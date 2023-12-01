# Customizing business cards in Kubernetes {#config_buscard_custom_kubernetes .task}

You can override the default business cards configuration by creating an extra-community-configs secret to hold the configuration files.

Kubectl commands are used to pull the existing file from the community pod to your local machine. You modify these files locally with the required settings, then create the secret containing the files.

The following procedures describes the steps to create a new secret. The example used in the steps shows creating a secret called extra-community-configs which overrides the values.yaml settings for LDAP. The extra-community-configs secret contains a copy of the configuration files used by the Community pod. For more information on secrets, see [Managing secrets in Kubernetes](managing_secrets_kubernetes.md).

1.  Create a directory on your machine called extra-community-config at the root of where the Sametime installation package was decompressed.

    ``` {#codeblock_l15_ptb_k5b}
    mkdir extra-community-config
    ```

2.  Use the cd command to change to the extra-community-config directory.

    ``` {#codeblock_g1v_5tb_k5b}
    cd extra-community-config
    ```

3.  Find the community pod name by running the get pods command.

    The pod name has some hashes in it, for example: `community-77d4695988-2bzrx): kubectl get pods`.

4.  Run the following command to pull a copy of the StCommunityConfig.xml file from the community pod specifying the name of the pod.

    ``` {#codeblock_edt_5ty_ztb}
    kubectl exec -it pod\_name --container community -- cat /local/notesdata/StCommunityConfig.xml >./StCommunityConfig.xml
    ```

    This file must be available. No changes to it are needed at this time.

5.  Run the following command to pull a copy of the UserInfoConfig.xml file from the community pod specifying the name of the pod.

    ``` {#codeblock_blp_b5y_ztb}
    kubectl exec -it pod\_name --container community -- cat /local/notesdata/UserInfoConfig.xml >./UserInfoConfig.xml
    ```

6.  Using a text editor, open the local copy of the UserInfoConfig.xml file in edit mode. Modify the file as needed.

    When finish, save and close the file.

7.  Ensure that you are in the extra-community-config directory that was created earlier. Run the following command to create the secret. If you have a namespace dedicated to Sametime, add the -n argument with your namespace to ensure it is created in the correct namespace.

    ``` {#codeblock_aqb_x5y_ztb}
    kubectl create secret generic extra-community-config --from-file=./ 
    ```

8.  Use the cd command to change to the helm directory where the Sametime installation package was decompressed.

    ``` {#codeblock_kyk_15b_k5b}
    cd helm
    ```

9.  Open the values.yaml file and put in edit mode.

10. Add the following line to the values.yaml file.

    ``` {#codeblock_xq2_1vy_ztb}
    overrideCommunityConfigSecret: extra-community-config
    ```

    When finished save and close the file..

11. Apply your changes to the environment.

    Verify that you are in the helm directory and run the following command to apply changes. Specify the Sametime deployment name for your environment. The default for Sametime Premium version 12 is sametime.

    ``` {#codeblock_iyn_51d_d5b}
    helm upgrade sametime\_deployment\_name .
    ```

    **Note:** Be sure to include the dot at the end. It is part of the command.

    If you are unsure of your deployment name, issue the helm list command to find the name. If you upgraded from an earlier Sametime release, the default name is sametime-meetings.

12. Restart the pods with the changes. Use the kubectl scale command to scale the pods to zero and then to one that have been changed. You must run the commands for each pod that the change affects.

    1.  Run the following command to scale the pod to zero.

        Scale the pod to zero, where pod\_deployment\_name is the pod name.

        ``` {#codeblock_cwz_mwc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=0
        
        ```

    2.  Run the following command to scale the pod to one.

        ``` {#codeblock_i2c_4wc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=1
        ```


**Parent topic:**[Setting up business cards](admin_st_buscard.md)

