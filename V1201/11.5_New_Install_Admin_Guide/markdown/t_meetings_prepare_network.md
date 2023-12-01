# Preparing the network {#t_meetings_prepare_network .task}

This section provides information on the network considerations needed to install Kubernetes.

**Network considerations**

Sametime Meetings uses UDP on port 30000 by default for media streams. Ensure that the clients you will service have UDP inbound access to this port and that outbound UDP traffic from the deployment is unrestricted.

The Sametime Meeting server must be able to connect to MongoDB with a user account which has the authority to create databases. The database will be created during the installation.

The Sametime Meeting server must be able to reach the Sametime server on the port used to service users \(typically port 443\). The meeting server requires the Sametime server to use a third-party certificate.

**STUN Service**

Sametime Meetings use internet accessible STUN servers to help clients and the server negotiate media paths for the exchange of audio/video/appshare data. Public Google STUN servers are configured by default.

These addresses must be reachable by the container. If they are not, there may be issues joining meetings.

```
stun.l.google.com:19302
stun1.l.google.com:19302
stun2.l.google.com:19302
```

To change the defult STUN server see, [Configuring alternate STUN servers](configuring_stun.md). For further information on STUN, see the topic [Session Traversal Utilities for NAT \(STUN\)](session_traversal_utilities.md).

**Ingress Controller**

Docker and Kubernetes uses internal private network addresses for the deployed services. Applications may also expose network ports directly on the node as well. Sametime Meetings defines a LoadBalancer service for the HTTP/HTTPS traffic and a NodePort service for the media traffic. To expose these services to the outside world, an ingress controller is required for the HTTP/HTTPS traffic and the IP address of the node must be accessible for the media traffic.

**DNS Considerations**

Your Kubernetes cluster must be able to resolve the supporting servers: MongoDB, Sametime Proxy and STUN. If DNS is unreliable or not able to resolve these hostnames to their IP addresses, complete the topic [Configuring Host Aliases for Kubernetes deployments](t_meetings_kubernetes.md)."

See [Loading the Sametime image to Docker](t_meetings_sametime_image_docker.md).

-   **[Configuring host aliases for Kubernetes deployments](t_meetings_kubernetes.md)**  
If your Kubernetes environment is unable to consistently resolve the host names of the supporting servers \(MongoDB, Sametime Proxy, STUN\) using DNS, configure the hosts manually.

**Parent topic:**[Installing Sametime in a Kubernetes environment](installation_sametime_kubernetes.md)

