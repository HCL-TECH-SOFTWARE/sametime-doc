# Updating client preferences with the managed-settings.xml file {#config_client_xml_location .task}

Sametime rich clients such as the embedded Sametime client in HCL Notes and the full Sametime standalone client are based upon the Eclipse framework. These clients can process a managed-settings.xml file to receive new or updated preferences automatically. The managed-settings.xml file is policy based, and each policy can define a different xml file to apply preferences to different groups of users.

Use a managed-settings.xml file to manage and define client preferences. The file is hosted on a web server. At login time, the client receives policies then checks for the existence of the managed-settings.xml file according to the "Sametime® update site URL" policy.

For example, if the configured URL is http://example.com/updates, the client looks for updated preferences in http://example.com/updates/managed-settings.xml.

The managed-settings.xml file can override and control any client preference, including hidden configuration preferences and preferences in the client user interface. Many preferences can also be set as read-only by specifying a locked="true" attribute for the preference.

The client settings which can be managed using managed-settings.xml are listed in [Sametime client preferences](config_client_pref_tables.md) as well as its subtopics.

There is a separate configuration file: managed-community-configs.xml which is used to manage or change client connectivity and connection preferences. See the topic: [Updating connectivity settings with the managed-community-configs.xml file](admin_st_mng_remotecomm.md).

**Note:** Sametime embedded clients for Notes can also be managed through the Domino® Desktop policy settings document.

Follow these steps to create and post a managed-settings.xml file.

1.  Create a settings XML file and save it as managed-settings.xml.

2.  Define preferences in the settings XML file.

3.  Place the managed-settings.xml file on a web server to host the file.

4.  Update the Sametime Policy for the user in the policies.user.xml file.


Changes take effect the next time the user starts Sametime. Settings found in the managed-settings.xml take precedence over matching settings in the plugin\_customization.ini file.

To test changes in a managed-settings.xml file, create a policy set that includes the administration update site URL and place the .xml file in the location specified by the update site URL. Apply the policy to yourself and log in to the client to verify the preferences.

To troubleshoot managed settings, see [Troubleshooting Sametime Managed Settings](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0038860).

-   **[Defining preferences in the managed-settings.xml file](config_client_xml_file.md)**  
Follow these instructions to define preferences in a managed-settings.xml file.
-   **[Changing the update interval for managed preferences](config_client_update_interval_xml.md)**  
To change the update interval for managed preferences, you can update the existingmanaged-settings.xml file.
-   **[Discontinuing managed preferences](config_client_discontinue_xml_file.md)**  
To stop setting preferences through the Expeditor managed settings framework, remove the reference to the managed-settings.xml or managed-community-configs.xml file\(s\) and unlock any previously read-only settings.

**Parent Topic:  **[Configuring Sametime client preferences with the Expeditor managed settings framework](config_client_mng_xml_pref.md)

