# Meetings {#meetings_configuring .concept}

This contains configuration steps specific to the HCL Sametime Meetings server.

-   **[Disabling secure meeting room names](secure_rooms.md)**  
Users are provisioned with a personal meeting room the first time that they log into their meeting. Their personal meeting room is created with a secure name that cannot be easily guessed by other users. For example: be:MeetMe.CWGRAff90q9HETLne4mhzA.
-   **[Disabling reports on Kubernetes](meeting_report_kubernetes.md)**  
You can disallow gathering reports. When this value is turned on, the meeting owner doesn't have the ability to allow reports to be generated. When this value is turned off, the meeting owner can determine if reports about the meeting are generated and how the report is accessed.
-   **[Disabling reports on Docker or Podman](meeting_report_setting_docker.md)**  
You can disallow gathering reports. When this value is turned on, the meeting owner doesn't have the ability to allow reports to be generated. When this value is turned off, the meeting owner can determine if reports about the meeting are generated and how the report is accessed.
-   **[Enabling conference dial-in](meetings_dialin.md)**  
You can set up your environment to allow users to dial in to a meeting using a SIP-capable phone system that is connected to a public switched telephone network \(PSTN\). This feature uses the ilink TeamCall Meeting Gateway \(TMG\).
-   **[Configuring alternate host name for Web Chat](t_different_hostname.md)**  
The default host name for Meetings and Web Chat are the same. However, you can configure Web Chat to use a different host name. In other words, you can use your *chat host name* instead of the default. There is a secondary cookie that is also used in the meeting authentication flow where if the cookie is present, then the redirect target is pulled from the cookie instead of the TARGET= parameter.
-   **[Enabling meeting dial-out](enable_dial_out.md)**  
You can enable the dial-out option on Docker and Kubernetes.
-   **[Configuring the maximum number of meeting participants](meetings_configuring_max.md)**  
A maximum of 100 users are supported in a meeting regardless of the selected meeting mode. To reach a wider audience, you can start a live stream and share the link to all intended participants.
-   **[Enable Videobridge for TCP](enable_video_bridge.md)**  
This section provides steps to configure TCP for media streams using TCP port 4443.
-   **[Disable sharing of meeting recording](disable_sharing_meetings.md)**  
By default meeting recordings can be shared with others. You can change a setting to disable sharing of meeting recordings.
-   **[Enabling Microsoft Outlook Add-in](enable_microsoft_outlook.md)**  
To use the Sametime Meetings add-in for Microsoft Outlook, it must be enabled on the Sametime server. The add-in is provided as part of Sametime installation package.
-   **[Deploying Microsoft Outlook add-ins to users](microsoft_outlook_deploy.md)**  
An administrator can centralize the deployment the HCL Microsoft Add-in so that it is available for users within the organization.
-   **[Setting up a TURN server](turnserver_intro.md)**  
A TURN server can be configured to provide for efficient traffic flow within your Sametime meeting.

**Parent Topic: **[Configuring](configuring.md)

