# Preparing to install an Openshift environment {#installation_sametime_openshift .task}

You must complete the tasks in this topic if you are installing in an Openshift environment before you can install Sametime.

Refer to [Planning for Openshift](c_planning_openshift.md) for consideratons related to namespace and video.

1.  Deploy in a namespace. You can either create a namespace or use the default namespace. If you deploy Sametime into the default namespace, there are modifications that must be appled to the Helm chart.

    **Deploy to a new namespace**

      ``` {#codeblock_x2p_h4b_twb}
      
      export NAMESPACE=sametime
      oc create namespace $NAMESPACE
      ```

    **Deploy to default namespace**

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
            name: videoUser
        
        ```

    -   Using a node port is also lower performance but is restricted to a single node. It requires a no host-network SCC.

        Edit the values.yaml file to add the following to the Sametime service account:

        ```
        
        global:
          disableHostNetwork: true
        ...
        video:
          serviceAccount:
            name: videoUser
        
        ```

Continue with the topics for installing in a Kubernetes environment.

