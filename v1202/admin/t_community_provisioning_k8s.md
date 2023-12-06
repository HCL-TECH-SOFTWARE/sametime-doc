# Creating a community provisioning on Kubernetes {#t_community_provisioning_k8s .task}

As discussed in [Creating a community provisioning URL for mobile users](community_provisioning.md), mobile users cannot connect to the Sametime server without a special mobile community definition that provides details needed for the connection. This topic discusses the steps to set up the community provisioning URL on Kubernetes.

Ensure that you have read [Creating a community provisioning URL for mobile users](community_provisioning.md) for the general guidelines on how to create and configure the custom provisioning URL.

1.  Update the environment using this format.

    ``` {#codeblock_rj3_3xm_lyb}
    kubectl set env deploy/proxy 'MOBILE_CONFIGURL=hclsametime://stproxyserver.example.com/?action=AddCommunity&communityName=Sametime%20Server'
    ```

2.  The changes persist in your deployment. To apply the changes to new deployments, you must edit the helm/charts/auth/templates/deployment.yaml file and add the new settings to the `proxy:` section.

    ``` {#codeblock_pmv_vym_lyb}
          containers:
          - proxy:
    <<< INSERT NEW SETTINGS HERE >>>
    
    ```

    Insert this, for example:

    ``` {#codeblock_qmv_vym_lyb}
            - name: MOBILE_CONFIGURL
              value: "hclsametime:stproxyserver.example.com/?action=AddCommunity&communityName=Sametime%20Server"
    ```

3.  Apply your changes to the environment.

    Verify that you are in the helm directory and run the following command to apply changes. Specify the Sametime deployment name for your environment. The default for Sametime Premium version 12 is sametime.

    ``` {#codeblock_iyn_51d_d5b}
    helm upgrade sametime\_deployment\_name .
    ```

    **Note:** Be sure to include the dot at the end. It is part of the command.

    If you are unsure of your deployment name, issue the helm list command to find the name. If you upgraded from an earlier Sametime release, the default name is sametime-meetings.

4.  Restart the pods with the changes. Use the kubectl scale command to scale the pods to zero and then to one that have been changed. You must run the commands for each pod that the change affects.

    1.  Run the following command to scale the pod to zero.

        Scale the pod to zero, where pod\_deployment\_name is the pod name.

        ``` {#codeblock_cwz_mwc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=0
        
        ```

    2.  Run the following command to scale the pod to one.

        ``` {#codeblock_i2c_4wc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=1
        ```


**Parent Topic:  **[Creating a community provisioning URL for mobile users](community_provisioning.md)

