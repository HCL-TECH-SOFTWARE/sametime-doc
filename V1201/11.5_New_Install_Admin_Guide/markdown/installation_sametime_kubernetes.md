# Installing Sametime in a Kubernetes environment {#installation_sametime_kubernetes .concept}

A Sametime deployment on Kubernetes requires a properly configured cluster consisting of a minimum of four nodes: a control plane and three worker nodes with an Ingress Controller.

The following white papers are available to review this setup for GKE \(Google\), AWS \(Amazon\) and on-premise configurations. Use these white papers for additional details on the installation and configuration steps for Kubernetes.

-   [HCL Sametime 11.6 - Full stack Kubernetes Implementation](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0092467)
-   [Deploying HCL Sametime Meetings on AWS Elastic Kubernetes Service \(EKS\)](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0085515)
-   [Deploying Sametime 12 on Google Kubernetes Engine](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0099614)

References to the cluster.yaml file in the white papers are based on Sametime 11.6. For later Sametime versions, the file is located in the Sametime installation package directory: install\_package\_directory/ /kubernetes/stack/eks/cluster.yaml.

See the [HCL Sametime® System Requirements](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0100619) document for support Kubernetes and Helm versions.

After the Kubernetes cluster is built, complete the following tasks to deploy Sametime.

1.  [Prepare the network](t_meetings_prepare_network.md)
2.  [Load the Sametime image to Docker](t_meetings_sametime_image_docker.md)
3.  [Creating the persistent volume](t_meetings_recordings.md)
4.  [Verify the service](t_meetings_verify.md)

**Note:** The helm charts and templates provided were tested with 1.22. Later versions of Kubernetes might not be compatible.

-   **[Preparing the network](t_meetings_prepare_network.md)**  
This section provides information on the network considerations needed to install Kubernetes.
-   **[Loading the Sametime image to Docker](t_meetings_sametime_image_docker.md)**  
This section provides information on the network considerations needed to install Kubernetes.
-   **[Preparing the deployment](t_meetings_configure_deployment.md)**  
This section provides information to configure secrets for deployment.
-   **[Enabling multiple videobridges](t_configure_jitsi.md)**  
This section covers the steps on how to enable multiple videobridges. Below are a list of several secrets defined in the sametime-global-secrets resource. There are others not mentioned here as well. Refer to [Managing secrets in Kubernetes](managing_secrets_kubernetes.md) for the basic guidelines regarding post-installation configuration.
-   **[Creating the persistent volume](t_meetings_recordings.md)**  
This section provides information to create the persistent volume.
-   **[Deploying Sametime to Kubernetes cluster](t_installing_deploy_st_kubernetes.md)**  
This section provides information to deploy Sametime to the Kubernetes cluster.
-   **[Installing Ingress](t_ingress_install.md)**  
When running Kubernetes on-prem, managing load-balancing must be considered for Sametime Meetings and Web Chat. Both of these Sametime features require the addition of an ingress controller.
-   **[Verifying the service](t_meetings_verify.md)**  
This section provides information to verify if you are able to join a meeting, see and hear the other participants.
-   **[Installing Prometheus](installation_prometheus.md)**  
Promethus provides monitoring on the system. It is used in the auto-scaling feature, but can also be used a monitor your system usage and performance.

**Parent topic:**[Installing Sametime](installation_sametime.md)

