# Configuring allowed client types {#config_st_allowed_client_types .task}

You can define the types of clients that can connect to the Sametime server.

When using this setting, only client IDs that are on the list are allowed to connect to the Sametime server. For more information on the list of Sametime client IDs, see [Sametime Client IDs](new_client_ids.md). This is an optional task. Follow these steps to specify the list of client types.

1.  Open a text editor on the Sametime server.

2.  Open the sametime.ini file located in the Sametime server installation directory.

    The default directory in Windows is C:\\program files\\HCL\\domino.

3.  In the Config section, enter the client type IDs for the allowed client types in the `VPS_ALLOWED_LOGIN_TYPES` flag. If the flag is not specified or its value is empty, then all client types are allowed to connect to the server. It is a comma-separated list.

    ``` {#codeblock_ujh_rtp_3tb}
    [Config]VPS_ALLOWED_LOGIN_TYPES=130B,130A
    ```

    **Note:** Once the `VPS_ALLOWED_LOGIN_TYPES` flag is used, you must update the values whenever you add new client types; otherwise the new client type cannot log in.

4.  Save the sametime.ini file.

5.  Restart the Sametime server to commit the changes.


**Parent topic:**[Managing client types and log-ins](st_adm_comm_manageclientlogin_c.md)

