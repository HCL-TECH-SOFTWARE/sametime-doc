# Contact list preferences {#config_client_contact_list_pref .concept}

The following table lists the contact list preferences for the HCL® Sametime® Connect Client and Sametime Embedded Client for Notes®.

|Attribute|Variable type|Description|Release|
|---------|-------------|-----------|-------|
|sortGroups|Boolean. Default is true.|Specifies whether by default to alphabetically sort groups in the contact list.|7.5.1 and later|
|sortContacts|Boolean. Default is true.|Specifies whether by default to alphabetically sort contacts in the contact list.|7.5.1 and later|
|alwaysEditStatusMsgActive|Boolean. Default is true.|Specifies whether by default to always edit the status message when changing status to available.|7.5.1 and later|
|alwaysEditStatusMsgAway|Boolean. Default is true.|Specifies whether by default to always edit the status message when changing status to away.|7.5.1 and later|
|alwaysEditStatusMsgInMtg|Boolean. Default is true.|Specifies whether by default to always edit the status message when changing status to in a meeting.|7.5.1 and later|
|alwaysEditStatusMsgDnd|Boolean. Default is true.|Specifies whether by default to always edit the status message when changing status to in a do not disturb.|7.5.1 and later|
|showActionToolBar|Boolean. Default is true.|Specifies whether by default to show the action toolbar in the contact list window.|7.5.1 and later|
|showStatusBar|Boolean. Default is true.|Specifies whether by default to show the status bar in the contact list window.|7.5.1 and later|
|showQuickFind|Boolean. Default is true.|Specifies whether by default to show quick find in the contact list window.|7.5.1 and later|
|flashAddedContacts|Boolean. Default is true.|Specifies whether by default to flash newly added contacts.|7.5.1 and later|
|showAddDialogSuccess|Boolean. Default is true.|Specifies whether by default to open a confirmation dialog after a contact has been added.|7.5.1 and later|
|showAddGroupSuccess|Boolean. Default is true.|Specifies whether by default to open a confirmation dialog after a group has been added.|7.5.1 and later|
|showAddPartnerSuccess|Boolean. Default is true.|Specifies whether by default to open a confirmation dialog after a chat partner has been added \(through add button in chat window\).|7.5.1 and later|
|autoSyncDefaultCommunity  
 BuddyList

|Boolean. Default is true.|Specifies whether by default to synchronize the 7.5 XML buddylist with the previous pre 7.5 contact list used by older clients. Windows® only.|7.5.1 and later|
|launchAtStartup|Boolean|Specifies whether or not to launch Sametime at system startup. The preference is valid only for stand-alone clients and windows platform. If the preference is set it in plugin\_customization.ini or managed preferences framework, it does not work for the first launch of the Sametime client.|7.5.1 and later|
|hideWhenMinimized|Boolean. Default is true.|Specifies whether by default to hide the contact list window when minimized. The preference is valid only for the Sametime Connect Client for Microsoft® Windows.|7.5.1 and later|
|showCommunityIconBackground|Boolean. Default is false.|Specifies whether by default to show the community icon behind the contacts.|7.5.1 and later|
|statusImgBackgroundTransparency|Integer. Default is 60.|Specifies the transparency of the community background image. 0 is very prominent, 100 is completely transparent.|7.5.1 and later|
|showHoverBizCard|Boolean. Default is true.|Specifies whether or not to show the business card when hovering over contacts.|7.5.1 and later|
|hideContactsWhenOffline|Boolean. Default is false.|Specifies whether or not to hide the contact list tree when offline.|7.5.1 and later|
|showBuddyListConflictDialog|Boolean. Default is true.|Specifies whether or not to show the contact list conflict dialog when synchronizing the remote contact list.|7.5.1 and later|
|buddyListConflictPref|String. Default is merge.|Specifies the default behavior to follow in case of a remote/local synchronization conflict. Options include "merge", "keepLocal", and "replaceLocal".|7.5.1 and later|
|warnWhenWatchLimitExceeded|Boolean|When the watch limit is in effect, specifies whether or not to warn user when the number of contacts that can be monitored is exceeded.|7.5.1 and later|
|warnWhenContactLimitExceeded|Boolean|When "LimitContactListSize" policy is set, specifies whether or not to warn user when the contact list is approaching the maximum number allowed.|7.5.1 and later|
|showShortNames|Boolean|Specifies whether or not to show short names for contact list.|7.5.1 and later|
|alwaysOnTop|Boolean|Specifies whether or not to make the contact list window stay visible.|7.5.1 and later|
|showOnlineOnly|Boolean|Specifies whether or not to show online contacts only in the contact list window.|7.5.1 and later|
|showStatusToolBar|Boolean|Specifies whether or not to show My Status ToolBar in the contact list window.|7.5.1 and later|
|showContactList|Boolean|Specifies whether or not to show the contact list in the contact list window.|7.5.1 and later|
|confirmMultiPartyChatInvitation  
 ToMoreThanX

|Boolean|Specifies whether or not to confirm when users start events with groups larger than a specified number of people. The number value is specified by `confirmMultiPartyChatInvitationToMoreThanXNumber`

.|7.5.1 and later|
|confirmMultiPartyChatInvitation  
 ToMoreThanXNumber

|Integer|Specifies a limit number. See `confirmMultiPartyChatInvitationToMoreThanX`

.|7.5.1 and later|
|launchMinimized|Boolean.|Specifies whether or not to minimize Sametime when launching. It's valid only for stand-alone clients and windows platform.|8.5 and later|
|limitPublicGroupSubscriptions

|Boolean. Default is true.|Takes contact list size of public groups into account to calculate the contact list size limit. The default value is true, which means that users cannot add a public group to their contact lists if doing so exceeds the contact list size. If users already have public groups in their contact lists, this preference causes the client to subscribe to each group in the list, from smallest to largest, until the limit is reached. Any other groups remaining in the contact list are shown as unsubscribed groups. Disabling a group subscription causes the client to add as many groups from the unsubscribed list as it can until the contact list size is reached again. Setting the value to false does not include the contact list size of public groups to calculate the contact list size limit.|8.5.2 and later|
|maxPublicGroupSize

|Integer|The maximum number of contacts a public group can have that allows users to subscribe to it. Groups that exceed this size cannot be added to the contact list. If the group already exists in the contact list, users cannot subscribe to the group. You can set this preference when the limitPublicGroupSubscriptions preference is enabled.|8.5.2 and later|
|excludedPublicGroups

|String|A comma-delimited list of public group names that should not be subscribed to \(for example, employees\_Active,employees\_All\). Groups in this list cannot be added to the contact list. If the group already exists in the contact list, users cannot subscribe to the group. You can set this preference when the limitPublicGroupSubscriptions preference is enabled.|8.5.2 and later|
|allowExportContactList|Boolean , default value is false|Specifies whether to allow users to export their contact list. When set to `false`, the **Export Contact List** option does not display on the **Manage Contact List** menu..|9.0.1 and later|

|Attribute|Variable type|Description|Release|
|---------|-------------|-----------|-------|
|HIDE\_PANEL\_com.ibm.collaboration.realtime.filteredbuddies.shelfview|Boolean. Default is true.|Specifies whether the Primary Contacts panel displays in the contacts list.|7.5.1 and later|

**Parent Topic: **[Sametime client preferences](config_client_pref_tables.md)

