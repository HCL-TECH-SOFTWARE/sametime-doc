# Choosing a method for connecting to the Sametime Community Server {#config_client_conn_meth_ov .concept}

The Sametime® Connect Client uses the connection method specified in Server Communities preferences. The Global connection settings apply to all Connections unless a specific server community uses an alternate connection method as defined on its Connection tab in the Preferences window.

This section explains how to configure the different types of connections.

-   **[Connecting the client through a direct connection over TCP/IP](config_client_conn_direct.md)**  
When a user starts the Sametime Connect Client with a **Direct connection** preference, the client connects to the Sametime Community server using a unique Sametime protocol over TCP/IP. By default, the Community Server listens for this connection on port 1533. Use this preference when the connection does not need to occur through a proxy server, and the network does not block TCP/IP connections on the port used by the client.
-   **[Connecting the client through a TLS connection](config_client_conn_tls.md)**  
When a user starts the Sametime Connect Client with a **Direct connection using TLS** preference, the client connects to the Sametime Community server using the Transport Layer Security \(TLS\) protocol. Use this preference for clients that must connect through a FIPS proxy server.
-   **[Connecting the client through a proxy connection](config_client_conn_prox.md)**  
When a user starts the Sametime Connect Client with a **Use proxy** preference, the client connects to the HCL® Sametime Community server through a SOCKS, HTTP, or HTTPS proxy server.

**Parent topic:**[Connecting the Sametime Connect client to the Sametime server](config_client_conn_ov.md)

