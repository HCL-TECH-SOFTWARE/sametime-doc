# Sametime Advanced preferences \(Sametime 9.0.1 only\) 

These settings only apply to environments that include the Sametime 9.0.1 Advanced Server.

The following table lists the preferences that are available for the HCL® Sametime® Advanced client. These preferences are set in the `plugin_customization.ini` file.


Table 1. Global Preferences - com.ibm.collaboration.realtime

|Attribute|Variable type|Description|
|---------|-------------|-----------|
|enableAdvanced|Boolean \(default value is false\)|When the value is set to true, the Sametime Advanced plug-ins installed with the client become active.|
|enableInstantShare|Boolean \(default value is false\)|If enableAdvanced is set to false, but the value of enableInstantShare is set to true, the instant share feature is available. Otherwise, the value of enableInstantShare is ignored.|

Table 2. Sametime Advanced Preferences - com.ibm.collaboration.realtime.persistentChat

|Attribute|Variable type|Description|
|---------|-------------|-----------|
|showAdvancedVersioningAlert|Boolean|Suppress client version warnings when accessing a Sametime 9.0 \(or higher\) server from an older Connect or Embedded client.|

Table 3. Broadcast and Persistent Chat Preferences - com.ibm.collaboration.realtime.bcs

|Attribute|Variable type|Description|
|---------|-------------|-----------|
|sametimeAdvancedServerName|String|Required. Fully qualified Apache Tomcat® Application Server host name, for example: sales.|
|sametimeAdvancedServerPort|String|Required. Sametime Advanced Server port number.|
|sametimeCommunityServer|String|Required. Default Sametime Community Server host name. This is the server users log in to for awareness and chat.|
|broadcastToolsServerName|String|Required. Fully qualified Apache Tomcat Application Server host name.|
|broadcastToolsServerPort|String|Required. Apache Tomcat Application Server port number. The port number is normally 1883 for HTTP and 8883 for SSL, but can be any port specified by the administrator.|
|useHTTPS|Boolean|If you are using SSL while connecting to the server, set to true. If you are using HTTP set to false.|
|advancedServerConnectionType|String|Connection type to connect to the Sametime Advanced server. Set to 0 for a direct connection to the server. Set to 1 to connect through a reverse proxy.|
|broadcastServerConnectionType|String|Connection type to connect to the Broadcast Tools server. Set to 1 for a direct connection to the server. Set to 2 to connect using SSL.|
|useHttpProxy|Boolean|Set to true if you are using an HTTP forward proxy; otherwise set it to false.|
|proxyHost|String|Type the proxy IP address or host name if you are using a HTTP proxy, otherwise leave it blank.|
|proxyPort|String|Type the HTTP proxy port to which you are connecting.|
|proxyUserName|String|Type the user name if the HTTP proxy requires one for authentication; otherwise leave it blank.|
|reverseProxyBaseURL|String|Type the reverse proxy base URL to use if connecting through a reverse proxy. For example: http://mycompany.example.com/mycontext Leave blank otherwise.|
|reverseProxyUserName|String|Enter the reverse proxy user name if the proxy is authenticating. Leave blank if you are not using reverse proxies.|
|jmsProtocol|String|Indicate whether the client connects with a secure connection using the Security Secure Sockets Layer \(SSL\) or not. The default is disthub \(to connect without SSL\). Enter disthubs to connect with SSL.|
|liveNameResolveTimeout|String \(the default is 10000 milliseconds\)|Time allowed in milliseconds for awareness names to resolve. The default is 10000.|
|notifyNewOpenCommunities|Boolean \(the default istrue \)|Alert users when a new open community is created.|
|notifyNewModeratedCommunities|Boolean \(the default istrue \)|Alert users when a new moderated community is created.|
|notifyNewPrivateCommunities|Boolean \(the default istrue \)|Alert users when a new private community is created|
|blockBroadcastOnDoNotDisturb|Boolean \(the default istrue \)|Blocks broadcasts when client is set to "Do not disturb".|
|blockBroadcastOnInMeeting|Boolean \(the default isfalse \)|Blocks broadcasts when client is set to "In a meeting".|
|notifyChatRoomAddMember|Boolean \(the default istrue \)|Alerts users when a chat room has a new member.|
|blockChatRoomNotifyOnDoNotDisturb|Boolean \(the default istrue \)|Blocks chat room notifications the client to "Do not disturb".|
|blockChatRoomNotifyOnInMeeting|Boolean \(the default isfalse \)|Blocks chat room notifications when user is in a meeting.|
|broadcastServerUserIdType|String \(the default isemail \)|Specifies the LDAP attribute used as the user ID.|
|useTokens|Boolean \(the default istrue \)|Determines whether the client uses an LTPA token at login. Set this to false only if there is no way to set up Single Sign-On between the Sametime Community Server and the Sametime Advanced Server.|
|chatRoomLaunchURLRichClient|Boolean|Specifies what type of chat room window the users sees. The value true represents the Sametime client chat room and the value false represents the web browser chat room.|
|onlyActiveChatRooms|Boolean \(default value is false\)|Limits the chat room list to active chat rooms, suppressing disabled and archived chat rooms from the list.|
|showToolTip|Boolean \(default value is true\)|Displays the description associated with a chat room when the user mouses over the chat room name.|
|updateInterval|String \(default value is 600000 milliseconds, or 10 minutes\)|Specifies the wait \(in milliseconds\) before chat room data is refreshed. You can improve server performance by refreshing less frequently.|

Table 4. Community Preferences - com.ibm.collaboration.community

|Attribute|Variable type|Description|
|---------|-------------|-----------|
|loginTokenRefreshInterval|String \(default value is 900000 milliseconds, or 15 minutes\)|LTPA token timeout in seconds. Best practice is to set this value to 5 minutes less than the token expiration time configured on the WebSphere server hosting Sametime Advanced, and on the Community Server. The value should be specified in milliseconds. For example, if the server-side token expiration timeout is 24 hours, configure loginTokenRefreshInterval=86100000 \(which is 23 hours and 55 minutes\) on the client.|

**Parent topic:   **[Sametime client preferences](config_client_pref_tables.md)

