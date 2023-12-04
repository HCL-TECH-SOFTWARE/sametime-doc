# Chat {#chat_configuring .concept}

This section contains Chat configuration considerations.

Most chat related settings pertain to the community container. The community container:

-   Processes all log ins including Single Sign On \(LTPA, SAML, JWT\)
-   Provides user search, quickfind, and more
-   Provides the contact lists to clients
-   Processes all chats
-   Handles rich client connections through the Mux container
-   Provides presence awareness and status, for example: I am available and I am away
-   Provides business card information to clients

The community container interacts directly with LDAP and MongoDB.

-   **[Configuring the sametime.ini file](chat_configuring_sametimeini.md)**  
There are many configuration options in Sametime to override the default behaviors. Community related configuration options are in the sametime.ini file.

**Parent Topic: **[Configuring](configuring.md)

