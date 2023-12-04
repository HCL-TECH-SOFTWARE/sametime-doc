# Choosing a method for connecting to the Sametime server {#config_client_conn_meth_ov .concept}

The Sametime Connect Client uses the connection method specified in Server Communities preferences. The global connection settings apply to all connections unless a specific server community uses an alternate connection method as defined on its Connection tab in the Preferences window.

This section explains how to configure the different types of connections.

-   **[Connecting the client through a direct connection over TCP/IP](t_client_connect_direct.md)**  
When a user starts the Sametime Connect client with a **Direct connection** preference, the client connects to the Sametime server using a unique Sametime protocol over TCP/IP. By default, the server listens for this connection on port 1533. Use this preference when the connection does not need to occur through a proxy server, and the network does not block TCP/IP connections on the port used by the client.
-   **[Connecting the client through a TLS connection](t_client_connect_tls.md)**  
When a user starts the Sametime Connect client with a **Direct connection using TLS** preference, the client connects to the Sametime server using the Transport Layer Security \(TLS\) protocol. Use this preference for clients that must connect through a FIPS proxy server.
-   **[Connecting the client through a proxy connection](t_client_connect_proxy.md)**  
When a user starts the Sametime Connect client with a **Use proxy** preference, the client connects to the Sametime server through a SOCKS, HTTP, or HTTPS proxy server.

**Parent Topic: **[Connecting the Sametime Connect client to the Sametime server](t_connect_clienttoserver.md)

