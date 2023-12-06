# Planning for a Kubernetes cluster configuration {#c_planning_kubernetes_cluster .concept}

When installing Sametime in a Kubernetes cluster, there are several considerations, some are a prerequisite to installing Sametime. Sametime can also be installed into the same Kubernetes cluster as other products, for example, MongoDB as long as the system requirements are met.

**Note:** The Sametime documentation does not provide full step-by-step instructions on creating a Kubernetes cluster because each Kubernetes provider has different steps. Consult your Kubernetes provider documentation for details on creating a cluster.

Two types of server nodes with different requirements are required:

-   role:main
-   role:video

The nodes are labeled with Kubernetes labels which allows the Kubernetes pod scheduler to assign the Kubernetes pods to the proper node type.

The video node runs the video pods only. This allows the video pod full access to the machine. A video node is reached from clients by NodePort, directly to its Public IP address. There is no load balancer or service requirement for inbound media traffic, as the media traffic is addressed to the specific video bridge where the meeting is active. The machine type must be suitable for media, with a minimum of 4 CPU and 16GB of RAM. When creating the node, pool autoscaling must be enabled. The Sametime autoscaler uses CPU utilization to determine when to bring up more nodes. For guidance on how many nodes to include in the video node pool, [contact HCL](https://volt.myhclsandbox.com/volt-apps/anon/org/app/7fc42e3c-19f4-48df-87fc-09d0ac7c3296/launch/index.html?form=F_Form1)

## Availability zones for resiliency {#section_mrc_fc5_swb .section}

If you are installing Sametime into a cloud hosted Kubernetes environment, such as Google Kubernetes Engine, or Amazon Elastic Kubernetes Service, consider creating nodes in more than one availability zone. This provides some additional resiliency if the cloud provider has an outage in a particular data center, having nodes in a different zone allow a fail over event to take place.

## Namespaces {#section_dw3_1b5_swb .section}

Many existing production environments use namespaces. A namespace can be used for Sametime, but it is not required. When you enable autoscaling, you are creating a namespace for monitoring and custom-metrics. If a namespace is created for Sametime, be sure to add the namespace argument to the helm and kubectl commands. For example, if you deploy Sametime in a namespace called sametime and you want to view a list of pod, issue the following command:

``` {#codeblock_f14_rgh_vwb}
kubectl -n sametime get pods
```

To see a list of namespaces that are configured, issue the following command:

``` {#codeblock_arh_53h_vwb}
kubectl get namespaces
```

For additional information, see [Namespace](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces) topic in the Kubernetes documentation.

## Network {#section_adc_db5_swb .section}

If you are new to Kubernetes, there are some concepts that are helpful to understand how to configure your firewall. There are small differences between cloud providers and on-prem providers where the names of the features may vary. The following information is generic to introduce the concept. It is important to understand the IP addresses used in a deployment have different ranges, and when configuring a firewall rule, the source IP and destination IP need to be considered.

Node
:   A node is the virtual machine or hardware running the Kubernetes cluster, it hosts the pods that run the Sametime workloads. A node has an IP address in the node IP range, it will have both an internal IP address and an external IP address. Video nodes are reached by end users from their public IP address directly to the node’s external IP address.

Pod
:   A pod is a Kubernetes based workload, which has one or more containers inside. These are stateless in Sametime which means they have a defined life cycle and they do not persist. Each pod has its own unique cluster-wide IP address which changes as the pods are scaled. Typical container-to-container communications between pods on the same host are normally permitted without any additional configuration. For example, the community pod communicating to the proxy pod.

:   Pods have no awareness of the node host ports or IP addresses. Additionally, you cannot directly reach a pod IP address from outside of the cluster. To expose an application that is running in your pods to be reachable from outside your cluster, Kubernetes services and ingress are used. Ingress is used to expose web services, like Web Chat and Meetings. For on-premise Kubernetes clusters, ingress is also used to expose the Sametime mux to Connect clients and embedded clients which use port 1533.

Service
:   A Kubernetes service is used by Sametime to expose various components running in pods outside the cluster. It provides a single endpoint to multiple back-ends. Kubernetes services have their own IP address range that is separate from the node IP and pod IP ranges. This provides a consistent IP address as a front-end since the IP addresses for pod change frequently. There are different types of services in Kubernetes, Sametime uses the LoadBalancer type service which directs traffic to back-end pods, each cloud provider has its own implementation of this and some cloud providers have more features than others.

:   For cloud hosted Kubernetes clusters, Sametime deploys the mux as a service with the LoadBalancer type for both an internal IP and an external IP. The external IP is used for Sametime Connect and Embedded clients to connect to Sametime. Use the external IP to configure your firewall rules to allow external traffic if you are supporting these clients.

    When you install an ingress controller in the cluster, it is also a LoadBalancer type service which has both a cluster IP and an external IP. To expose users to the web services in Sametime for Meetings and Web Chat, open port 443 to this external IP address. Some cloud providers enable this firewall rule automatically when the ingress controller is deployed into the cluster.

    Other Sametime components have services with cluster IP type service. To ensure that the websockets feature functions properly, ensure the video node IP can reach the Jitsi service cluster IP on ports 5280 and 5222 TCP/IP. This is because video uses a node IP address instead of one from the pod IP range. For details see the [Websockets fail to load after installing Sametime 11.6 or 12.0.x on Kubernetes](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0101583) knowledge article.

    All other Sametime components can communicate from inside the cluster to the service Cluster IP without additional firewall configuration.

:   When the connection from the community pod attempts to connect to an LDAP service outside the cluster, a source IP in the pod IP address range is used.

Network Address Translation \(NAT\)
:   If you cannot permit your firewall to allow the entire pod IP address range, consider deploying a Network Address Translation \(NAT\). A source NAT can replace the source IP address on a packet. Note that each Kubernetes cloud provider has its own implementation and features for NAT. For an overview, see the [Using Source IP](https://kubernetes.io/docs/tutorials/services/source-ip/) topic in the Kubernetes documentation.

:   If you are deploying telephony, the Jitsi pod with Jigasi inside uses a source IP from the pod IP range when connecting to the ilink Teamcall Meeting Gateway \(TMG\) for SIP. You can enable a source NAT for the entire Kubernetes cluster which will cover both LDAP and Telephony traffic.

## Storage {#section_qf1_nb5_swb .section}

When you create a persistent volume there is a certain type of access mode associated with it. If you have more than one node in the main node pool, be sure to use read-write-many \(RWX\) access mode, this allows for more than one node to access the volume at a time. If you only have one main node in the node pool, the standard read-write-once access \(RWO\) is sufficient.

When configuring your persistent volume \(PV\), consider the types of data that are stored there, and what kinds of features users may utilize that place data in storage. Examples are:

Files
:   Users can upload files to chats in any of the clients including meetings. They are stored in the PV and are retained for 90 days \(configurable\).

Backgrounds
:   Users can upload their own virtual backgrounds to be used when they enable their video. These images are stored in the PV.

Recordings
:   Recordings are saved as MP4 files, and vary in size depending on duration.

Reports
:   When meeting reports are enabled, PDFs are saved in the PV containing the report.

## Monitoring and logging {#section_ltb_xb5_swb .section}

The Grafana dashboards shipped with Sametime provides multiple types of statistics. You can also deploy Elasticsearch, Fluentd and Kibana \(EFK stack\) to aggregate the logs and make them indexable. This is helpful to produce your own statistics, if the Grafana dashboard does not have the statistics you need. It can also aid in troubleshooting because the logs can be written to a PV outside of the pods. If the logs are not configured to be written to a PV using the EFK stack, then the logs are part of the pods and are lost when the pods are scaled. If you deploy the EFK stack, it has its own persistent volume separate from the Sametime pods.

While these tools are helpful, they do not provide proactive monitoring to alert the administrator of problems. Other products can be used for monitoring such as: Panopta or New Relic.

## Container registry {#section_brq_rd5_swb .section}

The Sametime container images can be stored and retrieved from a public or private container registry. Using a registry might require authenticated access or keys. The Sametime server authenticates with the container registry using a Kubernetes secret. The secret must be created prior to installing Sametime. During the install process container images are pushed to the container registry by running the load.sh script. The container images are retrieved by the pods when the pod is initialized. For additional information, see the [Using a private registry](https://kubernetes.io/docs/concepts/containers/images/#using-a-private-registry) topic in the Kubernetes documentation.

## MongoDB {#section_qwd_zb5_swb .section}

MongoDB is deployed separately from Sametime and can be deployed as a standalone virtual machine \(VM\), a cluster installed on VMs, or a Kubernetes cluster. MongoDB has options for both running your own Kubernetes cluster or a cloud hosted cluster. These options might require an enterprise license. For more information or questions about licensing, contact a MongoDB representative. Contact information can be found on the [MongoDB, Inc](https://www.mongodb.com/contact) website.

MongoDB can be also be installed into the same Kubernetes cluster as Sametime. Ensure that you allow for additional capacity if installing into the same node pool as the main node pool, or you can dedicate a node pool to MongoDB.

**Parent Topic:  **[Planning for Sametime in a Kubernetes environment](c_planning_kubernetes.md)

