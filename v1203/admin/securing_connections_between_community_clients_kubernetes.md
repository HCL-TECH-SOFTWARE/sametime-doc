# Configuring TLS for Sametime mux on Kubernetes {#securing_connections_between_community_clients_kubernetes .task}

Ensure that the following conditions are satisfied.

-   Obtain a third-party certificate. You can use a self-signed certificate or a third-party certificate to configure TLS for Sametime mux.
-   [Obtain a private key](t_keystore_mux.md) with a subject that contains the host name assigned to the mux Kubernetes service. If you do not know the mux Kubernetes service IP address, issue the kubectl get svc \| grep mux command.

These are the steps to secure the connection between the Sametime Connect client and Sametime embedded client inside of HCL Notes to the Sametime mux using TLS.

The changes in this task apply to the following pods:

-   community
-   mux

1.  Create a secret that contains your trust store.

    ``` {#codeblock_dns_snk_y5b}
    kubectl create secret generic mux-secret --from-literal=KeyStorePassword=samet1me --from-file=./keystore.p12
    ```

2.  In the values.yaml file remove the comment tag \(\#\) surrounding the muxTlsConfigSecret: mux-secret parameter.

3.  Save and close the values.yaml file.

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


**Parent Topic:  **[Securing connections between the Sametime mux and the Connect and Embedded clients](securing_connections_between_community_clients.md)

