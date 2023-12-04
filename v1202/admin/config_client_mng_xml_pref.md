# Configuring Sametime client preferences with the Expeditor managed settings framework {#config_client_mng_xml_pref .task}

You can configure and manage the user's Sametime client preferences for capable clients using the Expeditor managed settings framework. The Sametime clients that are Expeditor based include the Sametime client for Windows or Mac, and the HCL Notes embedded Sametime client for Windows or Mac. This excludes the PWA, web and mobile clients.

The Expeditor managed settings framework pulls preference settings from a managed-settings.xml and/or managed-community-configs.xml file hosted on a web server or as a part of the Samtime client installation package.

There are two methods to deploy the settings to the user.

-   **Method 1:**

    The settings files are hosted on a web server and the URL to the files is defined in either location:

    -   In the plugin\_customization.ini file as part of the Sametime installation package. This option requires customization of the client installation package.

    -   In the user's Sametime policy.
-   **Method 2:**

    The managed-settings.xml file can be packaged with the Sametime installation package. This option requires customization of the client installation package.


The following topics explain how to configure and update settings using the Expeditor managed settings framework.

-   **[Configuring Sametime Connect Client preferences in the plugin\_customization.ini file](config_client_pref_plugin.md)**  
Defining a settings file in the plugin\_customization.ini file is an alternate method for distributing preferences to the Sametime® Connect Client. Unlike the managed-settings.xml file posted on an update site, this method does not provide any policy-based distribution of preferences.
-   **[Updating client preferences with the managed-settings.xml file](config_client_xml_location.md)**  
Sametime rich clients such as the embedded Sametime client in HCL Notes and the full Sametime standalone client are based upon the Eclipse framework. These clients can process a managed-settings.xml file to receive new or updated preferences automatically. The managed-settings.xml file is policy based, and each policy can define a different xml file to apply preferences to different groups of users.

**Parent Topic: **[Sametime client configuration options](sametime_client_configuration.md)

