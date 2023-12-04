# Configuring LTPA in Kubernetes {#ltpa_configure_kubernetes .task}

This topic includes the steps to configure LTPA keys on Kubernetes.

You must have already obtain the LTPA keys before you can compete this task. For more information on using WebSphere Liberty to generate LTPA keys, see [Generating LTPA keys](ltpa_generate_key.md).

The changes in this task affect the following pods:

-   community

1.  Create a secret that contains your LTPA keys.

    ``` {#codeblock_tnx_tw3_5tb}
    kubectl create secret generic ltpa-keys --from-file=./ltpa.keys 
    ```

2.  Change to the helm/templates directory and open the sametime-secrets.yaml file.

3.  Find the base64 encoded value for your pass code.

    To base64 encode the password, you can enter the following command in a Linux shell:

    ``` {#codeblock_gns_r4h_k5b}
    echo -n 'ltpa\_key\_password' | base64
    ```

4.  Locate the `LtpaKeysPassword` line and replace the existing text with the base64 encoded LTPA key password.

5.  Save and close the sametime-secrets.yaml file.

6.  In the helm/values.yaml file set `enableLtpa` to true.

    `enableLtpa : true`

7.  Add a new line that defines the number of minutes that the LTPA token is valid.

    The number of minutes must match the Domino web SSO token expiration field. For example, if the Domino Web SSO token expiration is 30 minutes, for example:

    ``` {#codeblock_bjg_x3h_gyb}
    ltpaDurationMinutes: "30"
    ```

    **Note:** The new line must be indented with two spaces.

8.  When using a realm, add a new line that defines the realm name.

    ``` {#codeblock_ejr_gt4_jyb}
    ltpa.realm: <defaultrealm>
    ```

    **Note:** For integrations with HCL Connections, you must define the realm name in the values.yaml/config if/. For more information, see [Integrating with HCL Connections](ltpa_configure_connections.md).

9.  Apply your changes to the environment.

    Verify that you are in the helm directory and run the following command to apply changes. Specify the Sametime deployment name for your environment. The default for Sametime Premium version 12 is sametime.

    ``` {#codeblock_iyn_51d_d5b}
    helm upgrade sametime\_deployment\_name .
    ```

    **Note:** Be sure to include the dot at the end. It is part of the command.

    If you are unsure of your deployment name, issue the helm list command to find the name. If you upgraded from an earlier Sametime release, the default name is sametime-meetings.

10. Restart the pods with the changes. Use the kubectl scale command to scale the pods to zero and then to one that have been changed. You must run the commands for each pod that the change affects.

    1.  Run the following command to scale the pod to zero.

        Scale the pod to zero, where pod\_deployment\_name is the pod name.

        ``` {#codeblock_cwz_mwc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=0
        
        ```

    2.  Run the following command to scale the pod to one.

        ``` {#codeblock_i2c_4wc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=1
        ```


**Parent Topic: **[Setting up SSO using LTPA](enabling_sso_ltpa.md)

