# Network planning for meetings {#network_planning .concept}

Sametime meetings generate two types of traffic: web traffic and RTP media streams. Web traffic is standard HTTPS. And, media streams by default use UDP for optimal performance. If the UDP service is unavailable, enabling TCP for RTP media streams is supported.

To support the Sametime default configuration, use the following ports for client access:

-   For Kubernetes deployments: TCP port 443 and UDP port 30000
-   For Docker deployments: TCP port 443 and UDP port 10000

If you enable TCP for media streams, you can configure it to use TCP port 443. However, it does not send media streams as HTTPS data. Confirm with your security and firewall teams that this non-standard use of HTTPS port 443 will be permitted.

The amount of bandwidth consumed by Sametime Meetings depends on several factors, such as the quality of video being shared, the number of video and audio streams being shared, and more. The default limit for simultaneous video streams is *8*. Increasing this value affects bandwidth consumption. For more information, refer to [Increasing active cameras](increase_activecameras.md).

You must discuss the design of your Sametime deployment with your network and security teams before implementation. Many common network layer devices and technologies introduce latency, which can degrade the user experience. Identify all potential bottlenecks, for example, firewall, proxy, VPN, packet shapers, and intrusion prevention devices before deploying servers.

-   **[Session Traversal Utilities for NAT \(STUN\)](session_traversal_utilities.md)**  
Session Traversal Utilities for NAT \(STUN\) is a standardized set of methods, including a network protocol, for [NAT traversal](https://en.wikipedia.org/wiki/NAT_traversal) of [Network address transalation \(NAT\)](https://en.wikipedia.org/wiki/Network_address_translation) gateways in applications of real-time voice, video, messaging, and other interactive communications.
-   **[Determining where to install Sametime](topology_turn.md)**  
You can extend access to Sametime outside of your internal network to attendees on the Internet. Sametime can be installed in the demilitarized network zone \(DMZ\) and the required ports for connectivity need to be opened on the firewalls surrounding the DMZ. You can also use a third party Kubernetes cloud provider such as Amazon EKS, Google GKE, or other third party Kubernetes provider to deploy Sametime. For more information, see the [Deploying Sametime 12 on Google Kubernetes Engine](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0099614) guide.

**Parent topic:**[Planning](planning.md)

