# Connecting the client through a proxy connection {#config_client_conn_prox .task}

When a user starts the Sametime Connect client with a **Use proxy** preference, the client connects to the Sametime server through a SOCKS, HTTP, or HTTPS proxy server.

Contact your Sametime administrator for the hostname, port, and type of proxy server in use.

The connection methods for the **Use proxy** option differ in the types of proxy servers they use for connecting.

-   SOCKS4 or SOCKS5 proxy

    The client uses the **Standard Sametime protocol** over TCP/IP for this connection. The connection from the SOCKS proxy to the Community Services occurs on the "Community port" \(default 1533\) specified in the Sametime Connect Client Sametime Connectivity settings. This connection is the same as the **Use my Internet Explorer HTTP settings** preference for a user who has a SOCKS proxy server selected in Internet Explorer.

-   Reverse proxy

    This selection allows the Sametime Connect Client to connect to a Sametime server over the Internet through a reverse proxy server. The reverse proxy server protects internal HTTP servers by providing a single point of access to the internal network.

-   HTTP Proxy

    The client encases the standard Sametime protocol connection information within an HTTP request. Sametime Connect Client connects to the HTTP proxy, and the HTTP proxy server connects to the Community Services multiplexer on the Sametime server on behalf of the Sametime Connect Client. The HTTP connection to the Community Services multiplexer occurs on the "Community port" \(default 1533\) specified in the Sametime Connect Client Sametime Connectivity settings.

    The Community Services multiplexer on the Sametime server listens for HTTP Connections on all ports specified in the **Port number** field in the **Client Connections** section within the **Community Services** settings of the Sametime configuration database.


Follow these steps to select the **Use proxy** method for the client.

1.  From the Sametime Connect client, select **File** \> **Preferences**.

2.  Do one of the following:

    -   To choose this connection method for all server communities, select **Server Communities**. In the "Global connection settings" section, select **Use proxy**.
    -   To select this connection method for only one server community, select **Server Communities**, select the server community name, and open the **Connection** tab. Clear **Use global connection settings**, then select **Use proxy**.
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
        3.  Select the **Resolve server name locally** option to have the client resolve the Sametime server name by calling a local DNS server and passing the IP address to the SOCKS proxy server. If your organization, for security reasons, prohibits internal DNS servers from resolving the names of external servers, do not select the **Resolve server name locally** option. The SOCKS proxy resolves the external server name by calling a different DNS server instead, one that is not available on the internal network.
    -   **Use reverse proxy**
        1.  Specify the **URL** of the reverse proxy server. The clients uses this URL to access the reverse proxy server. The reverse proxy server handles requests from the client and redirects the request to the Sametime server
        2.  Specify the **User name** and **Password** for authenticating with the reverse proxy server.
    -   **Use HTTP proxy**
        1.  Specify the **Host name** \(DNS name or IP address\) of the HTTP proxy server and the port required to connect to the HTTP proxy server
        2.  Specify the user name and password required for authentication to the HTTP proxy server if they are required.
5.  Select **OK** to close the Preferences window.


**Parent Topic: **[Choosing a method for connecting to the Sametime server](t_choose_connect_method.md)

