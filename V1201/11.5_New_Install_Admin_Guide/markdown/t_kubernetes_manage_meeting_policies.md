# Managing policies on Kubernetes {#t_kubernetes_manage_meeting_policies .task}

As administrators, you define what end-users can do on a cluster to comply with organization requirements. This section outlines the steps on how to manage policies in a Kubernetes environment.

You need to have a Kubernetes cluster, and the kubectl command-line tool must be configured to communicate with your cluster.

You can manage your policies on Kubernetes by modifying copies of policies.users.xml and policies.servers.xml files and adding an overrideCommunityPolicy parameter to `values.yaml`.

To manage your policies on Kubernetes, follow these steps:

1.  Copy the following extra community policy files out of the container to a local directory.

    ``` {#codeblock_l1h_jvc_qtb}
    kubectl  exec -it <podID> --container community -- cat /local/notesdata/policies.user.xml > ./policies.user.xml
    kubectl  exec -it <podID> --container community -- cat /local/notesdata/policies.server.xml > ./policies.server.xml
    ```

    **Note:** Both files are needed even if you are updating only one file.

    To find and identify the <podID\>, run the command:

    ``` {#codeblock_e32_2jr_qtb}
    kubectl get po
    ```

2.  Create a directory to store the extra community policy files. Move the copied files to the new directory. In the example below, the directory is called *extra-community-policy*.

    ``` {#codeblock_z4j_xvc_qtb}
    extra-community-policy
    ```

3.  Switch to the extra-community-policy directory. Edit the policy files and save the changes.

4.  Create the extra-community-policy ConfigMap from the directory with the policy files with the command:

    ``` {#codeblock_vp3_rxc_qtb}
    kubectl create configmap extra-community-policy --from-file=/.
    ```

5.  Edit `values.yaml` and add:

    ``` {#codeblock_dm5_xs2_qtb}
    overrideCommunityPolicy: extra-community-policy
    ```

6.  Run the command:

    ``` {#codeblock_jsx_ft2_qtb}
    helm upgrade <sametime_deployment>
    ```

7.  Scale the community pod.

    ``` {#codeblock_x5t_qkr_qtb}
    kubectl scale deploy community --replicas=0
    kubectl scale deploy community --replicas=1
    ```


**Parent topic:**[Configuring policies](configuring_policies.md)

## Updating configuration values {#task_sdb_4zc_qtb}

This procedure assumes that you have previously made adjustments to your policies, following the detailed steps above.

1.  Delete the ConfigMap extra-community-policy:

    ``` {#codeblock_zqy_4pr_qtb}
    kubectl delete cm  extra-community-policy
    ```

2.  Locate and edit the policies as necessary.

3.  Create the extra-community-policy ConfigMap:

    ``` {#codeblock_g2l_1qr_qtb}
    kubectl create configmap extra-community-policy --from-file=./
    ```

4.  Scale the community pod.

    ``` {#codeblock_slz_bqr_qtb}
    kubectl scale deploy community --replicas=0
    kubectl scale deploy community --replicas=1
    ```


