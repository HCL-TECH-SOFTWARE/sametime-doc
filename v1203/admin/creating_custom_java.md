# Creating custom Java classes for searching LDAP {#creating_custom_java .task}

**These topic are in progress** Create custom Java™ classes that provide greater control over how Sametime conducts name searches of an LDAP directory and how results are formatted.

Implementing a custom Java class file to transform LDAP searches helps with performance when the LDAP service has a complex directory schema.

If your configuration is using the UUID attribute as the attribute of the person entry that defines the internal ID of a Sametime user, include UUID in your customized filter.

-   **[Example: Writing a Java class to format names returned in a search](config_chat_ldap_java_format.md)**  
To return a user name in a format that is not available in an LDAP directory entry attribute, you can write a Java™ class that manipulates existing information in the LDAP directory to produce the user name in the desired format.
-   **[Example: Writing a Java class to filter searches for people and groups](config_chat_ldap_java_people.md)**  
If a single search filter is not adequate to resolve user or group name searches, you can write a Java™ class containing a method that specifies exactly how directory searches are conducted. The class can invoke different LDAP search filters depending on search criteria entered by users.
-   **[Configuring the class file on Docker and Podman](config_class_file_docker.md)**  
Use a custom Java class file to transform your searches for LDAP for the community pod.
-   **[Configuring the class file on Kubernetes](config_class_file_kubernetes.md)**  
You can use a custom Java class file to transform your searches for LDAP for the community pod.

**Parent Topic:  **[Configuring LDAP](configuring_ldap.md)

