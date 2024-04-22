# Securing {#securing .task}

This section provides information on securing your HCL Sametime environments.

-   **[Encryption usage in Sametime](overview_encryption.md)**  
HCL Sametime uses several types of encryption to protect data.
-   **[Securing connections](securing_connections.md)**  
The various connections to Sametime can be secured using TLS.
-   **[Enabling Single Sign-on](enabling_sso.md)**  
The HCL Sametime server installer enables required JSON Web Token \(JWT\) authentication. Additionally, the Sametime server supports Security Assertion Markup Language \(SAML\) and Lightweight Third Party Authentication \(LTPA\) Single Sign-on \(SSO\).
-   **[Setting up TLS for the Mongo database](security_mongodb_tls.md)**  
You can update the MongoDB connection with the Sametime server to encrypt data flowing between the Sametime server and a TLS-enabled MongoDB. This step is optional but is recommended for [multi-Kubernetes-cluster deployments](https://www.mongodb.com/docs/kubernetes-operator/stable/multi-cluster-overview/#multi-cluster-overview-ref).
-   **[Replacing the TLS certificates for Web Chat and Meetings](tls_change_certificate.md)**  
The Sametime server is pre-configured with a self-signed certificate. You can replace the self-signed certificate with a third party certificate.
-   **[Applying Let's Encrypt certificates](using_meeting_servers.md)**  
This topic describes how to replace the self-signed certificate with a third-party certificate.

