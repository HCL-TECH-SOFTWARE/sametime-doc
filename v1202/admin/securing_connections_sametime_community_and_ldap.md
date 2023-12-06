# Securing connections between Sametime servers and LDAP 

When Sametime is configured to connect to an LDAP server, the Sametime servers makes five separate connections to the LDAP server.



The Sametime Community Server makes a separate connection to the LDAP server to perform each of these five tasks:

-   Authenticate users.
-   Resolve a user name to a distinguished name as part of the login procedure.
-   Resolve user and group names \(for example, as a response to an "Add Person or Group" request from a Sametime Connect Client\).
-   Browse the directory.
-   Get the content of public groups.

The Sametime Community Server and LDAP servers exchange directory information, including user names and passwords, over these connections. To ensure this information is secure, the administrator can use SSL to encrypt the data that passes over these connections. The administrator should consider the level of protection required before enabling SSL. Using SSL to encrypt these connections can slow the server performance. 

The administrator has the following options when using SSL to encrypt the data transmitted between the Sametime and LDAP servers:

-   **Encrypt all data** - This option encrypts all directory information \(both user names and passwords\) that is transmitted between the Sametime Community Server and the LDAP server. If you encrypt all data, all five connections between the Sametime Community Server and LDAP server are encrypted with SSL. This option provides the most security but also has the greatest effect on server performance.
-   **Encrypt only user passwords** - This option encrypts passwords but no other directory information \(such as usernames\) passing over the connections between the Sametime Community Server and LDAP servers. If you encrypt only user passwords, only the "authenticating users" connection between the Sametime server and the LDAP server is encrypted with SSL. This option provides an intermediate level of security and has less effect on server performance than encrypting all the data.
-   **Encrypt no data** - This option allows all directory information and passwords to pass unencrypted between the Sametime and LDAP servers. This option does not affect server performance and should be used if the administrator feels there is no chance that an unauthorized user can intercept information transmitted over the connections between the Sametime and LDAP servers. This is the default setting, if you wish to encrypt no data, no additional steps are necessary. 
-   **Using SSL to encrypt connections between the Sametime Userinfo servlet and LDAP** - This option secures the communication for the business card data.

**Prerequisites**

You must already have created the TLS Trust Store in .p12 or .jks format. 

You can configure Sametime LDAP to use the same TLS settings as the rest of the server by setting the configuration at the global scope, or the LDAP settings can be secured using its own key store and settings by following the instructions in the Individual TLS scope and using the pre-fix STLDAP\_.   You must configure the sametime.ini settings by completing one of these topics: 

-   [Implementing the Global TLS Scope](implement_tls_configuration.md)
-   [Implementing the Individual TLS Scope](implement_tls_configuration_individual.md)

**Procedure**

Follow these steps to encrypt all data as explained above.

**Import the LDAP server’s certificate into the trust store**

If the LDAP server is using a public certificate, then you need to obtain the public root CA and import it into the trust store on the Sametime server. If your LDAP server is using a self-signed certificate, then you simply import the self-signed certificate. In the prerequisite topics, your trust store filename is defined in sametime.ini setting ST\_TLS\_TRUST\_STORE\_FILE or if using the individual scope in STLDAP\_TLS\_TRUST\_STORE\_FILE.  If you are securing Sametime using the global scope, the LDAP connections can use the same key and trust stores and these sametime.ini parameters are not needed.

**Update the stconfig.nsf to use the secure LDAP settings**

See the [configuring\_ldap.md](configuring_ldap.md) topic and

-   Set the Connection settings to the secure LDAP port \(typically 636\).
-   Set the field **SSL Enabled** to true.

**Update the userinfoconfig.xml to use the secure LDAP settings**

By default, the business cards LDAP connection is unsecure. To secure these settings, see the topic [Configuring Business cards using an LDAP Directory](config_buscard.md) and complete the optional step **“Enabling Encryption”**.

**Encrypt only password related operations**

If you wish to only encrypt operations that involve passwords, the rest of the traffic can remain unencrypted \(sent in the clear\), follow these steps:

1.  Remote to the Sametime Community Server.
2.  Open the sametime.ini file using a text editor \(located in the Domino program directory\).
3.  In the \[Directory\] section add the following line:

    ST\_DB\_LDAP\_SSL\_ONLY\_FOR\_PASSWORDS=1

4.  Save and close the sametime.ini file.
5.  Restart Sametime Server for the change to take effect.

