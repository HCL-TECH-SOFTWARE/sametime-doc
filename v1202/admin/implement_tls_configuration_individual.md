# Implementing the Individual TLS Scope {#implement_tls_configuration_individual .task}

-   GSKit must be installed.
-   You must have a key store and trust store as a .p12 or .jks file.

You can use the global TLS settings for some of the connections and override some or all of them. If you desire to use a combination of the global settings as well as override them for specific services, be sure to review and implement the topic [Implementing the Global TLS Scope](implement_tls_configuration.md).

It is also possible to have each individual type of connection use its own settings and not enable the global settings.

When you are overriding or not using the global settings , pre-fix the configuration settings with the service name you are wanting to secure.

The service pre-fixes take the place of “ST” in the sametime.ini settings that are detailed in the topic [Implementing the Global TLS Scope](implement_tls_configuration.md).

These are the pre-fixes:

|Prefix|Applies to|Description|
|------|----------|-----------|
|ST\_|Global Scope|The global setting prefix that applies to all services unless one of the below settings overrides the global setting.|
|STMUX\_|Sametime Multiplexer|These are for the Sametime Multiplexer both standalone and the one on the Community Server. These are client to server interactions on port 1533.|
|STSRV\_|St Community|These are the settings for server side applications connecting to the Community Server on port 1516. Examples of this include the standalone Mux and the Sametime Proxy Server.|
|STLDAP\_|LDAP|These are interactions between the Sametime Server and the LDAP server. In this case the Sametime server is a client to LDAP and the communications are typically secured on port 1516.|
|STSAML\_|SAML|These settings are used to validate signed responses \(encrypted assertions\) from the IdP are valid.|

To use the prefix, review the setting from [Implementing the Global TLS Scope](implement_tls_configuration.md) table 1. Replace “ST\_” with the prefixes from the table above for each type of server interaction.

**For example,** to configure the trust store for the Sametime Mux, take the setting “ST\_TLS\_TRUST\_STORE\_TYPE”. Remove “ST\_” from the beginning and use “STMUX\_” prefix in front of the parameter. The resulting parameter is STMUX\_TLS\_TRUST\_STORE\_TYPE. This substitution concept works for all parameters listed on the [Implementing the Global TLS Scope](implement_tls_configuration.md) topic.

Once the required sametime.ini parameters are in place be sure to finish configuring your service by completing the topic for the service you are wanting to secure.

