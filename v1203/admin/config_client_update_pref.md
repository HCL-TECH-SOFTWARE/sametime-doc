# Update preferences {#config_client_update_pref .concept}

The following table lists the update preferences for the HCL® Sametime® Connect Client and Sametime Embedded Client for Notes®.

|Attribute|Variable type|Description|Release|
|---------|-------------|-----------|-------|
|firstTimeRestartDelayMinutes|Integer. Default is 0.|Defines how long to delay for the first prompt after an automatic update is completed. Prompts immediately by default.|8.5.2 and later|
|restartAction|restart.now - user is presented with a restart dialog with Restart Now button only.

restart.now.or.later - user is presented with a restart dialog with Restart Now and Wait x minutes buttons.

restart.on.next.login - user is presented with an info message that the plug-in updates will be effected on next restart.

restart.now.no.prompt - the client is restarted automatically when update is completed without any user interaction.

Default is restart.now.or.later.

|Defines how restart should be initiated on the client after an update is completed. Note this preference is just valid for administrator-initiated updates, but be invalid for user's manual updates by Tools -\> Plug-ins menu.|8.5 and later|
|restartRemindDelayMinutes|Integer. Default is 5.|Defines how long to delay the restart of the client after an update is completed. This setting is ignored if restartAction is set to restart.now or restart.on.next.login.|8.5 and later|

Example entry in plugin\_customization.ini:

```
com.ibm.collaboration.realtime.update/restartAction=restart.now.no.prompt
com.ibm.collaboration.realtime.update/restartRemindDelayMinutes=1 
```

**Parent Topic:  **[Sametime client preferences](config_client_pref_tables.md)

