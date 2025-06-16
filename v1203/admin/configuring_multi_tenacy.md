# Enabling multi-tenancy {#configuring_multi_tenacy .task}

Multi-tenancy allows multiple organizations to be part of the Sametime community. With multi-tenancy, Sametime users can chat, add users and groups to contact lists, and have awareness of users in their organization or in other organizations that are configured to be visible to them.

The following conditions must be satisfied:

-   Sametime must be installed and configured. For more information, refer to [Installing Sametime](installation_sametime.md) and [Preparing the deployment](t_meetings_configure_deployment.md).
-   Ensure that users from all organizations reside under one tree, with multiple branches. For example, if the base DN is CN=ORGANIZATIONS,OU=COLLAB,DC=HCL,DC=COM, then an individual organization would be found at the following baseDN:

    ``` {#codeblock_u4d_t5x_dwb}
    O=Organization A,CN=ORGANIZATIONS,OU=COLLAB,DC=HCL,DC=COM 
    O=Organization B,CN=ORGANIZATIONS,OU=COLLAB,DC=HCL,DC=COM
    ```

    Additionally, each user’s entry in LDAP must contain an attribute that also contains the name of the organization that the user belongs to. For example, you can create an attribute called “organizationName” and the value set to the name of the organization:

    ``` {#codeblock_ns2_w5x_dwb}
    organizationName=Organization A
    ```


**Note:** For multi-tenant deployments, orgID in versions 12.0 and 12.0.1 does not support the dash \( -\) character for Sametime Meetings.

By default, the multi-tenancy feature is *disabled*. This feature uses customized Java™ code to dynamically generate a filter and base distinguished names for LDAP searches. The multi-tenancy feature is configured by running the `setupMultitenancy.sh` script.

1.  The `setupMultitenancy.sh` script prompts for details from the LDAP configuration. Review your LDAP base DNs to determine which values should be used.

2.  Complete the worksheet below to assist in completing the configuration:

    |Setting Name|Description|Example|Your Value|
    |------------|-----------|-------|----------|
    |Base DN|The top of your LDAP tree—where to start searching the directory.|CN=ORGANIZATIONS,OU=COLLAB, DC=HCL,DC=COM| |
    |Organization BaseDN|Thhe location of the individual organizations.|O=Organization A,CN=ORGANIZATIONS, OU=COLLAB,DC=HCL,DC=COM| |
    |﻿ORG\_PART\_OF\_DN|The attribute in the LDAP DN that contains the organization name.|O| |
    |﻿PEOPLE\_ROOT\_BASE\_DN|The DN of the entry where to start searching for people. It should contain the lowest LDAP entry under which the entries of all the people in the organization are available.|O=%S,CN=ORGANIZATIONS, OU=COLLAB,DC=HCL,DC=COM| |
    |﻿GROUPS\_ROOT\_BASE\_DN|The DN of the entry where to start searching for groups. It should contain the lowest LDAP entry under which the entries of all the people in the organization are available.|O=%S,CN=ORGANIZATIONS, OU=COLLAB,DC=HCL,DC=COM| |
    |﻿PEOPLE\_BASE\_DN\_TEMPLATE|﻿The DN of the entry at which to start the people or the groups LDAP search when the search is done in a sub tree of a particular organization. %S should always be present in the value. It is dynamically replaced by the organization name during the resolve operation.|O=%S| |
    |﻿GROUPS\_BASE\_DN\_TEMPLATE|The DN of the entry at which to start the people or the groups LDAP search when the search is done in a sub tree of a particular organization. %S should always be present in the value. It is dynamically replaced by the organization name during the resolve operation.|O=%S| |
    |﻿LDAP\_ORG\_ATTR|﻿The attribute in the LDAP directory that is present in every person and group entry and contains the organization name that this person or group belongs to.|ORGANIZATIONNAME| |

3.  Change directories to where the Sametime installation files are extracted. Then run `setupMultitenancy.sh` and follow the prompts to provide the required information.

4.  When successful, do either of the following.

    -   For Docker, restart the server to apply the changes.
    -   For Kubernetes, install or upgrade the helm charts \(as applicable to your environment\):
        -   To install, run helm install sametime.
        -   To upgrade, run helm upgrade sametime.

**Parent Topic:  **[Administering](administering.md)

