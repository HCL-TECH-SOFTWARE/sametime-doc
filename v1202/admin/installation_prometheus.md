# Installing Prometheus {#installation_prometheus .task}

Promethus provides monitoring on the system. It is used in the auto-scaling feature, but can also be used a monitor your system usage and performance.

To deploy the autoscaler, Promethus must be enabled.

1.  From the cloud shell, run the following commands in the directory where you extracted the HCL Sametime install zip file.

2.  Add the prometheus-community helm repository.

    ``` {#codeblock_igb_vhk_mvb}
     helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
    ```

3.  Create a namespace for monitoring.

    ``` {#codeblock_apw_vhk_mvb}
    kubectl create namespace monitoring 
    ```

4.  Install Prometheus using the following command. The command must be entered as a single line.

    ``` {#codeblock_mc4_whk_mvb}
     helm install -n monitoring prometheus --set prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues=false prometheus-community/kube-prometheus-stack
    ```


**Parent topic:**[Installing Sametime in a Kubernetes environment](installation_sametime_kubernetes.md)

