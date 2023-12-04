# Preparing to install an Openshift environment {#installation_sametime_openshift .task}

You must complete the tasks in this topic if you are installing in an Openshift environment before you can install Sametime.

1.  Deploy in a namespace. You can either create a namespace or use the default namespace. If you deploy Sametime into the default namespace, there are modifications that must be appled to the Helm chart.

    **Deploy to a new namespace**

    1.  Create a namespace

        ``` {#codeblock_x2p_h4b_twb}
        
        export NAMESPACE=sametime
        oc create namespace $NAMESPACE
        ```

    2.  Create the sametimeUser service account.

        ```
         kubectl -n $NAMESPACE create serviceaccount sametimeUser
        ```

    3.  Create the SCC for sametimeUser account

        ```
        oc create -f kubernetes/stack/openshift/sametime-restricted-v2.yaml
        ```

    4.  Apply the SCC to the service account.

        ```
        oc adm policy add-scc-to-user sametime-restricted-v2 -z sametimeUser -n $NAMESPACE
        ```

    **Deploy to default namespace**

    In OpenShift, there are seLinuxOptions level/label restrictions that are automatically applied within a namespace. By default, labels are not randomize which causes a problem when using the OpenShift default namespace. When deploying in the default namespace, comment out the seLinuxOptions:false setting for each of the activity, file, and recording charts.

    1.  Edit the values.yaml file.

        Comment out the `seLinuxOptions: false` setting for each of the following sections.

        -   `activity`
        -   `files`
        -   `recordings`
        For example:

        ``` {#codeblock_pvh_hgj_ywb}
        
        activity:
          fullnameOverride: activity
          persistence: {}
        #  seLinuxOptions: false
        
        ```

2.  Deploy the video using one of the following methods.

    -   Host Port

        This is the default which provides the best performance and scales automatically scalable. This method requires pod-to-node affinity restriction through node labels. A separate video service account is required and the hostnetwork-v2 must be assigned to it.

        ```
         
        oc create -f kubernetes/stack/openshift/sametime-hostnetwork-v2.yaml 
        kubectl -n $NAMESPACE create serviceaccount videoUser 
        oc adm policy add-scc-to-user sametime-hostnetwork-v2 -z videoUser -n $NAMESPACE 
        ```

        Edit the values.yaml to reference this video service account:

        ```
        
        video:
          serviceAccount:
            name: videoUser
        ```

    -   Using a load balancer is lower performance and has no pod-to-node restrictions. It requires the Kubernetes load balancing infrastructure.

        Edit the values.yaml file to enable the loadBalanceVideo setting and reference the Sametime service account.

        ```
        
        global:
          loadBalanceVideo: true
        ...
        video:
          serviceAccount:
            name: sametimeUser
        
        ```

    -   Using a node port is also lower performance but is restricted to a single node. It requires a no host-network SCC.

        Edit the values.yaml file to add the following to the Sametime service account:

        ```
        
        global:
          disableHostNetwork: true
        ...
        video:
          serviceAccount:
            name: sametimeUser
        
        ```

3.  Edit the values.yaml file to disable the fsGroup and runAsUser settings, and reference the Sametime service account that you created.

    ```
    
    global:
       ...
       disableFsGroup: true
       disableRunAsUser: true
       sametimeServiceAccount: sametimeUser
    
    ```


Continue with the topics for installing in a Kubernetes environment.

**Parent Topic: **[Installing Sametime in a Kubernetes environment](installation_sametime_kubernetes.md)

