# Creating a truststore when using LDAP {#t_create_truststore_LDAP .task}

Ensure that you have read the [section overview](t_create_truststore.md).

If the connection is secured using TLS, a certificate is needed to complete the SSL handshake with LDAP. If you are connecting to multiple LDAP servers that have different certificates, you need to trust each certificate in a single trust store.

The LDAP trust store file name must be ldaptruststore.p12. It is defined using the commands in this procedure.

1.  Copy the certificates to be trusted to the machine where the keytool utility is installed, and stage them in a temporary directory.

2.  Create a keystore by issuing the below command with the parameters:

    ``` {#codeblock_btx_jtr_dvb}
    keytool -importcert -storetype PKCS12 -keystore ldaptruststore.p12 -storepass truststore\_password -alias alias\_name -file file\_to\_trust.crt -noprompt
    ```

    truststore\_password
    :   The desired password for your trust store. Save the password for later use.

    alias\_name
    :   The value to display in the trust store, each certificate must have a unique alias.

    file\_to\_trust.crt
    :   The full path to the certificate you are adding to the trust store.

3.  To import additional certificates into an existing trust store, run the below command, be sure to use a unique alias for each additional certificate.

    ``` {#codeblock_bhp_rtr_dvb}
    keytool -importcert -storetype PKCS12 -keystore ldaptruststore.p12 -storepass truststore\_password -alias aliasname -file file\_to\_trust.crt -noprompt
    ```


To implement the trust store, refer to one of the following topics.

-   [Configuring LDAP on Docker and Podman](configuring_ldap_docker.md)
-   [Overriding the default LDAP configuration in Kubernetes](configuring_ldap_kubernetes.md)

**Parent Topic:  **[Creating a truststore with a third-party certificate](t_create_truststore.md)

