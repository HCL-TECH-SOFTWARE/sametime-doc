# People preferences {#config_client_people_pref .concept}

The following table lists the people preferences for the HCL® Sametime® Connect Client and Sametime Embedded Client for Notes®.

|Attribute|Variable type|Description|Release|
|---------|-------------|-----------|-------|
|lookupExpirationDays|Integer. Default is 7.|Specifies the number of days a users directory info is considered up to date. A value of 0 means refresh a user's directory info for each client session.|7.5.1 and later|
|wrapBusinessCard|Boolean. Default is true.|Specifies whether or not to wrap text in business card|7.5.1 and later|
|showNoPhotoPhoto|Boolean. Default is true.|Specifies whether or not to show a placeholder image in business card when user doesn't have a photo.|7.5.1 and later|
|isCaseInsensitive|Boolean. Default is false.|Specifies if it is case insensitive when looking up people. The default of false means the search is case-sensitive. If you plan to set this to true, first turn off case sensitivity in the HCL Sametime Community server and restart the server.|7.5.1 and later|
|userInfoReplacesDefaultDisplayName|Boolean. Default is false.|When set to true, contact names refresh automatically with the contact's business card name. When this preference is enabled, users can also update contact names manually. They can update one name by right-clicking a contact name and choosing **Refresh Person Info**. They can also update all names by selecting **Tools** \> **Refresh Contact Nicknames**.For the preference to work, the person attributes in the LDAP directory used with the Sametime Community Server must meet the following requirements. Verify or change these settings by using the Sametime System Console to administer the Sametime Community Server.

-   Community Services tab - The attribute used for the internal user ID must be different from the attribute used for the person's display name.
-   Business card tab - The attribute used for the business card name must be the same as the attribute used for the person's display name.

|7.5.1 and later|
|refreshNicknamesOnFirstStartup|Boolean. Default is false.|Determines whether clients automatically replace all existing display names and nicknames in the contact list with business card names after clients start up and log in. You can set this preference when the userInfoReplaces DefaultDisplayName preference is enabled.

**Tip:** To prevent the task from running each time you install on a new computer or reset the workspace, use managed preferences to set this preference temporarily for all new and upgrading clients. Disable the preference after all clients have run once.

|8.5.2 and later|
|bizCardShowExtendedStatus|Boolean. Default is false.|Determines whether the extended status, such as phone call status, is displayed in the business card. The default setting is not to display all of the extended statuses in business card.|9.0 and later|

**Parent Topic:  **[Sametime client preferences](config_client_pref_tables.md)

