# Configuring LDAP {#configuring_ldap .task}

Sametime supports LDAP directory servers as the user repository.

For LDAP security, see the security section of the help center.

-   **[Configuring LDAP on Docker](configuring_ldap_docker.md)**  
Content needed.
-   **[Configuring LDAP on Kubernetes](configuring_ldap_kubernetes.md)**  

-   **[Changing the LDAP service account password in Kubernetes](configuring_ldap_password.md)**  
If you are using an authenticated bind for LDAP, with a password that expires periodically, you'll need to update the LDAP bind credentials for Sametime clusters in Kubernetes with a new password.
-   **[Configuring additional LDAP servers on Docker](configuring_ldap_multiple_docker.md)**  
You can configure the Sametime server to connect to two or more LDAP servers.
-   **[Configuring additional LDAP servers on Kubernetes](configuring_ldap_multiple_kubernetes.md)**  
You can configure the Sametime Community pod to connect to two or more LDAP servers.
-   **[Creating custom Java classes for searching LDAP](creating_custom_java.md)**  
**These topic are in progress** Create custom Java™ classes that provide greater control over how Sametime® conducts name searches of an LDAP directory and how results are formatted.

**Parent topic:**[Configuring](configuring.md)

