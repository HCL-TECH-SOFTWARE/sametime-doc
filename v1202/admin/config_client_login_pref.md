# Login preferences {#config_client_login_pref .concept}

The following table lists the login preferences for the HCL® Sametime® Connect Client and Sametime Embedded Client for Notes®.

|Attribute|Variable type|Description|Release|
|---------|-------------|-----------|-------|
|autoLogin|Boolean. Default is true.|Specifies whether or not to enable the auto-login feature for clients. If this setting is enabled, users can choose whether to use the feature with the **Automatically log in** setting in the client.|7.5.1 and later|
|enableAutoReconnect|Boolean. Default is true.|Specifies whether or not to enable automatic re-connection to the Sametime server in case the client is inadvertently disconnected.|7.5.1 and later|
|autoReconnectAttempt  
 Interval

|long. Default is 20000.|Specifies the interval in milliseconds at which the client will attempt to reconnect.|7.5.1 and later|
|autoReconnectAttempts|long. Default is -1.|Specifies the number of attempts to reconnect. The value -1 means to never stop trying.|7.5.1 and later|
|verifyConnectionPriorToLogin

|Boolean. Default is true.|Specifies whether or not to verify that a network connection is available before logging in.|7.5.1 and later|
|notifyWhenNetConnLost|Boolean. Default is true.|Specifies whether or not to alert the user when the network connection is lost.|7.5.1 and later|
|alwaysLoggedIn|Boolean|Keeps "Automatically log in" and "Remember password" disabled and checked and disables all "Log out" menu items.|7.5.1 and later|
|disableExit|Boolean|Keeps the "Exit" menu items disabled.|7.5.1 and later|
|disableHostName|Boolean|Sets edit state of host name text field on login dialog.|7.5.1 and later|
|displayResetUserBtn|Boolean|Makes the reset button show or not on the login dialog. If the preference is set to true and `com.ibm.collaboration.  
 realtime.communit/host`

 is set to true, the reset button will automatically be disabled.|7.5.1 and later|
|allowSave|Boolean|Specifies whether or not to allow saving password.|7.5.1 and later|
|earlyStartupLogin|Boolean|Specifies whether or not to show login dialog when the client starts.|7.5.1 and later|
|resetUser|Boolean. Default is false.|Specifies whether or not to reset user information when the client starts.|7.5.1 and later|
|displayAuthServerSSO|Boolean. Default is true.|Specifies whether or not to display Authentication server information in the community Log In tab.|7.5.1 and later|

**Parent Topic: **[Sametime client preferences](config_client_pref_tables.md)

