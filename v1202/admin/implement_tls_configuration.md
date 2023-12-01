# Implementing the Global TLS Scope {#implement_tls_configuration .task}

-   GSKit must already be installed.
-   You must have a key store and trust store as a .p12 or .jks file.
-   Both third party and self-signed certificates are supported.

    **Note:** If you have a Sametime Proxy server, it should use third-party certificates if you plan to support mobile clients.


**Concepts:**

-   There is a trust store needed for creating outbound connections.
    -   The trust store is used by the client side of a TLS connection to validate the server's certificate.
    -   With mutual authentication, the trust store is also used by the server to validate the client's certificate. 
-   There is a key store needed for accepting inbound connections.
    -   The key store is used by the server side of a TLS connection to store the server certificate as well as chain certificates, if any chain certificates exist.
    -   During client authentication, the key store is used by the client to store its client certificate and chain certificates, if any exist.
-   All Sametime encryption is done at TLS 1.2, which can be overridden if a lower version is required.

Configure these required parameters into the \[Config\] section of sametime.ini

|Setting|Description|Example Value|
|-------|-----------|-------------|
|ST\_TLS\_TRUST\_STORE\_TYPE|The trust store type p12= use for files ending with .p12 or .pfx \(p12 is recommended\) jks= use for files ending with .jks|p12|
|ST\_TLS\_KEY\_STORE\_TYPE|This is for the key store type. p12= use for files ending with .p12 or .pfx \(p12 is recommended\) jks= use for files ending with .jks|p12|
|ST\_TLS\_TRUST\_STORE\_FILE|Enter the full path and name of the trust store file.|C:\\Program Files\\HCL\\Domino\\truststore.p12|
|ST\_TLS\_TRUST\_STORE\_PASSWORD|Enter the password to the trust store. This will be stored in clear text, if desired a stash file can be used instead. Refer to the optional parameters section.|SecureSametimePassw0rd|
|ST\_TLS\_KEY\_STORE\_FILE|Enter the full path and name of the key store.|C:\\Program Files\\HCL\\Domino\\keystore.p12|
|ST\_TLS\_KEY\_STORE\_PASSWORD|Enter the password to the keystore|SecureSametimePassw0rd|

**Optional: Additional Sametime.ini parameters**

|Example|Description|
|-------|-----------|
|ST\_TLS\_FIPS\_COMPLIANCE|Set to 1 to enable FIPS compliance.|
|ST\_TLS\_SECURITY\_LEVEL|The required security level. The minimum security level controls compliance with the security standards NIST SP800-131a and NSA Suite B.

 **0 = No requirement**

 **1 = NIST SP800 -131a “Transition mode”**

 **2 = NIST SP800-131a “Strict mode”**

 **3 = NSA Suite B 128-bit level**

 **4 = NSA Suite B 192-bit level**

|
|ST\_TLS\_MAX\_SESSION\_AGE|The amount of time before re-negotiating a session. The time to keep a session, in seconds, before deleting it from cache. The default of -1 implies no cache, which is generally sufficient for most Sametime deployments. A 0 implies no limit on the age of cached sessions.|
|ST\_TLS\_SESSION\_CACHE\_SIZE|Ignored for outbound connections, only applies to inbound connections. The number of TLS sessions that a server keeps in memory, for session reuse. This option tells the server to keep a cache of the TLS session state after the connection is closed. It is useful after temporary network outage, when the client attempts to reconnect to the server, by reusing the session that was established earlier. If the server finds the session in cache, the handshake is abbreviated, consuming less resources. If the session is not in cache, a new session is established, including the full handshake. The default value of -1 implies no session caching, which is generally sufficient for most Sametime deployments. A value of 0 imposes no limit on the number of cached sessions.|
|ST\_TLS\_SESSION\_CACHE\_TIME|Ignored for outbound connections, only applies to inbound connections. Time before renegotiating a session - The maximum age of a TLS session, in seconds. If the same session is used longer than this setting, a new session is renegotiated over the same connection. The default value of 0 implies no session renegotiation.|
|ST\_TLS\_MIN\_PROTOCOL\_VERSION=|The oldest version of the SSL/TLS protocol to negotiate during handshake. To set a TLS protocol other than 1.2, use Set the value to your needs:

 **For SSL v3: 0x300**

 **For TLS v1.0 = 0x301**

 **For TLS v1.1 = 0x302**

 **For TLS v1.2 = 0x303 \(or leave blank for default to TLS 1.2\)**

