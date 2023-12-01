# Securing connections between the Sametime mux and clients {#securing_connections_between_community_clients .task}

There are several connection methods to connect to the Sametime server. This topic includes the steps to encrypt connections between the clients and the Sametime mux using TLS.

You must configure the sametime.ini settings, either at the global or individual TLS scope.

To implement the use of TLS, the clients must have the **Direct connection using TLS** connection option enabled. This setting is under **Preferences** \> **Server Communities** \> **Global Connection Settings**. There are three methods to set the client connection preferences.

-   Push the setting to users in the managed-community-configs.xml file, which is a good option for clients that are already deployed and in use.
-   Use the plugin\_customization.ini file which can be configured and included with the installation package.
-   Manually configure the settings.

For additional information, see [Updating connectivity settings with the managed-community-configs.xml file](admin_st_mng_remotecomm.md).

When you enable TLS for the Sametime server connections, TLS version 1.2 is used by default. SSLv3 and TLSv1 have security vulnerabilities and should not be used.

To configure the connection between the Sametime server and clients, there are two tasks that must be completed:

-   Configure the encryption settings.
-   Configure the client settings to support a direct connection with TLS.

Sametime can be configured to allow legacy encryption along with TLS encryption \(both enabled\), or strict TLS where only TLS encrypted connections are allowed. The Sametime Mux can listen for both TLS and legacy encrypted connections on the same port number, so there is no need to have a unique port for the TLS encrypted connections, they can also use port 1533. The port number can be changed if desired.

For details on configuring the encryption settings, follow the instructions in one of the following topics.

-   [Configuring the encryption settings on Docker](securing_connections_between_community_clients_docker.md)
-   [Configuring TLS for Sametime mux on Kubernetes](securing_connections_between_community_clients_kubernetes.md)

1.  From the Sametime Connect Client, click **File** \> **Preferences**.

2.  -   To select this connection method for all server communities, click **Server Communities**. In the **Global connection settings** section, click **Direct connection using TLS** \> **OK**.
-   To select this connection method for only one server community, click **Server Communities**, select the server community name, and open the **Connection** tab. Uncheck **Use global connection**settings, then click **Direct connection using TLS**. Click **OK** to close the Preferences window.

-   **[Configuring TLS for Sametime mux on Kubernetes](securing_connections_between_community_clients_kubernetes.md)**  

-   **[Configuring the encryption settings on Docker](securing_connections_between_community_clients_docker.md)**  


**Parent topic:**[Securing connections](securing_connections.md)

