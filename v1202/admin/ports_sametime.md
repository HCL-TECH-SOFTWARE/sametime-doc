# Ports used by Sametime services

Sametime services use several ports for communication. If firewalls are in use in your environment, all traffic on these ports should be permitted bidirectionally.

|Port Number|Description|
|-----------|-----------|
|389|Used for non-secure communications from the Sametime server to the LDAP server.|
|443|Used for HTTP communications over a secure connection.|
|636|Used for secure communications with LDAP for directory services.|
|1516|Used as an internal port between the community and proxy pods.|
|1533|Used to listen for direct TCP/IP connections from Sametime Connect clients.A direct TCP/IP connection is when a Sametime client uses a unique Sametime protocol over TCP/IP to establish a connection with community services.|
|1935|Used when streaming YouTube videos.|
|5280, 5222|Used to reach the service cluster IP for Jitsi. In Kubernetes environments, for websockets to function properly, the video pods using the node port must be able to reach the service Cluster IP for Jitsi on ports 5280 and 5222. See the [Websockets fail to load after installing Sametime 11.6 or 12.0.x on Kubernetes](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0101583) article for more information.|
|8000|Used to listen for HTTP communications. All communication over this port is redirected to HTTPS port 443. Port 8000 is the default port assigned during the product installation process.|
|10000|Used by audio and video clients to stream media data when deploying Sametime on Docker.|
|19302|This UDP port is the default STUN port used by both the client and meeting server for NAT traversal.|
|27017|Used for communication with MongoDB.|
|30000|Used by audio and video clients to stream media data when deploying Sametime on Kubernetes.|

**Parent Topic:  **[Planning the network topology and connectivity](topology.md)

