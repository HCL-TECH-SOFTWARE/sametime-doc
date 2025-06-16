# Running a pod as the root user {#troubleshooting_kubernetes_pod_root .task}

The containers in Sametime normally run as a non-root user for enhanced security, but some troubleshooting tasks (like [Capturing a network trace in a pod](troubleshooting_kubernetes_pod_networktrace.md)) might require running a pod briefly as the root user in order to install enhanced debugging tools, etc.

The following steps will allow you to restart a given pod as the root user.

1.  Determine the deployment of the pod you need to run as root. Typically, this will simply be the first part of the pod name, but you can also get deployments directly:

    ``` {#codeblock_r3b_bbj_3vb}
     kubectl get po
    ```

    or

    ``` {#codeblock_r3b_bbj_3vb}
     kubectl get deployments
    ```

2.  Modify the running deployment by issuing the below command, making the necessary substitutions:

    For deployments with a single container:
    ``` {#codeblock_t4z_c2j_3vb}
    kubectl patch deployment <deploymentname> --type json -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/securityContext", "value": {"allowPrivilegeEscalation": true, "runAsNonRoot": false, "runAsUser": 0}}]'
    ```

    For deployments with multiple containers, you will need to get the index of the container you want to run as root:

    ``` {#codeblock_t4z_c2j_3vb}
    DEPLOYMENT=<deploymentname>
    CONTAINER=<container_name>
    INDEX=$(kubectl get deployment $DEPLOYMENT -o json  | jq '.spec.template.spec.containers | map(.name == "'$CONTAINER'") | index(true)')
    kubectl patch deployment $DEPLOYMENT --type json -p='[{"op": "replace", "path": "/spec/template/spec/containers/'$INDEX'/securityContext", "value": {"allowPrivilegeEscalation": true, "runAsNonRoot": false, "runAsUser": 0}}]'
    ```

    deploymentname
    :   The name of the deployment.

    container\_name
    :   is the name of the container. Use [Pods in Sametime](pods_descriptions.md) as a guide for finding the container name for a given deployment.

3.  The pods associated with that deployment will restart, now running as root. Do whatever troubleshooting needs to be done to the pod while as root.

4.  Revert the deployment back to its original state like this:

    For deployments with a single container:

    ``` {#codeblock_t4z_c2j_3vb}
    kubectl patch deployment <deploymentname> --type json -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/securityContext", "value": {"allowPrivilegeEscalation": false}}]'
    ```

    For deployments with multiple containers:

    ``` {#codeblock_t4z_c2j_3vb}
    DEPLOYMENT=<deploymentname>
    CONTAINER=<container_name>
    INDEX=$(kubectl get deployment $DEPLOYMENT -o json  | jq '.spec.template.spec.containers | map(.name == "'$CONTAINER'") | index(true)')
    kubectl patch deployment $DEPLOYMENT --type json -p='[{"op": "replace", "path": "/spec/template/spec/containers/'$INDEX'/securityContext", "value": {"allowPrivilegeEscalation": false}}]'
    ```


**Parent Topic:  **[Troubleshooting Sametime on Kubernetes](t_troubleshooting_sametime_kubernetes.md)

