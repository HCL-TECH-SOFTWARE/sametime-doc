# Defining the host server and port for connecting to a Sametime server {#config_client_conn_host .task}

The Sametime Connect client uses the host and server community port preferences to determine the host name and port it should use when attempting a connection to the Sametime server.

Follow these instructions to define the host server and port for a server community.

1.  From the Sametime Connect client, choose **File** \> **Preferences**.
2.  Select **Server Communities**.
3.  Do one of the following:
    -   To add a new server connection, select **Add New Server Community**.
    -   To change an existing server connection, expand the **Server Community list** and select the community name.
4.  For an existing community, proceed to the next step. For a new community, provide a community name and log in information.
5.  Select the **Connection tab**.
6.  Provide a host server and port. The method chosen for connecting to the server may also affect the Host server and port you use here.
    -   Host server
    -   Server community port
7.  For an existing community, select **OK** to close the Preferences window.
8.  For a new community, select **OK** to save and then **OK** to close the Preferences window.

**Configuring client connectivity to the Sametime mux**

Each user must update the Sametime Connect Client with the DNS name of the Sametime Community Mux server. If you have deployed multiple Sametime Community Mux servers, distribute users evenly among the servers. For example, with two multiplexers, direct half of your users to use multiplexer 1 and the other half to use multiplexer 2.

1.  Open Sametime Connect client.

2.  Choose **File** \> **Preferences** \> **Server Communities**.

3.  In the**Server Community** field, type the fully qualified host name of the Sametime Community Mux server, such as messaging.example.com.


**Parent Topic: **[Connecting the Sametime Connect client to the Sametime server](t_connect_clienttoserver.md)

