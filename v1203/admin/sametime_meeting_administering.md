# Managing Sametime Meetings 
You can enable or disable meeting features. Note that these settings apply to the server and are not controlled by user policies.

The following table lists meeting features and whether they can be turn on or off by the administrator or meeting owner.

Table 1. Meeting Features

|Feature|Settings|
|-------|--------|
|Audio and video|Enabled by default, cannot disable.|
|Sharing a video|Enabled by default, cannot disable.|
|Start live stream|Live streaming is disabled if recordings are disabled. To allow recordings and disable live streaming, see [Configuring Live Streaming](enable_disable.md).|
|Disable recordings|Recordings are enabled by default. To disable recordings, see [Managing recording options](recording.md).|
|Change recording availability|Recordings are available for 3 days by default, to change the setting, see [Managing recording options](recording.md).|
|Secure the meeting with password|The option to secure meetings with a password is by default enabled, cannot disable.|
|  |  A user can choose for any meeting owned whether or not to configure a password on that meeting.|
|  | See [Defining Meetings password requirements](meetings_passwords.md) for additional information.|
|Guest users|Guest access is enabled by default. To disable, see [Preventing guest access](disable_guest_access.md)|
|Unmoderated meetings|Enabled by default, cannot disable.|
|Moderated meeting: invite others|[Enabling meeting dial-out](enable_dial_out.md).|
|Raise hand|Enabled by default, cannot disable.|
|User Photos \(authenticated users only\)|You can retrieve photos from the Sametime Proxy server. They will display if they are available to the meeting server.|
| | You can use Gravatar to configure an avatar based on your Sametime email ID. Use it if your photo is not available via the Sametime Proxy.|
|Group Chat|Enabled by default, cannot disable.|
|Group Chat also in the rich client|Enabled by default, cannot disable.|
|Screenshare \(Start Presenting\)|Screenshare is enabled by default on all meetings. In a moderated meeting, the moderator must grant access to screenshare.|
|Multi-user screenshare|By default, any user in an unmoderated meeting can share their screen, even if another user is already sharing. It is not possible to disable this feature.|
|  |  In a moderated meeting, you can share only a single screen at a time.|
|Lock meeting|Enabled by default, cannot disable.|
|Moderated Meeting: Mute everyone else|Enabled by default, cannot disable.|
|Moderated Meeting: All cameras off|Enabled by default, cannot disable.|
|Moderated Meeting: Invite others|See: Enabling a SIP Trunk for Meeting Dial Out|

The following table displays settings that affect the functionality of the server.

Table 2. Server-side configuration settings 

|Description|Setting|
|-----------|-------|
|Maximum number of attendees per meeting. Currently, the maximum supported number of users per meeting is 50. |The default setting is 25 users. To change the setting, see: [Configuring the maximum number of meeting participanats](meetings_configuring_max.md).|


**Parent topic: **[Administering](administering.md)

