# Session Traversal Utilities for NAT \(STUN\) {#session_traversal_utilities .concept}

Session Traversal Utilities for NAT \(STUN\) is a standardized set of methods, including a network protocol, for [NAT traversal](https://en.wikipedia.org/wiki/NAT_traversal) of [Network address translation \(NAT\)](https://en.wikipedia.org/wiki/Network_address_translation) gateways in applications of real-time voice, video, messaging, and other interactive communications.

STUN is a tool used by other protocols, such as [Interactive Connectivity Establishment \(ICE\)](https://en.wikipedia.org/wiki/Interactive_Connectivity_Establishment), the [Session Initiation Protocol \(SIP\)](https://en.wikipedia.org/wiki/Session_Initiation_Protocol), and [WebRTC](https://en.wikipedia.org/wiki/WebRTC). It provides a tool for hosts to discover the presence of a network address translator and to discover the mapped, usually public, [Internet Protocol \(IP\)](https://en.wikipedia.org/wiki/Internet_Protocol) address and port number that the NAT has allocated for the application's [User Datagram Protocol \(UDP\)](https://en.wikipedia.org/wiki/User_Datagram_Protocol) flows to remote hosts. The protocol requires assistance from a third-party network server STUN server located on the opposing public side of the NAT, usually the public [Internet](https://en.wikipedia.org/wiki/Internet).

For more information, see [Session Traversal Utilities for NAT \(STUN\)](https://en.wikipedia.org/wiki/STUN).

## Why is STUN needed? {#section_p4l_jrw_v5b .section}

Simply put, we use STUN as a tool to help clients determine their public IP address so that they can connect to each other and the Sametime server to send and receive audio and video data.

If your deployment of Sametime is all internal and there are no NAT or firewalls between the users and the server, then you might not need to use STUN.

If your deployment includes users external to your network, like people working from home, then you likely need a STUN server to help negotiate the audio and video sessions.

## Default configuration {#section_a5x_drw_v5b .section}

By default, the Sametime server is configured to use the Google Public STUN servers.

For Docker, this information is configured in the .env file like this:

``` {#codeblock_ohd_hrw_v5b}
# STUN servers used to discover the server's public IP.
JVB_STUN_SERVERS=stun.l.google.com:19302,stun1.l.google.com:19302,stun2.l.google.com:19302
```

For Kubernetes, this information is configured in the helm/values.yaml file:

``` {#codeblock_phd_hrw_v5b}
jvbStunServers: stun.l.google.com:19302,stun1.l.google.com:19302,stun2.l.google.com:19302
```

In both cases, this configuration is telling the server to use these STUN servers:

``` {#codeblock_qhd_hrw_v5b}
stun.l.google.com
stun1.l.google.com
stun2.l.google.com

Using UDP port 19302.
```

It is important to note that if the server or clients is unable to reach the configured STUN servers, n-way meetings does not work properly. When planning your deployment, make sure that the STUN servers are available over the network.

## Optional configurations {#section_ydm_drw_v5b .section}

If you already have a STUN server in your environment or wish to use an alternative public STUN server, simply update the appropriate settings above before you deploy the server. It can be modified post-deployment as well. For more information on this, see [Configuring alternate STUN servers](configuring_stun.md).

If your deployment does not require the use of STUN, then you can disable this by simply commenting out the appropriate line in either the .env or values.yaml file and installing the server.

**Parent Topic:  **[Network planning for meetings](network_planning.md)

