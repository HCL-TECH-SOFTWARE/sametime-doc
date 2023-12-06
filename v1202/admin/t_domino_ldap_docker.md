# Specifying a cipher for Sametime to connect to Domino LDAP on Docker or Podman {#t_domino_ldap_docker .task}

Several options that are related to the LDAP server SSL or TLS secure communications can be controlled by environment variables that are used by System SSL. This topic discusses the steps on how to specify a cipher for Sametime to connect to Domino LDAP.

By default, Domino 12.0.x LDAP servers must be configured to support a certain cipher used by Sametime. For more information, see [Sametime 12.0 TLS required ciphers to connect to Domino 12.0.2 LDAP](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0099644).

This task involves defining the required cipher for Sametime to connect to Domino 12 LDAP servers. To support Domino 12.0.2 LDAP connections, follow these steps.

1.  Open the custom.env file for editing.

2.  Add the following line.

    ``` {#codeblock_xq2_1vy_ztb}
    STI__Config__STLDAP_TLS_CIPHER_SUITES=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
    ```

    For more information on how to configure the sametime.ini file, refer to [Configuring the sametime.ini file on Docker or Podman](chat_configuring_sametimeini_docker.md).

3.  Save and close the file.

4.  Follow the steps in the [Applying configuration changes in Docker or Podman](apply_configchanges_docker.md) topic.


**Parent Topic:  **[Securing connections between Sametime servers and LDAP](securing_connections_sametime_community_and_ldap.md)

