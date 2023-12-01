# Meeting server FAQ {#planning_meetingserver .concept}

The Meeting server routes media traffic.

## Network related {#section_gmc_qlc_w5b .section}

How are media streams transferred? Is there any instance where this would occur peer to peer?
:   All media traffic is routed through the Sametime server.

If I need external access to meetings, in which firewall zone do I place the Sametime Meeting server?
:   The Sametime server can be placed in the DMZ or your internal firewall zone.

Are there any considerations for the network if I have a firewall?
:   Yes, see [Sametime Meetings on Kubernetes Statistics and Monitoring case study](session_traversal_utilities.md).

## Chats within a meeting {#section_nmw_qmc_w5b .section}

How long does chats in the meeting remain?
:   There are two places that chats are displayed. For authenticated users who are logged into the server, they see the chats in the Sametime clients as a group chat that includes the meeting participants. The chat persists if the user does not close the chat.

:   For meetings where users are guests, or authenticated users are not logged into a Sametime client, the meeting chat is only inside the meeting room. When the meeting concludes, the meeting room chats are deleted from the meeting room.

Can I make the chats persist from one meeting to the next?
:   When the meeting concludes, the meeting room chats are deleted from the meeting room. Meeting chats do not persist to the next time the same meeting URL is used.

Can I enable logging of the chats inside the meeting?
:   The user can log the chats only if they log into the server using a Sametime client. There are three ways the user can log these chats:

    -   The Sametime Connect client or embedded client have a client-side chat logging feature enabled to save a local transcript.
    -   The user enables persistent chats on the server and clients supporting persistent chats are in use, these chats are stored on the server in MongoDB. They are subject to the persistent chat configuration.
    -   The server-side chat logging is enabled and chats are stored in the configured method.

## Authentication {#section_jps_knc_w5b .section}

Which authentication methods are supported?
:   The Sametime server handles all authentication requests. Any supported authentication model you configure on the Sametime server is supported for Meetings.

How can I disable guest \(anonymous\) access to meetings?
:   See [Disabling guest access](disable_guest_access.md).

Which types of SSO are supported with meetings?
:   LTPA and SAML with LTPA are supported. See [Enabling Single Sign-on](enabling_sso.md).

## Recordings {#section_jxc_d4c_w5b .section}

Where are recordings stored?
:   See [Managing recording](recording.md).

How can you disable meeting recordings?
:   See [Managing recording](recording.md).

What type recorded media is available for meetings, is this configurable?
:   The user can save all recordings as MP4 files. It is not configurable.

Which part of a meeting is recorded?
:   You can record everything that displays on the screen. This does not include the meeting chat.

:   Meeting attendees who also log into the server with a Sametime client have a group chat for the meeting. The link for the recording is contained in the chat, and the chat persists if the clients use the supporting persistent chat and keep the chat open.

How long does recorded media remain on servers? Is this configurable?
:   The default is three days, which is configurable. See [Managing recording](recording.md).

## Configuration settings {#section_nsz_npc_w5b .section}

Which settings are configurable server-wide?
:   Meeting server configuration is all handled on the meeting server; each change is global.

Can the administrator restrict number of participants in a meeting?
:   Yes, and the default number of participants in a meeting is 100. See [Configuring the maximum number of meeting participants](meetings_configuring_max.md) for details.

Which settings are configurable though a policy?
:   The community policy only allows or disallows meetings. There are no other policy-based settings.

Can I disable the audio and video options?
:   No.

Can I integrate my telephony system with the Sametime meeting server?
:   Yes, see [Enabling meeting dial-out](enable_dial_out.md).

## Personal or reserved meetings {#section_zpg_dqc_w5b .section}

Can a user own or reserve the name of a meeting, that is the meeting URL so that no one can use it?
:   Yes, the first user who requests the meeting name owns the reserved name.

Can I have a persistent meeting?
:   You can have a reserved meeting name. There is no data preserved or persisting between members entering or leaving.

Is a moderated meeting room not available until its owner enters the room?
:   Yes, the moderated meeting room is not available until the owner enters the room.

## Migration and existing Sametime environments {#section_ttf_lqc_w5b .section}

Can I upgrade from an earlier version of Sametime Meetings?
:   Yes, see [Upgrading from Meetings 11.5 and 11.6](upgrading_meetings.md).

Can I migrate my Sametime 9.0.1 meeting data to the Sametime meeting server?
:   No. There is no slide share or file share tool in the new meeting server. There is no data that needs to be migrated.

Will my old Sametime meeting URLs work on the new server?
:   Users can expect the legacy meeting URLs to work. The DNS change from the old host name to the new host name handles the migration to the new server. After the DNS change, users can continue to use the original meeting URLs in calendar entries to join meetings. The new server does not support the legacy meeting client plug-in in the Sametime client, so users must join by URL.

Can I use the Sametime 9 meeting plug-in embedded in HCL Notes to connect to a Sametime Meetings server?
:   The introduction of the External Meeting Provider feature in the Sametime embedded and stand-alone clients deprecate the meeting plug-in in the Notes version 11.

## Statics, reporting and auditing {#section_xv4_2rc_w5b .section}

Are there meeting statistics or reports for Sametime ?
:   Sametime 12 introduces a new feature to allow users to download meeting reports. The meeting report includes a list of attendees, meeting start and end times, duration, meeting types such as moderated, guests allowed, the time participants were joined and left the meeting, a list of presenters, a link to meeting recording, and the chat transcript.

:   There is no default feature to collect statistics. It might be possible to configure third party monitoring tools, for example: Grafana and Kubernetes stat page. For more information, see the [HCL Sametime Meetings on Kubernetes: Monitoring and Statistics Case Study](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0088100) white paper.

**Parent topic:**[Planning](planning.md)

