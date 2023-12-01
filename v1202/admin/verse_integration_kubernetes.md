# Enabling the legacy web client on Kubernetes {#verse_integration_kubernetes .task}

The changes in this task affect the following pods:

-   proxy

1.  Edit the values.yaml file.

2.  Add the `enableLegacyClient` key with the value set to true.

    ``` {#codeblock_j2z_zf1_h5b}
    enableLegacyClient: true
    ```

3.  Apply the changes to the configuration.

    Run the helm upgrade command from the helm directory where the Sametime installation package was unzipped.

    Specify the Sametime deployment name.

    ``` {#codeblock_pbx_jzc_d5b}
    helm upgrade sametime\_deployment\_name .
    ```

    **Note:** The dot is part of the command.

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


**Parent topic:**[Integrating with other applications](verse_integration.md)

