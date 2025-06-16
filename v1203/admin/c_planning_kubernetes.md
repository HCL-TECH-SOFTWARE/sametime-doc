# Planning for Sametime in a Kubernetes environment {#c_planning_kubernetes .concept}

Kubernetes provides container orchestration for managing containers. When using this platform, you must consider how to manage operations, scalability, and security.

Kubernetes is a third-party product. HCL support is available to assist in configuration and support-related issues as they pertain to the Sametime product. If you require assistance with a full Kubernetes deployment, reach out to HCL Services or one of our HCL Business Partners to inquire about professional services.

**Note:** Packages for Kubernetes can be downloaded directly from your vendor.

## Manage operations {#section_sdv_x43_ywb .section}

Kubernetes automates the deployment and management of containerized applications. The number of concurrent users that Sametime can support depends on the size of the deployment. For sizing and deployment-related questions, [contact HCL](https://volt.myhclsandbox.com/volt-apps/anon/org/app/7fc42e3c-19f4-48df-87fc-09d0ac7c3296/launch/index.html?form=F_Form1). If you are unfamiliar with this technology, see [An Overview of Kubernetes](https://www.hcltech.com/blogs/overview-kubernetes).

High-availability clusters
:   High availability is supported for the front-end web traffic to the Kubernetes cluster. You can deploy multiple web front ends on different physical or virtual nodes pointing to the same back end in order to both distribute load and survive a node outage.

    High availability is not supported for active meetings. If a server hosting a meeting goes down, then ongoing meetings on that server are interrupted. There is a reconnection timer built into the client that causes all the clients to reconnect and be distributed to an available node. In some circumstances, a server going down results in the client thinking the meeting has ended. Users can quickly re-join the meeting from their Recent meetings list and meet again on an available server momentarily.

Cloud deployment
:   You can run a Kubernetes cluster on your own hardware or a different cloud provider. You can also use a third-party Kubernetes cloud provider, such as Amazon EKS, Google GKE, or other third-party Kubernetes provider to deploy Sametime. Each cloud provider makes security recommendations for running workloads securely in their environment. Refer to the cloud provider's security documentation for further details.

    -   [Deploying Sametime 12 on Google Kubernetes Engine](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0099614) for Google GKE deployment.
    -   [Deploying Sametime Meetings in Amazon's AWS Elastic Kubernetes Services](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0085515) for Kubernetes Cloud deployment. The examples in this knowledge article are based on the version 11.5 guide and are not the exact steps for version 12. For version 12, the cluster.yaml file is found in the location of the Sametime 12 installation directory under /kubernetes/stack/eks/cluster.yaml. For additional information, see [Deploying Sametime 12 on Google Kubernetes Engine \(GKE\)](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0099614).

## Scalability {#section_yh5_w43_ywb .section}

Kubernetes automatically scales a cluster up and down in line with demand without increasing your operations team. To achieve optimal performance, you can provision the infrastructure for Kubernetes before you can install, configure, and connect a component to create a cluster.

Meeting size
:   By default, there is a limit of 100 participants for every meeting. To reach a wider audience, you can start a live stream and share the link with all intended participants. The limit is configurable. For more information, refer to [Configuring the maximum number of meeting participants](meetings_configuring_max.md).

## Security {#section_hrd_ww2_jwb .section}

With Kubernetes, you must integrate security throughout the layers of the solution stack before deploying and running the container. Because cloud-native security is multilayer, it is an effective way to address threats across every level of workflow.

For additional information, see [Overview of Cloud Native Security](https://kubernetes.io/docs/concepts/security/overview/) in the Kubernetes documentation.

## Disaster recovery {#section_rvv_hw1_ftb .section}

The backup and restore process is handled outside of Sametime. Consult with your Kubernetes vendor for details.

## Beyond container orchestration {#section_n2b_1p3_ywb .section}

Aside from container orchestration, you can also use Kubernetes to abstract the infrastructure away from higher-level services and applications, making these applications more portable and flexible. Furthermore, Kubernetes allows you to build a much-needed and future-ready architecture.

-   **[Planning for a Kubernetes cluster configuration](c_planning_kubernetes_cluster.md)**  

-   **[Planning for Openshift](c_planning_openshift.md)**  
OpenShift is a cloud-based Kubernetes platform. Planning considerations and procedures used to deploy Sametime in an Openshift environment are the same as the Kubernetes platform with the additional considerations addressed in this topic.

**Parent Topic:  **[Platforms](c_planning_platforms.md)

