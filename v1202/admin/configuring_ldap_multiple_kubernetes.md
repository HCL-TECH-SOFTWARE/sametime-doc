# Configuring additional LDAP servers on Kubernetes {#configuring_ldap_multiple_kubernetes .task}

You can configure the Sametime Community pod to connect to two or more LDAP servers.

When you connect to more than one LDAP server, it is important for the names to be unique. If you are trying to achieve high availability to the same directory, use a load balancer to front-end the connection between the multiple LDAP servers.

-   Configure the cluster for the first LDAP server. This must be done when the cluster was installed.
-   You must know the host name, port and optional bind credentials for each LDAP server.
-   If you are using a secure connection to LDAP, the LDAP server’s certificate for each server must be stored in the same .p12 trust store file. You must create a secret containing the trust store that holds each LDAP server’s certificate. Follow the step for creating a secret that contains your certificate in the [Securing LDAP on Kubernetes](securing_ldap_kubernetes.md) topic.

When more than one LDAP is defined in an environment, they are searched in the order defined in the StCommunityConfig.xml file. When you define each LDAP server, the order in which they are listed in the configuration is the same order in which they are searched.

The process described in this procedures involves creating a new secret called extra-community-configs. This secret overrides the LDAP configuration settings in the values.yaml file. The extra-community-configs secret contains a copy of the configuration files used by the Community pod. The LDAP servers are defined within each configuration file. For more information on secrets, see [Managing secrets in Kubernetes](managing_secrets_kubernetes.md).

kubectl commands are used to pull the existing file from the Community pod to your local machine. Modify these files locally with the required settings, then create the secret containing the files.

This procedure is to configure Sametime to connect to two or more separate LDAP servers that have unique names.

**Note:** If you have already created a secret for extra-community-config, you can copy the UserInfoConfig.xml file from the pod to the extra-community-config directory and recreate the secret with the other required files.

The changes in this task affect the following pods:

-   community

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

7.  Use a text editor to open your local copy of UserInfoConfig.xml in edit mode.

8.  Duplicate the line that begins with `StorageDetails`.

9.  The order in which you list your `StorageDetails` statement is the search order to be used.

    Configure your second LDAP server by completing the fields:

    HostName
    :   The fully qualified host name or IP address of the second LDAP server.

    Port
    :   If using unsecured LDAP, specify the port number used by LDAP. If you are using secure LDAP, you don't need to modify this field.

    UserName
    :   Set this field to empty double-quotes \( “” \).

    Password
    :   Set this field to empty double-quotes \(“”\). If using an authenticated bind, add a new parameter after UserName and Password called **UserEncodedAuth=** and set it to the value that was determined in a previous step.

    BaseDN
    :   Define a base DN for searching the directory. If left blank, the entire directory is searched.

    SearchFilter
    :   Modify the search filter if needed. The defaults work well with Domino LDAP.

    You can make other changes to the business cards configuration if needed at this time. When finished, save and close the file.

10. Edit the StCommunityConfig.xml file with a text editor and make the following changes.

    1.  Within the `<LDAP>` section, duplicate the line that begins with `<Connection Hostname`.

    2.  Modify the new line to contain the details of the second LDAP server.

    3.  Modify the SearchOrder parameter for the additional LDAP server to a unique number. This must match the search order you selected for UserInfoConfig.xml.

    4.  Save and close the file.

11. Change to the extra-community-config directory that was created earlier. Run the following command to create the secret.

    ``` {#codeblock_d13_nsc_ytb}
    kubectl create secret generic extra-community-config --from-file=./ 
    ```

    If you have a namespace dedicated to Sametime add the -n argument with your namespace to ensure it is created in the correct namespace.

12. Change to the helm directory where the Sametime installation package was decompressed.

13. Open the values.yaml file and place in edit mode. Add the following line.

    ``` {#codeblock_y1s_5sc_ytb}
    overrideCommunityConfigSecret: extra-community-config
    ```

    Save and close the file.

14. Apply your changes to the environment.

    Verify that you are in the helm directory and run the following command to apply changes. Specify the Sametime deployment name for your environment. The default for Sametime Premium version 12 is sametime.

    ``` {#codeblock_iyn_51d_d5b}
    helm upgrade sametime\_deployment\_name .
    ```

    **Note:** Be sure to include the dot at the end. It is part of the command.

    If you are unsure of your deployment name, issue the helm list command to find the name. If you upgraded from an earlier Sametime release, the default name is sametime-meetings.

15. Restart the pods with the changes. Use the kubectl scale command to scale the pods to zero and then to one that have been changed. You must run the commands for each pod that the change affects.

    1.  Run the following command to scale the pod to zero.

        Scale the pod to zero, where pod\_deployment\_name is the pod name.

        ``` {#codeblock_cwz_mwc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=0
        
        ```

    2.  Run the following command to scale the pod to one.

        ``` {#codeblock_i2c_4wc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=1
        ```


**Parent topic:**[Configuring LDAP](configuring_ldap.md)

