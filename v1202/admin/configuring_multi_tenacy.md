# Enabling multi-tenancy {#configuring_multi_tenacy .task}

Multi-tenancy allows multiple organizations to be part of the Sametime community. With multi-tenancy, Sametime users can chat, add users and groups to contact lists, and have awareness of users in their organization or in other organizations that are configured to be visible to them.

The multi-tenancy feature uses customized Java™ code to dynamically generate a filter and base distinguished names for LDAP searches on the Sametime Community Server. The `CustomizedMultitenancy.class` and `ConfigLoader.class` Java files containing the required code are automatically installed during the Sametime Community Server installation. The `CustomizedMultitenancy.ini` file is also installed and contains the configuration settings and the configuration instructions for the multi-tenancy feature. These files are located in the java directory where Domino is installed.

**For example,**on Windows ﻿C:\\Program Files\\HCL\\Domino\\java.

The multi-tenancy feature is disabled by default.

**Prerequisite LDAP Requirements**

Users from all organizations should reside under one tree, with multiple branches.

**For example:**

If the base DN is CN=ORGANIZATIONS,OU=COLLAB,DC=HCL,DC=COM

An individual organization would be found at this baseDN\(s\):

O=Organization A,CN=ORGANIZATIONS,OU=COLLAB,DC=HCL,DC=COM

O=Organization B,CN=ORGANIZATIONS,OU=COLLAB,DC=HCL,DC=COM

Additionally, each user’s entry in LDAP must contain an attribute that also contains the name of the organization that the user belongs to.

**For example,**you can create an attribute called “organizationName” and the value set to the name of the organization.

organizationName=Organization A.

1.  Before making edits to the configuration, review your LDAP base DNs to determine which values should be used inside the `CustomizedMultitenancy.ini`.

2.  Complete the worksheet below to assist in completing the configuration:

    |Setting Name|Description|Example|Your Value|
    |------------|-----------|-------|----------|
    |Base DN|This is the top of your LDAP tree, where to start searching the directory|CN=ORGANIZATIONS,OU=COLLAB, DC=HCL,DC=COM| |
    |Organization BaseDN|This is the location of the individual organizations.|O=Organization A,CN=ORGANIZATIONS, OU=COLLAB,DC=HCL,DC=COM| |
    |﻿ORG\_PART\_OF\_DN|The attribute in the LDAP DN that contains the organization name.|O| |
    |﻿PEOPLE\_ROOT\_BASE\_DN|This is the DN of the entry where to start searching for people. It should contain the lowest LDAP entry under which the entries of all the people in the organization are available.|O=%S,CN=ORGANIZATIONS, OU=COLLAB,DC=HCL,DC=COM| |
    |﻿GROUPS\_ROOT\_BASE\_DN|This is the DN of the entry where to start searching for groups. It should contain the lowest LDAP entry under which the entries of all the people in the organization are available.|O=%S,CN=ORGANIZATIONS, OU=COLLAB,DC=HCL,DC=COM| |
    |﻿PEOPLE\_BASE\_DN\_TEMPLATE|﻿The DN of the entry at which to start the people or the groups LDAP search when the search is done in a sub tree of a particular organization. %S should always be present in the value. It will be dynamically replaced by the organization name during the resolve operation.|O=%S| |
    |﻿GROUPS\_BASE\_DN\_TEMPLATE|The DN of the entry at which to start the people or the groups LDAP search when the search is done in a sub tree of a particular organization. %S should always be present in the value. It will be dynamically replaced by the organization name during the resolve operation.|O=%S| |
    |﻿LDAP\_ORG\_ATTR|﻿The attribute in the LDAP directory that is present in every person and group entry and contains the organization name that this person or group belongs to.|ORGANIZATIONNAME| |

    **Note:** **Every value in the `customizedMultitenancy.ini` must be in upper case.**

3.  Using the values that have been identified, populate the settings in the `customizedMultitenancy.ini` file, following the examples inside the file. The `customizedMultitenancy.ini` is in the java folder inside the Domino program directory.

4.  Save and close the customizedMultitenancy.ini file when complete.

5.  Open the `sametime.ini` file using a text editor.

6.  Locate the existing \[Config\] section of the file.

    -   For Windows installs, add the following line, ensuring the correct path to the java directory:

        `ST_JAVA_CUSTOM_PATH=C:\Program Files\HCL\Domino\java`

    -   For Linux installs, add the following line, ensuring the correct path to the java directory:

        `ST_JAVA_CUSTOM_PATH=/local/notesdata/java`

7.  Review the `ST_JAVA_CLASS_PATH` line and confirm that the path you entered in the above step is listed first on this line.

8.  **Save** and **Close** the `sametime.ini` file.

9.  Launch the HCL Notes or Administrator client.

10. Click **Open** \> **Applications** \> **Open an Application**

11. In the server name field, enter the Sametime Community server name. In the filename field enter `“stconfig.nsf”`.

12. Double-click the LDAPServer document.

13. Inside the LDAPServer document, double-click to place in edit mode.

14. Change the following fields to the values shown below:

    Search filter for resolving person names:CustomizedMultitenancy.peopleResolveFilter\(\)

    Search filter for resolving group names: CustomizedMultitenancy.groupsResolveFilter\(\)

    Base object when searching for person entries: CustomizedMultitenancy.peopleBaseDn\(\)

    Base object when searching for group entries: CustomizedMultitenancy.groupsBaseDn\(\)

15. Click **File** \> **Save** to save the document.

16. Restart the Community Server for these settings to take effect.

17. On the Sametime Proxy server, add the following section to the stproxyconfig.xml file with the appropriate values for your configuration.

    ```
    <multiTenancy>
    <key>O</key>
    <attr>ORGANIZATIONNAME</attr>
    </multiTenancy>
    </configuration>
    ```

18. On the**Sametime Meeting server**, add the JWT\_ORGID\_KEY attribute to the custom.env file with the appropriate values for your configuration. The value for JWT\_ORGID\_KEY must be the same key value used in the proxy configuration for the multiTency.

    ``` {#codeblock_jpv_mwq_spb}
    <multiTenancy>
    <key>O</key>
    <attr>JWT_ORGID_KEY=O</attr>
    </multiTenancy>
    </configuration>
    ```

19. Restart the Sametime Proxy server for the settings to take affect.


**Parent topic:**[Administering](administering.md)

