# Configuring alternate communities for clients {#config_client_conn_alt .task}

Configuring alternate communities gives users more options for logging in from their Sametime Connect Client and Sametime Embedded Client for Notes. For example, you can have a default community that allows users to connect using a direct connection when they are in the office and you can add an alternate community that allows them to connect to the same community through a reverse proxy server connection from home.

Alternate communities are defined using preferences. Before clients install, you can define preferences with a plugin\_customization.ini file that goes into effect when the client logs in after installation. You can also define preferences after installation and distribute them through the policy-based managed-settings.xml file.

1.  Follow these steps to define an alternate community. These steps assume that you have already installed and set up the servers that host the community.
2.  First define the managed IDs for each alternate community using the "com.ibm.collaboration.realtime.community/altCommunityConfig.managedIds" preference. This is a comma-delimited set of IDs you define.

3.  Then for each ID, add the Community preferences reserved for alternate communities.

    For example:

    ``` {#pre_iwj_pgn_1yb}
    com.ibm.collaboration.realtime.community/altCommunityConfig.managedIds=altHost1,altHost2
    com.ibm.collaboration.realtime.community/altCommunityConfig.altHost1.<attribute>=<attribute value>
    com.ibm.collaboration.realtime.community/altCommunityConfig.altHost2.<attribute>=<attribute value>
    ```


After you configure alternate communities and distribute them through preferences, they become available when users attempt to log in to the default community. If the default community is not available, the client then tries the alternate communities that you have defined. The client continues through the list of alternate communities until it connects successfully or all attempts fail.

**Parent Topic:  **[Connecting the Sametime Connect client to the Sametime server](t_connect_clienttoserver.md)

