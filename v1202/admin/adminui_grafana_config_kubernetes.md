# Configuring Kubernetes to run Grafana 

To use Granfana, the Prometheus application must be installed. If you installed Prometheus following the instructions in the [installation\_prometheus.md](installation_prometheus.md) topic, Grafana is installed as part of installing Prometheus.

To verify that the service was created correctly, run the following command to display a list of all services:

```
kubectl get svc -n monitoring
```

Ensure that the type for the Grafana service is ClusterIP and the port is 3000. Below is an example.

|Name|Type|Cluster-IP|External-IP|Port|Age|
|----|----|----------|-----------|----|---|
|grafana|ClusterIP|10.97.236.243|<none\>|3000/TCP|7m2s|

1.  2.  Enter admin for both the user name and prom-operator, and then select **Sign In**.

    You are prompted to change the password.

3.  Select **OK** and enter the new password.

4.  From the left panel, hover over **+ Create** and select **Import**.

5.  Upload the K8\_Sametime\_Dashboard.json file.

    The K8\_Sametime\_Dashboard.json file is included in the Sametime Premium install product image. After decompressing the product image, the file is in the root directory.

6.  Select **Prometheus \(default\)** as the data source and then select **Import**.

7.  Save the dashboard.


