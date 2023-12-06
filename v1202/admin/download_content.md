# Downloading content to the server {#download_content .task}

When downloading content to the Sametime sever, it must be downloaded to the web/download directory.

-   If in a Docker or Podman environment, copy files into the sametime-config/web/downloads directory. For example, the following command is copying the SametimeClient.exe file onto the Sametime server.

    ``` {#codeblock_zrs_yhf_qyb}
    cp SametimeClient.exe sametime-config/web/downloads/
    ```

-   For Kubernetes environment, copy the files to the persistent volume. For example, the following command is copying the SametimeClient.exe file onto the Sametime server.

    ``` {#codeblock_erx_d3f_qyb}
    
    {{POD=$(kubectl get po --selector=app.kubernetes.io/name=web | tail -1 | awk ' { print $1 } ') 
    kubectl cp SametimeClient.exe $POD:/usr/share/nginx/downloads/.}} 
    ```

    After copying the files, restart the pod.


**Parent Topic:  **[Configuring](configuring.md)

