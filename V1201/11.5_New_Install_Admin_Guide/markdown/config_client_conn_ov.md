# Connecting the Sametime Connect client to the Sametime server {#config_client_conn_ov .concept}

The Sametime Connect client uses Server Communities preferences to connect to the Sametime server for presence and chat features.

The client finds a Sametime server using the server community's host server and server community ports specified in **Preferences** \> **Server Communities**. The client connects most efficiently when the host server matches the home Sametime server defined in the user's Person document, if the **Home Sametime server** field is being used. The corresponding **Connectivity** settings for the Sametime® Community Server must contain the correct IP addresses or DNS names and ports for clients to connect successfully.

The client uses the connection method selected in the Global connection settings for all Server Communities unless the server community's Connection tab specifies an alternate method. This section explains how to configure the different types of connections.

-   **[Defining the host server and port for connecting to a Sametime server](config_client_conn_host.md)**  
The Sametime Connect client uses the **Host** and **Server community port** preferences to determine the host name and port it should use when attempting a connection to the Sametime server. This section also includes optional steps for configuring client with the Sametime Mux.
-   **[Choosing a method for connecting to the Sametime Community Server](config_client_conn_meth_ov.md)**  
The Sametime Connect Client uses the connection method specified in Server Communities preferences. The Global connection settings apply to all Connections unless a specific server community uses an alternate connection method as defined on its Connection tab in the Preferences window.
-   **[Configuring alternate communities for clients](config_client_conn_alt.md)**  
Configuring alternate communities gives users more options for logging in from their Sametime Connect Client and Sametime Embedded Client for Notes®. For example, you can have a default community that allows users to connect using a direct connection when they are in the office and you can add an alternate community that allows them to connect to the same community through a reverse proxy server connection from home.

**Parent topic:**[Managing Sametime clients](managing_sametime_client_preferences.md)

