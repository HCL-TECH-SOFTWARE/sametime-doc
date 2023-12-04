# Troubleshooting LDAP on the community pod {#t_troubleshooting_ldap_kubernetes .task}

If you are having difficulty connecting to a secure LDAP server, perform the following troubleshooting steps.

1.  Log into the community pod.

    1.  Find the name of the community pod using the kubectl get pods command. The results shows the pod names which contains hashes.

    2.  Run the following command to log into the community pod. Include the pod name.

        ``` {#codeblock_tq1_c22_lvb}
        
        kubectl exec -it pod\_name --container=community -– bash 
        ```

2.  Confirm that the community pod is receiving the trust store. Look for the ldaptruststore.p12 file in /local/notesdata directory.

    -   If the file is present, continue to the next step.
    -   If the file is missing, the LDAP secret is not being read properly.
    1.  Confirm that LDAP secret has been created in the correct namespace if using namespaces.

    2.  Open the values.yaml file and confirm that the LDAP secret name is specified correctly in the `ldapConfigSecret: "ldap-config-secret"` format.

3.  Confirm that the sametime.ini and UserInfoConfig.xml files are updated.

    1.  Open the /local/notesdata/sametime.ini file in the community pod. and confirm the LDAP TLS settings are present.

        Locate the following statements in the file:

        ``` {#codeblock_fp4_nj2_lvb}
         
        STLDAP_TLS_TRUST_STORE_TYPE=p12 
        STLDAP_TLS_TRUST_STORE_FILE = /local/notesdata/ldaptruststore.p12 
        ```

        The file name and path are hard coded and should not changed.

        ``` {#codeblock_exw_qj2_lvb}
        STLDAP_TLS_TRUST_STORE_PASSWORD= thepassword
        ```

        This should be your actual password for the trust store. If these are missing, confirm the values.yaml settings are present as mentioned in the confirm you have the correct configuration details step.

    2.  Open the /local/notesdata/UserInfoConfig.xml and confirm that you see the correct details in the `<Storage Details>` section for the host name and port of the LDAP server.

        Confirm that the below line is present, where “thepassword” is your trust store password:

        ``` {#codeblock_j5p_nl2_lvb}
        <SslProperties KeyStorePath="/local/notesdata/ldaptruststore.p12" KeyStorePassword="password" />
        ```

        If anything in this section is missing, examine the settings in the values.yaml file for accuracy as decribed in the next step.

4.  Confirm you have correct configuration details .

    1.  Confirm your other values in the values.yaml pertaining to LDAP:

        -   `ldapHost:`

            ``` {#codeblock_z5b_fm2_lvb}
            
            ldapHost: server\_host\_name
            ldapPort: "636"
            ldapTls: true
            ```

            Where server\_host\_name should be the LDAP server host name or IP address.

    2.  Check the bind credentials in the sametime-global-secrets, they are base64 encoded. First, issue the command: `kubectl edit secret sametime-global-secrets`

        Locate the lines beginning with `LdapBindEntryDn` and `LdapBindEntryPassword`. Take the value of each setting and base64 decode them, they should be your Bind DN and the Bind password. If these are wrong, then base64 encode them. To decode the values, issue the following command:

        ``` {#codeblock_h2w_svw_mvb}
         echo -n ‘value’ | base64 -d 
        ```

        Where ‘value’ is the encoded value in the secret.

    3.  If you need to change the credentials, you can set it to the base64 encoded value of the correct Bind name and password, directly in the secret, but it should also be set in the template file as well. If you fail to update the template file, then your existing secrets are overridden when you run a helm upgrade command. The template file is located where the helm directory was saved, and it is found under /helm/templates/sametime-secrets.yaml

        To change the Bind credentials, see [Changing the LDAP service account password in Kubernetes](configuring_ldap_password.md). For more information on secrets, see the [Managing secrets in Kubernetes](managing_secrets_kubernetes.md)and [Modifying secrets](secrets_modify.md) topics.

    4.  If you are overriding the default configuration using an extra-community-config secret, there are additional steps to take to correct the Bind DN. See [Changing the LDAP service account password in Kubernetes](configuring_ldap_password.md).

5.  Confirm TLS is negotiating properly between Sametime and LDAP

    -   In Sametime 12 only TLS 1.2 is enabled by default. If the LDAP server you are connecting to doesnn't support TLS 1.2, then you need to override the default configuration.
    -   Sametime connects to LDAP attempting to negotiate TLS with the following ciphers:

          
         RSA\_WITH\_AES\_256\_GCM\_SHA384 \(0x009D\)  
         RSA\_WITH\_AES\_128\_CBC\_SHA \(0x002F\)

        Support for at least one of the ciphers might need to be added to your LDAP server, such is the case for HCL Domino 12.0.2, for details see [Sametime 12.0 TLS required ciphers to connect to Domino 12.0.2 LDAP](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0099644)

    -   There is a known issue when using a newer version of keytool to create the trust store, Sametime is unable to read it. To work around the problem, recreate the trust store with keytool and add the argument: `-J-Dkeystore.pkcs12.legacy` to the command. For more details, see the [Sametime unable to read trust store causing LDAP connection to fail](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0101354) article.
    -   To determine if your TLS is not negotiating and finding a common cipher suite enable debug. Start with VP\_LDAP\_TRACE=1 and ST\_TLS\_DEBUG=1. See the[Enabling Community debug in Kubernetes](t_enabling_community_debug.md) topic.
6.  By default, the community pod connects to LDAP on the pod IP address range, and the firewall should be configured to permit this traffic. If you are unable to open up the entire pod IP range to LDAP, consider implementing a network address translation, or IP Masquerade solution, which will give the traffic from the pods an IP in a range of your choosing.

    An example of this is the Google Kubernetes Engine IP masquerade agent solution. For more information, see the [IP masquerade agent](https://cloud.google.com/kubernetes-engine/docs/concepts/ip-masquerade-agent) Google Cloud topic. Each cloud provider has an unique solution, see your vendor’s documentation for more details.

7.  The community pod must resolve the host name of the LDAP server, or you can configure the IP address instead. If the host name of the LDAP server does not resolve in DNS, you can configure Host Aliases for the Community pod.

    See the [Configuring host aliases for Kubernetes deployments](https://help.hcltechsw.com/sametime/12/admin/t_meetings_kubernetes.html) article for steps.

8.  Netstat is installed on the community pod and can be helpful to understanding if the connectivity is succeeding or not succeeding.

    To use netstat on the community pod enter the command:

    ``` {#codeblock_ekz_cyw_mvb}
    netstat -an | grep 636 
    ```

    Substitute your secure LDAP port number if you are not using port 636.

9.  You might find that the default settings for LDAP are incompatible with your LDAP implementation and are causing problems

    -   Sametime 12 connects with multiple connections, the login, resolve and search connections uses the same settings. These settings are configured in the StCommunityConfig.xml, which are pulled from the values.yaml file and sametime-global-secrets. These can be overwritten by the extra-community-configs secret.
    -   The UserInfo task \(business cards\) uses different settings. These settings are in theUserInfoConfig.xml file and are also pulled from the values.yaml file and can be overwritten by the extra-community-configs secret.
    It is also possible to create a custom java class file to transform the LDAP searches for more efficient requests to LDAP. See [Configuring the class file on Kubernetes](config_class_file_kubernetes.md) for more details.


**Parent Topic: **[Troubleshooting Sametime on Kubernetes](t_troubleshooting_sametime_kubernetes.md)

