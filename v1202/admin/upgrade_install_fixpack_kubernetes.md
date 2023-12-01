# Installing a fix pack on Kubernetes {#upgrade_install_fixpack_kubernetes .task}

For Sametime upgrades, the upgrade package includes full helm charts that need to be implemented. You need to port your settings over from your values.yaml into the new values.yaml file. Do not restore your values.yaml from a back up because there may be some deprecated settings.

1.  Download and extract the Sametime fix pack zip files into a directory on either the master Kubernetes host or on a machine which has management access to the Kubernetes cluster.

2.  Run the following command to load the fix pack Docker image to the Docker repository.

    ``` {#codeblock_nwr_lpk_25b}
    ./load.sh
    ```

    If your image repository requires a secret, then define the secret name in the values.yaml file.

    If your image repository requires a secret, then define in the secret name on the hclImagePullSecret setting in the values.yaml file.

3.  Edit the values.yaml file as needed.

4.  Run the following script to update the current configuration to values.yaml file as needed. You are prompted for any missing information.

    ``` {#codeblock_klx_qpk_25b}
    ./prepareDeployment.sh
    ```

5.  When prompted to confirm the upgrade, answer Y to proceed with the current settings. If your response is No, you are prompted for necessary information.

6.  If the community LDAP settings are overridded in your deployment using an extra-community-config secret, there are changes to these files that need to be included as a part of the upgrade.

    1.  Delete the secret by running the following command:

        ``` {#codeblock_pzp_3yh_rvb}
        kubectl delete secret extra-community-config
        ```

    2.  Comment out the following line in the values.yaml file using the comment \(\#\) character.

        ``` {#codeblock_vpm_nyh_rvb}
        # overrideCommunityConfigSecret: extra-community-config
        ```

    When the upgrade is finished, pull new copies of StCommunityConfig.xml and UserInfoConfig.xml files. Modify the files to include your custom settings. Create the extra-community-config secret again with your changes.

7.  If you have enabled telephony, copy the secrets from your old helm charts to the new ones.

    1.  Copy the existing setting `application-registry.json` from /helm/templates/auth-config-secrets.yaml into your new /helm/templates/auth-config-secrets.yaml file.

    2.  Copy the existing JigasiSipUri and JigasiSipPassword settings from the/helm/templates/sametime-secrets.yaml file to the new /helm/templates/sametime-secrets.yaml file.

8.  Apply your changes to the environment.

    Verify that you are in the helm directory and run the following command to apply changes. Specify the Sametime deployment name for your environment. The default for Sametime Premium version 12 is sametime.

    ``` {#codeblock_iyn_51d_d5b}
    helm upgrade sametime\_deployment\_name .
    ```

    **Note:** Be sure to include the dot at the end. It is part of the command.

    If you are unsure of your deployment name, issue the helm list command to find the name. If you upgraded from an earlier Sametime release, the default name is sametime-meetings.


**Parent topic:**[Upgrading to a new version or applying a fixpack](upgrade_install_fixpack.md)

