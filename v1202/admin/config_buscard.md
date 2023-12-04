# Configuring business cards using an LDAP directory {#config_buscard .task}

Configuring business cards is done in the `UserInfoConfig.xml` file in the community pod.

Before you start setting up your business cards, ensure the following:

-   The LDAP server is running and accessible by the Sametime server.
-   All LDAP attributes needed by the business card are accessible for query through an anonymous connection or by using a specific bind account and password.
-   If using an Domino LDAP, edit the server configuration settings to allow anonymous users to access required user details. In the Domino Administrator or Notes Client, click **Configuration** \> **All Server Documents** \> **Configurations** to access the **All Servers** document. Click **Edit Configurations**. Under the LDAP tab, you can view and add LDAP attributes that can be retrieved by anonymous users to the **Anonymous users can query** list.

Configuration settings for business cards are in the `UserInfoConfig.xml` file in the community container or pod. For most environments, the `UserInfoConfig.xml` file works with default settings. You can override the default configuration settings by modifying the `UserInfoConfig.xml` file. The procedure to update the `UserInfoConfig.xml` file is different on Kubernetes and Docker.

When modifying the XML file be sure to check the formatting using a browser. If there is an error with the formatting of the XML file, a business failure can occur.

1.  When using multiple LDAP servers, each LDAP server requires its own settings. By default, only the first server is configured during setup. To add additional LDAP servers, use the existing settings as a template.

    Locate the `<StorageType=”LDAP”>` section and copy everything between the `<StorageType=”LDAP”>` and `</Storage>` statements. Paste the statements at the end of the section below the `</Storage>` statement. This creates a new LDAP section. See [Configuring additional LDAP servers on Kubernetes](configuring_ldap_multiple_kubernetes.md) for information on configuring LDAP.

2.  Configure an authenticated bind.

    In some environments, not all the attributes are available to an anonymous bind, and an authenticated bind must be used. During the Sametime installation, anonymous binds to LDAP is configured by default. When a custom UserInfoConfig.xml file is being used, the LDAP bind credentials are being overridden. Bind credentials are located in the .env file for Docker and the sametime-global-secret in Kubernetes.

    1.  Use the echo command to find the base64 encoded value for the user name and password.

        Specify the user name and password separated by a colon. For example, if the Bind user name is `CN=stbind,O=example` and the password is `securePassword`, enter the following command in a Linux shell:

        ``` {#codeblock_zvc_dvd_s5b}
        echo -n ‘CN=stbind,O=example:securePassword’ | base64 
        ```

        The results from the command is the value of a new argument called UserEncodedAuth.

    2.  Replace the user name and password parameters with `UserEncodedAuth="value"`.

        For example:

        ``` {#codeblock_ss5_lvd_s5b}
        <StorageDetails HostName="ldap2.example.com" Port="1389" UserEncodedAuth=” 4oCYQ049c3RiaW5kLE89ZXhhbXBsZTpzZWN1cmVQYXNzd29yZOKAmQ==” SslEnabled="true" SslPort="636" BaseDN="" Scope="2" SearchFilter="(&amp;(objectclass=organizationalPerson)(|(cn=%s)(givenname=%s)(sn=%s)(displayName=%s)(mail=%s)))"/>
        ```

3.  By default, the LDAP operations are not encoded, and all communications are sent over clear text. To enable encryption, first follow the instructions in [Securing connections between Sametime servers and LDAP](securing_connections_sametime_community_and_ldap.md).

    After the keystore has been created, update the SSL properties to include the path to the keystore and its password. For example:

    ```
    <SslProperties KeyStorePath="keys.p12" KeyStorePassword="securePassword"/> 
    ```

    Verify the port number on the `SslPort` property. The default LDAP port number is 636.

    ``` {#codeblock_ayd_sss_q5b}
    SslPort="port\_number"
    ```

    Change the setting for `SslEnabled` to true.

    ``` {#codeblock_uzk_rss_q5b}
    SslEnabled="true"
    ```

4.  Review the default search filter and make changes to fit your LDAP server’s schema.

    The `BaseDN` field specifies where to start searching in the directory. For example, if all users are located in `cn=users,dc=example,dc=com`, you could set your `BaseDN=”cn=users,dc=example,dc=com“` so that the rest of the directory is not searched. A BaseDN is required if using Microsoft Active Directory and is not required for Domino LDAP.

    Scope specifies how deep the search is done, enter one of the following.

    0 = Base
    :   A lookup operation. Only a single entry described by the base DN is matched.

    1 = One level
    :   Searching is performed one level below the base DN and no further. This is like opening a folder in a file system and looking only at the direct elements inside the folder.

    2 = Subtree
    :   All child entries of the base DN are searched, whether direct or not, including the base DN itself.

