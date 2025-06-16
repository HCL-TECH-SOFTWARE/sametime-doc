# Community preferences {#config_client_comm_pref .concept}

The following tables list the default community preferences and alternate community preferences for the HCL® Sametime® Connect Client and Sametime Embedded Client for Notes®.

|Attribute|Variable type|Description|
|---------|-------------|-----------|
|kioskMode|Boolean|Kiosk mode allows multiple users to share the same client on the same computer. If set to true, the client deletes personal information after each user logs out. When this setting is enabled, the automatic login, password saving, and locally stored contacts list features are not available because they require the use of personal information.|
|logoutWhenIdle|Boolean|Specifies whether the client should disconnect from the server \(and log out the user\) when idle.|
|logoutWhenIdleOverride|Boolean|Provides a mechanism to override the user's logoutWhenIdle setting. If set to true, then the client will always logout when idle, and the user will not be able to change the value the Preferences settings.|
|logoutWhenLocked|Boolean|Sets the initial value of whether or not the Embedded client logs out when Notes is locked \(disconnected from the server\). This preference only applies to new users.|
|logoutWhenLockedOverride|Boolean|Provides a mechanism to override the user's logoutWhenLocked setting. If set to true, then the client will always logout when locked, and the user will not be able to change the value in the Preferences settings.|
|tokenLoginOnly|Boolean|Specifies the whether to force login by token for the default community. Takes effect the next time that the client connects to the Community Server.|
|host|String|Specifies the initial community host value. Takes effect the next time that the client connects to the Community Server.|
|authServerUrl|String|Specifies the initial authentication server URL value for the default community. Takes effect the next time that the client connects to the Community Server.|
|defaultAuthType|String|Specifies the authentication type for the default community. For user name and password authentication, this setting should be left empty. For Domino® Single Sign-On in the Embedded client, the value should be set to ST-DOMINO-SSO. For a SAML authentication community, the value should be set to SAML.|
|keepAlive|Boolean. Default is true.|The keepAlive feature allows the client remain connected to the Sametime Community Server even when the user is inactive, so that the user remains logged in to Sametime. In the client, use the **Server** tab of the **Preferences** \> **Server Communities** \> **community** page to specify how often a keep-alive signal should be sent to the server.|
|keepAliveInterval|Integer. Default is 60.|Specifies the initial keep alive interval value for the default community. Takes effect the next time that the client connects to the Community Server.|
|loginByToken|Boolean|If set to true, the client will log in to the community using a token other than user name and password pair. For example, the Embedded client can use Domino Single Sign-On with the LTPA token, and the Connect client uses can use the SAML token. Takes effect the next time that the client connects to the Community Server.|
|name|String|Specifies the initial name for the default community. Takes effect the next time that the client connects to the Community Server.|
|port|Integer. Default is 1533.|Specifies the initial community port value. Takes effect the next time that the client connects to the Community Server.|
|savePassword|Boolean. Default is false.|Specifies whether the user's password is saved for the default community. Takes effect the next time that the client connects to the Community Server.|
|connectionType|String. Valid values include direct, tls-direct, http-direct, socks4-proxy, socks5-proxy, http-proxy, https-proxy, reverse-proxy, useBrowserSettings.|Specifies the connection protocol that is used when the client connects to the default community. Takes effect the next time that the client connects to the Community Server.|
|proxyHost|String|Specifies the host name for the Sametime Proxy Server that browser clients connect to before accessing the Community server where the default community is hosted. Takes effect the next time that the client connects to the Community Server.|
|proxyPort|Integer|Specifies the port number that listens for browser client connections on the Sametime Proxy Server used with the Community server where the default community is hosted. Takes effect the next time that the client connects to the Community Server|
|proxyUserName|String|Specifies the initial proxy user name for the default community. Takes effect the next time that the client connects to the Community Server.|
|proxyPassword|String|Specifies the initial proxy password for the default community. Takes effect the next time that the client connects to the Community Server.|
|proxyResolvesLocally|Boolean|Specifies the initial proxyResolvesLocally value for the default community. Takes effect the next the time that the client connects to the Community Server.|
|loginTokenRefreshInterval|Integer. Default is 900000.|Specifies the login token refresh interval in milliseconds. The default is 900000, or 15 minutes.|
|samlTrustedSites|String|Specifies the URL of a trusted site for use with SAML authentication. Example: `samlTrustedSites=url1,url2`.|

