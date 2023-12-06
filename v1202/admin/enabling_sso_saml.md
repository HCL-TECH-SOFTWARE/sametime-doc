# Setting up SSO using SAML {#enabling_sso_saml .task}

You can implement SSO into your environment using Security Assertion Markup Language \(SAML\). The process is different for Kubernetes and Docker.

One user access URL for the Sametime server is needed for the identity provider \(IdP\). An IdP is a service that stores and verifies the identity of users. In previous Sametime releases, the community services for rich clients was separate from the web chat and meeting services. In Sametime 12, all services are under the Sametime server. Because there is only one server, only one host name is required for all three types of user access: rich clients, web chat, and meetings.

To use SAML, the IdP administrator must create a federated partnership or relying party trust for the Sametime server. Additionally, the user access URL for the Sametime configuration and a certificate to be trusted by the Sametime server must be provided.

If you are upgrading from a previous Sametime version, you might want to keep using the same host names. Use the following scenarios for IdP requirement guidance.

Scenario 1
:   If one host name is used for accessing rich clients, web chat clients, and meeting clients, then only one SAML partnership or relying party trust is needed.

Scenario 2
:   If using a different host name for rich clients and web chat clients, then include the following SAML partnerships or relying party trusts:

    -   One for the chat host name that is exposed to the Sametime Mux service
    -   One for the web chat host name defined for ingress

Scenario 3
:   If using a different host name for rich client, web chat clients, and meeting clients, then include the following SAML partnerships or relying party trusts:

    -   One for the chat host name that is exposed to the Sametime Mux service
    -   One for the web chat host name defined for ingress

    **Note:** Meeting authentication is processed through the web chat proxy and no specific SAML partnership is required for the meeting host name.

Each IdP varies in implementation and terminology. The following are some guidelines for configuring your IdP. Only IdP initiated sign-on is supported.

SAML assertion consumer service URL
:   The fully-qualified URL of the Sametime server, add /stwebapi/user/connect. For example, https://sametime.example.com/stwebapi/user/connect at the end of the URL.

:   If you are using a separate name for the web chat client, you can use the webchat host name in the URL. For example: https://webchat.example.con/stwebapi/user/connect.

:   If the Community chat server has a separate host name from webchat or rich clients, use the community host name in the URL, for example: https://chat.example.com .

Relay State
:   Specify the same value as the what is specified for the SAML assertion consumer service URL.

Log out URL
:   Do not specify a value for this property. The SAML logout specification is not supported in Sametime.

Name ID
:   Specify the attribute from the IdP that contains the user's email address.

Certificate for TLS
:   A secure connection to the IdP is required and the IdP administrator must provide the certificate for Sametime to trust. If you have multiple relying party trusts, the IdP might have separate certificates for each host name trusted or a single certificate. Such as in the case of separated host names. If there are more than one certificate, each certificate and its full chain must be added to the trust store.

-   **[Configuring SAML on Docker and Podman](enabling_saml_docker.md)**  

-   **[Configuring SAML in Kubernetes](enabling_saml_kubernetes.md)**  
You can implement SSO into your Kubernetes environment using Security Assertion Markup Language \(SAML\).
-   **[Configuration settings related to SAML authentication](configuring_sso_saml.md)**  
You can override default configuration settings in the sametime.ini file. Note that the settings are implemented differently depending on the platform: Docker, Podman, Kubernetes, and Openshift.
-   **[Enabling SAML authentication in client installation packages](enabling_saml.md)**  
Ensure that Sametime Connect and Embedded clients can connect to the Sametime using SAML by adding the new trusted audience URL to the client preferences before installing or updating the clients.
-   **[Enabling SAML authentication in installed clients](enabling_saml_clients.md)**  
Enable SAML authentication from within the HCL® Sametime® Connect or Embedded client that is already installed on a computer.

**Parent Topic:  **[Enabling Single Sign-on](enabling_sso.md)

