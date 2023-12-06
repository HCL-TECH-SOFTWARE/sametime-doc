# Configuring autoscaling for recorder {#plan_cluster_meetings_recorder .task}

A recorder is used when a meeting is being recorded and when live streaming a video. The Kubernetes autoscaler adjusts the use of recorder pods based on settings in the recorder.yaml file.

To deploy the autoscaler, Prometheus must be installed. See [Installing Prometheus](installation_prometheus.md) for the details.

When a recorder is being used in a meeting, it is dedicated to that meeting until the user stops the recorder or the meeting is stopped. At that time, the recorder is available to be used again. For example, if two recorders are deployed, only two meetings can be recorded at the same time. A recorder is not available until one of the meetings ends. The live streaming feature is also handled by the recorder.

Estimate how many recorders you may need and define the minimum and maximum number of recorder pods that are used by the autoscaler.

1.  Change directories to installation\_directory/ /kubernetes/autoscaling directory. Where installation\_directory is the directory the install package is located.

2.  Open the recorder.yaml file for editing.

3.  Configure the minimum number and maximum number of recorders by adjusting the following settings.

    ``` {#codeblock_t33_4bj_bvb}
    
    minReplicas: minimum\_value
    maxReplicas: maximum\_value
    ```

    For example:

    ``` {#codeblock_dn1_tjn_1vb}
    
    minReplicas: 2 
    maxReplicas: 10
    ```

4.  Save and close the file.

5.  To deploy the recorder autoscaler, run the following command from the autoscaling directory.

    ``` {#codeblock_ijl_jpn_1vb}
    kubectl apply -f recorder.yaml
    ```

    If the autoscaler has already been deployed, you can adjust the number of recorder pods available. The following command can be used to adjust the number of recorders.

    ``` {#codeblock_m4k_vqn_1vb}
    kubectl edit hpa recorder
    ```


**Parent Topic:  **[Configure high capacity for meetings](plan_cluster_meetings.md)

