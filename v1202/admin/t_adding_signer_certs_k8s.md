# Retrieving photos from HTTPS hosts in Kubernetes {#t_adding_signer_certs_docker .task}

Signer certificates establish the relationship in SSL communication. This step is needed by the Sametime server, specifically for cases where the PhotoURL is using SSL \(HTTPS\) to access business card photos.

After obtaining the certificate file for the host, follow these steps.

1.  Create a generic secret containing the CA certificate.

    ``` {#codeblock_ngz_v4n_xwb}
    kubectl create secret generic ca_certificates --from-file=ca-certificates.crt=ca_certificates
    ```

2.  Place the values.yaml file in edit mode.

3.  Add the following line to the values.yaml file.

    ``` {#codeblock_xq2_1vy_ztb}
    caCertificateSecret: ca_certificates
    ```

    When done, save and close the file.

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


**Parent Topic: **[Setting up business cards](admin_st_buscard.md)

