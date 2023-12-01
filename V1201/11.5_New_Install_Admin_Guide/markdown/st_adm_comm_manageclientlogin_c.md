# Managing client types and log-ins {#st_adm_comm_manageclientlogin_c .concept}

You can manage the manner and order of client connections to Sametime.

-   **[Configuring allowed client types](config_st_allowed_client_types.md)**  
You can define the types of clients that can connect to the Sametime server.
-   **[Configuring the preferred login list](st_adm_comm_prefloginlist_t.md)**  
By default, persistent chat enables a user that is logged in to multiple clients to receive instant messaging sessions across all clients concurrently. In an environment that does not support persistent chat and where the [single login type](st_adm_comm_singlelogintype_t.md) feature is disabled, Sametime uses a default login order to determine which client type should receive the instant messaging session. A preferred login list allows you to override the default order.
-   **[Configuring the single login type](st_adm_comm_singlelogintype_t.md)**  
The single login type mode means that only one login per user is allowed. When a client attempts to log in to the Sametime server, the server checks if there are any existing logins of the same user and disconnects them. Any client on the exclusion list is not disconnected, which is useful for users who want to run multiple clients simultaneously.
-   **[Sametime Client IDs](new_client_ids.md)**  


**Parent topic:**[Managing Sametime clients](managing_sametime_client_preferences.md)

