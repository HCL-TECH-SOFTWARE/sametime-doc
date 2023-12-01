# Connecting the client through a TLS connection {#config_client_conn_tls .task}

When a user starts the Sametime® Connect Client with a **Direct connection using TLS** preference, the client connects to the Sametime Community server using the Transport Layer Security \(TLS\) protocol. Use this preference for clients that must connect through a FIPS proxy server.

A successful connection depends on these prerequisites.

-   The client's preferences for the server community must contain a valid Host server and Server community port for a TLS connection.
-   The server must be configured to allow TLS connections from clients, see the topic: [Securing connections between Sametime Community and Sametime clients](securing_connections_between_community_clients.md).

Follow these steps to select the **Direct connection using TLS** method for the client.

1.  From the Sametime Connect client client, click **File** \> **Preferences**.

2.  Do one of the following:

    -   To select this connection method for all server communities, click **Server Communities**. In the "Global connection settings" section, click **Direct connection using TLS** and click **OK**.
    -   To select this connection method for only one server community, click **Server Communities**, select the server community name, and open the **Connection** tab. Uncheck **Use global connection settings**, then click **Direct connection using TLS** and click **OK**. Click OK to close the **Preferences** window.

**Parent topic:**[Choosing a method for connecting to the Sametime Community Server](config_client_conn_meth_ov.md)

