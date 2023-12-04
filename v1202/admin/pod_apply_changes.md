# Applying changes {#pod_apply_changes .task}

After you have modified a secret, scale the pods for which changes were made. Scaling the pod is similar to a reboot, first the pod is scaled to zero and then scaled to one. For Sametime pods details, see [Pods in Sametime](pods_descriptions.md). Scaling to zero removes all containers for the specified pods and scaling to one restarts their use. When scaled back up from zero, changes made are used by the pod.

1.  Restart the pods with the changes. Use the kubectl scale command to scale the pods to zero and then to one that have been changed. You must run the commands for each pod that the change affects.

    1.  Run the following command to scale the pod to zero.

        Scale the pod to zero, where pod\_deployment\_name is the pod name.

        ``` {#codeblock_cwz_mwc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=0
        
        ```

    2.  Run the following command to scale the pod to one.

        ``` {#codeblock_i2c_4wc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=1
        ```


**Parent Topic: **[Troubleshooting Sametime on Kubernetes](t_troubleshooting_sametime_kubernetes.md)

