# Configuring LTPA in Kubernetes {#ltpa_configure_kubernetes .task}

This topic includes the steps to configure LTPA keys on Kubernetes.

You must have already created a secret that contains your LPTA keys before you can compete this task. For more information on using WebSphere Liberty to generate LTPA keys, see [Generating LTPA keys](ltpa_generate_key.md).

If LTPA was not selected during the install process, you must add it to the sametime.ini file to use LTPA authentication. Edit the sametime.ini file and verify that `Ltpa` is included on the following line. If not, add it before continuing with configuring LTPA steps.

``` {#codeblock_ybv_dnd_35b}
STI_ST_BB_NAMES_ST_AUTH_TOKEN=Fork:Jwt, Ltpa
```

**Note:** There are two double underscores after STI and NAMES.

The changes in this task affect the following pods:

-   community

1.  Create a secret that contains your LTPA keys.

    ``` {#codeblock_tnx_tw3_5tb}
    kubectl create secret generic ltpa-keys --from-file=./ltpa.keys 
    ```

2.  Change to the helm/templatesdirectory and open open the sametime-secrets.yaml file.

3.  Find the base64 encoded value for your pass code.

    To base64 encode the password, you can enter the following command in a Linux shell:

    ``` {#codeblock_gns_r4h_k5b}
    echo -n ltpa\_key\_password
    ```

4.  Locate the `LtpaKeysPassword` line and replace the existing text with the base64 encoded LTPA key password.

5.  Save and close the sametime-secrets.yaml file.

6.  In the values.yaml file set `enableLtpa` to true.

    `enableLtpa = true`

7.  Apply your changes to the environment.

    Verify that you are in the helm directory and run the following command to apply changes. Specify the Sametime deployment name for your environment. The default for Sametime Premium version 12 is sametime.

    ``` {#codeblock_iyn_51d_d5b}
    helm upgrade sametime\_deployment\_name .
    ```

    **Note:** Be sure to include the dot at the end. It is part of the command.

    If you are unsure of your deployment name, issue the helm list command to find the name. If you upgraded from an earlier Sametime release, the default name is sametime-meetings.

8.  Restart the pods with the changes. Use the kubectl scale command to scale the pods to zero and then to one that have been changed. You must run the commands for each pod that the change affects.

    1.  Run the following command to scale the pod to zero.

        Scale the pod to zero, where pod\_deployment\_name is the pod name.

        ``` {#codeblock_cwz_mwc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=0
        
        ```

    2.  Run the following command to scale the pod to one.

        ``` {#codeblock_i2c_4wc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=1
        ```


**Parent topic:**[Setting up SSO using LTPA](enabling_sso_ltpa.md)

