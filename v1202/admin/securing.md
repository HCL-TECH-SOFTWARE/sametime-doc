# Securing {#securing .task}

This section provides information on securing your HCL Sametime environments.

-   **[Securing connections](securing_connections.md)**  
The various connections to Sametime can be secured using TLS.
-   **[Enabling Single Sign-on](enabling_sso.md)**  
The HCL Sametime server installer enables required JSON Web Token \(JWT\) authentication. Additionally, the Sametime server supports Security Assertion Markup Language \(SAML\) and Lightweight Third Party Authentication \(LTPA\) Single Sign-on \(SSO\).
-   **[Enabling security in the MongoDB](security_mongodb.md)**  
To enable MongoDB securing, edit the mongod.conf file **authorization: enabled** setting.
-   **[Enabling TLS for the Mongo database](security_mongodb_tls.md)**  
You can update the MongoDB connection with the Sametime Community server to encrypt data flowing between the Sametime server and a TLS enabled MongoDB.
-   **[Updating the Sametime server TLS certificates](updating_meeting_servers.md)**  
The Sametime server is pre-configured with a self-signed certificate. You can replace the self-signed certificate with a third party certificate.
-   **[Applying Let's Encrypt certificates](using_meeting_servers.md)**  


**Parent topic:**[HCL Sametime Administration Guide 12.0.1](administrator_doc.md)

