# Configuring alternate STUN servers {#configuring_stun .task}

Sametime Meetings uses public Google STUN servers by default. To use different STUN servers, you must complete this procedure before installing Sametime Meetings.

For more information about STUN, see [Session Traversal Utilities for NAT \(STUN\)](session_traversal_utilities.md)

**Kubernetes**

To configure alternate STUN servers if you use Kubernetes, edit the following file:

```
heml/values.yaml 
            
```

Change the following line to refer to your preferred servers, following the same pattern.

```
jvbStunServers: stun.l.google.com:19302,stun1.l.google.com:19302,stun2.l.google.com:19302
            
```

**Docker**

To configure alternate STUN servers if you use Docker, edit the following file:

```
.env
```

Change the following line to refer to your preferred servers, following the same pattern.

```
# STUN servers used to discover the server's public IP.
JVB_STUN_SERVERS=stun.l.google.com:19302,stun1.l.google.com:19302,stun2.l.google.com:19302
```

**Parent topic:**[Configuring](configuring.md)

