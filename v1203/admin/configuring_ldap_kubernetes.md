# Overriding the default LDAP configuration in Kubernetes {#configuring_ldap_kubernetes .task}

Configuration settings can be overridden using the extra-community-config secret.

You can override the default LDAP configuration settings with the StCommunityConfig.xml file and UserInfoConfig.xml file using a secret called extra-community-config.

If you do not need to modify the UserInfoConfig.xml file it does not need to be included in the secret If you need to modify the UserInfoConfig.xml file, you must also include the StCommunityConfig.xml file as well.

1.  Create a directory on your machine called extra-community-config at the root of where the Sametime installation package was decompressed.

2.  Change to the extra-community-config directory.

3.  Find the Community pod name by running the get pods command.

    The pod name has hashes in it. For example: community-77d4695988-2bzrx.

    ``` {#codeblock_mzs_tb1_ytb}
    kubectl get pods
    ```

4.  Pull a copy of the StCommunityConfig.xml from the Community pod by running the below command, where podname is the pod name found in the previous step.

    ``` {#codeblock_v2k_wnx_wtb}
    kubectl exec -it podname --container community -- cat /local/notesdata/StCommunityConfig.xml >./StCommunityConfig.xml 
    ```

    For example, if the Community pod name is community-845d5d5755-z7zf7, the command to run is

    ``` {#codeblock_njq_ykd_xtb}
    kubectl exec -it community-845d5d5755-z7zf7 --container community -- cat /local/notesdata/StCommunityConfig.xml >./StCommunityConfig.xml 
    ```

5.  Pull a copy of the UserInfoConfig.xml file from the Community pod, by running the below command. Substitute the name of your Community pod for podname.

    ``` {#codeblock_wtp_d4x_wtb}
    kubectl exec -it podname --container community -- cat /local/notesdata/UserInfoConfig.xml >./UserInfoConfig.xml 
    ```

6.  Find the base64 encoded value of your bind credentials. If you are using an authenticated bind, issue the following command in a Linux shell that contains your user name and password separated by a colon.

    The resulting value is used in a later step.

    ``` {#codeblock_rjt_t41_ytb}
    echo -n “username:password” | base64 -d
    ```

    If the Bind DN is CN=bind,O=Example and the password is password, then the command is:

    ``` {#codeblock_qt4_vpb_ytb}
    echo -n “CN=bind,O=Example:password” | base64 -d 
    ```

7.  Open the local copy of the UserInfoConfig.xml for editing.

8.  Update the configuration settings.

    Configure the desired custom settings in the StCommunityConfig.xml and UserInfoConfig.xml files. See [Configuring LDAP](configuring_ldap.md) for configuration settings.

9.  Use the Change Directory command to change to the extra-community-config directory that was created earlier. Run the following command to create the secret.

    ``` {#codeblock_d13_nsc_ytb}
    kubectl create secret generic extra-community-config --from-file=./ 
    ```

    If you have a namespace dedicated to Sametime add the -n argument with your namespace to ensure it is created in the correct namespace.

10. Change to the helm directory where the Sametime installation package was decompressed.

11. Open the values.yaml file and place in edit mode. Add the following line.

    ``` {#codeblock_y1s_5sc_ytb}
    overrideCommunityConfigSecret: extra-community-config
    ```

    Save and close the file.

12. Apply your changes to the environment.

    Verify that you are in the helm directory and run the following command to apply changes. Specify the Sametime deployment name for your environment. The default for Sametime Premium version 12 is sametime.

    ``` {#codeblock_iyn_51d_d5b}
    helm upgrade sametime\_deployment\_name .
    ```

    **Note:** Be sure to include the dot at the end. It is part of the command.

    If you are unsure of your deployment name, issue the helm list command to find the name. If you upgraded from an earlier Sametime release, the default name is sametime-meetings.

13. Restart the pods with the changes. Use the kubectl scale command to scale the pods to zero and then to one that have been changed. You must run the commands for each pod that the change affects.

    1.  Run the following command to scale the pod to zero.

        Scale the pod to zero, where pod\_deployment\_name is the pod name.

        ``` {#codeblock_cwz_mwc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=0
        
        ```

    2.  Run the following command to scale the pod to one.

        ``` {#codeblock_i2c_4wc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=1
        ```


**Parent Topic:  **[Configuring LDAP](configuring_ldap.md)

