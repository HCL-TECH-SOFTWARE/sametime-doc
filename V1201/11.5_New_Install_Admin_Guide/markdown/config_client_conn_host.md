# Defining the host server and port for connecting to a Sametime server {#config_client_conn_host .task}

The Sametime Connect client uses the **Host** and **Server community port** preferences to determine the host name and port it should use when attempting a connection to the Sametime server. This section also includes optional steps for configuring client with the Sametime Mux.

Verify the **Connectivity** settings for client Connections set for the Sametime server. The client's successful connection depends on defining the correct **host name**, **port**, and **connection method** for the server.

-   In the **Client Connections** section, type the fully qualified host name and port from which services listen for direct TCP/IP Connections and HTTP-tunneled Connections from the services clients.
-   In the **HTTP Tunneled Client Connections** section, type the fully qualified Host Name and Port from which Community Services clients can make HTTP-tunneled Connections to the services multiplexer. Services clients can make HTTP-tunneled connections on both ports 80 and 8082 by default.
-   In the **HTTPS Tunneled Client Connections** section, type the fully qualified Host Name and Port from which the Community Services clients attempt HTTPS Connections when accessing the Sametime server through an HTTPS proxy server.

Follow these instructions to define the host server and port for a server community.

Follow these instructions to define the host server and port for a server community.

1.  From the Sametime Connect client, click **File** \> **Preferences**.
2.  Select **Server Communities**.
3.  Do one of the following:
    -   To add a new server connection, click **Add New Server Community**.
    -   To change an existing server connection, expand the **Server Community list** and select the community name.
4.  For an existing community, proceed to the next step. For a new community, provide a community name and log in information.
5.  Click the **Connection tab**.
6.  Provide a host server and port. The method chosen for connecting to the server may also affect the Host server and port you use here.
    -   Host server
    -   The client connects most efficiently when the Host server matches the home Sametime server defined in the user's Person document.
    -   If you have set up a rotating DNS system for load balancing, specify the DNS name \(**for example,** `sametime.cscluster.com`\) of the rotating DNS system in this field.
    -   If you have configured the environment to support load balancing, users must enter the fully qualified host name of the Load Balancer Server in this field.
    -   Server community port
    -   The method you choose for connecting to the server also affects the port setting.

        **For example,** if you choose Direct connection using HTTP protocol and the client that operates behind a firewall that only allows outbound Connections on port 80, you must change the default port from 1533 to port 80.

7.  For an existing community, click **OK** to close the Preferences window.
8.  For a new community, click OK to save and then OK to close the Preferences window.

**Configuring client connectivity to the Sametime Community Mux**

After you have configured the stand-alone HCL® Sametime® Community Mux, give users the fully qualified host name of the server and instruct them to set up their Sametime Connect Client preferences to connect to the multiplexer instead of directly to the Sametime Community Server.

Each user must update the Sametime Connect Client with the DNS name of the Sametime Community Mux server. If you have deployed multiple Sametime Community Mux servers, distribute users evenly among the servers. For example, with two multiplexers, direct half of your users to use multiplexer 1 and the other half to use multiplexer 2.

**Procedure**

1.  Open Sametime Connect Client.
2.  Choose **File** \> **Preferences** \> **Server Communities**.
3.  In the**Server Community** field, type the fully qualified host name of the Sametime Community Mux server, such as messaging.example.com, as instructed by the administrator.

**Parent topic:**[Connecting the Sametime Connect client to the Sametime server](config_client_conn_ov.md)

