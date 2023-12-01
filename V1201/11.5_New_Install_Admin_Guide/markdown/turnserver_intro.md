# Setting up a TURN server {#turnserver_intro .concept}

A TURN server can be configured to provide for efficient traffic flow within your Sametime meeting.

You'll need to install a TURN server and configure it for use with the Sametime Meeting server. There are several options for a TURN server. One option is the [Coturn](https://github.com/coturn/coturn), which is an open source TURN server. The following two methods can be used to install the Coturn TURN server:

-   [Install on Ubuntu operating system](turnserver_ubuntu.md)
-   [Install on CentOS](turnserver_centos.md)

After the TURN is installed, follow the configuration method appropriate for your environment:

-   [Configuring the TURN Server for Docker](turnserver_meetings_docker.md)
-   [Configuring the TURN server for Kubernetes](turnserver_meetings_kubernetes.md)

-   **[Installing a TURN Server on Ubuntu](turnserver_ubuntu.md)**  
You can install and configure a TURN server to use with Sametime Meeting on an Ubuntu operating system.
-   **[Installing a TURN Server](turnserver_centos.md)**  
You can install and configure a TURN server to use with Sametime Meetings.
-   **[Configuring the TURN Server for Docker](turnserver_meetings_docker.md)**  
You can configure the Sametime Meeting service to enable a TURN server on port 443 for Docker.
-   **[Configuring the TURN server for Kubernetes](turnserver_meetings_kubernetes.md)**  


**Parent topic:**[Meetings](meetings_configuring.md)

