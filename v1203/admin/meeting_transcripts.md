# Enabling Meeting Recording Transcription

The Meeting Transcripts feature automatically generates a written transcript of the entire meeting, providing an accurate record of the conversation for review. 

This feature enhances accountability and productivity by allowing participants to easily reference meeting content, ensuring no information is overlooked, and facilitating better decision-making and follow-up actions.

**Note:** The Meeting Recording Transcription feature is set to "OFF" by default.

## Prerequisites

The meeting transcription feature uses open source machine learning technology (ML) to provide a transcript of the words spoken in a meeting. The ML model(s) used for speech-to-text (STT) can be large and normally require a high computation in order to execute. It is highly recommended that GPU resources are available in the deployment when transcription is enabled. As the product is containerized, the GPU resources should be made available to the container. Depending on whether you are deploying via Docker or Kubernetes, on-prem vs. cloud, the mechanism to enable GPU resources in the deployment will vary. You should consult the documentation of your chosen infrastructure relative to access to GPU resources. Sametime has been tested in both Docker and Kubernetes environments with NVIDIA GPUs.

### Reference material

   - [Access an NVIDIA GPU](https://docs.docker.com/engine/containers/resource_constraints/#gpu) 
   - [NVIDIA GPU Operator](https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/getting-started.html) 

## Enabling via Docker

In the .env file for the deployment, you can enable transcriptions via:

```ENABLE_TRANSCRIPTIONS=1```

When you install via the install.sh script, an attempt is made to detect the presence of the nvidia-container-toolkit. If it can be successfully detected, updates are made to the docker-compose.yml file that enable the GPU to be accessed by the transcriber service. If for some reason the nvidia-container-toolkit was not detected (or it was installed later, after install.sh has been run), you may need to manually enable the GPU in the transcriber service.

Before (nvidia-container-toolkit not detected)
 
```
    transcriber:
        image: hclcr.io/st/meetings-whisper:${BUILD_LEVEL}
        restart: ${RESTART_POLICY} 
#GPU        deploy:
#GPU          resources:
#GPU            reservations:
#GPU              devices:
#GPU                - driver: nvidia
#GPU                  count: 1 # alternatively, use `count: all` for all GPUs
#GPU                  capabilities: [gpu]
        volumes:
            - ${CONFIG}/whisper:/home/ubuntu/.cache/huggingface
        environment:
            - DEFAULT_RESPONSE_FORMAT=verbose_json
            - WHISPER__MODEL=${TRANSCRIBER_MODEL_NAME:-Systran/faster-whisper-small}
        networks:
            sametime.test: 
```

After (nvidia-container-tookit was detected

 
```
    transcriber:
        image: hclcr.io/st/meetings-whisper:${BUILD_LEVEL}
        restart: ${RESTART_POLICY} 
        deploy: #GPU
          resources: #GPU
            reservations: #GPU
              devices: #GPU
                - driver: nvidia#GPU
                  count: 1 # alternatively, use `count: all` for all GPUs #GPU
                  capabilities: [gpu] #GPU
        volumes:
            - ${CONFIG}/whisper:/home/ubuntu/.cache/huggingface
        environment:
            - DEFAULT_RESPONSE_FORMAT=verbose_json
            - WHISPER__MODEL=${TRANSCRIBER_MODEL_NAME:-Systran/faster-whisper-small}
        networks:
            sametime.test: 
``` 

After applying these docker-compose.yml updates, you can verify that the transcriber service has access to the GPU by checking the logs for that service when it starts.

If the container is started and cannot get access to the GPU, the following message displays:

**WARNING:** The NVIDIA Driver was not detected.  GPU functionality will not be available. 

Transcription can run on CPU but may consume significant resources, potentially delaying meeting reports. Monitor server performance and disable the feature if necessary.


## Enabling via Kubernetes

Transcription is enabled/disabled in your deployment using the the following setting.
``` 
global:
  enableTranscription: true
```

When enabled, the transcriber pod will start but by default, it will NOT attempt to align on a node that has GPU resources. There are a couple of options to make certain that this alignment takes place. If you have installed the NVIDIA GPU Operator in the cluster, you can enable GPU support on the transcriber.  For example, 

```
transcriber:
  enableGpuSupport: true
```

You can also use a nodeSelector to align the transcriber pod to a node of your choice. An example might be if you have GPU resources on that node and they are available to containers running on the node, but you are not using the NVIDIA GPU Operator such that the GPU resources are not available to the kubernetes scheduler. You might label the node with 'gpu', for example,

```
global:
  transcriberNodeRole: gpu
``` 
 
Verify that the transcriber has access to GPU resources by checking the logs of the transcriber pod. You will see a warning message if the pod does not have access to the GPU:

**WARNING:** The NVIDIA Driver was not detected.  GPU functionality will not be available. 

Transcription can run on CPU but may consume significant resources, potentially delaying meeting reports. Monitor server performance and disable the feature if necessary.

## Model Configuration Options

By default, the STT model named "Systran/faster-whisper-small" will be used. It provides good coverage of most speech and produces generally good results without being too CPU/Memory resource intensive. The model can be changed if you have a preference.

### Docker

Set preferred model in the .env file:

```
TRANSCRIBER_MODEL_NAME=deepdml/faster-whisper-large-v3-turbo-ct2
```

### Kubernetes

Set the preferred model via yaml config in the deployment:

```
transcriber:
  modelName: deepdml/faster-whisper-large-v3-turbo-ct2
```

## Cloud-based Transcription Support

By default, the transcription is executed in the local cluster using local CPU/GPU resources. There is an option of using cloud-based transcription if desired (from OpenAI, for example).

### Docker

Set your OpenAI API key and Transcription base URL in custom.env:

```
TRANSCRIPTION_API_KEY={your-openai-api-key}
OFFLINE_TRANSCRIBER_BASE_URL=https://api.openai.com
TRANSCRIPTION_MODEL=whisper-1
```

### Kubernetes

Set your OpenAI API key via yaml config in the deployment:

```
global:
  transcriptionApiKey: {your-openai-api-key}
```

**Note:** The OpenAI URL and model are configured by default in the helm charts if you provide a transcription API key as above. However, they can be configured separately as needed:

```
global:
  transcriptionBaseUrl: https://api.openai.com
  transcriptionModel: whisper-1
```

**Note:** Other cloud providers may also be used if they conform to the OpenAI REST API for STT.

 