# Deploying Sametime to Kubernetes cluster {#t_installing_deploy_st_kubernetes .task}

This section provides information to deploy Sametime to the Kubernetes cluster.

1.  Deploy the helm chart.

    ```
    helm install sametime .
    ```

    **Note:**

    -   The command assumes you are in the helm directory. The `.` represents current directory.
    -   Instead of `sametime` you can choose any descriptive name for the deployment. You can also deploy the application in a namespace through the `-n or --namespace` option. First create the namespace via `kubectl create namespace`.
    If there are any errors, you must remove the installed product and fix the error before trying the installation again. To uninstall the product, run the following commands:

    ``` {#codeblock_or3_2j4_4tb}
    # helm uninstall sametime
    ```

    ``` {#codeblock_gxk_fj4_4tb}
    # kubectl delete job sametime
    ```

    ``` {#codeblock_shp_fj4_4tb}
    # kubectl delete clusterrolebinding sametime
    ```

    ``` {#codeblock_rjr_fj4_4tb}
    # kubectl delete clusterrole sametime
    ```

    ``` {#codeblock_dct_fj4_4tb}
    # kubectl delete serviceaccount sametime
    ```


Sametime Meetings uses websockets for audio and video streams. If your network does not allow for, you might encounter issues when joining Meetings. For more information on how to diagnose if websockets are blocked, see [Sametime Meeting fails to load if WebSockets are blocked](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0091088).

See [Verify the service](t_meetings_verify.md).

**Parent topic:**[Installing Sametime in a Kubernetes environment](installation_sametime_kubernetes.md)

