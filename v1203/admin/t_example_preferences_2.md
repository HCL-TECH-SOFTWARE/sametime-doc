# Hosting client files for Sametime on Kubernetes {#t_host_samefilename_k8s .task}

Sametime clients can be configured by administrators using a managed-settings.xml or managed-community-configs.xml file which is hosted by a web server. Additionally, the Sametime client can be pre-configured with settings such as the host name and port. The client package can be hosted on a web server for download.

Ensure that you have access to kubectl command line tool.

**Note:** If Sametime is deployed in a namespace, append the `-n namespace` argument to all kubectl commands.

This procedure copies the file from the machine that runs kubectl to the persistent volume and have the web pod automatically retrieve the file when it starts. Use this procedure for each file that you would host in the default downloads directory.

1.  Place the file that you are making available to users on the machine that runs kubectl. Then change directories to where the files are located.

2.  Run the following command to get the name of the web pod.

    ``` {#codeblock_tmf_gwq_yxb}
    kubectl get pods
    ```

3.  Run the following command to copy the file from the machine that runs kubectl to the web pod.

    ``` {#codeblock_m5g_kwq_yxb}
    kubectl cp filename pod:/usr/share/nginx/downloads/.
    ```

    -   Where filename is the name of the file you are copying
    -   Where pod is the web pod name
    For example, suppose the following for the variables:

    -   The file name is managed-settings.xml
    -   The web pod name is `web-6d4cc59bc9-v8gf4`
    Then the command should be:

    ``` {#codeblock_ynh_4kf_qyb}
    kubectl cp managed-settings.xml web-6d4cc59bc9-v8gf4:/usr/share/nginx/downloads/.
    ```

    **Note:** If using a namespace, add the `-n namespace` argument after `kubectl` and before `cp`.

4.  Scale the web pod to 0, then up to 1.

    ``` {#codeblock_ht1_sxq_yxb}
    kubectl scale deploy/web --replicas=0 
    
    kubectl scale deploy/web --replicas=1 
    ```

5.  Confirm the URL is working for download. Open a browser and enter the HTTPS formatted URL:

    ``` {#codeblock_jpv_ryq_yxb}
    https://sametime.example.com/downloads/managed-settings.xml
    ```

    -   Where `sametime.example.com` is the host name of the Sametime server
    -   Where managed-settings.xml is the name of the file being hosted

-   **[Hosting files containing the same file name](t_host_samefilename_k8s.md)**  
This topic covers the additional steps necessary for environments that require hosting multiple managed-settings.xml or managed-community-configs.xml files.

**Parent Topic:  **[Defining preferences in the managed-settings.xml file](config_client_xml_file.md)

