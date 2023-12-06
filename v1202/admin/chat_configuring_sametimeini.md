# Configuring the sametime.ini file {#chat_config_sametimeini .concept}

There are many configuration options in Sametime to override the default behaviors. Community related configuration options are in the sametime.ini file.

The sametime.ini file is part of the community container. Most of the parameters within the file pertain to community related services such as interactions with LDAP, SAML, authentication, Connect client, chat, security, and more.

Beginning in Sametime version 12, the defaults for many parameters have changed. If you have questions about previous parameter from a previous Sametime release, contact HCL Support for guidance.

The STI setting prefix followed by two underscores, followed by the section name, then a two underscores, then the parameter and the value. For example, to add a setting called ST\_COMMUNITY\_ID to the `[Config]` section, the new parameter format is STI\_\_Config\_\_ST\_COMMUNITY\_ID.

The HCL documentation and support knowledge articles document various configuration parameters created before Sametime version 12. These documents might refer to the settings using the older parameter names.

## Format { .section}

The sametime.ini file is a sectioned configuration file. Sections are noted with square brackets, for example: `[Config]`. The parameters specified in the sametime.ini file are valid only when placed within the correct section. Use only characters allowed within an XML file.

Parameters are specified as a key and value pair. The format is different for Docker and Kubernetes.

Docker
:   key=value

Kubernetes
:   key:"value"

For example:

-   Docker

    ``` {#codeblock_stj_kzc_nwb}
    STI__Config__ST_COMMUNITY_ID=sametime 
    ```

-   Kubernetes

    ``` {#codeblock_ttj_kzc_nwb}
    STI__Config__ST_COMMUNITY_ID: "sametime"
    ```


These settings are documented throughout the help center as well as in the HCL support portal in knowledge articles. The various documentation may have the older \(before Sametime 12\) notation of the sametime.ini settings with the section name listed separately.

If you need to modify a sametime.ini setting, follow the guidance in the topic for your deployment on Docker or Kubernetes.

-   **[Configuring the sametime.ini file on Docker or Podman](chat_configuring_sametimeini_docker.md)**  

-   **[Configuring the sametime.ini file on Kubernetes](chat_configuring_sametimeini_kubernetes.md)**  


**Parent Topic:  **[Chat](chat_configuring.md)

