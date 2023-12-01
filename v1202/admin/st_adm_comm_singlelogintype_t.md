# Configuring the single login type {#st_adm_comm_singlelogintype_t .task}

The single login type mode means that only one login per user is allowed. When a client attempts to log in to the Sametime server, the server checks if there are any existing logins of the same user and disconnects them. Any client on the exclusion list is not disconnected, which is useful for users who want to run multiple clients simultaneously.

To configure the single login function and exclude certain client types from qualifying as logins, edit the sametime.ini file.

1.  Open a text editor on the Sametime server.

2.  Open the sametime.ini file located in the Sametime server installation directory. For example, the default directory in Windows is C:\\program files\\HCL\\domino.

3.  In the Config section, set the following flag to activate single client login mode:

    VP\_ONLY\_SINGLE\_LOGIN\_ALLOWED=1

    If the flag is set to 1 the server works in the single login allowed mode. When a new client login request is received, all the previous logins are disconnected. Only one client type connection per computer is allowed at one time \(related to client types, not users\).

4.  Specify which client types are not considered logins when the server checks whether to accept or disconnect clients. Separate the client types with commas.

    VPS\_EXCLUDED\_LOGIN\_TYPES=clienttype1, clienttype2

    In the following configuration, even though single client login mode is activated, logins originating from C++ clients and Unified instant messaging clients are not disconnected if they have logged in from the Sametime client too.

    VPS\_EXCLUDED\_LOGIN\_TYPES=1002, 1304

5.  To access Sametime from the HCL® Notes® Basic client, update or add these settings as indicated.

    -   Reset `VP_SECURITY_LEVEL=7000 to VP_SECURITY_LEVEL=6510`
    -   Add this setting to the \[Config\] section: `ST_MINIMAL_CLIENT_VERSION=6510`
6.  Save the sametime.ini file.


**Parent topic:**[Managing client types and log-ins](st_adm_comm_manageclientlogin_c.md)

