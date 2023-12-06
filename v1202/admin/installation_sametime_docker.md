# Installing Sametime in a Docker or Podman environment {#installation_sametime_docker .concept}

The process to install Sametime on Docker and Podman are identical. The installation process detects if you are installing Sametime on Docker or Podman and prompts for the appropriate information.

Before you can install Sametime, you must have a working Docker or Podman environment. Refer to the documentation for installing and configuring Docker or Podman which contain the latest information.

The Docker and Podman commands are similar. The only difference is that docker precedes the command when issued in a Docker environment and podman precedes the name in a Podman environment. Example commands used in the Sametime documentation are shown using Docker. For Podman, change docker to podman.

-   **[Installing Docker](installing_docker.md)**  
This section provides information on how to install Docker.
-   **[Installing Sametime on Docker or Podman](installing_on_docker.md)**  
Installing Sametime involves starting the install procedure and specifying configuration information for the server, such as the credentials, the ports, MongoDB, and LDAP that the server uses.
-   **[Defining extra hosts for Docker deployments](t_installing_docker_extrahosts.md)**  
Extra hosts for Docker deployments can be defined when there are network or DNS issues. Defining extra hosts is optional and not a requirement to ensure the connections are successful.
-   **[Configuring container networking with Podman](t_installing_podman_extrahosts.md)**  
The network layer does not have DNS resolve available between containers. This topic provides information on the network configurations needed to resolve network or DNS issues in Podman environments.

**Parent Topic:  **[Installing Sametime](installation_sametime.md)

