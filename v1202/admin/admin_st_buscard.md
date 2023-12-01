# Setting up business cards {#admin_st_buscard .concept}

You can configure the Sametime server so that business card information about an individual displays when a user hovers over a name in a chat window or a contact list. Business card information also displays at the top of an active chat window.

Business cards are configured to access user information from the LDAP directory. To access the user information from the LDAP directory, Sametime provides a search engine called a black box.

By default, you can choose the following fields to display in the business card.

-   Photo
-   Name
-   Company
-   E-mail address
-   Telephone
-   Address or location
-   Title

To troubleshoot problems with business cards, see [Resolving problems with business cards](t_resolving_business_cards.md).

Business card photos must meet the following requirements:

-   Photos must be less than 45K in size. Photos 10K or less are recommended.
-   Photo file types .jpg and .gif are supported.
-   Photos to be used in business card for mobile or web clients they must be in the format of a URL, such as hosted from a web server or HCL Connections Profiles server.

## Planning for business cards {#section_pny_k5w_35b .section}

A single LDAP server must be used as the primary repository to retrieve user information. A secondary repository is optional and must be configured as a secondary LDAP server for business cards.

## Planning for photos {#tasktroubleshooting_ay3_nrv_4tb .section}

If photos are used in a business card , they can be stored in the LDAP directory or in the format of a URL hosted from a web server. For mobile and web clients using the Sametime Proxy server, they must be stored in the format of a URL. Importing photos into a directory using an image/jpeg type is only supported on the Connect and Embedded clients.

Importing photos into a directory increases the size of the directory. The increase in size can affect the performance of other applications that use the directory.

Depending on the Sametime client type, the attribute to defined the photo location is different.

-   `PhotoURL` supports the Web and Mobile clients.
-   `ImagePath` supports the Connect and Notes Embedded clients.
-   Photos set to image/jpeg type supports the Connect and Notes Embedded clients.

`PhotoURL` and `ImagePath` can be mapped to the same LDAP field. To support all Sametime client types using a URL, update the Sametime server UserInfoConfig.xml file to define both `PhotoURL` and `ImagePath`. For example:

``` {#codeblock_pqq_svw_35b}

 <Detail Type="text/plain" FieldName="PhotoURL" Id="ImagePath"/>
 <Detail Type="text/plain" FieldName="PhotoURL" Id="PhotoURL"/>

<Set params="MailAddress,Name,Title,Location,Telephone,PhotoURL,ImagePath,Company" SetId="0"/>
<Set params="MailAddress,Name,Title,Location,Telephone,PhotoURL,ImagePath,Company" SetId="1"/>
```

After you have identified where the user information is stored, proceed to the applicable topic to configure business cards.

-   **[Configuring business cards using an LDAP directory](config_buscard.md)**  
Configuring business cards is done in the `UserInfoConfig.xml` file in the community pod.
-   **[Customizing business cards in Kubernetes](config_buscard_custom_kubernetes.md)**  
You can override the default business cards configuration by creating an extra-community-configs secret to hold the configuration files.
-   **[Customizing business cards in Docker](config_buscard_custom_docker.md)**  
You can override the default business cards configuration by editing a UserInfoConfig.xml file and adding it as a volume in the docker-compose.yml.
-   **[Storing photos in the Domino directory](storing_photos.md)**  
If the Sametime server is connected to a Domino LDAP server, you can store business cards photos in the Domino Directory.
-   **[Using HCL Connections photos for the Sametime business card](connections_photos.md)**  
You can use the HCL Connections profiles photos for the Sametime business cards. A benefits for using this method is that updated photos in Connections are automatically updated in Sametime.

**Parent topic:**[Configuring](configuring.md)

