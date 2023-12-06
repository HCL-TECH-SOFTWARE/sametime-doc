# Loading the Sametime images to a Docker repository {#load_stimages_local .task}

The Sametime images must be in a Docker repository so that they can be accessed when running Sametime. They can be in a local Docker repository or they can be accessed from the HCL Docker repository.

If you prefer to use a local Docker repository, move the Sametime images from the product download file into the repository.

1.  Download the HCL Sametime installation file from the HCL Software download portal.

    The compressed file contains Sametime images, managed charts, scripts, configuration files and more.

2.  Extract the zip file to any directory on the master Kubernetes host itself or on a machine which has management access to the Kubernetes cluster.

3.  Change to that directory and load the docker images into your docker registry using the following command.

    ```
    ./load.sh
    ```

    The load script extracts the docker images to the local host by default. When prompted, specify your Docker registry host FQDN. This can be a cloud provider registry or a private registry accessible to all of the nodes. If you do not have your own registry, run the load script on each node in the Kubernetes cluster and use the script defaults.

    **Note:** If the commands fails accessing the Docker daemon, you can run the following command:

    ``` {#codeblock_mwb_nkl_pzb}
    sudo ./load.sh
    ```

    Using the sudo command temporarily gives you administrator privileges. For security purposes, it is best that you have administrator access than running with elevated privileges.


See [Preparing the deployment](t_meetings_configure_deployment.md).

**Parent Topic:  **[Installing Sametime in a Kubernetes environment](installation_sametime_kubernetes.md)