|
|ST\_TLS\_MAX\_PROTOCOL\_VERSION|To set a maximum TLS protocol other than 1.2, use Set the value to your needs:

 **For SSL v3: 0x300**

 **For TLS v1.0 = 0x301**

 **For TLS v1.1 = 0x302**

 **For TLS v1.2 = 0x303 \(or leave blank for default to TLS 1.2\)**

|
|ST\_TLS\_CIPHER\_SUITES|A comma-separated list of cipher suites. Leave blank to enable the default cipher suites. |
|ST\_TLS\_CLIENT\_AUTH|Request a certificate from the client, does not apply to outbound connections.

 **0 = None:** The server will not request a certificate from the client. This is the default value.

 **1 = Want:** The server will request a certificate from the client, but will proceed with the handshake even if the client does not present one.

 **2 = Need:** The server will request a certificate from the client, and will fail the connection if the client does not present one.

|
|ST\_TLS\_TRUSTED\_HOSTS|A list of trusted certificate hostnames. A comma-separated list of one or more trusted hosts, to compare against the peer certificate. This comparison takes place during the TLS handshake, when receiving a certificate from the peer -- either when the client receives the server certificate, or when the server receives a client certificate. The name in the peer certificate is typically specified in either the subject CN \(common name\) or the `subjectAltName` field. Validation passes if there is at least one match between the name in the peer certificate and a name in the trusted hosts list. A trusted host name may contain the wildcard character \*, indicating comparison of domain components rather than the entire string as a whole. This follows the matching rules of [RFC 2818](https://www.ietf.org/rfc/rfc2818.txt) section 3.1. Certificate subject validation only applies when receiving a certificate from the peer. In order to ensure that a server performs this comparison, the server must require a client certificate, by setting `ST_TLS_CLIENT_AUTH=2`.|
|ST\_TLS\_MIRROR\_TRUSTED\_HOSTS|Necessary only if you have a key store with multiple key certificates. In which case, each certificate has a different alias in the key store. On the server side, specify the alias of the certificate that identifies the server. If the key store is used on the client side of TLS connections, specify the alias of the certificate that identifies the client.|
|ST\_TLS\_KEY\_LABEL|Ignored if ST\_TLS\_KEY\_STORE\_FILE is missing, or if there is only one key in the keystore.

 Necessary only if you have a key store with multiple key certificates. In which case, each certificate has a different alias in the key store. On the server side, specify the alias of the certificate that identifies the server. If the key store is used on the client side of TLS connections, specify the alias of the certificate that identifies the client.

|

**Note:** When you enable TLS for the Sametime server connections, TLS version 1.2 is used by default. SSLv3 and TLSv1 have security vulnerabilities and should not be used.

**Parameters to use a stash file**

Storing the certificate store password in a stash file is useful for keeping sametime.ini file clean of passwords. The password stash file is not securely encrypted, and therefore it should be protected from unauthorized access.

To create the password stash file for the first time, complete these steps:

1.  Set both the password parameters in the \[Config\] section of sametime.ini:

    `ST_TLS_TRUST_STORE_PASSWORD=<your password>`

    `ST_TLS_KEY_STORE_PASSWORD=<your password>`

2.  Set the path to the stash files, relative to the Domino directory:

    `ST_TLS_KEY_STORE_PASSWORD_STASH_FILE=<C:\Program Files\HCL\Domino\key.sth>`

    `ST_TLS_TRUST_STORE_PASSWORD_STASH_FILE=<C:\Program Files\HCL\Domino\trust.sth>`

3.  Make sure the password stash file does not exist in the file system.
4.  Start the Sametime server.
5.  Upon initialization, Sametime creates the password stash file and deletes the cleartext password from the configuration.
6.  The next time the server is started, the password is obtained from the password stash file.

**Note:** The password stash file is not securely encrypted, it must be protected from unauthorized access.

**Parent topic:**[Choosing the TLS configuration scope](tls_configuration.md)

