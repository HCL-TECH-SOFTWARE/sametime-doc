# Kubernetes: Containers not starting due to "Host not found" {#t_troubleshooting_kubernetes_host_not_found .task}

Use this information on troubleshooting Sametime 12 Premium on Kubernetes - containers not starting due to "Host not found."

After installing Sametime 12, the server is not responding correctly. You may experience any of the following symptoms:

-   Unable to create or save a meeting room
-   Can't get a list of meeting rooms
-   Recordings fail
-   Unable to login
-   Group chat inside the meeting fails
-   Media streams do not work

To investigate the issue, use the following command to display a list of running pods. In a normal working environment, all processes have a status of **Running**.

``` {#codeblock_xdj_cb1_ptb}
kubectl get po
```

![](Images/troubleshoot_kubernetes.png)

If there are any processes not in Running status, it indicates a problem. Typically, for the previously listed symptoms this indicates an issue with the meeting server connecting to MongoDB or the Sametime proxy. To investigate further, use the kubectl describe command, which provides detailed information about a specified process. Specify the name of the process as listed in the **NAME** column. For example,

-   Issues related to storage such as creating or retrieving meeting rooms, look at the catalog process.

    ``` {#codeblock_ezm_11q_twb}
    kubectl describe catalog\_name
    ```

-   For authentication issues, investigate the auth process.

    ``` {#codeblock_qbf_c1q_twb}
    kubectl logs auth\_name
    ```

-   For recordings, investigate the recordings process.

    ``` {#codeblock_w5f_31q_twb}
    kubectl logs recordings\_name
    ```

-   For other Sametime Proxy related issues, investigate the "web" process.

    ``` {#codeblock_edt_vyf_xwb}
    kubectl logs web\_name
    ```

-   For media issues, investigate the "video" process.

    ``` {#codeblock_dsl_xyf_xwb}
    kubectl logs deploy/video
    ```


For example, to investigate authentication issues if the auth process name is For authentication issues, investigate the auth process name is auth-77fbc6cf67-vrf77, run the following command:

``` {#codeblock_a2j_cb1_ptb}
kubectl logs auth-77fbc6cf67-vrf77
```

If you see errors about "host not found" then the Kubernetes environment is having difficulty resolving the MongoDB server and/or Proxy server.

If the DNS is consistently unable to resolve the host names for MongoDB or Sametime Proxy, you can manually add the host names and IP addresses to the configuration. These host names and IP addresses can be added to the host aliases. For additional information, see the [Adding entries to Pod /etc/hosts with HostAliases](https://kubernetes.io/docs/concepts/services-networking/add-entries-to-pod-etc-hosts-with-host-aliases/) topic in the Kubernetes documentation. The host aliases must be updated for each pod that is receiving the host not found error message.

You can modify the template, so that any future changes to incorporate bring these host aliases. Or, you can modify the instance that is running, so that the change is in effect immediately.

**Note:** If you modify the instance that is running, you lose these settings if you restart the pod. To ensure that the change is always incorporated, change the template.

1.  Use the below table to determine which template needs to be modified. Also the command to modify the running instance is provided.

    |Name|Pod|Template names|Command to modify running instance.|
    |----|---|--------------|-----------------------------------|
    |Hostname of the Sametime Proxy|auth and web pods|helm/charts/web/templates/deployment.yamlhelm/charts/auth/templates/deployment.yaml|    ``` {#codeblock_f2j_cb1_ptb}
kubectl edit deploy web
    ```

     ``` {#codeblock_g2j_cb1_ptb}
kubectl edit deploy auth
    ```

|
    |Hostname of the MongoDB server|catalog|helm/charts/catalog/templates/deployment.yaml|    ``` {#codeblock_h2j_cb1_ptb}
kubectl edit deply catalog
    ```

|
    |STUN server host|video|helm/charts/video/templates/deployment.yaml|    ``` {#codeblock_i2j_cb1_ptb}
kubectl edit deploy video
    ```

|
    |Recording repository host|recordings|helm/charts/recordings/templates/deployment.yaml|    ``` {#codeblock_j2j_cb1_ptb}
kubectl edit deploy recordings
    ```

|

2.  Modify the template.

    First a note about yaml files - do not use the tab key for indentation, when using indentation use two spaces for each indentation.

    Open the template in a text editor \(such as vi\).

    Locate the line restartPolicy=Always and insert a new line.

    Use the below example text to include the hostnames that need to be resolved:

    ``` {#codeblock_k2j_cb1_ptb}
    hostAliases:
        - hostnames:
          - "sametimeproxy.example.com"
          - "sametimeproxyalias.example.com"
          ip: "10.10.10.10"
        - hostnames:
          - "mongodb.example.com"
          ip: "10.10.10.11"
    ```

    In the hostnames field your server may only be known as one hostname, you can add multiple aliases if desired.

    Before saving the template, make sure the indentations are correct, using only spaces for indentation. The "hostAliases:" line should line up exactly under the "restartPolicy" line at the same level of indententaion. You may need to correct the other lines as well after copy and pasting them. Visually it should look like this:

    ![](Images/restart_policy.png)

    **Note:** There should be no extra blank lines in the template, so be sure to remove any.

    Save and close the template when changes are complete.

    This process should be completed for all templates involved.

3.  Apply the changes to the server.

    Run the commands:

    ``` {#codeblock_m2j_cb1_ptb}
    helm uninstall sametime-meetings
    
    helm install sametime-meetings .
    ```

    **Note:** The dot at the end is part of the command.


**Parent Topic: **[Troubleshooting Sametime on Kubernetes](t_troubleshooting_sametime_kubernetes.md)

