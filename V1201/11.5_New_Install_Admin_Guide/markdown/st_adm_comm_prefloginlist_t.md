# Configuring the preferred login list {#st_adm_comm_prefloginlist_t .task}

By default, persistent chat enables a user that is logged in to multiple clients to receive instant messaging sessions across all clients concurrently. In an environment that does not support persistent chat and where the [single login type](st_adm_comm_singlelogintype_t.md) feature is disabled, Sametime uses a default login order to determine which client type should receive the instant messaging session. A preferred login list allows you to override the default order.

By default, once persistent chat is disabled, the Sametime server depends on the default list of client types, each of which has a predefined weight. Login order for each user depends upon the login-type weight. The first login type, having minimal weight, is the one provided for the incoming instant messaging session.

Default order of login types on Sametime:

1.  Sametime connect clients
2.  Sametime mobile clients
3.  Sametime proxy clients

The Sametime server is installed with a pre-defined list of client IDs for preferred login types. Use the below steps to customize this list and include Sametime clients as necessary.

1.  As administrator, open a text editor on the Sametime server.

2.  Open the sametime.ini file located in the Sametime server installation directory. The default directory in Windows is C:\\program files\\HCL\\domino.

3.  In the Config section, specify the order of the login types that overrides the default order. If a user is logged in to multiple clients, offline messages are delivered to the client running the latest release, if available. If that release of the client is not available, offline messages are delivered to the client based on this default order.

    ``` {#codeblock_aqs_dpq_3tb}
    VPS_PREFERRED_LOGIN_TYPES=login_type1, login_type2
    ```

    For example, `VPS_PREFERRED_LOGIN_TYPES=130C,130B,130A,1308,1306,1304,1436,1435,1434,1433,1432,1431,1430,14A3,14A2,14A1,14A0`

4.  Save the `sametime.ini` file.

5.  Restart the Sametime server to allow the changes to take effect.


**Parent topic:**[Managing client types and log-ins](st_adm_comm_manageclientlogin_c.md)

