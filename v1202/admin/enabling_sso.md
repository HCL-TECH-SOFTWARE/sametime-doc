# Enabling Single Sign-on {#enabling_sso .task}

The HCL Sametime server installer enables required JSON Web Token \(JWT\) authentication. Additionally, the Sametime server supports Security Assertion Markup Language \(SAML\) and Lightweight Third Party Authentication \(LTPA\) Single Sign-on \(SSO\).

SSO is required by the Sametime Community, Proxy, and Meeting services. Typically no further configuration is required, but in some situations you might need to configure SSO to work with other servers. For example, if you have Sametime Integration with Verse, you need to share the same SSO with the Verse servers.

With SSO configured, users who log in to any server within the configured DNS domain do not have to log in again when they access another participating server.

**Note:** When using SSO all servers must use the fully qualified host names, such as server.example.com for the LTPA tokens to be created correctly.

-   **[Setting up SSO using LTPA](enabling_sso_ltpa.md)**  
You can implement SSO into your environment using Lightweight Third Party Authentication \(LTPA\) which requires LTPA keys.
-   **[Setting up SSO using SAML](enabling_sso_saml.md)**  
You can implement SSO into your environment using Security Assertion Markup Language \(SAML\). The process is different for Kubernetes and Docker.

**Parent Topic: **[Securing](securing.md)

