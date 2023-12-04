# Installing Prometheus {#installation_prometheus .task}

Prometheus provides monitoring on the system. It is used in the auto-scaling feature, but can also be used to monitor your system usage and performance.

The Prometheus application must be installed to deploy the autoscaler and deploy Grafana on a Sametime Kubernetes environment.

The procedures in this topic install the Kube-Prometheus stack using Helm and the default helm charts. Refer to the [prometheus-operator / kube-prometheus](https://github.com/prometheus-operator/kube-prometheus) readme for the default settings. To customize the configuration, the [prometheus-community/helm-charts](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) can be downloaded and modified before installing them.

1.  Add the prometheus-community helm repository.

    ```
    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
    ```

2.  Create a namespace for monitoring.

    ```
    kubectl create namespace monitoring
    ```

3.  Run the following command to install Prometheus. The command must be entered as a single line.

    ```
    helm install -n monitoring prometheus --set prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues=false prometheus-community/kube-prometheus-stack
    ```


**Parent Topic: **[Installing Sametime in a Kubernetes environment](installation_sametime_kubernetes.md)

**Parent Topic: **[Monitoring your meeting and chat metrics with Grafana](adminui_grafana_overview.md)

