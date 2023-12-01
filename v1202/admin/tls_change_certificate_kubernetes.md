# Updating the TLS certificates on Kubernetes {#tls_change_certificate_kubernetes .task}

In Kubernetes, TLS certificates are contained within a secret called tls\_secret.

Ensure that you have the certificate and private key to be used.

To update the certificate on Kubernetes, first you must delete the existing secret and create it again with the new certificate information.

1.  Run the following command to verify if the secret currently exists.

    ``` {#codeblock_dnq_5ww_p5b}
    kubectl get secrets
    ```

2.  If the tls\_secret exists, delete it.

    ``` {#codeblock_ddy_rxw_p5b}
    kubectl delete secret tls-secret
    ```

3.  Create a new tls\_secret secret with the new certificate and private key.

    ``` {#codeblock_rkb_hyw_p5b}
    create secret tls tls-secret --key tls.key --cert tls.crt
    ```

    Where the value for key is the private key file and cert is the certificate file.

4.  Verify

    ``` {#codeblock_k1x_l4x_p5b}
    kubectl get secret tls-secret -o yaml
    ```


**Parent topic:**[Updating the Sametime server TLS certificates](updating_meeting_servers.md)

