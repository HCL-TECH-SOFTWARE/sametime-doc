# Managing Sametime Meetings {#sametime_meeting_administering .task}

This topic explains the features you can enable or disable for meetings. Currently, the settings that you can change are global settings that apply to the entire server. User policies cannot control the settings.

|Feature|Settings|
|-------|--------|
|Audio and video|Enabled by default, cannot disable.|
|Sharing a video|Enabled by default, cannot disable.|
|Start live stream|Live streaming is disabled if recordings are disabled. To allow recordings and disable live streaming, see [Configuring Live Streaming](enable_disable.md).|
|Disable recordings|Recordings are enabled by default. To disable recordings, see [Managing recording options](recording.md).|
|Change recording availability|Recordings are available for 3 days by default, to change the setting, see [Managing recording options](recording.md).|
|Secure the meeting with password|The option to secure meetings with a password is by default enabled, cannot disable.

 A user can choose for any meeting owned whether or not to configure a password on that meeting.

 There are no configurable password strength options.

|
|Guest users|Guest access is enabled by default. To disable, see[Disabling guest access](disable_guest_access.md)|
|Unmoderated meetings|Enabled by default, cannot disable.|
|Moderated meeting: invite others|[Enabling meeting dial-out](enable_dial_out.md).|
|Raise hand|Enabled by default, cannot disable.|
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

|The default setting is 25 users. To change the setting, see: [Configuring the maximum number of meeting participants](meetings_configuring_max.md).|

-   **[Defining Meetings password requirements](meetings_passwords.md)**  
The default requirement for a meeting is that the password must be at least eight characters. To increase the password requirements, additional rules can be specified.
-   **[Disabling guest access](disable_guest_access.md)**  
You can disable guest access and remove the option from the meeting attend page.
-   **[Configuring live streaming](enable_disable.md)**  
If you have a high number of users that need to attend a meeting that does not require two-way interaction, you can live stream the conference to YouTube, and users can access the meeting using a YouTube URL.
-   **[Increasing the number of video streams displayed during a meeting](increase_activecameras.md)**  
The most recent active video streams are displayed in the meeting window up to the specified maximum value. The default is nine.
-   **[Managing recording options](recording.md)**  
As the administrator, you have control over your recording settings. This section describes the features available to help you manage meeting recordings and where they are configured.
-   **[Disabling Sametime reports](t_disable_generate_report.md)**  
 By default, meeting owners can generate meeting reports. You can change a setting to disable the ability for owners to generate meeting reports.
-   **[Managing user sign-on](control_validity_length.md)**  
You can control how long your Sametime meeting credentials are maintained to reduce the number of times you have to sign in.
-   **[Disabling virtual background](disable_background.md)**  

-   **[Disabling custom background uploads](t_disable_background_upload.md)**  

-   **[Disabling the meeting timer](t_disabling_timer.md)**  
By default, Sametime is configured to display the meeting duration. You can change the setting to disable the timer.

**Parent Topic:  **[Administering](administering.md)

