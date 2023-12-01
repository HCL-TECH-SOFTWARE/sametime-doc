# Configuring the sametime.ini file {#chat_config_sametimeini .concept}

There are many configuration options in Sametime to override the default behaviors. Server configuration options are in the sametime.ini file.

The sametime.ini file is part of the community pod. Most of the parameters within the file pertain to community related services such as interactions with LDAP, SAML, authentication, Connect client, chat, security, and more.

Care must be taken if you change this file. In previous Sametime versions, updating the file was not

Note that in Sametime 12, the defaults for many parameters changed, and overriding them should be done with caution. If you have any questions about previous server tuning from an older release, contact HCL Support for guidance.

The setting prefix STI followed by two underscores, followed by the section name, then a two underscores, then the parameter and the value. For example, to add a setting called ST\_COMMUNITY\_ID to the \[Config\] section, the new parameter format is STI\_\_Config\_\_ST\_COMMUNITY\_ID.

The value is different with Kubernetes and Docker.

-   For Docker, simply use the = sign and set the value. For example: STI\_\_Config\_\_ST\_COMMUNITY\_ID=sametime
-   For Kubernetes, the value is a keypair in the values.yaml and the value is set in quotes. For example: STI\_\_Config\_\_ST\_COMMUNITY\_ID: "sametime"

If you need to modify a sametime.ini setting, follow the guidance in the topic for your deployment on Docker or Kubernetes.

## Format { .section}

The sametime.ini file is a sectioned configuration file. Sections are noted with square brackets, for example: `[Config]`. The parameters used in the sametime.ini file are valid only when placed within the correct section. Other considerations when working with the file include:

-   Do not duplicate section names or parameters.
-   Use only characters allowed within an XML file.

Parameters are specified as a parameter and value pair. The format is different for Docker and Kubernetes.

Docker
:   parameter=value

Kubernetes
:   parameter:value

These settings are documented throughout the help center as well as in the HCL support portal in knowledge articles. The various documentation may have the older \(before Sametime 12\) notation of the sametime.ini settings with the section name listed separately.

-   **[Configuring the sametime.ini file on Docker](chat_configuring_sametimeini_docker.md)**  

-   **[Configuring the sametime.ini file on Kubernetes](chat_configuring_sametimeini_kubernetes.md)**  


**Parent topic:**[Chat](chat_configuring.md)

