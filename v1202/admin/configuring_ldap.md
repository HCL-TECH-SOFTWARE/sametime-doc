# Configuring LDAP

Sametime supports LDAP directory servers as the user repository.

The default LDAP configuration works for most environments. The settings are based on an Domino LDAP deployments that has not been modified. If using another LDAP environment, you might need to override the default settings.

You can customize how the Sametime server interacts with LDAP by modifying the StCommunityConfig.xml file located in the Community container. The UserInfoConfig.xml file also contains LDAP settings that can be customized for business cards.

For LDAP security, see the security section of the help center.

Note that when modifying XML files, it is important to keep the indentation preserved and not use any illegal XML characters including in passwords. Do not use copy and paste into the XML files, it might corrupt the files.

When using the StCommunityConfig.xml and UserInfoConfig.xml files to override default setting, the LDAP bind credentials are stored in these files. If the bind account password changes, these files need to be updated too. To change the bind password in these files, see [Changing the LDAP service account password in Kubernetes](configuring_ldap_password.md).

You can customize the following:

-   The resolve filter for resolving user names
-   The search filter for finding users
-   The group resolve filter Define the attributes used for group membership, mail, BaseDN display name for searching users and groups
-   The frequency for refreshing the directory
-   Configure additional LDAP servers: See [Configuring additional LDAP servers on Kubernetes](configuring_ldap_multiple_kubernetes.md)
-   Business Cards: See [Setting up business cards](admin_st_buscard.md)

The following table describes the configuration settings.

|Setting|Description|Default setting|
|-------|-----------|---------------|
|DirRefreshInterval|The amount of time users and groups are refreshed. The refreshed data is maintained in a cache. This cache can be a resource intensive operation for large directories and can be adjusted to happen at a less frequent interval. For example, if you have more than 200,000 entries in the directory, consider changing this to 240 minutes.|60 minutes|
|ConfigRefreshInterval|The amount of time that lapses before policy, sametime.ini, UserInfoConfig.xml and StCommunityConfig.xml files are re-read. There is typically no need to change this setting.|60 minutes|
|Connection HostName|The fully qualified host name of the LDAP server. If you are using a cluster, it is recommended to place a load balancer in front of the cluster and use the load balancer host name or IP address.|The value for this setting is obtained from the values.yaml file. It is placed there when prompted during the **prepareDeployment** script.|
|OrganizationName|Do not specify. This setting is deprecated. |Do not change.|
| | **Note:** Specifying a value might prevent users from logging in successfully. | |
|Port|The unsecured LDAP port, if you are using an unsecure connection to LDAP.|If an unsecured LDAP is specified when running **prepareDeployment.sh**, the port specified at the script prompt is used. If secure LDAP was specified, the default value is 1389.|
|BindEntryDn|The LDAP Bind account name, which can be in DN or email format.|This is blank unless a value is provided during the **prepareDeployment.sh**, and then it is retrieved from the sametime-global-secrets.|
|BindEntryPassword|The password for the **BindEntryDn**.|Blank or retrieved from **sametime-global-secrets**.|
|SSLEnabled|0 Turn off SSL. | The value for this is provided during **prepareDeployment.sh** and is pulled from values.yaml file.|
| | 1   Turn on SSL.| |
|SSLPort|The LDAP secure port. The well-known port is 636, but some LDAP services use a proprietary port.|This selection is made during the **prepareDeployment.sh** and is pulled from the values.yaml file.|
|SearchOrder|The order in which LDAP directories are searched. Do not change this value unless you have more than one LDAP server to configure. Each search order must be unique.| |
|PersonResolveBase|The base DN used for searching users. If users are in a specific OU, you can list that OU and Sametime begins searching there. For example, if users are in OU=users,O=example, you can set this as your PersonResolveBase.|None. The entire directory is searched.|
|PersonResolveFilter|The filter used to search LDAP when a user searches with Quickfind.| \(&amp;\(objectclass=organizationalPerson\)\(\|\(cn=%s\*\)\(givenname=%s\*\)\(sn=%s\*\)\(mail=%s\*\)\)\) |
|PersonResolveScope|The scope of the search. | 'recursive \(searches nested OUs\)'| 
| | **recursive** Search the entire directory recursively starting at the base DN. | |
| | **onelevel** Search the base DN and not search OUs. | |
|GroupResolveBase|The base DN for searching groups. For example if your groups are in a specific OU, you can list that OU and Sametime will begin searching there. For example if your groups all exist in OU=groups,O=example, you can use that as a base DN. | None|
| | **Note:** Domino LDAP groups are flat and you should not use a GroupResolveBase if using Domino LDAP.| |
|GroupResolveFilter|The filter used to resolve a group name to a group. The name of the **objectClass** used by Domino uses for groups is **groupOfNames**. Other LDAP providers might use a different name, such as **groupOfUniqueNames**. This filter is used when clients add groups to contact lists, or when Sametime clients calculate their policy. | \(&amp;\(objectclass=groupOfNames\)\(cn=%s\*\)\) |
|GroupResolveScope|The scope of a search. |recursive|
| | **recursive** Search all nested OUs. | |
| | **onelevel** Searchonly the base DN. | |
|UserIdAttribute|Defines the Sametime ID.|The DN is used as the default|
|NameAttribute|The attribute used to display the user’s name in meetings, chat and business cards.|cn|
|DescAttribute|This setting is not used and should be left blank.|None, do not change.|
|GroupNameAttribute|The name of the attribute that holds the group’s name.|cn|
|PersonObjectClass|The object class that defines a person in the LDAP directory.|organizationalPerson|
|GroupObjectClass|The object class that defines a group in the LDAP directory.|groupOfNames|
|HomeServerAttribute|Does not apply to version 12.0 and higher deployments.|None|
|UserDnSearchFilter|The filter to resolve a user to a unique DN. Use this to customize how Sametime searches and finds a user and resolves them to their DN.|"\(&amp;\(objectclass=organizationalPerson\)\(\|\(cn=%s\)\(givenname=%s\)\(sn=%s\)\(mail=%s\)\)\)"|
|GroupMemberAttribute|The name of the attribute that holds the members of a group.|Member|
|EmailAttribute|The name of the attribute that holds the email address.|Mail|
|GroupMembership|The resolve filter used by policies to determine if a user is a member of a group. It might be more performant to change this to the memberOf attribute in lieu of a search.|"\(&amp;\(objectclass=groupOfNames\)\(member=%s\)\)"|

-   **[Configuring LDAP on Docker and Podman](configuring_ldap_docker.md)**  

-   **[Changing the LDAP service account password in Kubernetes](configuring_ldap_password.md)**  
If you are using an authenticated bind for LDAP, with a password that expires periodically, you'll need to update the LDAP bind credentials for Sametime clusters in Kubernetes with a new password.
-   **[Overriding the default LDAP configuration in Kubernetes](configuring_ldap_kubernetes.md)**  
Configuration settings can be overridden using the extra-community-config secret.
-   **[Configuring additional LDAP servers on Docker and Podman](configuring_ldap_multiple_docker.md)**  
You can configure the Sametime server to connect to two or more LDAP servers.
-   **[Configuring additional LDAP servers on Kubernetes](configuring_ldap_multiple_kubernetes.md)**  
You can configure the Sametime Community pod to connect to two or more LDAP servers.
-   **[Creating custom Java classes for searching LDAP](creating_custom_java.md)**  
**These topic are in progress** Create custom Java™ classes that provide greater control over how Sametime conducts name searches of an LDAP directory and how results are formatted.

**Parent Topic:  **[Configuring](configuring.md)

