# Specifying a cipher for Sametime to connect to Domino LDAP on Kubernetes {#t_domino_ldap_k8s .task}

This task involves defining the required cipher for Sametime to connect to Domino 12 LDAP servers.

By default, Domino 12.0.x LDAP servers must be configured to support a certain cipher used by Sametime. For more information, see [Sametime 12.0 TLS required ciphers to connect to Domino 12.0.2 LDAP](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0099644).

To support Domino 12.0.2 LDAP connections, follow these steps.

1.  Place the values.yaml file in edit mode.

2.  Locate the `sametimeIni:` setting in the file, and then add the new line, indented with four spaces:

    ``` {#codeblock_xq2_1vy_ztb}
        STI__Config__STLDAP_TLS_CIPHER_SUITES=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
    ```

    For more information on how to configure the sametime.ini file, refer to [Configuring the sametime.ini file on Kubernetes](chat_configuring_sametimeini_kubernetes.md).

3.  Save and close the file.

4.  Apply your changes to the environment.

    Verify that you are in the helm directory and run the following command to apply changes. Specify the Sametime deployment name for your environment. The default for Sametime Premium version 12 is sametime.

    ``` {#codeblock_iyn_51d_d5b}
    helm upgrade sametime\_deployment\_name .
    ```

    **Note:** Be sure to include the dot at the end. It is part of the command.

    If you are unsure of your deployment name, issue the helm list command to find the name. If you upgraded from an earlier Sametime release, the default name is sametime-meetings.

5.  Restart the pods with the changes. Use the kubectl scale command to scale the pods to zero and then to one that have been changed. You must run the commands for each pod that the change affects.

    1.  Run the following command to scale the pod to zero.

        Scale the pod to zero, where pod\_deployment\_name is the pod name.

        ``` {#codeblock_cwz_mwc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=0
        
        ```

    2.  Run the following command to scale the pod to one.

        ``` {#codeblock_i2c_4wc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=1
        ```


**Parent Topic: **[Securing connections between Sametime servers and LDAP](securing_connections_sametime_community_and_ldap.md)

