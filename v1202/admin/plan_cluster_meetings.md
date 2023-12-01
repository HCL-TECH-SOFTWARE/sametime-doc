# Configure high capacity for meetings {#plan_cluster_meetings .concept}

High availability is supported for the front-end web traffic to the Kubernetes cluster. You can deploy multiple front-ends on different physical and virtual nodes pointing to the same back-end in order to distribute load and survive a node outage.

High availability is not supported for active meetings, but fail over is supported. If a server hosting a meeting goes down, users in who are in meetings on that server are briefly interrupted. The client reconnection timer reconnects the clients and distributes them to an available node. In some circumstances, a server that stops responding causes a client to disconnect from a meeting. Users can reconnect to the meeting from their recent meetings list and rejoin the meeting on an available server.

Sametime can be expanded to more than one geography or another network by deploying multiple video bridges. This is different from deploying multiple video nodes, which are all co-located. When you deploy multiple video bridges the user receives audio and video from the video bridge that is located the closest to them. For more details, see [Configuring autoscaling for video](plan_cluster_meetings_video.md).

For sizing and deployment related questions, contact an HCL support personal by completing the [Talk to a Technical Expert](https://volt.myhclsandbox.com/volt-apps/anon/org/app/7fc42e3c-19f4-48df-87fc-09d0ac7c3296/launch/index.html?form=F_Form1) form.

## Docker {#section_mhc_fqk_bvb .section}

Meetings are sized based on what is happening in the environment at any given time. For Docker deployments, there are many variables including the CPU and memory size of the Docker instance. A large Docker instance can support up to 200 concurrent peak users, but that does not take into consideration how many of the meetings are being recorded. Meeting recordings are CPU intensive. A Docker instance is best suited for a small department or focused team than an enterprise size deployment.

## Kubernetes {#section_wxt_hqk_bvb .section}

If you are deploying Sametime meetings to your entire organization, Kubernetes is a better choice than Docker. The Kubernetes autoscaling feature provides for the flexibility needed in an enterprise deployment. Autoscaling is a feature in which a cluster adjusts the number of nodes based upon current usage and monitoring.

In Kubernetes environments, a Horizontal Pod Autoscaler is leveraged to automatically scale the environment upon demand. There are two configurations, one for video and one for recorder. When you create your node pools for video and recorder it is important to estimate how many nodes are needed.

-   Video nodes are dedicated to a single video pod
-   Recorder nodes are dedicated to the recorder pod

You can either have a node dedicated to one recorder or you can size your recorder node pool instances to support more than one recorder per node.

-   **[Configuring autoscaling for recorder](plan_cluster_meetings_recorder.md)**  
A recorder is used when a meeting is being recorded and when live streaming a video. The Kubernetes autoscaler adjusts the use of recorder pods based on settings in the recorder.yaml file.
-   **[Configuring autoscaling for video](plan_cluster_meetings_video.md)**  
The Kubernetes autoscaler adjusts the use of video pods based on the configured values in the video.yaml file.

**Parent topic:**[Clustering and high availability](cluster_highavailability.md)

