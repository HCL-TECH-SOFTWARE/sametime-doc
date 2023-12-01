# Choosing the TLS configuration scope {#tls_configuration .task}

When configuring security, you can configure key store, trust store and other configuration settings globally that apply to all Community server interactions. This creates a single place for an administer to manage configuration settings because there is only one place to maintain certificates, as well as fewer settings to configure.

Optionally, TLS configuration settings can be overridden to have separate key and trust store, and settings for each type of connection if required in your environment.

Only the settings in the sametime.ini file are global. To complete the configuration, some additional configuration may be required in the `stconfig.nsf` or some of the server xml files. These settings are detailed under the appropriate topic labeled for each type of server interaction.

-   **[Implementing the Global TLS Scope](implement_tls_configuration.md)**  

-   **[Implementing the Individual TLS Scope](implement_tls_configuration_individual.md)**  


**Parent topic:**[Securing connections](securing_connections.md)

