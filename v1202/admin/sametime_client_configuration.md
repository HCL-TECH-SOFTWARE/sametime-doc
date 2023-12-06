# Sametime client configuration options

There are several methods to customize the user experience for Sametime clients. This section covers Expeditor based clients that are capable of leveraging the Expeditor Managed Settings framework. These clients include the Sametime client for Windows or Mac, and the HCL Notes embedded Sametime client for Windows or Mac. This does not apply to the PWA, web or mobile clients.

Use managed-settings.xml and managed-community-configs.xml for clients which are already installed.

If your clients not not yet installed, the the plugin\_customization.ini file can be configured and included with the client installation package.

|File|Location|Purpose|
|----|--------|-------|
|managed-community-configs.xml|Web server|This file is used to update connectivity preferences in the client. Update, add and delete servers, and manage connection settings \(such as host name, port, connection method, authentication method, etc\). The file is pushed using a policy, so you can define different settings for different users. This method applies to both the Sametime® rich client and to the Sametime client embedded in Notes®. This file is retrieved upon login and will take effect the next time the user restarts the client.|
|managed-settings.xml|Web server|This file can be used to push [client preferences](config_client_pref_tables.md) to the users. The file is hosted on a web server and retrieved upon login from the Sametime policy. This method applies to the Sametime rich client and Sametime embedded client in Notes.|
|               |       |**Note:** Do not add community config settings \(connectivity settings\) to this file. Community config settings must be added to the managed-community-configs.xml file. See the topic [Updating Communities with the Managed-community-configs xml](admin_st_mng_remotecomm.md).|
|plugin\_customization.ini|Client computer|Set initial eclipse preferences when client install kits are deployed to desktops or when a new user launches the product for the first time. These preferences can be overridden at runtime for the logged in user base using the managed-settings.xml file. This method only applies to installed Sametime Connect clients.|
|        |     |Community settings \(such as loginAtStartup and host\) can be entered here to prepopulate community settings for a first time user. After the user logs in, only the managed-community-configs.xml file can be used to change community settings.


-   **[Sametime client preferences](config_client_pref_tables.md)**  
This section lists the preferences that can be managed for the HCL Sametime Connect Client and Sametime Embedded Client for Notes.
-   **[Selecting preferences in the client](config_client_connect_pref.md)**  
In the **Preferences** dialog of the HCL Sametime Connect Client and the Notes client, users can choose any Sametime preferences that have not been locked by the administrator.
-   **[Configuring Sametime client preferences with the Expeditor managed settings framework](config_client_mng_xml_pref.md)**  
You can configure and manage the user's Sametime client preferences for capable clients using the Expeditor managed settings framework. The Sametime clients that are Expeditor based include the Sametime client for Windows or Mac, and the HCL Notes embedded Sametime client for Windows or Mac. This excludes the PWA, web and mobile clients.
-   **[Configuring Sametime preferences using HCL Notes policies](alternate_client_configuration.md)**  
To configure preferences for the HCL Sametime Embedded Client for Notes, you can also use the [Domino® Desktop policy settings document](https://help.hcltechsw.com/domino/11.0.0/conf_policies_c.html). These policies are applied when a Notes user logs into their home mail server and retrieves their desktop policy. These settings will not apply to any other client.
-   **[Updating connectivity settings with the managed-community-configs.xml file](admin_st_mng_remotecomm.md)**  
You can distribute updates to HCL Sametime client communities automatically using a managed-community-configs.xml file. The managed-community-configs.xml file is policy-based, so you can control communities for different user groups.
-   **[Creating a community provisioning URL for mobile users](community_provisioning.md)**  
This section describes how to create a provisioning URL that automatically creates a Sametime community definition on mobile devices running Google Android or Apple iOS, so users can easily connect to Sametime.

**Parent Topic:  **[Managing Sametime clients](managing_sametime_client_preferences.md)

