# Creating a truststore with a third party certificate {#t_create_truststore .task}

When creating a connection between the Sametime server and a service using TLS, a truststore is needed. The truststore is used to store Sametime certificates.

To create a trust store, the Java Keytool command is used. The keytool utility must be installed to complete the steps. The command is part of the Oracle and OpenJDK toolkits. The OpenJDK is included with Sametime. For more information on keytool, see the OpenJDK [The keytool Command](https://cr.openjdk.java.net/~jjg/8261930/docs/specs/man/keytool.html) or Oracle [Tools Reference](https://docs.oracle.com/en/java/javase/11/tools/keytool.html) websites. Run the utility from the directory where it is installed.

The certificate used to trust the connection must be a CRT file type format. For chained certificates, you also need the root and intermediate certificates.

When using SAML connections, LDAP connections, and business card photos, there are additional considerations for creating the truststore. See the following sections for details.

**Parent topic:**[Securing connections](securing_connections.md)

## Creating a truststore when using SAML {#task_kh3_h2r_dvb}

Ensure that you read the introductory section.

When using a SAML connection, the Sametime server must be able to decodes the SAML tokens. You need to know how many SAML partnerships or relying party trusts are required. For information on identifying the number, see [Setting up SSO using SAML](enabling_sso_saml.md). If you are supporting more than one relying party trust, create one trust store that contains certificates for each one.

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

-   [Configuring SAML on Docker](enabling_saml_docker.md)
-   [Configuring SAML in Kubernetes](enabling_saml_kubernetes.md)

## Creating a truststore when using LDAP {#task_igr_nmr_dvb}

Ensure that you read the introductory section.

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

-   [Configuring LDAP on Docker](configuring_ldap_docker.md)
-   [Configuring LDAP on Kubernetes](configuring_ldap_kubernetes.md)

## Creating a truststore when using business card photos {#task_xjf_s3v_fvb}

If you are retrieving photos from an HTTPS trusted URL, the Sametime Proxy service needs a truststore to properly retrieve the photos from the https protected PhotoURL.

The truststore file name must be named XXXX.p12.

To create the truststore, run the following command.

``` {#codeblock_mqh_gkv_fvb}
keytool -importcert -storetype PKCS12 -keystore XXX.p12 -storepass truststore_password -alias alias_name -file file_to_trust.crt -noprompt
```

truststore\_password
:   The desired password for your truststore. Save the password for later use.

use.alias\_name
:   The value to display in the truststore, each certificate must have a unique alias.

file\_to\_trust.crt
:   The full path to the certificate you are adding to the truststore.

After creating the truststore, see [Setting up business cards](admin_st_buscard.md).

