# Connecting the client through a direct connection over TCP/IP {#config_client_conn_direct .task}

When a user starts the Sametime® Connect Client with a **Direct connection** preference, the client connects to the Sametime Community server using a unique Sametime protocol over TCP/IP. By default, the Community Server listens for this connection on port 1533. Use this preference when the connection does not need to occur through a proxy server, and the network does not block TCP/IP connections on the port used by the client.

A successful connection depends on these prerequisites.

-   The client's preferences for the server community must contain a valid Host server and Server community port for a TCP/IP connection.
-   The Sametime Community Server Connection Settings for **Client Connections**, as defined in the Sametime configuration database, must match the Host server and Server community port specified in the client. The default port is 1533.

The connection can fail if it must pass through a proxy server or network that prevents direct TCP/IP Connections on the specified port.

Follow these steps to select the **Direct connection** method for the client.

1.  From the Sametime Connect client, click **File** \> **Preferences**.

2.  Do one of the following:

    -   To select this connection method for all server communities, click **Server Communities**. In the "Global connection settings" section, click **Direct connection** and click **OK**.
    -   To select this connection method for only one server community, click **Server Communities**, select the server community name, and open the **Connection** tab. Deselect **Use global connection settings**, then click **Direct connection** and click **OK**. Click **OK** to close the **Preferences** window.

**Parent topic:**[Choosing a method for connecting to the Sametime Community Server](config_client_conn_meth_ov.md)

