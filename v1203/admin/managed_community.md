# Managed community settings {#managed_community .task}

Define managed community settings in the managed-community-configs.xml file.

The managed-community-configs.xml file uses these element types:

-   Action elements specify what action to take: Add, Update, Delete, or Reset. They are set as <managed-community-action\> elements.
-   Community elements specify the community attributes to which the actions apply. They are set as <managed-community\> elements.

Only define attributes that are mandatory. For example, do not include the "loginAtStartup" attribute unless you want to prevent your users from changing that setting. If the user's configuration differs from any defined attribute, the user's configuration is updated. Although you cannot lock the user interface, any settings that a user changes during a session revert back at the next login.

The following tables describe the attributes for each element. The required attributes must be present in the file.

|Attribute|Required?|Description|
|---------|---------|-----------|
|deleteOverlappingCommunities|No|Whether or not overlapping duplicate communities should be deleted. The default is "false". An overlapping community is one in which the community host and userid are the same. An overlapping duplicate community can occur when you use a managed-community-configs.xml file to consolidate multiple hosts into a single community. The Sametime® client may have a community for each host; updating each to the same new host name would result in duplicate overlapping communities. To ensure that duplicate overlapping communities are consolidated into one, set this attribute to true.|
|id|Yes|The unique ID of the managed community. This setting should be the same value as the "host" attribute.|
|host|Yes|The host to manage. The client only updates communities whose host matches the host of the managed community.|
|newHost|No|Attribute used to update the host of a community that matches the "host" attribute. This is the new host to connect to. The attribute only applies to "update" type managed community actions. The user's contact list is assumed to be valid for the new community. If the contact list is not valid, use the "reset" managed community action instead.|
|name|No|The name of the community. Not recommended. To set the community ID, use ST\_COMMUNITY\_ID in the server's sametime.ini to set the community name for all clients.|
|savePassword|No|Whether or not to save the password. Set the value to "true" to save the password.|
|loginAtStartup|No|Whether or not to automatically log in. Set the value to "true" to log in automatically.|
|useGlobalConnContext|No|Whether or not to use the global connection context. You must set this to "true" if you are updating connectionType to a value other than "direct".|
|connectionType|No|The connection type corresponds to the options in the Connection settings page. Valid values include useBrowserSettings, direct, tls-direct, http-direct, socks4-proxy, socks5-proxy, http-proxy, and reverse-proxy.|
|authServerUrl|No|The server URL for SSO authentication.|
|authType|No|The authentication type for SSO. Value can either be **TAM-SPNEGO** or **ST-DOMINO-SSO**.|
|port|No|The port to use if it is not the default 1533.|
|proxyHost|No|The hostname of the proxy.|
|proxyPort|No|The port of the proxy.|
|loginByToken|No|Whether or not to log in by token. Set the value to "true" to log in by token. Note that if the token login fails and the password is available, the password-based authentication will proceed.|
|sendKeepAlive|No|Whether or not to send the keep alive signal. Set the value to "true" to send the keep alive signal.|
|keepAliveInterval|No|The interval at which to send the keep alive signal.|

|Attribute|Required?|Description|
|---------|---------|-----------|
|managed-community-id|Yes|The unique ID of the managed-community. Use the same value as the "host" attribute of the managed community|
|type|Yes|The type of action. Values can be "update", "add", "delete" or "reset".-   Add actions result in the addition of secondary communities.
-   Delete actions result in the deletion of secondary communities. The default community cannot be deleted.
-   Update actions result in an update to communities whose host value match the host value of the managed community. If no attributes are different, the update action does not result in any change.
-   Reset actions are used to reset the client configuration to a new default community. If a reset action is found, it is applied before any other action type and no other actions are processed. The user is prompted to restart, but may opt not to. The managed community referenced by the reset action represents the new default community that is to be used when the user next restarts.

|
|restart|No|By default, update actions only result in a restart if the host name is changed. Add this optional attribute and set the value to "true" to restart the client after other update events. To prevent the default restart after the host name is changed, add this attribute, but set it to "false."|
|applyDefaultCommunityUsername|No|Attribute that can be used with an "add" type managed community action to indicate whether or not the default community user name should be applied to the new community when it is added. Set the value to "true" apply the default community user name.|
|createNewConfig|No|Optional attribute for use with the reset action type. When you set this to "true," the previous default community is completely replaced by the new community. The user name and password are empty, requiring the user to repopulate these values. Without this attribute, or with the attribute set to false, the new default community configuration enabled with a reset action retains the user name, password, and connection options of the former default community.|

## Sample managed-community-configs file { .example}

The following sample file adds a new community and updates two others. The connection type is reverse-proxy.

```
<?xml version="1.0" encoding="UTF-8"?>
<managed-communities>
  <managed-community id="sales.usma.example.com" host="sales.usma.example.com" loginByToken="true" authServerUrl="http://sales.usma.example.com" authType="SAMPLE" useGlobalConnSettings="false">
  <connection connectionType="reverse-proxy" proxyHost="http://usma.example.com:81/sales"/>
  </managed-community>
  <managed-community id="sametime.example.com" host="sametime.example.com" newHost="sametimenew.example.com"/>
  <managed-community id="sametimenew.example.com" host="sametimenew.example.com"/>
  <managed-community-action type="update" managed-community-id="sales.usma.example.com"/>
  <managed-community-action type="update" managed-community-id="sametime.example.com"/>
  <managed-community-action type="add" managed-community-id="sametimenew.example.com"/>
</managed-communities>
```

