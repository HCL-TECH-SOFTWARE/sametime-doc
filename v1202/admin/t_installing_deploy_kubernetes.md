# Deploying Sametime to Kubernetes cluster {#t_installing_deploy_kubernetes .task}

Before you can deploy Sametime to a Kubernetes cluster, you must create the cluster.

Two types of server nodes are required:

-   role:main
-   role:video

Review the [Planning for a Kubernetes cluster configuration](c_planning_kubernetes_cluster.md) topic for details and other considerations.

1.  Change to the helm directory.

2.  Deploy the helm chart.

    ```
    helm install sametime .
    ```


If there are any errors, you must remove the installed product and fix the error before trying the installation again. See [Uninstalling Sametime on Kubernetes](t_uninstall_k8.md) for details.

**Parent Topic: **[Installing Sametime in a Kubernetes environment](installation_sametime_kubernetes.md)

