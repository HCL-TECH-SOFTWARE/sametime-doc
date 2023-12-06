# Hosting files containing the same file name {#t_host_samefilename_k8s .task}

This topic covers the additional steps necessary for environments that require hosting multiple managed-settings.xml or managed-community-configs.xml files.

Ensure that you have access to kubectl.

**Note:** If Sametime is deployed in a namespace, append the `-n namespace` argument to all kubectl commands.

When configuring managed settings or managed community configs for different groups of users, you might require the users to have different settings. Sametime requires the file name to be the same. To support multiple files with the same name, you must put them in separate directories. This is the procedure for creating the directories in the web pod to host the files. There is no limit to the number of directories that can be created.

In the following example, there are two managed-settings.xml files for a group named *east* and a group named *west*.

1.  Run the following command to obtain the name of the web pod.

    ``` {#codeblock_tmf_gwq_yxb}
    kubectl get pods
    ```

2.  Run the following command to remote into the web pod, where `webpod_name` is the name of the pod from the first command.

    ``` {#codeblock_m5g_kwq_yxb}
    kubectl exec -it webpod_name -- bash
    ```

3.  When inside the web pod, change directories to /usr/share/nginx/downloads.

    ``` {#codeblock_f4f_j1r_yxb}
    cd /usr/share/nginx/downloads
    ```

4.  Make a directory for each file you are hosting, where `directory_name` is the name of the directory you are creating.

    ``` {#codeblock_pkd_s1r_yxb}
    mkdir directory_name
    ```

    For example, if hosting a managed-settings.xml for a group called *east* and a separate group called *west*, then create the directories *east* and *west*.

    ``` {#codeblock_x4x_51r_yxb}
    mkdir east
    
    mkdir west
    ```

5.  Run the command to exit from the pod.

    ``` {#codeblock_z1m_r4r_yxb}
    exit
    ```

6.  On the machine that runs kubectl, copy the managed-settings.xml file for the first group; for example, east. Then change directories to where the file is located.

7.  Run the following command to copy the file from the machine that runs kubectl to the web pod.

    ``` {#codeblock_f25_snr_yxb}
    kubectl cp <filename> <pod>:/usr/share/nginx/downloads/<directory_name>/.
    ```

    -   Where `<filename>` is the name of the file you are copying
    -   Where `<pod`\> is the web pod name
    -   Where `<directory_name>` is the name of the directory you created
    For example, suppose the following for the variables.

    -   The file name is `managed-settings.xml`
    -   The pod name is `web-6d4cc59bc9-v8gf4`
    -   The directory name is `east`
    Then the command should be:

    ``` {#codeblock_u4y_c4r_yxb}
    kubectl cp managed-settings.xml web-6d4cc59bc9-v8gf4:/usr/share/nginx/downloads/east/.
    ```

    **Note:** If using a namespace, add the `-n argument` after `kubectl` and before `cp`.

8.  Repeat step 7 for the other files that are being configured.

9.  Scale the web pod to 0, then up to 1.

    ``` {#codeblock_ht1_sxq_yxb}
    kubectl scale deploy/web --replicas=0 
    
    kubectl scale deploy/web --replicas=1 
    ```

10. Confirm the URL is working for download. Open a browser and enter the https formatted URL:

    ``` {#codeblock_jpv_ryq_yxb}
    https://sametime.example.com/downloads/east/managed-settings.xml
    ```

    -   Where `sametime.example.com` is the host name of the Sametime server
    -   Where `east` is the name of the custom directory that was created before
    -   Where `managed-settings.xml` is the name of the file being hosted

**Parent Topic:  **[Hosting client files for Sametime on Kubernetes](t_example_preferences_2.md)