**Action examples**

Adding a new community

The following example adds a new secondary community using the global connection defaults. Administrator-defined secondary communities are not impacted by the **Allow user to add multiple server communities** policy. Even if the policy is set to Not selected, the client recognizes they are defined by the administrator and allows the user to log into them. Administrator-defined communities cannot be deleted.

```
<managed-communities>
<managed-community id="acct.sales.usma.example.com" host="acct.sales.usma.example.com"/>
<managed-community-action type="add" managed-community-id="acct.sales.usma.example.com"/>
</managed-communities>
```

Updating the default community host

This example updates the default community host from "sales.usma.example.com" to "sales2.usma.example.com."

```
<managed-communities>
<managed-community id="sales.usma.example.com" host="sales.usma.example.com" newHost="sales2.usma.example.com"/>
<managed-community-action type="update" managed-community-id="sales.usma.example.com"/>
</managed-communities>
```

Updating the default community host again

This example updates the default community host from "sales.usma.example.com" or "sales2.usma.example.com" to "sales3.usma.example.com."

```
<managed-communities>
<managed-community id="sales.usma.example.com" host="sales.usma.example.com" newHost="sales3.usma.example.com"/>
<managed-community id="sales2.usma.example.com" host="sales2.usma.example.com" newHost="sales3.usma.example.com"/>
<!-- Ensure existing sales community hosts that missed the first "sales2" update, or that manually reverted, are updated to sales3 -->
<managed-community-action type="update" managed-community-id="sales.usma.example.com"/>
<!-- Ensure existing sales2 community hosts are updated to sales3 -->
<managed-community-action type="update" managed-community-id="sales.usma.example.com"/>
</managed-communities>
```

Updating the secondary community host

This example updates "acct" to "acct2" and ensures acct2 is added as a secondary community for all new users.

```
<managed-communities>
<managed-community id="acct2.sales.usma.example.com" host="acct2.sales.usma.example.com" />
<managed-community id="acct.sales.usma.example.com" host="acct.sales.usma.example.com" newHost="acct2.sales.usma.example.com" />
<!-- Ensure acct2.sales.usma.example.com community is created for all users that don't yet have it -->
<managed-community-action type="add" managed-community-id="acct2.sales.usma.example.com"/>
<!-- Ensure existing acct.sales.usma.example.com community hosts are updated to acct2.sales.usma.example.com -->
<managed-community-action type="update" managed-community-id="acct.sales.usma.example.com"/>
</managed-communities>
```

Updating the secondary community host again

This example updates "acct2" to "acct3", and also ensures acct3 is added as a secondary community for all new users.

```
<managed-communities>
<managed-community id="acct3.sales.usma.example.com" host="acct3.sales.usma.example.com"/>
<managed-community id="acct2.sales.usma.example.com" host="acct2.sales.usma.example.com" newHost="acct3.sales.usma.example.com" />
<managed-community id="acct.sales.usma.example.com" host="acct.sales.usma.example.com" newHost="acct3.sales.usma.example.com" />
<!-- Ensure acct3.swg.usma.hcl.com community is created for all new users -->
<managed-community-action type="add" managed-community-id="acct3.sales.usma.example.com"/>
<!-- Ensure existing acct2.sales.usma.hcl.com community hosts are updated to acct3.sales.usma.example.com -->
<managed-community-action type="update" managed-community-id="acct2.sales.usma.example.com"/>
<!-- Ensure existing acct2.sales.usma.example.com community hosts that missed the first "acct2" update, or that manually reverted, are updated to acct3.sales.usma.example.com -->
<managed-community-action type="update" managed-community-id="acct.sales.usma.example.com"/>
</managed-communities>
```

Switching users to a new default community with a different user directory

If the new community is a different community with a different user backend, use the reset managed-community-action type to reset the user to the new community. Assuming the user credentials are valid in the new community, after restarting, the user logs into the new community. To include additional secondary communities as part of this new configuration, define them on the new server's managed-community-configs.xml file, using add actions for the desired secondary communities. When the reset action is found, if the current default community does not match the community defined by the administrator, or if createNewConfig is set to true, the client saves the new configuration locally. When the client next restarts, the default community defined by the administrator replaces the previously defined default community.

```
<managed-communities>
<managed-community id="acct.sales.usma.example.com" host="acct.sales.usma.example.com"/>
<managed-community-action type="reset" managed-community-id="acct.sales.usma.example.com"/>
</managed-communities>
```

Consolidating multiple communities to a single community

This example consolidates multiple communities with various hosts into a single community with one host.

```
<managed-communities deleteOverlappingCommunities="true">
<managed-community id="sales1.usma.example.com" host="sales1.usma.example.com" newHost="sales.usma.example.com"/>
<managed-community id="sales2.usma.example.com" host="sales2.usma.example.com" newHost="sales.usma.example.com"/>
<managed-community id="sales3.usma.example.com" host="sales3.usma.example.com" newHost="sales.usma.example.com"/>
<managed-community-action type="update" managed-community-id="sales1.usma.example.com"/>
<managed-community-action type="update" managed-community-id="sales2.usma.example.com"/>
<managed-community-action type="update" managed-community-id="sales3.usma.example.com"/>
</managed-communities>
```

**Parent Topic:  **[Updating connectivity settings with the managed-community-configs.xml file](admin_st_mng_remotecomm.md)

