# Installing Sametime {#installation_sametime .concept}

You can install HCL Sametime Premium and HCL Sametime in a single- or multi-node container environment. The following platforms are supported: Docker, Podman, Kubernetes, OpenShift, and Windows.

The processes for installing Sametime Premium and Sametime are almost identical. Sametime Premium includes both the meetings and chat features. Sametime includes only the chat feature. When you install Sametime, steps related to meetings, recordings, audio, and video are not required.

There are several install options that should be considered before starting the install process. Based your choice on what is best for your environment.

## Single-node container management environment {#section_hd1_hj2_zyb .section}

All supported platforms support a single-node environment to manage the Sametime containers. All use a install procedure that is specific to the container management system. Because it is a single-node environment, installing additional software for things such as autoscaling is not needed.

-   [Installing Sametime in a Docker or Podman environment](installation_sametime_docker.md)
-   [Installing Sametime on Windows using Docker Desktop](installation_sametime_windows.md)

## Multi-node container management environment {#section_ygj_4n2_zyb .section}

-   [Installing Sametime in a Kubernetes environment](installation_sametime_kubernetes.md)
-   [Installing Sametime in a Kubernetes using managed charts](installation_sametime_kubernetes_managedcharts.md)

-   **[Information to provide during installation](installation_prompt_descriptions.md)**  
During the install process, you are prompted for information used to tailor the installation for your environment.
-   **[Installing Sametime on Windows using Docker Desktop](installation_sametime_windows.md)**  
Sametime can be installed on a Windows OS as a single-node environment using a supplied Helm chart. The Sametime product image includes a pre-configured managed Helm Chart to deploy Sametime on Windows. The chart is run from a Helm dashboard a graphical user interface.
-   **[Installing Sametime in a Kubernetes environment](installation_sametime_kubernetes.md)**  
A Sametime deployment can be configured on a single-node Kubernetes clusters, like K3s or Docker Desktop, on a cloud-based, or on-prem multi-node cluster with separate control plane or worker nodes.
-   **[Installing Sametime in a Docker or Podman environment](installation_sametime_docker.md)**  
The process to install Sametime on Docker and Podman are identical. The installation process detects if you are installing Sametime on Docker or Podman and prompts for the appropriate information.

**Parent Topic: **[Installing](installing.md)

