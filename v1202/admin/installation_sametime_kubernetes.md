# Installing Sametime in a Kubernetes environment {#installation_sametime_kubernetes .concept}

A Sametime deployment can be configured on a single-node Kubernetes clusters, like K3s or Docker Desktop, on a cloud-based, or on-prem multi-node cluster with separate control plane or worker nodes.

An Ingress Controller is required for web traffic.

The following white papers are available to review this setup for GKE \(Google\), AWS \(Amazon\) and on-premise configurations. Use these white papers for additional details on the installation and configuration steps for Kubernetes.

-   [HCL Sametime Premium 12.0 FP1 - Full stack Kubernetes Deployment](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0100042)
-   [Deploying HCL Sametime Meetings on AWS Elastic Kubernetes Service \(EKS\)](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0085515)
-   [Deploying Sametime 12 on Google Kubernetes Engine](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0099614)

References to the cluster.yaml file in the white papers are based on Sametime 11.6. For later Sametime versions, the file is located in the Sametime installation package directory: install\_package\_directory/ /kubernetes/stack/eks/cluster.yaml.

If you are installing on an Openshift platform, review the [Preparing to install an Openshift environment](installation_sametime_openshift.md) topic before starting the install process.

See the [HCL Sametime® System Requirements](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0108387) document for support in Kubernetes and Helm versions.

Promethus can be used for tracking metrics and overall health of the system. Managed charts with Prometheus and metrics enabled are provided for convenience, otherwise, Prometheus should be installed manually before starting the Sametime installation process. See [Installing Prometheus](installation_prometheus.md) for details.

After the Kubernetes cluster is built, complete the following tasks to deploy Sametime.

1.  [Prepare the network](t_meetings_prepare_network.md)
2.  [Load the Sametime image to Docker](load_stimages_local.md)
3.  [Create the persistent volume](t_meetings_recordings.md)

**Note:** The helm charts and templates provided were tested with 1.22. Later versions of Kubernetes might not be compatible.

-   **[Preparing to install an Openshift environment](installation_sametime_openshift.md)**  
You must complete the tasks in this topic if you are installing in an Openshift environment before you can install Sametime.
-   **[Preparing the network](t_meetings_prepare_network.md)**  
This section provides information on the network considerations needed to install Kubernetes.
-   **[Using Sametime images from the HCL Harbor registry](use_stimages_harbor.md)**  

-   **[Loading the Sametime images to a Docker repository](load_stimages_local.md)**  
The Sametime images must be in a Docker repository so that they can be accessed when running Sametime. They can be in a local Docker repository or they can be accessed from the HCL Docker repository.
-   **[Installing Sametime in a Kubernetes using managed charts](installation_sametime_kubernetes_managedcharts.md)**  
The Sametime product image includes pre-configured managed Helm charts to deploy HCL Sametime and HCL Sametime Premium. The managed Helm charts allow you to get a Kubernetes-based deployment up and running.
-   **[Preparing the deployment](t_meetings_configure_deployment.md)**  
This section provides information on how to configure secrets for deployment.
-   **[Creating the persistent volume](t_meetings_recordings.md)**  
This section provides information to create the persistent volume.
-   **[Deploying Sametime to Kubernetes cluster](t_installing_deploy_kubernetes.md)**  
Before you can deploy Sametime to a Kubernetes cluster, you must create the cluster.
-   **[Installing Ingress](t_ingress_install.md)**  
When running Kubernetes on-prem, managing load-balancing must be considered for Sametime Meetings and Web Chat. Both of these Sametime features require the addition of an ingress controller.
-   **[Installing Prometheus](installation_prometheus.md)**  
Prometheus provides monitoring on the system. It is used in the auto-scaling feature, but can also be used to monitor your system usage and performance.
-   **[Deploying multiple videobridges in different locations](t_configure_jitsi.md)**  
Deploying multiple Kubernetes clusters each with a separate Sametime deployment allows for distribution of videobridges at different location. This type of deployment improves video streaming by reducing latency and improves bandwidth when users are geographically far from a single videobridge.The Octo Protocol is required when to route video streams between videobridge servers.

**Parent Topic: **[Installing Sametime](installation_sametime.md)

