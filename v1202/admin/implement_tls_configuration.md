# Implementing the Global TLS Scope for Docker {#implement_tls_configuration .task}

You must have a key store and trust store as a .p12 file. Both third party and self-signed certificates are supported.

**Note:** If you are supporting mobile clients, use a third-party certificate.

-   A trust store needed for creating outbound connections.
    -   The trust store is used by the client side of a TLS connection to validate the server's certificate.
    -   With mutual authentication, the trust store is also used by the server to validate the client's certificate. 
-   A key store needed for accepting inbound connections.
    -   The key store is used by the server side of a TLS connection to store the server certificate as well as chain certificates, if any chain certificates exist.
    -   During client authentication, the key store is used by the client to store its client certificate and chain certificates, if any exist.
-   All Sametime encryption is done at TLS 1.2, which can be overridden if a lower version is required.

The following tables describe the required and optional configuration settings in the sametime.ini. To configure the sametime.ini file, see [Configuring the sametime.ini file on Docker or Podman](chat_configuring_sametimeini_docker.md).

|Parameter|Description|
|---------|-----------|
|STI\_Config\_ST\_TLS\_TRUST\_STORE\_TYPE|The trust store type. Only p12 trust stores are supported.|
|STI\_Config\_ST\_TLS\_KEY\_STORE\_TYPE|The key store type. Only p12 trust stores are supported.|
|STI\_Config\_ST\_TLS\_TRUST\_STORE\_FILE|The full path and name of the trust store file. For example: /local/notesdata/truststore.p12|
|STI\_Config\_ST\_TLS\_TRUST\_STORE\_PASSWORD|The password to the trust store.For example: `SecureSametimePassw0rd`

|
|STI\_Config\_ST\_TLS\_KEY\_STORE\_FILE|The full path and name of the key store. For example: /local/notesdata/keystore.p12|
|STI\_Config\_ST\_TLS\_KEY\_STORE\_PASSWORD|The password to the keystorel For example: `SecureSametimePassw0rd`|

|Parameter|Description|
|---------|-----------|
|STI\_Config\_ST\_TLS\_FIPS\_COMPLIANCE|Set to 1 to enable FIPS compliance.|
|STI\_Config\_ST\_TLS\_SECURITY\_LEVEL|The required security level. The minimum security level controls compliance with the security standards NIST SP800-131a and NSA Suite B.

 0
:   No requirement

1
:   NIST SP800 -131a “Transition mode”

2
:   NIST SP800-131a “Strict mode”

3
:   NSA Suite B 128-bit level

4
:   NSA Suite B 192-bit level

|
|STI\_Config\_ST\_TLS\_MAX\_SESSION\_AGE|The amount of time before re-negotiating a session. The time to keep a session, in seconds, before deleting it from cache. -1
:   No cache, which is generally sufficient for most Sametime deployments. This is the default value.

0
:   No limit on the age of cached sessions.

|
|STI\_Config\_ST\_TLS\_SESSION\_CACHE\_SIZE|Applies only to inbound connections. The number of TLS sessions that a server keeps in memory, for session reuse. This option tells the server to keep a cache of the TLS session state after the connection is closed. -1
:   No session cache, which is generally sufficient for most Sametime deployments. This is the default value.

0
:   No limit on the number of cached sessions.

It is useful after temporary network outage, when the client attempts to reconnect to the server, by reusing the session that was established earlier.

-   If the server finds the session in cache, the handshake is abbreviated, consuming less resources.
-   If the session is not in cache, a new session is established, including the full handshake.

|
|STI\_Config\_ST\_TLS\_SESSION\_CACHE\_TIME|Applies only to inbound connections. The maximum age of a TLS session, in seconds before renegotiating a session, If the same session is used longer than this setting, a new session is renegotiated over the same connection. The default value 0 means that there is no session renegotiation.|
|STI\_Config\_ST\_TLS\_MIN\_PROTOCOL\_VERSION=|The oldest version of the SSL/TLS protocol to negotiate during handshake. The default value is TLS 1.2.

0x300
:   SSL v3

0x301
:   TLS v1.0

0x302
:   TLS v1.1

0x303
:   TLS v1.2. This is the default value used if the value for the parameter is blank.

|
|STI\_Config\_ST\_TLS\_MAX\_PROTOCOL\_VERSION|The maximum TLS protocol.

0x300
:   SSL v3

0x301
:   TLS v1.0

0x302
:   TLS v1.1

0x303
:   TLS v1.2. This is the default value used if the value for the parameter is blank.

|
|STI\_Config\_ST\_TLS\_CIPHER\_SUITES|A comma-separated list of cipher suites. Leave blank to enable the default cipher suites. |
|STI\_Config\_ST\_TLS\_CLIENT\_AUTH|Request a certificate from the client, does not apply to outbound connections.

 0=None
:   The server does not request a certificate from the client. This is the default value.

1=Want
:   The server requests a certificate from the client, but will proceed with the handshake even if the client does not present one.

2=Need
:   The server requests a certificate from the client, and will fail the connection if the client does not present one.

|
|STI\_Config\_ST\_TLS\_TRUSTED\_HOSTS|A comma-separated list of one or more trusted hosts, to compare against the peer certificate. The comparison takes place during the TLS handshake, when receiving a certificate from the peer, when the client receives the server certificate, or when the server receives a client certificate. The name in the peer certificate is typically specified in either the subject CN \(common name\) or the `subjectAltName` field. Validation passes if there is at least one match between the name in the peer certificate and a name in the trusted hosts list.

A trusted host name may contain the wild card character \(\*\) which can be used to compare domain components rather than the entire string as a whole. The comparison process follows the rules described in section 3.1 of [RFC 2818](https://www.ietf.org/rfc/rfc2818.txt).

Certificate subject validation only applies when receiving a certificate from the peer. In order to ensure that a server performs this comparison, the server must require a client certificate, by setting `ST_TLS_CLIENT_AUTH=2`.

|
|STI\_Config\_ST\_TLS\_MIRROR\_TRUSTED\_HOSTS|This parameter is needed when you have a key store with multiple key certificates. In which case, each certificate has a different alias in the key store. On the server side, specify the alias of the certificate that identifies the server. If the key store is used on the client side of TLS connections, specify the alias of the certificate that identifies the client.|
|STI\_Config\_ST\_TLS\_KEY\_LABEL|This parameter is ignored if the STI\_Config\_ST\_TLS\_KEY\_STORE\_FILE parameter is missing or if there is only one key in the keystore.

 This parameter is needed when you have a key store with multiple key certificates. In which case, each certificate has a different alias in the key store. On the server side, specify the alias of the certificate that identifies the server. If the key store is used on the client side of TLS connections, specify the alias of the certificate that identifies the client.

|

**Note:** When you enable TLS for the Sametime server connections, TLS version 1.2 is used by default. SSLv3 and TLSv1 have security vulnerabilities and should not be used.

**Parent Topic:  **[Securing connections](securing_connections.md)

