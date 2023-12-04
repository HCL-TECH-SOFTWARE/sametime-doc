# Creating a truststore when using SAML {#t_create_truststore_SAML .task}

Ensure that you have read the [section overview](t_create_truststore.md).

When using a SAML connection, the Sametime server must be able to decode the SAML tokens. You need to know how many SAML partnerships or relying party trusts are required. For information on identifying the number, see [Setting up SSO using SAML](enabling_sso_saml.md). If you are supporting more than one relying party trust, create one trust store that contains certificates for each one.

The SAML trust store file name must be samltruststore.p12.

1.  Run the following command.

    ``` {#codeblock_bzs_1nr_dvb}
    
    keytool -importcert -storetype PKCS12 -keystore samltruststore.p12 -storepass truststore\_password -alias alias\_name -file file\_to\_trust.crt -noprompt
    ```

    truststore\_password
    :   The desired password for your trust store. Save the password for later use.

    alias\_name
    :   The value to display in the trust store, each certificate must have a unique alias.

    file\_to\_trust.crt
    :   The full path to the certificate you are adding to the trust store.

    **Note:** If you are using OpenJDK version 11 and later, add the `-J-Dkeystore.pkcs12.legacy` parameter to the command. For example:

    ``` {#codeblock_q5k_m3v_fvb}
    keytool -importcert -storetype PKCS12 -keystore samltruststore.p12 -storepass truststore\_password -alias alias\_name -file file\_to\_trust.crt -noprompt -J-Dkeystore.pkcs12.legacy 
    ```


To complete the configuration, refer to one of the following topics.

-   [Configuring SAML on Docker and Podman](enabling_saml_docker.md)
-   [Configuring SAML in Kubernetes](enabling_saml_kubernetes.md)

**Parent Topic: **[Creating a truststore with a third-party certificate](t_create_truststore.md)

