# Enabling Community debug in Kubernetes {#t_enabling_community_debug .task}

The Sametime Community pod supports a variety of debug parameters as documented in [Common debug parameters for Sametime Community Server](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0079079) article.

**Note:** In Sametime versions prior to version 12, the Community services debug was handled in the sametime.ini file.  Beginning with Sametime 12, the parameters used for Community debug are in defined in a ConfigMap in Kubernetes.

The changes in this task affect the following pods:

-   community

1.  Change directories to where helm is located.;

2.  Open the values.yaml file for editing.

    In the`global` section, add the following line:

    ``` {#codeblock_y1k_bsw_mvb}
    enableCommunityDebug: true
    ```

    **Note:** Confirm the indentation matches the other settings \(two spaces\).

    When finished, save and close the file.

3.  Apply the changes.

    Upgrade the deployment by following the instructions in [Applying configuration changes in Kubernetes or Openshift](apply_configchanges_kubernetes.md).

4.  Run the following command to open the ConfigMap.

    ``` {#codeblock_hvq_psw_mvb}
    kubectl edit cm sametime-community-logging
    ```

5.  Press **i** to switch to edit mode.

6.  Configure any custom debug parameters. If you know the parameter, configured with the following format.

    -   The first characters are STI\_\_DEBUG.

        **Note:** Enter two underscores to separate.

    -   If your debug parameters belong in the `[Debug]` section of the sametime.ini originally, add two underscores and then your parameter, followed by a colon and its value in quotes. For example, if setting `VP_LDAP_TRACE=1` at the \[Debug\] section of the sametime.ini file, then the configuration setting is:

        ``` {#codeblock_x1n_zsw_mvb}
        STI__DEBUG__VP_LDAP_TRACE: “1”
        ```

        **Note:** In the example, there are two underscores between STI and DEBUG and then two more underscores before the parameter.

        If your debug setting is a component level debug such as \[Debug-StUsers\], then the parameter must have the same beginning STI\_\_DEBUG, followed by a single underscore and the component name, and then two underscores and the parameter. For example, if you are setting component level debug for `VP_TRACE_ALL=1` for the \[Debug-StUsers\] component, then the configuration setting is like the following:

        ``` {#codeblock_z1n_zsw_mvb}
        STI__Debug_StUsers__VP_TRACE_ALL: "1"
        ```

7.  Save and close the ConfigMap.

8.  Restart the pods with the changes. Use the kubectl scale command to scale the pods to zero and then to one that have been changed. You must run the commands for each pod that the change affects.

    1.  Run the following command to scale the pod to zero.

        Scale the pod to zero, where pod\_deployment\_name is the pod name.

        ``` {#codeblock_cwz_mwc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=0
        
        ```

    2.  Run the following command to scale the pod to one.

        ``` {#codeblock_i2c_4wc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=1
        ```


**Parent Topic: **[Troubleshooting Sametime on Kubernetes](t_troubleshooting_sametime_kubernetes.md)

