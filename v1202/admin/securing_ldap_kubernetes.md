# Securing LDAP on Kubernetes {#securing_ldap_kubernetes .task}

This section covers the steps to import your LDAP trust store and password into Kubernetes as a secret, then define the secret in the Sametime configuration.

Create a trust store in p12 format that contains a copy of the LDAP server’s certificate. To perform this step you will need to know the password of your trust store.

The changes in this task affect the following pods:

-   community

1.  Create a secret a secret that contains your certificate.

    1.  Rename your trust store file name to ldaptruststore.p12.ls.

    2.  Copy the ldaptruststore.p12 file to the machine where you are running kubectl.

    3.  Run the following command to create the Kubernetes secret.

        ``` {#codeblock_e2b_5d2_xtb}
        kubectl create secret generic ldap-config-secret --from-literal=KeyStorePassword=password --from-file=./ldaptruststore.p12
        ```

        Substitute your password for password. If you have a namespace dedicated to Sametime, add the -n argument with your namespace to ensure the secret is created in the correct namespace.

    4.  Change to the helm directory where the Sametime installation package was decompressed. Open the values.yaml file to update the secret parameter.

        Set the value of the `ldapConfigSecret` parameter to `ldap-config-secret`.

        ``` {#codeblock_dly_l22_xtb}
        ldapConfigSecret: ldap-config-secret 
        ```

        If the parameter is commented out, remove the comment tag.

    5.  Save and close the file.

    6.  Ensure you are in the helm directory. To apply your changes to the environment run the following command, specifying the deployment name in your environment. The default for Sametime version 12 is sametime.

        ``` {#codeblock_bvg_pk2_xtb}
        helm upgrade deployment\_name.
        ```

        If you are unsure of your deployment name, issue the helm list command to find the name. If you upgraded from an earlier Sametime release, the default name is sametime-meetings.

        **Note:** Be sure to include the dot, it is part of the command.

    7.  Scale the Community pods to zero and then to one.

        Run the following command to scale the pod to zero.

        ``` {#codeblock_jg4_lzy_xtb}
        
        kubectl scale deploy community --replicas=0
        ```

        Run the following command to scale the pod to one.

        ``` {#codeblock_tny_zzy_xtb}
        
        kubectl scale deploy community --replicas=1
        ```

2.  Apply your changes to the environment.

    Verify that you are in the helm directory and run the following command to apply changes. Specify the Sametime deployment name for your environment. The default for Sametime Premium version 12 is sametime.

    ``` {#codeblock_iyn_51d_d5b}
    helm upgrade sametime\_deployment\_name .
    ```

    **Note:** Be sure to include the dot at the end. It is part of the command.

    If you are unsure of your deployment name, issue the helm list command to find the name. If you upgraded from an earlier Sametime release, the default name is sametime-meetings.

3.  Restart the pods with the changes. Use the kubectl scale command to scale the pods to zero and then to one that have been changed. You must run the commands for each pod that the change affects.

    1.  Run the following command to scale the pod to zero.

        Scale the pod to zero, where pod\_deployment\_name is the pod name.

        ``` {#codeblock_cwz_mwc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=0
        
        ```

    2.  Run the following command to scale the pod to one.

        ``` {#codeblock_i2c_4wc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=1
        ```


**Parent Topic:  **[Securing connections between Sametime servers and LDAP](securing_connections_sametime_community_and_ldap.md)

