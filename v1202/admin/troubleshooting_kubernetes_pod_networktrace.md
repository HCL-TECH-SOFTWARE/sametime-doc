# Capturing a network trace in a pod {#troubleshooting_kubernetes_pod_networktrace .task}

1.  Get the name of the pod.

    ``` {#codeblock_r3b_bbj_3vb}
     kubectl get pods 
    ```

2.  Start a shell session in the pod. Issue the below command, and make the following substitutions:

    ``` {#codeblock_t4z_c2j_3vb}
    kubectl exec -it <podname> --container=<container name> -- bash 
    ```

    podname
    :   The name of the pod.

    container\_name
    :   is the name of the container. If the pod only has one container you can omit this parameter.

    For example, if the pod name is jitsi-74d95d6d49-k5nts and the container name is jigasi, then the resulting command is:

    ``` {#codeblock_msr_22j_3vb}
    kubectl exec -it jitsi-74d95d6d49-k5nts --container=jigasi --bash
    ```

3.  Update the repositories by issuing the below command:

    ``` {#codeblock_wm2_s2j_3vb}
    apt-get update 
    ```

4.  Install tcpdump by issuing the below command:

    ``` {#codeblock_gfx_52j_3vb}
    apt-get install tcpdump 
    ```

5.  Capture the network data, by issuing the command:

    ``` {#codeblock_xl1_x2j_3vb}
    tcpdump -i any -w <filename>.pcap 
    ```

6.  Reproduce the problem.

7.  To stop and save the capture press Ctrl+C.


**Parent Topic:  **[Troubleshooting Sametime on Kubernetes](t_troubleshooting_sametime_kubernetes.md)

[Transferring files from a pod to a Linux shell](troubleshooting_kubernetes_transfer_pods.md)

[Pods in Sametime](pods_descriptions.md)

