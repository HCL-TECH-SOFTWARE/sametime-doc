# Connecting the client through a TLS connection {#config_client_conn_tls .task}

When a user starts the Sametime Connect client with a **Direct connection using TLS** preference, the client connects to the Sametime server using the Transport Layer Security \(TLS\) protocol. Use this preference for clients that must connect through a FIPS proxy server.

Follow these steps to select the **Direct connection using TLS** method for the client.

1.  From the Sametime Connect client, select **File** \> **Preferences**.

2.  Do one of the following:

    -   To select this connection method for all server communities, do the following.
        1.  Select **Server Communities**.
        2.  From the Global connection settings section, select **Direct connection using TLS**.
        3.  Select **OK**.
    -   To choose this connection method for only one server community, do the following.
        1.  Select **Server Communities**.
        2.  Select the server community name.
        3.  Open the **Connection** tab.
        4.  Uncheck **Use global connection settings**, then select **Direct connection using TLS** and select **OK**.
        5.  Select **OK** to close the **Preferences** window.

**Parent Topic:  **[Choosing a method for connecting to the Sametime server](t_choose_connect_method.md)

