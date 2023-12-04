# Considerations for telephony {#topology_telephony .concept}

Integration with the Teamcall Meeting Gateway \(TMG\) application from ilink enables telephony services to be added to your Sametime environment. The telephony feature allows telephone access to chats and meetings.

TMG provides two types of end-user experiences:

Dial in
:   Phone numbers are assigned to the Sametime Meeting service, and each telephony-enabled meeting has a unique pass code. This allows users to use their phones to dial into a meeting.

Dial out
:   Dial out allows users to dial a phone number from the meeting and invite another user to join that meeting.

The ilink TMG can leverage your existing on-premise SIP trunk, or a SIP provider or carrier service from a third party. With this configuration, the SIP and RTP protocols are used between:

-   the Meeting service and the ilink TMG server
-   the ilink TMG server and the SIP Provider/Carrier or SIP Trunk

For more details on the ilink product, see the [ilink](https://www.ilink.de/en/index.html) website.

The following graphic shows a network environment with ilink integration.![Graphic showing iLink integration](Images/plan_sametime_ilink.png)

**Parent Topic: **[Planning the network topology and connectivity](topology.md)

