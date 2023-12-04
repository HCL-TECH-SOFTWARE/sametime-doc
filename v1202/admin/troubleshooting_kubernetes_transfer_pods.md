# Transferring files from a pod to a Linux shell {#troubleshooting_kubernetes_transfer_pods .task}

1.  Obtain the name of the pod.

    Pod names have hashes in it that change each time a pod is started. To get the name of the current pods, issue the command:

    ``` {#codeblock_r3b_bbj_3vb}
    kubectl get pods 
    ```

2.  To copy a file from the pod, use the syntax below, and make the following substitutions:

    ``` {#codeblock_slt_ycj_3vb}
    kubectl cp <podname>:/<filename> /<path_on_local>/<filename> --container=<container_name> 
    ```

    podname
    :   The name of the pod.

    filename
    :   The file name inside the pod.

    path\_on\_local
    :   The path on the machine running kubectl.

    container\_name
    :   The name of the container. If the pod only has one container you can omit this parameter. See [Pods in Sametime](pods_descriptions.md) for container names.

    For example if:

    -   The pod name is jitsi-7b86fc4f64-vtrrb
    -   The container name is jigasi
    -   The file name inside the pod is test1.pcap
    To save this file to the /tmp directory on the machine running kubectl, then the command is:

    ```
    kubectl cp jitsi-7b86fc4f64-vtrrb:/test1.pcap /tmp/test1.pcap --container=jigasi
    ```


**Parent Topic: **[Troubleshooting Sametime on Kubernetes](t_troubleshooting_sametime_kubernetes.md)

