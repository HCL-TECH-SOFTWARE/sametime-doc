# Configuring SAML in Kubernetes {#enabling_saml_kubernetes .task}

The changes in this task affect the following pods:

-   community
-   mux
-   proxy

1.  Find the **idpUrl** value.

    1.  Modify the user access URL that was provided by your identity provider so that users are redirected properly.

    2.  Append the IdP user access URL with `?TARGET=https://fully_qualified_hostname/chat`.

    For example, if the following exists:

    -   IdP user access URL is https://idp.example.com/example\_tenant&appid=1234
    -   Sametime fully qualified host name is sametime.example.com.
    The resulting URL is

    https://idp.example.com/example\_tenant&appid=1234?TARGET=https://sametime.example.com/chat

    If you are using a different host name for meetings and webchat, use the host name for th e webchat client.

    https://idp.example.com/exampletenant&appid=1234?TARGET=https://webchat.example.com/chat

2.  Configure the Sametime server to use SAML.

    1.  Retrieve the certificate from your IdP and create a trust store in p12 format named **samltruststore.p12**. If your IdP provides more than one certificate, all certificates must be added to the trust store.

    2.  Create a secret with your trust store.

        ``` {#codeblock_whq_ztl_qtb}
        kubectl create secret generic saml-secret --from-literal=KeyStorePassword=password --from-file=samltruststore.p12
        ```

        Where password is the password for the keystore. If you are using a namespace for Sametime, include the namespace argument in the command to ensure the secret is located in the same namespace as Sametime.

    3.  Change directories to helm in the location where the Sametime install was decompressed.

    4.  Open the values.yaml file in edit mode.

    5.  Remove the comment character \(\#\) from the following line.

        `# samlConfigSecret: saml-secret`

    6.  Type the IdP URL as the value for the **idpUrl** parameter.

    7.  Add the following line below the **idpUrl** line.

        ``` {#codeblock_vh2_kv3_rtb}
        ReactAppShowGuestLoginByDefault: true
        ```

    8.  Save and close the values.yaml file.

3.  Apply your changes to the environment.

    Verify that you are in the helm directory and run the following command to apply changes. Specify the Sametime deployment name for your environment. The default for Sametime Premium version 12 is sametime.

    ``` {#codeblock_iyn_51d_d5b}
    helm upgrade sametime\_deployment\_name .
    ```

    **Note:** Be sure to include the dot at the end. It is part of the command.

    If you are unsure of your deployment name, issue the helm list command to find the name. If you upgraded from an earlier Sametime release, the default name is sametime-meetings.

4.  Restart the pods with the changes. Use the kubectl scale command to scale the pods to zero and then to one that have been changed. You must run the commands for each pod that the change affects.

    1.  Run the following command to scale the pod to zero.

        Scale the pod to zero, where pod\_deployment\_name is the pod name.

        ``` {#codeblock_cwz_mwc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=0
        
        ```

    2.  Run the following command to scale the pod to one.

        ``` {#codeblock_i2c_4wc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=1
        ```


**Parent topic:**[Setting up SSO using SAML](enabling_sso_saml.md)

