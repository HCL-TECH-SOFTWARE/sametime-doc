# Managing Sametime Meetings {#sametime_meeting_administering .task}

This topic explains the features you can enable or disable for meetings. Currently, the settings that you can change are global settings that apply to the entire server. User policies cannot control the settings.

|Feature|Settings|
|-------|--------|
|Audio and Video|Enabled by default, cannot disable.|
|Blur the background \(video feature\)|Enabled by default, cannot disable.|
|Share a YouTube video|Enabled by default, cannot disable.|
|Start live stream|Live streaming is disabled if recordings are disabled. To allow recordings and disable live streaming, see [Configuring Live Streaming](enable_disable.md).|
|Disable recordings|Recordings are enabled by default. To disable recordings, see [Managing recording](recording.md).|
|Change recording availability|Recordings are available for 3 days by default, to change the setting, see [Managing recording](recording.md).|
|Secure the meeting with password|The option to secure meetings with a password is by default enabled, cannot disable.

 A user can choose for any meeting owned whether or not to configure a password on that meeting.

 There are no configurable password strength options.

|
|Guest users|Guest access is enabled by default. To disable, see[Disabling guest access](disable_guest_access.md)|
|Unmoderated Meetings|Enabled by default, cannot disable.|
|Moderated Meeting: Invite others|[Enabling meeting dial-out](enable_dial_out.md).|
|Raise Hand|Enabled by default, cannot disable.|
|User Photos \(authenticated users only\)|You can retrieve Photos from the Sametime Proxy server. They will display if they are available to the meeting server.You can use Gravatar to configure an avatar based on your Sametime email ID. Use it if your photo is not available via the Sametime Proxy.

|
|Group Chat|Enabled by default, cannot disable.|
|Group Chat also in the rich client|Enabled by default, cannot disable.|
|Screenshare \(Start Presenting\)|Screenshare is enabled by default on all meetings. In a moderated meeting, the moderator must grant access to screenshare.|
|Multi-user screenshare|By default, any user in an unmoderated meeting can share their screen, even if another user is already sharing. It is not possible to disable this feature.

 In a moderated meeting, you can share only a single screen at a time.

|
|Lock meeting|Enabled by default, cannot disable.|
|Moderated Meeting: Mute everyone else|Enabled by default, cannot disable.|
|Moderated Meeting: All cameras off|Enabled by default, cannot disable.|
|Moderated Meeting: Invite others|See: Enabling a SIP Trunk for Meeting Dial Out|

These settings affect the functionality of the server.

|Description|Setting|
|-----------|-------|
|Maximum number of attendees per meeting. Currently, the maximum supported number of users per meeting is 50.

|The default setting is 100 users. To change the setting, see: [Configuring the maximum number of meeting participants](meetings_configuring_max.md).|

-   **[Disabling guest access](disable_guest_access.md)**  
You can disable guest access and remove the option from the meeting attend page.
-   **[Configuring live streaming](enable_disable.md)**  
If you have a high number of users that need to attend a meeting without two-way interaction, you can live stream the conference to YouTube. It will only be a listen and watch experience for attendees in the live stream. The users will attend this meeting using a YouTube URL. Most of the live stream requirements are on the YouTube account that belongs to the user who moderates the meeting. In the context of YouTube live streaming, consider the Sametime Meeting server as an “encoder” for YouTube. There is no requirement to install additional software.
-   **[Increasing active cameras](increase_activecameras.md)**  
The default allowed active cameras is eight, with the most recent active cameras displaying.
-   **[Managing recording](recording.md)**  
You can control how long meeting recordings are available and also disable the recording feature.
-   **[Managing user sign-on](control_validity_length.md)**  
You can control how long your Sametime meeting credentials are maintained to reduce the number of times you have to sign-in.
-   **[Disabling virtual background](disable_background.md)**  

-   **[Disabling custom background uploads](t_disable_background_upload.md)**  


**Parent topic:**[Administering](administering.md)

