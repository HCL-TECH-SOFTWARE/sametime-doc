# Information to provide during installation {#installation_prompt_descriptions .concept}

During the install process, you are prompted for information used to tailor the installation for your environment.

The Sametime install prompts for several details pertaining to the environment. Before initiating the process, gather the listed details.

Sametime server name
:   The fully qualified name of the Sametime server.

MongoDB
:   Mongo host
:   The host name of the MongoDB server.

Mongo port
:   The port number used to communicate with the MongoDB server.

Administrator user name
:   The user name of the MongoDB administrator defined when configuring the MongoDB. The default MongoDB administrator is sametimeUser.

Password
:   The password for the the MongoDB administrator defined when configuring the MongoDB. The default MongoDB password is sametime.

Connection URL
:   A secure URL to connect to the MongoDB server. The supplied URL overrides the default MongoDB URL.

LDAP
:   LDAP server
:   The host name or IP address of the LDAP server.

LDAP port
:   The port used to communicate with the LDAP server.

Bind name and password
:   The bind account name and password for Sametime to access LDAP.

Base DN
:   The base location where Sametime begins a search for users and groups.

TLS access
:   If LDAP is access using TLS, provide the port number.

    displayName attributes
    :   The default is cn.

JWT Secret
:   The Base64 encoded JWT\_SECRET from the Sametime deployment. If migrating from another version of Sametime, you can re-use your existing secret. If you don't have one the install program generates it.

TURN server
:   TURN server address
:   The fully-qualified host name of a TURN server.

TURN port
:   The port used to communicate with the TURN server.

Secert to TURN server
:   Transport for stun/turn connection
:   Select either tcp or udp.

TCP configuration
:   The port number used for TCP communications. The default is port number 4443.

LTPA configuration
:   Path to the LTPA key file
:   Fully path to the LTPA key file. If you enable LTPA, LTAP keys are required.

:   -   If you don't specify a value for the LTPA keys file location, the LTPA keys are automatically generated as part of the install process. If you don't specify a password, the default is WebAS. Enter the password when prompted to confirm.
-   If you have already have LTPA keys, enter the full path to an LTPA keys file and verify the password.

    Upon successful connection to the LTPA keys, the following message is displayed.LTPA configuration is OK

Administrator email
:   The email address for the Sametime administrator.

**Parent Topic: **[Installing Sametime](installation_sametime.md)

