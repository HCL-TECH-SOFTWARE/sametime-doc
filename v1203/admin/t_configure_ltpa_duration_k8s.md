# Configuring the LTPA token expiry interval on Kubernetes {#t_configure_ltpa_k8s .task}

LTPA tokens expire by design. In the process of enabling LTPA, you can define the amount of time after which a token expires in minutes. When necessary, you can update the token expiration interval again after the value has been defined during enablement.

The following conditions must be satisfied:

-   LTPA must be enabled. For more information, refer to [Configuring LTPA in Kubernetes](ltpa_configure_kubernetes.md).
-   Ensure that the LTPA token created when you sign in to Sametime chat allows access to other Domino applications until the expiration time has elapsed.

1.  Update the environment using this format:

    ``` {#codeblock_rxw_5tb_fxb}
    kubectl set env deploy/auth -e LTPA_DURATION_MINUTES=<minutes_token_valid>
    ```

    The following example shows `LTPA_DURATION_MINUTES` set to 30 minutes.

    ``` {#codeblock_zz3_x4l_gxb}
    kubectl set env deploy/auth -e LTPA_DURATION_MINUTES=30
    ```

2.  Add or update the `JWT_ACCESS_DURATION_MINUTES` environment variable. Specify the duration in this format:

    ``` {#codeblock_dkb_vz2_gxb}
    JWT_ACCESS_DURATION_MINUTES=<minutes_token_valid>
    ```

    The following example shows `JWT_ACCESS_DURATION_MINUTES` set to 30 minutes.

    ``` {#codeblock_r2x_npl_gxb}
    kubectl set env deploy/auth -e JWT_ACCESS_DURATION_MINUTES=30
    ```

3.  For the changes persist in your deployment and to apply the changes to new deployments, you must edit the helm/charts/auth/templates/deployment.yaml file and add the new settings to the `env:` section.

    ``` {#codeblock_hyz_trl_gxb}
          containers:
          - env:
    <<< INSERT NEW SETTINGS HERE >>>
    {{- if (.Values.global.ltpaRealm) }}
            - name: LTPA_REALM
              value: {{ .Values.global.ltpaRealm | quote }}
    {{- end }} 
    ```

    Insert this, for example:

    ``` {#codeblock_mpp_1sl_gxb}
            - name: LTPA_DURATION_MINUTES
              value: "30"
            - name: JWT_ACCESS_DURATION_MINUTES
              value: "30"
    ```

4.  Apply your changes to the environment.

    Verify that you are in the helm directory and run the following command to apply changes. Specify the Sametime deployment name for your environment. The default for Sametime Premium version 12 is sametime.

    ``` {#codeblock_iyn_51d_d5b}
    helm upgrade sametime\_deployment\_name .
    ```

    **Note:** Be sure to include the dot at the end. It is part of the command.

    If you are unsure of your deployment name, issue the helm list command to find the name. If you upgraded from an earlier Sametime release, the default name is sametime-meetings.

5.  Restart the pods with the changes. Use the kubectl scale command to scale the pods to zero and then to one that have been changed. You must run the commands for each pod that the change affects.

    1.  Run the following command to scale the pod to zero.

        Scale the pod to zero, where pod\_deployment\_name is the pod name.

        ``` {#codeblock_cwz_mwc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=0
        
        ```

    2.  Run the following command to scale the pod to one.

        ``` {#codeblock_i2c_4wc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=1
        ```


**Parent Topic:  **[Setting up SSO using LTPA](enabling_sso_ltpa.md)

