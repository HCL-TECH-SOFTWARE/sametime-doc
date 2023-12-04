# Installing Sametime in a Kubernetes using managed charts {#installation_sametime_kubernetes_managedcharts .task}

The Sametime product image includes pre-configured managed Helm charts to deploy HCL Sametime and HCL Sametime Premium. The managed Helm charts allow you to get a Kubernetes-based deployment up and running.

The managed charts include everything needed for a running deployment, such as: MongoDB, OpenLDAP, and NGINX Ingress Controller; and are ready to go with a single install operation. There is a variant of each chart that includes Prometheus and Grafana so that metrics can be monitored without any additional configuration. Each managed chart is provided as a TGZ bundle and can be installed using Helm or Helm Dashboard.

Within the managed chart TGZ bundle is a values.yaml file. You can create a custom values.yaml file with configuration settings to override the settings of the supplied file. For example, the managed chart uses `lvh.me` as the host name, so that it can only be accessed through the local host from where it is being installed. You can provide a different value in the custom values.yaml file.

The customized values.yaml file can be created manually or by using the supplied prepareDeployment.sh script. For more information about the script, see [Preparing the deployment](t_meetings_configure_deployment.md). After the file is created, the customized values.yaml file can be archived and version controlled as necessary so that it can be applied to future updates, duplicated deployments with slight variations between each, and backed up for safe keeping so that the deployment can be recovered if necessary.

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

**Parent Topic: **[Installing Sametime in a Kubernetes environment](installation_sametime_kubernetes.md)

## Using command line {#task_iy1_lnf_pzb}

1.  Verify that the container images have been loaded into a registry that is accessible to the Kubernetes cluster. For additoinal information, see [Loading the Sametime images to a Docker repository](load_stimages_local.md).

2.  Once you have loaded the images into your own private registry, when you install using Helm, make sure to override the registry configuration.

    For example:

    ``` {#codeblock_w4r_c4f_pzb}
     helm install sametime chart-name.tgz --set global.hclImageRegistry=my-custom-registry.myco.com
    ```

    Alternatively, create an image pull secret used to pull the container images from the HCL Harbor Registry \(see Loading the Sametime image \(wrong topic name, but that is how you have it now\)\). Then you may do this:

    ``` {#codeblock_e4m_44f_pzb}
     helm install sametime chart-name.tgz
    ```

    Alternatively, the chart can be pulled directly from the HCL Harbor Registry if you have configured Helm with authentication. After following the steps about accessing the container images from Harbor, you can additionally configure that access token with helm:

    ``` {#codeblock_rzl_x4f_pzb}
     helm registry login -u '<yourEmailAddress>' hclcr.io
    ```

    When prompted for a password, use the access token from your account profile in Harbor.

3.  Use the helm installcommand to run the managed chart.

    ``` {#codeblock_jph_cpf_pzb}
    helm install sametime oci://hclcr.io/st/sametime-premium-single-node
    ```

    Any customizations that should be applied to the deployment can be supplied in a custom values.yaml file rather than using --set options . To see the default values, examples, and documentation about settings you might want to customize, use one of the command:

    -   ``` {#codeblock_xmq_xpf_pzb}
helm show values chart-name.tgz
```

    -   ``` {#codeblock_vlc_ypf_pzb}
helm show values oci://hclcr.io/st/sametime-premium-single-node 
```

    You can copy-paste and modify any of the default values and then apply those settings like this:

    ``` {#codeblock_a4x_zpf_pzb}
     helm install sametime sametime-premium-single-node-12.0.2.tgz -f values.yaml
    ```

    where values.yaml is the file you have customized.

    Alternatively, you can run:

    ``` {#codeblock_b1j_2qf_pzb}
     ./prepareDeployment.yaml values.yaml
    ```

    and follow the prompts to produce a new values.yaml file with your customized configuration. You can use that as a starting point to make further edits as needed, for example. See [Preparing the deployment](t_meetings_configure_deployment.md) for more information about how to respond to the prompts in the prepareDeployment tool.

    **Note:** when using the prepareDeployment tool with a managed chart, there are additional prompts about whether the embedded mongo/openldap/coturn/nginx-ingress should be deployed. You can choose these to meet your needs.


## Using user interface tools {#task_l1q_jnf_pzb}

Tools like[helm-dashboard](https://github.com/komodorio/helm-dashboard/releases) provide a user interface to manage deployments in a Kubernetes environment. A browser is used to operate Helm in this case, but you can start the tool and point it to the chart you would like to install as a local-repository:

-   helm-dashboard --local-chart=sametime-premium-single-node-12.0.2.tgz
-   Windows: helm-dashboard.exe /local-chart=sametime-premium-single-node-12.0.2.tgz

Then either a browser will open automatically or you can do it manually and open the URL http://localhost:8080

This will present a management UI where you can observe under the Repository tab that sametime-premium-single-node is an installable chart. Click Install. The Install window displays information about the Helm Chart. You can modify and add values before running the chart. When finished, click Confirm.

I think we should also add some NOTE: about the metrics-enabled charts and helm-dashboard: NOTE: helm-dashboard will fail to install metrics enabled charts \(sametime-premium-single-node-metrics or sametime-premium-multi-node\) at first. This is because the included Prometheus deployment has some custom CRDs that helm-dashboard does not successfully validate when it runs its multi-pass install process. The recommendation is to install either of those charts first via the helm command first. You can then un-install immediately using helm or helm-dashboard and subsequent installs via helm-dashboard will work. The alternative to that is to pre-install these custom CRDs using the command: kubectl apply -f https://github.com/prometheus-operator/prometheus-operator/releases/download/v0.69.1/stripped-down-crds.yaml

1.  Start the tool and point it to the chart you to install as a local-repository.

    -   ``` {#codeblock_ypk_frf_pzb}
elm-dashboard --local-chart=sametime-premium-single-node-12.0.2.tgz 
```

    -   From Windows

        ``` {#codeblock_w4z_grf_pzb}
         helm-dashboard.exe /local-chart=sametime-premium-single-node-12.0.2.tgz 
        ```

2.  Run the Helm Dashboard including the location of the TAR file containing the Helm Chart.

    ``` {#codeblock_dyt_h4f_pzb}
    run helm-dashboard.exe /local-chart tar\_file\_path
    ```

    Select the **Repository** tab and highlight the TAR file to be used and click **Install**.

    The Install window displays information about the Helm Chart. You can modify and add values before running the chart. When finished, click **Confirm**.


