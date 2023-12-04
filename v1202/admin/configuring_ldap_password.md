# Changing the LDAP service account password in Kubernetes {#configuring_ldap_password .task}

If you are using an authenticated bind for LDAP, with a password that expires periodically, you'll need to update the LDAP bind credentials for Sametime clusters in Kubernetes with a new password.

The LDAP bind credentials are Base64 encoded and defined in the configuration as secrets. When updating the password, you'll need to complete the following tasks:

-   Find the Base64 encoded values of your credentials.
-   Update the bind credentials in the Kubernetes secrets.

    The LDAP bind credentials are located in Kubernetes secrets:

    -   `sametime-global-secrets`
    -   `extra-community-config` \(optional\)
    There is an optional configuration to override the default settings for LDAP and for business cards in a secret called extra-community-config. If you have implemented this secret, the LDAP Bind credentials must be updated in the XML configuration files and the extra-community-config secret should be deleted and recreated


The changes in this task affect the following pods:

-   Community

1.  Find the Base64 encoded values of your credentials.

    1.  If your LDAP DN is changing, you need to Base64 encode the complete DN.

        For example, if your LDAP DN is `CN=SametimeBind,O=Example` take your DN and run the below command:

        ``` {#codeblock_umn_jds_5tb}
        echo -n “CN=SametimeBind,O=Example” | base64
        ```

        For this example, the resulting value is shown below and must be configured for the LdapBindEntryDn parameter in the sametime-secrets.yaml file.

        ``` {#codeblock_jbp_kds_5tb}
        LdapBindEntryDn: 4oCcQ049U2FtZXRpbWVCaW5kLE89RXhhbXBsZeKAnQ== 
        ```

    2.  If your LDAP bind password is changing, you need to base64 encode the password.

        For example, if your password is thepassword, then run the below command to base64 encode it:

        ``` {#codeblock_rz3_qds_5tb}
        echo -n “thepassword” | base64
        ```

        The resulting value is used in your configuration for the password.

    3.  Now find the base64 encoded value of the two settings combined, separated by a colon.

        For example if your Bind DN is `CN=SametimeBind,O=Example` and the password is thepassword then find the base64 encoded value of `CN=SametimeBind,O=Example:thepassword`:

        ``` {#codeblock_djw_tnj_5tb}
        echo -n “CN=SametimeBind,O=Example:thepassword” | base64 
        ```

2.  Update the secret for `sametime-global-secrets`.

    1.  Edit the `sametime-global-secrets` file. Run the following command.

        ``` {#codeblock_crt_rfs_5tb}
        kubectl edit secret sametime-global-secrets
        ```

    2.  Locate `LdapBindEntryDn` and `LdapBindEntryPassword` in the helm/templates/sametime-secrets.yaml file. Set their values to the base64 encoded value of your name and password respectively.

        ```
        
        LdapBindEntryDn: base64\_encoded\_DN 
        LdapBindEntryPassword: base64\_encoded\_password
        ```

    3.  Save and close the file.

    4.  Press **Esc, w, q, !** on the keyboard to save your changes.

3.  Update the `extra-community-config` secret.

    1.  Determine if there is already a `extra-community-config` secret by issuing the following command.

        ``` {#codeblock_w1g_dp2_vtb}
        kubectl get secrets 
        ```

        If you are using a namespace for Sametime, you must include the `-n namespace` argument on the command to view the secrets scoped to the Sametime namespace.

    2.  If there is a secret, delete it. Otherwise skip to the next step.

        Run the following command to delete the secret.

        ``` {#codeblock_gvp_pp2_vtb}
        kubectl delete secret extra-community-configs
        ```

4.  Create a new directory named extra-community-configs on the machine that is used to run kubectl commands.

5.  Change directories to the extra-community-configs you just created.

6.  Locate the pod name of the Community pod to be used in the next step by running following the command.

    ``` {#codeblock_ank_lkd_xtb}
    kubectl get pods
    ```

    The name has hashes in it, for example: `community-845d5d5755-z7zf7`.

7.  Pull a copy of the StCommunityConfigs.xml from the Community pod by running the below command, where podname is the Community pod name found in the previous step.

    ``` {#codeblock_v2k_wnx_wtb}
    kubectl exec -it podname --container community -- cat /local/notesdata/StCommunityConfig >./StCommunityConfig.xml 
    ```

    For example, if the Community pod name is community-845d5d5755-z7zf7, the command to run is

    ``` {#codeblock_njq_ykd_xtb}
    kubectl exec -it community-845d5d5755-z7zf7 --container community -- cat /local/notesdata/StCommunityConfig.xml >./StCommunityConfig.xml 
    ```

8.  Pull a copy of the UserInfoConfig.xml file from the Community pod, by running the below command. Substitute the name of your Community pod for podname.

    ``` {#codeblock_wtp_d4x_wtb}
    podname: kubectl exec -it <podname> --container community -- cat /local/notesdata/UserInfoConfig.xml >./UserInfoConfig.xml 
    ```

    For example, if the Community pod name is community-845d5d5755-z7zf7, the command to run is

    ``` {#codeblock_ldq_h4x_wtb}
    kubectl exec -it community-845d5d5755-z7zf7 --container community -- cat /local/notesdata/UserInfoConfig.xml >./UserInfoConfig.xml 
    ```

9.  After adding the two files to your machine, the new LDAP DN and password must be defined. Open the local copy of the StCommunityConfig.xml file using a file editor.

    Locate the parameters to be changed and set them to their actual unencoded values. Do not specify the base64 encode values.

    -   Set `BindEntryDn`= to the Bind DN
    -   Set `BindEntryPwd=` set to the new Bind password
    Save and close the file.

10. Open the UserInfoConfig.xml file. Next change the `UserEncodedAuth` value.

    1.  Locate `UserEncodedAuth` in the file.

    2.  Change the current value to the base64 encoded values of the DN and password.

        Combine the two values with a colon \(:\) between them. For example:

        ``` {#codeblock_fzv_1nd_xtb}
        echo -n DN:password echo -n 'DN:password' | base64
        ```

    3.  Save and close the file.

11. Create the `extra-community-configs` secret by issuing the following command.

    ``` {#codeblock_cn4_snd_xtb}
    kubectl create secret generic extra-community-config --from-file=./
    ```

12. Update the configuration files.

    If you did not have an `extra-community-configs` secret before you must update the values.yaml file for Sametime to use the secret.

    1.  Change to the helm directory, where the Sametime installation image was unzipped.

    2.  Open the values.yaml file with a text editor.

    3.  Add the following parameter to the global section.

        ``` {#codeblock_ics_x4d_xtb}
        overrideCommunityConfigSecret: "extra-community-config"
        ```

    4.  Save and close the file.

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


**Parent Topic: **[Configuring LDAP](configuring_ldap.md)

