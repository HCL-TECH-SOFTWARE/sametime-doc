# Installing Sametime in a Kubernetes using managed charts 

The Sametime product image includes pre-configured managed Helm charts to deploy HCL Sametime and HCL Sametime Premium. The managed Helm charts allow you to get a Kubernetes-based deployment up and running.

The managed charts include everything needed for a running deployment, such as: MongoDB, OpenLDAP, and NGINX Ingress Controller; and are ready to go with a single install operation. There is a variant of each chart that includes Prometheus and Grafana so that metrics can be monitored without any additional configuration. Each managed chart is provided as a TGZ bundle and can be installed using Helm or Helm Dashboard.

Within the managed chart TGZ bundle is a values.yaml file. You can create a custom values.yaml file with configuration settings to override the settings of the supplied file. For example, the managed chart uses `lvh.me` as the host name, so that it can only be accessed through the local host from where it is being installed. You can provide a different value in the custom values.yaml file.

The customized values.yaml file can be created manually or by using the supplied prepareDeployment.sh script. For more information about the script, see [Preparing the deployment](t_meetings_configure_deployment.md).  After the file is created, the customized values.yaml file can be archived and version controlled as necessary so that it can be applied to future updates, duplicated deployments with slight variations between each, and backed up for safe keeping so that the deployment can be recovered if necessary.

The managed charts are hosted on the [HCL Harbor Registry](https://hclcr.io/) so that deploying the charts can be cloud-native, without having to separate manage docker images on a per-node basis within an on-premise private registry.

|Managed-file name|Description|
|-----------------|-----------|
|sametime-single-node|Install Sametime as a single node.|
|sametime-single-node-metrics|Install Sametime as a single node and includes Promethus and Grafana.|
|sametime-multi-node|Install Sametime as a multi-node environment. It includes Promethus and Grafana.|

|Managed-file name|Description|
|-----------------|-----------|
|sametime-premium-single-node|Install Sametime Premium as a single node.|
|sametime-premium-single-node-metrics|Installs Sametime Premium as a single node and includes Promethus and Grafana.|
|sametime-premium-multi-node|Install Sametime Premium as a multi-node environment. It includes Promethus and Grafana.|

**Note:** A single-node installation cannot be installed in a multi-node cluster. It is designed without aspects that are typical for large deployments where there is concern about balancing resources across available nodes for performance and fault tolerance. You are can install the single-node deployment in a multi-node cluster as a "minimal footprint" deployment. If doing so, follow the steps in the [Creating the persistent volume](t_meetings_recordings.md) topic as you would if you were installing the multi-node deployment.

## Using command line {#task_iy1_lnf_pzb}

1.  Verify that the container images have been loaded into a registry that is accessible to the Kubernetes cluster. For additoinal information, see [Loading the Sametime images to a Docker repository](load_stimages_local.md).

2.  When you install using Helm, make sure to override the registry configuration.

    -   Load images into a private registry.

        ``` {#codeblock_pkl_jfd_rzb}
        helm install sametime chart-name.tgz --set global.hclImageRegistry=my-custom-registry.myco.com
        ```

    -   Create an image pull secret used to pull the container images from the HCL Harbor Registry. See [Using Sametime images from the HCL Harbor registry](use_stimages_harbor.md) for more information before running the helm install command.

        ``` {#codeblock_ybr_kfd_rzb}
        helm install sametime chart-name.tgz
        ```

    -   If you have configured Helm with authenication, you can pull the charts directly from the HCL Harbor Registry. After following the steps about accessing the container images from Harbor, you can configure that access token with Helm:

        ``` {#codeblock_e12_nfd_rzb}
        helm registry login -u your\_email\_address hclcr.io
        ```

        When prompted for a password, use the access token from your account profile in Harbor.

3.  Use the helm install command to run the managed chart.

    ``` helm install install\_name oci://hclcr.io/st/sametime-premium-single-node ```

    Any customizations that should be applied to the deployment can be supplied in a custom values.yaml file rather than using --set options. To see the default values, examples, and documentation about settings you might want to customize, use one of the command:

    -   ``` helm show values chart-name.tgz ```

    -   ``` helm show values oci://hclcr.io/st/sametime-premium-single-node ```

    You can copy-paste and modify any of the default values and then apply those settings like this:

    ``` helm install sametime sametime-premium-single-node-12.0.2.tgz -f values.yaml ```

    where values.yaml is the file you have customized.

    Alternatively, you can run:

    ``` ./prepareDeployment.yaml values.yaml ```

    and follow the prompts to produce a new values.yaml file with your customized configuration. You can use that as a starting point to make further edits as needed, for example. See [Preparing the deployment](t_meetings_configure_deployment.md) for more information about how to respond to the prompts in the prepareDeployment tool.

    **Note:** when using the prepareDeployment tool with a managed chart, there are additional prompts about whether the embedded `mongo/openldap/coturn/nginx-ingress` should be deployed. You can choose these to meet your needs.


## Using Helm dashboard {#task_l1q_jnf_pzb}

Tools like [helm-dashboard](https://github.com/komodorio/helm-dashboard/releases) provide a user interface to manage deployments in a Kubernetes environment.

1.  Start the Helm dashboard and point it to the chart to install as a local-repository.

    -   ``` helm-dashboard --local-chart=sametime-premium-single-node-12.0.2.tgz ```

    -   Windows:

        ``` helm-dashboard.exe /local-chart=sametime-premium-single-node-12.0.2.tgz ```

2.  Select the **Repository** tab and highlight the TAR file to be used and click **Install**.

    The Install window displays information about the Helm Chart. You can modify and add values before running the chart. When finished, click **Confirm**.


