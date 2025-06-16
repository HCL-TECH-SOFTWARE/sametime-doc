# Creating a truststore with a third-party certificate {#t_create_truststore .task}

When creating a connection between the Sametime server and a service using TLS, a truststore is needed. The truststore is used to store certificates for Sametime.

To create a trust store, the Java Keytool command is used. The keytool utility must be installed to complete the steps. The command is part of the Oracle and OpenJDK toolkits. The OpenJDK is included with Sametime. For more information on keytool, see the OpenJDK [The keytool Command](https://cr.openjdk.java.net/~jjg/8261930/docs/specs/man/keytool.html) or Oracle [Tools Reference](https://docs.oracle.com/en/java/javase/11/tools/keytool.html) websites. Run the utility from the directory where it is installed.

**Note:** If you are using a Keytool version other than the version that comes installed with Sametime, see the [Sametime unable to read trust store causing LDAP connection to fail](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0101354) knowledge article for additional configuration tasks.

The certificate used to trust the connection must be a CRT file type format. For chained certificates, you also need the root and intermediate certificates.

When using SAML connections, LDAP connections, and business card photos, there are additional considerations for creating the truststore.

-   **[Creating a truststore when using SAML](t_create_truststore_SAML.md)**  

-   **[Creating a truststore when using LDAP](t_create_truststore_LDAP.md)**  

-   **[Creating a truststore when using business card photos](t_create_truststore_businesscards.md)**  


**Parent Topic:  **[Securing connections](securing_connections.md)

