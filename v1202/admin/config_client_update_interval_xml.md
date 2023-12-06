# Changing the update interval for managed preferences {#config_client_update_interval_xml .task}

To change the update interval for managed preferences, you can update the existingmanaged-settings.xml file.

By default, managed settings are updated every 12 hours and when the HCL® Sametime® Connect Client is started. To change the update interval, add a new setting group to the managed-settings.xml file.

1.  Edit the managed-settings.xml file.

2.  Add a new setting group that contains the UpdateIntervalInMins setting.

    Verify that the following settings are set:

    value
    :   Specify the interval value in minutes. For example, for an update to occur every hour, specify `value="60"`.

    isLocked
    :   The value for this setting must be `isLocked="false"`.

    ```
    <settingGroup name="com.ibm.rcp.managedsettings">  
        <setting name="UpdateIntervalInMins" value="interval\_value" isLocked="false"/>
    </settingGroup>
    ```

    For additonal information on the isLocked setting, see[Defining preferences in the managed-settings.xml file](config_client_xml_file.md).


**Parent Topic:  **[Updating client preferences with the managed-settings.xml file](config_client_xml_location.md)

