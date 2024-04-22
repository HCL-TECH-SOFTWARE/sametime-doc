# Upgrade considerations for telephony {#t_upgrade_telephony .task}

The prepareDeployment.sh script does not update the values.yaml file for telephony-related settings and does not update the settings from the existing secrets. For more information, refer to [Preparing the deployment](t_meetings_configure_deployment.md).

1.  Configure the values.yaml file.

    Compare the old values.yaml file and the new version of values.yaml file and port the settings over manually.

    -   Locate these settings and change the value from `false` to `true`.

        ``` {#codeblock_qxt_zgk_3xb}
        enableJigasi: true 
        enableJigasiRestartOnTrunkFailure: true 
        dialInEnabled: true 
        dialInDisplayEnabled: true 
        enableInviteOthers: false (set to true if dial-out is enabled) 
        ```

    -   Locate these settings and configure to match the current environment. By default, these settings are blank.

        ``` {#codeblock_s4c_mhk_3xb}
        defaultCountryCode: "" 
        numbers_json: {}
        ```

    -   If necessary, add these settings to match the current environment.

        ``` {#codeblock_p5v_zhk_3xb}
        jigasiSipServer: tmghost.example.com 
        jigasiSipPort: 5060 
        jigasiSipTransport: TCP 
        jigasiProxyBypass: true 
        ```

2.  Configure the secrets for telephony. The secrets used by telephony are not carried over from the previous version of Sametime to the new version. This must be done manually.

    **Secret name: auth-config-secret**

      Template file name: helm/templates/auth-config-secrets.yaml

     Copy the `application-registry.json` setting from the previous file to the new file.

    **Secret name: sametime-global-secrets \(Sametime 12\) or meeting-secrets \(Sametime 11.6\)**    
       Template file name: helm/templates/sametime-global-secrets.yaml

       Copy the JigasiSipUri and JigasiSipPassword values from the previous file to the new file.

    **Secret name: catalog-config-secret**  
      Template file name: helm/templates/catalog-config-secrets.yaml

        **Note:** If the TMG server is configured for a self-signed certificate for HTTPS, you might have the optional extra-certs configured. In this case, copy the extra-certs value from the old helm/templates/catalog-config-secrets.yaml file and paste into the new Sametime 12 helm/catalog-config-secrets.yaml file.

3.  Apply the changes to the environment. See [Applying configuration changes in Kubernetes or Openshift](apply_configchanges_kubernetes.md) for the steps.


**Parent Topic:  **[Upgrading on Kubernetes](upgrade_install_fixpack_kubernetes.md)

