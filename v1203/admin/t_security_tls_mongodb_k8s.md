# Enabling TLS for the Mongo database on Kubernetes {#t_security_tls_mongodb_k8s .task}

Ensure that you have read the [Setting up TLS for the Mongo database](security_mongodb_tls.md) topic. Verify if you have a valid TLS certificate. See [Creating a truststore with a third-party certificate](t_create_truststore.md) for the details.

1.  Configure the Sametime server to use TLS.

2.  Obtain certificates for the mongo server and the entire chain of issuers and concatenate these into a file named `cacerts.pem`. There are no standard mechanisms with openssl to obtain the entire chain. Using a command like `openssl s_client -connect mongo:27017` will only obtain the certificates offered on that connection. Commonly, the mongo server won't present the certificate for the signer of this cert (for example, an Atlas server will not present the root CA, only the server and intermediate signer certificate). You can use various 3rd party tools for this, for example: [https://github.com/Hakky54/certificate-ripper](https://github.com/Hakky54/certificate-ripper){:target="_blank"}

3.  Create a secret with the trust store.

    ``` {#codeblock_ats_gz1_4yb}
    kubectl create secret generic mongo-secret --from-file=./cacerts.crt
    ```

4.  When installing, configure the mongo secret you created in the yaml file that is used to manage your deployment custom settings. See [Deployment customization best practices in Kubernetes](t_deployment_customization.md) for details about how to customize the deployment or make this change to values.yaml:

    ``` {#codeblock_rt5_2bb_4yb}
    mongoSecret: mongo-secret
    ```

5.  Apply your changes to the environment.

    Verify that you are in the helm directory and run the following command to apply changes. Specify the Sametime deployment name for your environment. The default for Sametime Premium version 12 is sametime.

    ``` {#codeblock_iyn_51d_d5b}
    helm upgrade sametime_deployment_name .
    ```

    **Note:** Be sure to include the dot at the end. It is part of the command.

    If you are unsure of your deployment name, issue the helm list command to find the name. If you upgraded from an earlier Sametime release, the default name is sametime-meetings.

6.  Restart the pods with the changes. Use the kubectl scale command to scale the pods to zero and then to one that have been changed. You must run the commands for each pod that the change affects.

    1.  Run the following command to scale the pod to zero.

        Scale the pod to zero, where pod_deployment_name is the pod name.

        ``` {#codeblock_cwz_mwc_d5b}
        
        kubectl scale deploy pod_deployment_name --replicas=0
        
        ```

    2.  Run the following command to scale the pod to one.

        ``` {#codeblock_i2c_4wc_d5b}
        
        kubectl scale deploy pod_deployment_name --replicas=1
        ```

**Parent Topic:  **[Setting up TLS for the Mongo database](security_mongodb_tls.md)

