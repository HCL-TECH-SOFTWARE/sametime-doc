# Changing the update interval for managed preferences {#config_client_update_interval_xml .task}

If you want to change the update interval for managed preferences, you can update the existing settings XML file.

By default, managed settings are updated every 720 minutes \(12 hours\) and whenever the HCL® Sametime® Connect Client is started. To change the update interval, edit the settings XML file to add a new setting group.

1.  Update the existing XML file with a new setting group that contains an UpdateIntervalInMins setting.

    ```
    <settingGroup name="com.hcl.rcp.managedsettings">  
        <setting name="UpdateIntervalInMins" value="1" isLocked="false"/>
    </settingGroup>
    ```


Updating settings has the following results:

-   All unlocked settings can be modified by the user. Once a setting is modified by the user, any subsequent update to the same setting will not apply unless the setting is changed to isLocked=true on the settings XML file. This behavior is consistent with settings changed with the plugin\_customization.ini file. User-modified preferences take precedence over settings from the plugin\_customization.ini file and settings XML file. However, if the user's workspace is cleaned, the administrator's values will apply.
-   Any settings or setting groups removed from the settings XML file \(for example, to unmanage those settings\) will remain on the client, and if the setting was previously locked, it will be automatically set to unlocked.
-   All unmanaged settings will automatically be managed as standard preferences.

**Parent topic:**[Updating client preferences with the managed-settings.xml file](config_client_xml_location.md)

