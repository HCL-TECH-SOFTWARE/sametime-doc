# Configuring autoscaling for video {#plan_cluster_meetings_video .task}

The Kubernetes autoscaler adjusts the use of video pods based on the configured values in the video.yaml file.

To deploy the autoscaler, Prometheus must be installed. See [Installing Prometheus](installation_prometheus.md) for the details.

When Sametime is installed for the first time, you must deploy a HorizontalPodAutoscaler.

1.  Change directories to installation\_directory/ /kubernetes/autoscaling directory. Where installation\_directory is the directory the install package is located.

2.  Open the video.yaml file for editing.

3.  Configure the minimum number and maximum number of video pods by adjusting the following settings.

    ``` {#codeblock_t33_4bj_bvb}
    
    minReplicas: minimum\_value
    maxReplicas: maximum\_value
    ```

    For example:

    ``` {#codeblock_hfb_cx4_1vb}
    
    minReplicas: 1 
    maxReplicas: 3 
    ```

4.  Save and close the video.yaml file.

5.  To deploy the video autoscaler, run the following command from the autoscaling directory.

    ``` {#codeblock_c5r_dx4_1vb}
    kubectl apply -f video.yaml 
    ```

    If the autoscaler has already been deployed, you can adjust the number of video nodes available. The following command can be used to adjust the number of video nodes.

    ``` {#codeblock_m4k_vqn_1vb}
    kubectl edit hpa video
    ```


**Parent Topic: **[Configure high capacity for meetings](plan_cluster_meetings.md)

