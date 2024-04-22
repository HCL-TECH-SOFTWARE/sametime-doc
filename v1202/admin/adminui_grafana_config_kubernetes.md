# Configuring Kubernetes to run Grafana {#adminui_grafana_config_kubernetes .task}

Grafana can be configured as a post-installation task or during an upgrade.

To use Granfana, the Prometheus application must be installed.

-   If you installed Prometheus following the instructions in the [Installing Prometheus](installation_prometheus.md) topic, Grafana is installed as part of installing Prometheus.
-   If the Grafana application is not installed in your Kubernetes cluster, see the installation details, in the [Deploying Grafana on Kubernetes](https://grafana.com/docs/grafana/latest/setup-grafana/installation/kubernetes/) topic in the Grafana documentation.

To verify that the service was created correctly, run the following command to display a list of all services:

``` {#codeblock_xqw_w3g_vzb}
kubectl get svc -n monitoring
```

Ensure that Grafana is listed as a service. Below is an example.![Command output](Images/grafana_verify.png)

By default, Grafana is not available through an ingress controller. 

-   Configure Grafana manually, using the instruction in the [GitHub - prometheus-operator/kub-prometheus](https://github.com/prometheus-operator/kube-prometheus) readme file to make Grafana available outside the Kubernetes cluster.
-   Use port-forwarding to forward the Grafana port to the machine where kubectl is running. If the machine where kubectl is running does not have a browser, then SSH must be used to port forward from the machine where kubectl is running to a machine that has a browser. For SSH, used the LocalForward feature. For more information, see the [Use Port Forwarding to Access Applications in a Cluster](https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster.html) topic in the Kubernetes documentation.

Before you can create your first dashboard, you need to add your data source. Note that you must have Grafana administrator access to add data sources. Complete the following steps to run Grafana and import your dashboard.

1.  Enable port forwarding for the Grafana service.

    ``` {#codeblock_apz_1hd_nvb}
    kubectl port-forward service/grafana 3000:3000 -n monitoring
    ```

2.  When using a remote setup, navigate to the Grafana sign-in page in your browser.

    ``` {#codeblock_s5j_gpz_lvb}
    <Cluster-IP>:3000
    ```

    The default port for Grafana is `3000`. If you are on a local machine use `localhost:3000`.

3.  Enter admin for both the user name and prom-operator, and then select **Sign In**.

    You are prompted to change the password.

4.  Select **OK** and enter the new password.

5.  From the left panel, hover over **+ Create** and select **Import**.

6.  Upload the K8\_Sametime\_Dashboard.json file.

    The K8\_Sametime\_Dashboard.json file is included in the Sametime Premium install product image. After decompressing the product image, the file is in the root directory.

7.  Select **Prometheus \(default\)** as the data source and then select **Import**.

8.  Save the dashboard.


**Parent topic: **[Monitoring your meeting and chat metrics with Grafana](adminui_grafana_overview.md)

