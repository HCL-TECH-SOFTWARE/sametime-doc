# Using HCL Connections photos for the Sametime business card {#connections_photos .concept}

You can use the HCL Connections profiles photos for the Sametime business cards. A benefits for using this method is that updated photos in Connections are automatically updated in Sametime.

**Calculating the Connections Profiles Photo URL**

The Connections user photo can be retrieved from /profiles/photo.do API \(REST: GET\) which can process different key values from the parameter sent to uniquely identify the user details. `<protocol>://<connections server>:<port>/profiles/photo.do?parametername=value`

The following parameters can be included on the API.

-   distinguishedName
-   email=
-   uid=
-   userid=
-   key=

This configuration depends on which unique user identifier \(userId\) has been configured in the LDAP settings. The default setting is distinguishedName.

In many cases the Sametime server is configured to use the DN as the Sametime userId. For example: the DN is: CN=Foo Bar,OU=Users,O=Example,C=US In this case the distinguishedName key should be used. The protocol is either HTTP or HTTPS. For example:

```
http://connections.example.com:9080/profiles/photo.do?distinguishedName= 
```

If the Connections server protocol is HTTP and the port is 9080, below is an example of the resulting URL after appending the user’s DN and encoding the spaces:

```
http://connections.example.com:9080/profiles/photo.do?distinguishedName=CN%3DFoo%20Bar%2COU%3DUsers%2CO%3DExample%2CC%3DUS 
```

The community service requires the absolute URL to be added to the person document or LDAP record as an attribute. Many LDAP servers including Domino LDAP and Microsoft Active Directory have an attribute that exists for this purpose called photoURL. Populate the full URL for the photo in the photoURL for each person record in the directory. For Domino LDAP directories, the photoURL is located on the person document, **Miscellaneous** tab.

Some LDAP servers may not display the photoURL attribute to an anonymous bind, for example, Domino LDAP. Use an authenticated bind to the LDAP server when configuring LDAP services, or configure the LDAP server to render the photoURL to anonymous users.

If the photoURL is a protected resource, Single Sign On \(SSO\) must be configured between the Sametime serve and Connections server. If the URL is available to anonymous users, SSO is not required.  When configuring SSO, the Connections server and Sametime server must share a common directory. For additional information, see [Configuring SSO between Connections and Sametime](enabling_sso_ltpa.md).

If you have not already configured the UserInfoConfig.xml file, review the applicable topic for your environment and complete the configuration before setting the photoURL.

**Parent topic:**[Setting up business cards](admin_st_buscard.md)

