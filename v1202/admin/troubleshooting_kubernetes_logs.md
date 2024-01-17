# Viewing and saving log files {#troubleshooting_kubernetes_logs .task}

Logs track pod events. You can gather a log for a specific pod and container within a pod or for all pods.

Each Kubernetes pod and container performs a specific task, narrowing down which pod to gather a log allows you to focus on the problem being debugged. Review the [Pods in Sametime](pods_descriptions.md) topic to understand what each pod does.

Some pods have multiple containers and you can specify gathering the log for the specific container. For pods that only have one container, you do not need to specify the container name.

1.  Run the kubectl get pods command to obtain the name of the pod. The command output includes all current pod names.

    **Note:** Pod name have hashes in it that change each time a pod is started.

    The following example shows the output from a kubectl get pods command.

    ``` {#codeblock_rjf_ydp_ywb}
    
    NAME			        READY    STATUS    RESTARTS        AGE
    activity-5b75df6f6b-z98xs	     1/1     Running    0              25d
    app-registry-7766fddd94-qbvsk    1/1     Running    0              25d
    auth-c6d8457cb-9j9z7             1/1     Running    0              24d
    backgrounds-cb8966646-wtvqs      1/1     Running    0              25d
    catalog-ff66944d5-vvfkx          1/1     Running    0              10d
    click2call-86f8f4cbbb-wptch      1/1     Running    0              25d
    community-775fc897c9-mmb84       2/2     Running    0              25d
    files-5b5865f8fc-h8hl5           2/2     Running    2 (9d ago)     25d
    jibri-web-65b6849f67-9xxq9       1/1     Running    0              25d
    jitsi-6c4754ffcf-n6t72           3/3     Running    0              25d
    lobby-b569fcdd5-5fkmf            1/1     Running    0              25d
    location-5894bcb6f7-kbkrb        1/1     Running    0              25d
    mux-f68c5868d-8vl6j              1/1     Running    0              25d
    outlook-7d7f54ff65-7cmzx         1/1     Running    2 (25d ago)    25d
    proxy-6d669b9b94-xmhvt           1/1     Running    0              25d
    recorder-7c9dcfc646-2g66f        2/2     Running    9 (22m ago)    32h
    recordings-7cdd5c8cf4-lg2hn      1/1     Running    0              25d
    video-7c477fbd86-2jn62           2/2     Running    0              25d
    web-6d785f6479-tfmkb             1/1     Running    5 (14d ago)    25d
    webhook-7cb587cd74-5t96w         1/1     Running    0              10d
    
    
    ```

2.  To view the log for a specific pod, run the kubectl logs command specifying the name of the pod to gather log information. If there is a specific container to gather the log, include both the pod name and container name on the command.

    ``` {#codeblock_izc_kbj_3vb}
    kubectl logs pod\_name container\_name 
    ```

    For example, if you want to view the jvb logs from the video pod based on the output in the previous step enter the command:

    ``` {#codeblock_kmv_nbj_3vb}
     kubectl logs video-7c477fbd86-2jn62 jvb 
    ```

    You can also use the --all-containers argument to see logs from all the containers on the pod.

    ``` {#codeblock_lbh_pbj_3vb}
    kubectl logs video-58f8589f99-f4tcd --all-containers 
    ```

    To redirect the output to a file, add the greater than character \(**\>**\) as an argument on the command and specifying a location that you have access to put the file. For example:

    ``` {#codeblock_am1_vbj_3vb}
    kubectl logs video-7c477fbd86-2jn62 --all-containers > /tmp/video.txt 
    ```


**Parent Topic:  **[Troubleshooting Sametime on Kubernetes](t_troubleshooting_sametime_kubernetes.md)

