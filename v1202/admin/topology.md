# Planning the network topology and connectivity {#topology .concept}

This topic explains how Sametime components are connected and the default ports that are used. There are also example topologies to illustrate how Sametime can be deployed in different scenarios.

The following are components within the Sametime topology.

-   Docker or Kubernetes
-   Directory service
-   Database
-   Clients

Clients are the interfaces used to connect with the Sametime server and product features. Each physical component communicates with the Sametime server using a specific port. See [Sametime clients](hcl_sametime_clients.md) for more information on clients.

## Directory services {#section_i5j_rmt_v5b .section}

When choosing which LDAP directory to use, consider all the integrations with Sametime. It is important to understand how users authenticate with the server. Sametime can be integrated into many other HCL products, such as HCL iNotes, Verse, Connections, and Digital Experience. It is important to understand how users authenticate with the server and use a common LDAP directory.

Review the [LDAP Planning](ldap.md) section for additional information when choosing a directory.

## Single sign-on \(SSO\) {#section_plw_cnt_v5b .section}

Sametime requires Single Sign On and issues a JWT token to the users upon log in. All users are authenticated against the Community service, where tokens are generated to be shared with the other microservices.

As an optional configuration, Sametime supports LTPA Single Sign On as well as Security Assertion Markup Language \(SAML\). With LTPA SSO, the user is issued an LTPA token, which can be shared with other services that support LTPA authentication, such as HCL Domino, Verse, and Connections.

With SAML, the initial authentication is done by an Identity Provider which validates the user’s identity with the Community service. The user is then provided a JWT token that is good for the duration of their session. For more information, see [Enabling Single Sign-on](enabling_sso.md).

-   **[Planning considerations for chat](topology_chat.md)**  

-   **[Considerations for Sametime Premium](topology_premium.md)**  
 Sametime Premium deployments are supported on Docker or Kubernetes.
-   **[Considerations for telephony](topology_telephony.md)**  
Integration with the Teamcall Meeting Gateway \(TMG\) application from ilink enables telephony services to be added to your Sametime environment. The telephony feature allows telephone access to chats and meetings.
-   **[Ports used by Sametime services](ports_sametime.md)**  
Sametime services use several ports for communication. If firewalls are in use in your environment, all traffic on these ports should be permitted bidirectionally.

**Parent Topic:  **[Planning](planning.md)

