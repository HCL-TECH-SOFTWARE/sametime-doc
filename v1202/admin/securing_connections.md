# Securing connections {#securing_connections .concept}

The various connections to Sametime can be secured using TLS.

Desktop client to Sametime server
:   These are connections from the Sametime Connect client or Sametime embedded client inside HCL Notes that connect on port 1533 to the Sametime Multiplexer \(Mux\) by default. Sametime has legacy encryption enabled by default. These connections can be secured over TLS 1.2. For additional information, see [Securing connections between the Sametime mux and the Connect and Embedded clients](securing_connections_between_community_clients.md).

Sametime web and mobile clients
:   Sametime meetings and web chat come with a self-signed certificate. You can replace the self-signed certificate with a third party certificate. For more details on this configuration, see [Replacing the TLS certificates for Web Chat and Meetings](tls_change_certificate.md).

Sametime server to LDAP server
:   By default the LDAP operations are not encrypted. It is recommended to enable encryption using TLS to encrypt sensitive user data, such as names and passwords. The secure port for LDAPS is typically 636 but may be different in your environment. For more details on this configuration, see [Securing connections between Sametime servers and LDAP](securing_connections_sametime_community_and_ldap.md).

Decrypting SAML assertions
:   When Sametime server is configured for SAML, the Sametime server can validate the encrypted assertions are from the Identity Provider \(IdP\). These settings is used for the decryption. For more information, see [Setting up SSO using SAML](enabling_sso_saml.md).

MongoDB
:   The connection Sametime uses to access MongoDB can be secured with TLS. For more details, see [Setting up TLS for the Mongo database](security_mongodb_tls.md).

Configuration scope
:   Beginning with Sametime 12, Kubernetes environments have a separate TLS scope for each type of connection as described above. Docker environments can be configured to use key and trust stores at the global level, where all certificates are shared among the different community services. For more details on this configuration, see [Implementing the Global TLS Scope for Docker](implement_tls_configuration.md).

-   **[Obtaining the cert.key and cert.crt files for Sametime](t_generate_certkey.md)**  

-   **[Creating a truststore with a third-party certificate](t_create_truststore.md)**  
When creating a connection between the Sametime server and a service using TLS, a truststore is needed. The truststore is used to store certificates for Sametime.
-   **[Implementing the Global TLS Scope for Docker](implement_tls_configuration.md)**  

-   **[Securing connections between the Sametime mux and the Connect and Embedded clients](securing_connections_between_community_clients.md)**  
There are several connection methods to connect to the Sametime server. This topic includes the steps to encrypt connections between the clients and the Sametime mux using TLS.
-   **[Securing connections between Sametime servers and LDAP](securing_connections_sametime_community_and_ldap.md)**  
When Sametime is configured to connect to an LDAP server, the Sametime servers makes five separate connections to the LDAP server.

**Parent Topic:  **[Securing](securing.md)

