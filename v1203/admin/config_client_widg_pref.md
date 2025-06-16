# Live Text and Widgets preferences 

The following scenarios show the Live Text and Widgets preferences for the HCL® Sametime® Connect Client. These scenarios apply to setting preferences for the stand-alone client.

Case 1 \(default\): Disable both Live Text and Widgets

This is the default scenario, set with the following preference in plugin\_customization.ini:

`com.hcl.rcp.toolbox.admin/toolboxvisibleMaster=false`

Case 2: Enable both Live Text and Widgets

Enable both Live Text and Widgets by setting the following preference to true in plugin\_customization.ini:

`com.hcl.collaboration.realtime/enableSametimeLiveText=true`

**Note:** This overrides the setting for `toolboxvisibleMaster`. You do not need to manually set `toolboxvisibleMaster` to true.

Case 3: Enable only Live Text, not Widgets

To enable only Live Text, managed preferences is required. Configure the following managed preferences:

```
<ManagedSettings>
<settingGroup name="com.hcl.collaboration.realtime">
<!-- Enable live text support in Sametime -->
<setting name="enableSametimeLiveText" value="true" isLocked="false"/>
</settingGroup>
<settingGroup name="com.hcl.rcp.toolbox.admin">
<!-- Disable widget support in Sametime -->
<setting name="toolboxvisible" value="false" isLocked="true"/>
<setting name="toolboxenableRecognizers" value="true" isLocked="true"/>
</settingGroup>
</ManagedSettings>
```

Case 4: Enable only Widgets, not Live Text

To enable only Widgets but not Live Text, managed preferences are required. Configure the following managed preferences:

```
<ManagedSettings>
<settingGroup name="com.hcl.collaboration.realtime">
<!-- Disable live text support in Sametime -->
<setting name="enableSametimeLiveText" value="false" isLocked="false"/>
</settingGroup>
<settingGroup name="com.hcl.rcp.toolbox.admin">
<!-- Enable widget support in Sametime -->
<setting name="toolboxvisible" value="true" isLocked="true"/>
<setting name="toolboxvisibleMaster" value="true" isLocked="true"/>
<setting name="toolboxenableRecognizers" value="false" isLocked="true"/>
</settingGroup>
</ManagedSettings>
```

**Parent topic:   **[Sametime client preferences](config_client_pref_tables.md)