|Attribute|Variable type|Description|
|---------|-------------|-----------|
|altCommunityConfig.managedIds|String|Required. A comma-delimited set of IDs that represents each alternate community. For example, altCommunityConfig.managedIDs=altHost1,altHost2 defines two alternate communities named altHost1 and altHost 2.|
|altCommunityConfig.altHost.altHostID.targetCommunityHost|String|Required. The host name of the alternate community. altHostID represents the ID you defined for the alternate community in the managedIds preference, such as altHost1.|
|altCommunityConfig.altHost.altHostID.enabled|Boolean. Default is true.|Enables the alternate community configuration.|
|altCommunityConfig.altHost.altHostID.weight|Integer. Default is 0.|The weight of the alternate community configuration relative to other alternate communities. The higher the value, the greater the weight. For example, a connection to an alternate community with a weight of 2 is tried before one with a weight of 0. Regardless of the assigned weight, the client attempts a connection to the last successful alternate community first.|
|altCommunityConfig.altHost.altHostID.type|String. The default is postDefaultConfig.|Determines if the alternate community connection is tried before the default community or after. A value of postDefaultConfig attempts the connection after trying to connect to the default community. A value of preDefaultConfig attempts to connect to the alternate community first.|
|altCommunityConfig.altHost.altHostID.attemptCount|Integer. The default is 1.|Sets the number of times the client attempts to connect to the alternate community before trying another community.|
|altCommunityConfig.altHost.altHostID.fallbackOnly|String|By default, this preference is not set and the client attempts a connection to the last successful alternate community first. If you set the preference fallbackOnly for a specific alternate community, it will never be retried first, even if it was the last successful connection.|
|altCommunityConfig.altHost.altHostID.host|String|Defines a secondary alternate community host to connect to if the host defined in the targetCommunityHost preference cannot be reached. For example, if the targetCommunityHost is im1.example.com, the host could point to im2.example.com.|
|altCommunityConfig.altHost.altHostID.authServerUrl|String|Specifies the server URL for Single Sign-on authentication.|
|altCommunityConfig.altHost.altHostID.authType|String|Defines the method used for Single sign-on authentication. Use TAM-SPNEGO for SPNEGO authentication or ST-DOMINO-SSO for Domino authentication within Notes.|
|altCommunityConfig.altHost.altHostID.port|Integer|The port to use if other than the default 1533.|
|altCommunityConfig.altHost.altHostID.connectionType|String. Valid values include direct, tls-direct, http-direct, socks4-proxy, socks5-proxy, http-proxy, https-proxy, reverse-proxy.|Determines how the client connects to the alternate community. The default is **direct**.|
|altCommunityConfig.altHost.altHostID.proxyHost|String|Specifies the initial proxy host value for the alternate community.|
|altCommunityConfig.altHost.altHostID.proxyPort|Integer|The port of the proxy.|
|altCommunityConfig.altHost.altHostID.loginByToken|Boolean|Determines if the client logs in by token. If the token login fails and the password is available, the client attempts password-based authentication instead.|
|tryLastSuccesfulConfigFirst|Boolean. Default is true.|Determines if the client first tries the alternate community it last connected to successfully. If you change the value to false, the client always attempts Connections to the alternate communities in the default priority order set in the managedIDs list, regardless of which alternate community connection was successful last.|

**Parent Topic:  **[Sametime client preferences](config_client_pref_tables.md)

