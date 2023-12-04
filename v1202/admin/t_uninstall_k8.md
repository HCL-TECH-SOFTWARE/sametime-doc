# Uninstalling Sametime on Kubernetes {#t_uninstall_k8 .task}

To uninstall Sametime on Kubernetes, follow these steps.

1.  Run the following commands.

    ``` {#codeblock_izx_hbt_lwb}
    # helm uninstall deployment name
    # kubectl delete job deployment name
    # kubectl delete clusterrolebinding deployment name
    # kubectl delete clusterrole deployment name
    # kubectl delete serviceaccount deployment name
    ```

2.  The container images must be removed from the container registry manually. Each Kubernetes environment has different instructions. Consult your Kubernetes documentation for the complete steps.

3.  Find the installation directory and remove the extracted files from that folder.


If you plan to re-install Sametime, refer to [Installing Sametime in a Kubernetes environment](installation_sametime_kubernetes.md). To migrate or upgrade to a higher version, refer to [Migrating and Upgrading](migrating.md).

**Parent Topic: **[Uninstalling Sametime](t_uninstall.md)