5.  The host name of the LDAP server is set during setup. Review the HostName setting and confirm that it is the fully qualified host name of the LDAP service, which might be a load balancer in front of a cluster of LDAP servers.

    If the host name is not correct, update it in the helm/values.yaml file for Kubernetes or the .env file for Docker.

6.  Map the business card fields to LDAP attributes

    For each type of data, there is an `Id` and `FieldName`.

    -   The `Id` is the internal name used to identify each area of the business card.
    -   The `FieldName` value is set to the LDAP attribute that contains the data to display inside the business card. Modify any values that do not match your LDAP schema.
    These settings are in the `<Details>` section.

    |Description|Id name \(do not change\)|Example|
    |-----------|-------------------------|-------|
    |The name of the attribute that holds the email address|MailAddress|mail|
    |The name of the attribute that has the user’s Common Name.|Name|cn|
    |The name of the attribute that contains the user’s title.|Title|title|
    |The name of the attribute that contains the user’s physical address.|Location|postalAddress|
    |The name of the attribute that contains the user’s phone number.|Telephone|telephoneNumber|
    |The name of the attribute that has the Company, organization or department name.|Company|ou|
    |The attribute containing the photo.\*\*|Photo|jpegPhoto|

    **Note:** \*\* If images are stored in a URL, see the step 8.

7.  If you would like to map additional detail to these fields it is possible with additional configuration modify the appropriate line in the `<Details>` section.

    For example, if there is both a desk phone number and a mobile phone number that you wish to include in the business card, you can use a separator between the two phone numbers when the information is displayed. Locate the `<Detail>` line with the telephone attributes. For desk phone number the attribute is telephoneNumber, and for mobile phone it is mobile. In the field name, include both attributes separated by a comma.

    ```
    FieldName=”telephoneNumber,mobile”
    ```

    Add `DisplaySeparator="separator"` to the statement identifying the separator. In the example, the forward slash is used as the separator. You can choose other characters as a separator.

    ``` {#codeblock_l1g_p1t_q5b}
    <Detail Type="text/plain" Id="Telephone" FieldName="telephoneNumber,mobile" DisplaySeparator=” / “/>
    ```

8.  If photos are stored in a URL on a web server, the LDAP server must have an attribute that contains the URL. The attribute can be an existing attribute that has been repurposed or a new attribute can be created.

    **Note:** If you are using HCL Connections Profiles for the photos, see the topic [Configuring Business Cards on HCL Connections](connections_photos.md).

    When using Connection Profile URLs, the photo name must be the email extension of .jpg. For example, if a user’s email address is jane@example.com, the file name must be jane@example.com.jpg.

    Locate the `<Details>` section. Create a new `<Details>` line for the ImagePath to be used by desktop clients. In the FieldName setting, enter the attribute that contains the URL. For example,if the attribute that contains the photo URL is description the new line is:

    ``` {#codeblock_b54_pb5_q5b}
    <Detail Type="text/plain" Id="ImagePath" FieldName="description"/>
    ```

    If you have mobile clients, add an additional `<DetailType>` for PhotoURL. For example:

    ``` {#codeblock_a31_rb5_q5b}
    <Detail Type="text/plain" Id="PhotoURL" FieldName="description"/>
    ```

9.  In the Set params settings, select the Id names for the fields that you want to display as part of the business card. And remove any Ids that you do not want to include.

    For example, if you do not want to include the company name, remove “Company” from the list of attributes.

    If you have added ImagePath, PhotoURL, or both, add these to the `<Set params>` and remove Photo.

    There are two lines that begin with `<Set params>`, each one has a unique SetID=.

    -   The one listed for SetId=”0” is for anonymous users.
    -   The one for SetId=”1” is for authenticated users.
10. In the LDAP configuration, if the **"﻿The attribute of the person entry that defines the internal ID of a Sametime user"** setting is not blank or set to anything other than the DN, the `UserInfoConfig.xml` file must be updated.

    Locate the StorageDetails tag of the relevant LDAP directory and add the following flags:

    -   UserIdAttribute= attribute\_name

        Where `attribute_name` is the name of the attribute configured as the internal ID.

    -   PersonObjectClass= object\_class\_name

        Where `object_class_name` is the name of the person object class, for example: organizationalPerson.

11. When all updates are complete, save and close the `UserInfoConfig.xml` file.

    Verify that there are not formatting errors by opening the file in a browser.


If no mistakes are found, update the Docker or Kubernetes deployment for the settings to take effect. See [Customizing business cards in Docker and Podman](config_buscard_custom_docker.md) or [Customizing business cards in Kubernetes](config_buscard_custom_kubernetes.md).

**Parent Topic: **[Setting up business cards](admin_st_buscard.md)

