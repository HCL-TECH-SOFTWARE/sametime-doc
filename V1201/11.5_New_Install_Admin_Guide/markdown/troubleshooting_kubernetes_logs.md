# Viewing and saving log files {#troubleshooting_kubernetes_logs .task}

Logs track pod events. You can gather a log for a specific pod and container within a pod or for all pods.

Each Kubernetes pod and container performs a specific task, narrowing down which pod to gather a log allows you to focus on the problem being debugged. Review the [Pods in Sametime](pods_descriptions.md) topic to understand what each pod does.

Some pods have multiple containers and you can specify gathering the log for the specific container. For pods that only have one container, you do not need to specify the container name.

1.  Run the kubectl get pods command to obtain the name of the pod. The command output includes all current pod names.

    **Note:** Pod name have hashes in it that change each time a pod is started.

    The following example shows the output from a kubectl get pods command.

    ``` {#codeblock_mny_54w_mvb}
    
    NAME                                                     READY   STATUS             RESTARTS  AGE 
    activity-5675f8bc9d-49b4f                                1/1     Running            0         21h 
    app-registry-84d89cfdd4-62z9s                            1/1     Running            0         21h 
    auth-7459fc7cd7-cqnjt                                    1/1     Running            0         21h 
    backgrounds-c9fb7b87c-m2gpc                              1/1     Running            0         21h 
    catalog-6cdd48b6d6-8k669                                 1/1     Running            0         21h 
    click2call-578d49d876-227fw                              1/1     Running            0         21h 
    community-695c867bfb-6tl42                               2/2     Running            0         21h 
    files-8454687cd8-xwsr8                                   2/2     Running            0         21h 
    jibri-web-64c6d478fc-sfz9j                               1/1     Running            0         21h 
    jitsi-7b86fc4f64-vtrrb                                   3/3     Running            0         21h 
    lobby-5ccf4bcb-s8mbr                                     1/1     Running            0         21h 
    location-5868588458-htxtj                                1/1     Running            0         21h 
    mux-6b4bdc46d7-86768                                     1/1     Running            0         21h 
    nginx-ingress-ingress-nginx-controller-5765f86f6-2dxq6   1/1     Running            0         21h 
    outlook-5f946d99fd-nxhrc                                 1/1     Running            0         21h 
    proxy-5697bc66f5-l88sf                                   1/1     Running            0         21h 
    recorder-6b4d9d4598-jqpss                                2/2     Running            0         21h 
    recordings-bd9f7b94f-5hhzq                               1/1     Running            0         21h 
    video-778749bc5d-jhj5j                                   2/2     Running            0         21h 
    web-5b5f4578d4-qmckq                                     1/1     Running            0         21h 
    
    ```

2.  To view the log for a specific pod, run the kubectl logs command specifying the name of the pod to gather log information. If there is a specific container to gather the log, include both the pod name and container name on the command.

    ``` {#codeblock_izc_kbj_3vb}
    kubectl logs pod\_name container\_name 
    ```

    For example, if you want to view the jvb logs from the video pod based on the output in the previous step enter the command:

    ``` {#codeblock_kmv_nbj_3vb}
     kubectl logs video-58f8589f99-f4tcd jvb 
    ```

    You can also use the --all-containers argument to see logs from all the containers on the pod.

    ``` {#codeblock_lbh_pbj_3vb}
    kubectl logs video-58f8589f99-f4tcd --all-containers 
    ```

    To redirect the output to a file, add the greater than character \(**\>**\) as an argument on the command and specifying a location that you have access to put the file. For example:

    ``` {#codeblock_am1_vbj_3vb}
    kubectl logs video-58f8589f99-f4tcd --all-containers > /tmp/video.txt 
    ```


**Parent topic:**[Troubleshooting Sametime on Kubernetes](t_troubleshooting_sametime_kubernetes.md)

