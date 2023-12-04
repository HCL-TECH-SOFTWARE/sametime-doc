# Pods in Sametime {#pod_descriptions .concept}

A pod is a group of one or more containers that share storage and network resources.

The following table describes the Sametime pods and the containers in which the pod runs.

|Pod Name|Container|Description|
|--------|---------|-----------|
|Activity| | |
|App-registry| | |
|Auth|NA|Interacts with the Sametime server for SSO.|
|backgrounds|NA|Provides the backgrounds in meetings.|
|Catalog|NA|Maintains the list of meetings that belongs to a user and the the recent meetings list. Interacts with the MongoDB.|
|Click2call|NA|Provides the click to call interface in web chat.|
|Community|community, pushgateway|Performs all authentication, interacts directly with the LDAP service. Enforces policies. Interacts with MongoDB for persistent chat. Retrieves and serves business cards data.|
|files|files, scanner|Provides file transfer service in meetings and web chat|
|Jibri-web|NA|Provides a web interface to the recordings|
|Jitsi|prosody, jigasi, jicofo|The video bridge that streams the media to users. Jigasi container for SIP messages \(integration with telephony\).

Jicofo \(conference focus\) – messages about features used in meetings, participants joining and dropping.

|
|Lobby|NA|Runs the lobby service for meetings.|
|Location|NA|Used when telephony is integrated to assist users with the telephone numbers.|
|Mux|NA|Allows the Connect and Embedded clients in Notes to connect over port 1533. Has a svc with an IP address for users to connect.|
|Proxy|NA|Runs the web chat service allowing users to connect with mobile clients or web clients for chat.|
|Recorder|jibri, pushgateway, await-prosody|Save meeting recordings when a user records a meeting.It is also used for live streaming.

|
|Recordings|NA|Interacts with the persistent volume to store recordings.|
|Video|jvb, prometheus-exporter|Interacts with STUN server.|
|Web|NA|Serves the web interface to the users|
|Webhook|NA|Interacts with telephony and click to call feature|
|Outlook|NA|When the Outlook add-in feature is enabled, this process interacts with the Outlook add-in.|

**Parent Topic: **[Troubleshooting Sametime on Kubernetes](t_troubleshooting_sametime_kubernetes.md)

