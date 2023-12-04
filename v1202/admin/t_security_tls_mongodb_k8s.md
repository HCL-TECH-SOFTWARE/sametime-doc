# Enabling TLS for the Mongo database on Kubernetes {#t_security_tls_mongodb_k8s .task}

Ensure that you have read the [Setting up TLS for the Mongo database](security_mongodb_tls.md) topic. Verify if you have a valid TLS certificate. See [Creating a truststore with a third-party certificate](t_create_truststore.md) for the details.

1.  Configure the Sametime server to use TLS.

2.  Create a secret with your certificate.

    ``` {#codeblock_ats_gz1_4yb}
    kubectl create secret generic mongo-secret --from-file=<ca.crt>
    ```

3.  Open the values.yaml file in edit mode.

4.  Add the following secret.

    ``` {#codeblock_rt5_2bb_4yb}
    mongoSecret: mongo-secret
    ```

5.  Save the changes.

6.  Apply your changes to the environment.

    Verify that you are in the helm directory and run the following command to apply changes. Specify the Sametime deployment name for your environment. The default for Sametime Premium version 12 is sametime.

    ``` {#codeblock_iyn_51d_d5b}
    helm upgrade sametime\_deployment\_name .
    ```

    **Note:** Be sure to include the dot at the end. It is part of the command.

    If you are unsure of your deployment name, issue the helm list command to find the name. If you upgraded from an earlier Sametime release, the default name is sametime-meetings.

7.  Restart the pods with the changes. Use the kubectl scale command to scale the pods to zero and then to one that have been changed. You must run the commands for each pod that the change affects.

    1.  Run the following command to scale the pod to zero.

        Scale the pod to zero, where pod\_deployment\_name is the pod name.

        ``` {#codeblock_cwz_mwc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=0
        
        ```

    2.  Run the following command to scale the pod to one.

        ``` {#codeblock_i2c_4wc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=1
        ```


**Parent Topic: **[Setting up TLS for the Mongo database](security_mongodb_tls.md)

