# Discontinuing managed preferences {#config_client_discontinue_xml_file .task}

To stop setting preferences through the Expeditor managed settings framework, remove the reference to the managed-settings.xml or managed-community-configs.xml file\(s\) and unlock any previously read-only settings.

1.  Managed settings that were previously pushed to the clients as read-only will continue to be used until they are specifically removed from the client. Unlock all managed settings by editing the XML file:

    1.  Change all "isLocked=true" instances to "isLocked=false".

    2.  If the lastModDate atribute was used previously, change the lastModDate attribute to a newer timestamp for all group settings. Otherwise, skip this step.

    3.  Provision the updated XML file to the client.

2.  Discontinue use of the settings.xml file based on the method you used to distribute managed preferences.

    -   **Method 1:**

        The managed-settings.xml or managed-community-configs.xml file hosted on a web server

        -   Remove the managed-settings.xml or managed-community-configs.xml file from the web server.
        -   [Modify the policies.user.xml](update_client_policy.md) and remove the URL that was previously hosting the managed-settings.xml or managed-community-configs.xml.
    -   **Method 2:**

        The managed-settings.xml file defined in a plugin\_customization.ini file.

        -   Remove the com.ibm.rcp.managedsettings.provider.file/URL setting from the plugin\_customization.ini file and provision the updated file to clients.

**Parent Topic: **[Updating client preferences with the managed-settings.xml file](config_client_xml_location.md)

