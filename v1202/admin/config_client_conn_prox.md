# Connecting the client through a proxy connection {#config_client_conn_prox .task}

When a user starts the Sametime® Connect Client with a **Use proxy** preference, the client connects to the HCL® Sametime Community server through a SOCKS, HTTP, or HTTPS proxy server.

For this connection to succeed, the port specified as the **Community port** setting in the Sametime Connect Client client's **Sametime Connectivity** settings must match a port number specified in one of these settings in the Sametime configuration database.

-   In the **Client Connections** section, type the fully qualified **Host Name** and **Port** from which Community Services listen for direct TCP/IP Connections and HTTP-tunneled Connections from the Community Services clients. A direct TCP/IP connection occurs when the Sametime client uses a unique Sametime protocol over TCP/IP to establish a connection with the Community Services.
-   In the **HTTP Tunneled Client Connections** section, type the fully qualified **Host Name** and **Port** from which Community Services clients can make HTTP-tunneled Connections to the Community Services multiplexer. Community Services clients can make HTTP-tunneled Connections on both ports 80 and 8082 by default. Port 8082 ensures compatibility with previous Sametime releases. In previous releases, Sametime clients made HTTP-tunneled connections to the Community Services only on port 8082. If a Sametime Connect Client from a previous Sametime release attempts an HTTP-tunneled connection to a Sametime server, the client might attempt this connection on port 8082.

    **Note:** If the administrator manually configures HTTP tunneling on port 80, the **Community Services** \> **Client connections** \> **Port number** setting default to port 1533, and the **Community Services** \> **HTTP tunneled client Connections** \> **Port number** settings are ports 80 and 8082. In this configuration, the Sametime Connect Client can complete an HTTP-tunneled connection to the Community Services multiplexer using either port 1533, 80, or 8082.

-   In the **HTTPS Tunneled Client Connections** section, type the fully qualified Host Name and Port from which the Community Services clients attempt HTTPS Connections when accessing the Sametime Community Server through an HTTPS proxy server. If a Community Services client connects to the Sametime Community server using HTTPS, the HTTPS connection method is used, but the data passed on this connection is not encrypted.

The connection methods for the **Use proxy** option differ in the types of proxy servers they use for connecting.

-   SOCKS4 or SOCKS5 proxy

    The client uses the **Standard Sametime protocol** over TCP/IP for this connection. The connection from the SOCKS proxy to the Community Services occurs on the "Community port" \(default 1533\) specified in the Sametime Connect Client Sametime Connectivity settings. This connection is the same as the **Use my Internet Explorer HTTP settings** preference for a user who has a SOCKS proxy server selected in Internet Explorer.

-   Reverse proxy

    This selection allows the Sametime Connect Client to connect to a Sametime server over the Internet through a reverse proxy server. The reverse proxy server protects internal HTTP servers by providing a single point of access to the internal network.

-   HTTP Proxy

    The client encases the standard Sametime protocol connection information within an HTTP request. Sametime Connect Client connects to the HTTP proxy, and the HTTP proxy server connects to the Community Services multiplexer on the Sametime server on behalf of the Sametime Connect Client. The HTTP connection to the Community Services multiplexer occurs on the "Community port" \(default 1533\) specified in the Sametime Connect Client Sametime Connectivity settings.

    The Community Services multiplexer on the Sametime server listens for HTTP Connections on all ports specified in the **Port number** field in the **Client Connections** section within the **Community Services** settings of the Sametime configuration database.


Follow these steps to select the **Use proxy** method for the client.

1.  From the Sametime Connect Client, click **File** \> **Preferences**.

2.  Do one of the following:

    -   To select this connection method for all server communities, click **Server Communities**. In the "Global connection settings" section, click **Use proxy**.
    -   To select this connection method for only one server community, click **Server Communities**, select the server community name, and open the **Connection** tab. Clear **Use global connection settings**, then click **Use proxy**.
3.  Select the appropriate **Proxy type**.

    -   **Use SOCKS4 proxy**
    -   **Use SOCKS5 proxy**
    -   **Use reverse proxy**
    -   **Use HTTP proxy**
4.  Specify the additional values for the proxy type you selected.

    -   **Use SOCKS4 proxy**

        Provide the **Host name** \(DNS name or IP address\) of the SOCKS proxy server and the port required to connect to the SOCKS proxy server.

    -   **Use SOCKS5 proxy**
        1.  Provide the **Host name** \(DNS name or IP address\) of the SOCKS proxy server and the port required to connect to the SOCKS proxy server.
        2.  Specify the user name and password required for SOCKS5 authentication.
        3.  Select the **Resolve server name locally** option to have the client resolve the Sametime Community server name by calling a local DNS server and passing the IP address to the SOCKS proxy server. If your organization, for security reasons, prohibits internal DNS servers from resolving the names of external servers, do not select the **Resolve server name locally** option. The SOCKS proxy resolves the external server name by calling a different DNS server instead, one that is not available on the internal network.
    -   **Use reverse proxy**
        1.  Specify the **URL** of the reverse proxy server. The clients uses this URL to access the reverse proxy server. The reverse proxy server handles requests from the client and redirects the request to the Sametime server
        2.  Specify the **User name** and **Password** for authenticating with the reverse proxy server.
    -   **Use HTTP proxy**
        1.  Specify the **Host name** \(DNS name or IP address\) of the HTTP proxy server and the port required to connect to the HTTP proxy server
        2.  Specify the user name and password required for authentication to the HTTP proxy server if they are required.
5.  Click **OK** to close the Preferences window.


**Parent topic:**[Choosing a method for connecting to the Sametime Community Server](config_client_conn_meth_ov.md)

