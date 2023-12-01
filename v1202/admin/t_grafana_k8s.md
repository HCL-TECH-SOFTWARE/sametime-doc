# Configuring Kubernetes to run Grafana {#t_grafana_k8s .task}

-   Install Prometheus. For more information, refer to [Installing Prometheus](installation_prometheus.md).
-   Install Grafana in your Kubernetes cluster. For the installation details, refer to [Deploying Grafana on Kubernetes](https://grafana.com/docs/grafana/latest/setup-grafana/installation/kubernetes/). To check if the service was created correctly, run `kubectl get svc -n monitoring`. A list of all the services is displayed. Ensure that the Grafana type is *ClusterIP* and the port is `3000`. Below is an example.

    |Name|Type|Cluster-IP|External-IP|Port|Age|
    |----|----|----------|-----------|----|---|
    |grafana|ClusterIP|10.97.236.243|<none\>|3000/TCP|7m2s|


Before you can create your first dashboard, you need to add your data source.

**Note:** Only users with the organization Admin role can add data sources.

To run Grafana and import your dashboard, follow these steps:

1.  Enable port forwarding for the Grafana service.

    ``` {#codeblock_apz_1hd_nvb}
    kubectl port-forward service/grafana 3000:3000 -n monitoring
    ```

2.  Navigate to the Grafana sign-in page in your browser.

    ``` {#codeblock_s5j_gpz_lvb}
    localhost:3000
    ```

    **Note:** `3000` is the default port for Grafana. Alternatively, you can use `<Cluster-IP>:3000` if you are using a remote setup.

3.  Enter *admin* for both username and password, and then select **Sign In**. If successful, you will be prompted to change the password.

4.  Select **OK** and enter the new password.

5.  From the left panel, hover over **+ Create** and select **Import**.

6.  Upload the K8\_Sametime\_Dashboard.json file. For more information, contact [HCL Customer Support](https://hclpnpsupport.hcltech.com/csm).

7.  Select **Prometheus \(default\)** as data source and then select **Import**.

8.  Save the dashboard.


**Parent topic:**[Monitoring your meeting and chat metrics with Grafana®](Managing_dashboard.md)

