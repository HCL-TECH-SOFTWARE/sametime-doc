# Connecting the client through a direct connection over TCP/IP {#config_client_conn_direct .task}

When a user starts the Sametime Connect client with a **Direct connection** preference, the client connects to the Sametime server using a unique Sametime protocol over TCP/IP. By default, the server listens for this connection on port 1533. Use this preference when the connection does not need to occur through a proxy server, and the network does not block TCP/IP connections on the port used by the client.

A successful connection depends on these prerequisites.

-   The client's preferences for the server community must contain a valid host server and server community port for a TCP/IP connection.

The connection can fail if it passes through a proxy server or network that prevents direct TCP/IP Connections on the specified port.

Follow these steps to select the **Direct connection** method for the client.

1.  From the Sametime Connect client, select **File** \> **Preferences**.

2.  Do one of the following:

    -   To select this connection method for all server communities, select **Server Communities**. In the "Global connection settings" section, select **Direct connection** and select **OK**.
    -   To select this connection method for only one server community, select **Server Communities**, select the server community name, and open the **Connection** tab. Deselect **Use global connection settings**, then select **Direct connection** and select **OK**. Select **OK** to close the **Preferences** window.

**Parent Topic:  **[Choosing a method for connecting to the Sametime server](t_choose_connect_method.md)

