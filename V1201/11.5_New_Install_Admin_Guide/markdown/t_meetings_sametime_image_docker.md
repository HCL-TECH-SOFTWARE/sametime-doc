# Loading the Sametime image to Docker {#t_meetings_sametime_image_docker .task}

This section provides information on the network considerations needed to install Kubernetes.

1.  Download HCL Sametime installation package from the HCL Software Portal.

2.  Extract the zip file to any directory on either the master kubernetes host itself or on a machine which has management access to the kubernetes cluster.

3.  Change to that directory and load the docker images into your docker registry using the following command:

    ```
    sudo ./load.sh
    ```

    **Note:** The load script extracts the docker images to the local host by default. When prompted, specify your own Docker registry host FQDN. This can be a cloud provider registry or some other private registry accessible to all of the nodes. If you don't have your own registry, then run the load script on each node in the Kubernetes cluster and use the script defaults.


See [Preparing the deployment](t_meetings_configure_deployment.md).

**Parent topic:**[Installing Sametime in a Kubernetes environment](installation_sametime_kubernetes.md)

