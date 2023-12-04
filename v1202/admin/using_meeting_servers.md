# Applying Let's Encrypt certificates {#using_meeting_servers .task}

This topic describes how to replace the self-signed certificate with a third-party certificate.

The Sametime server is preconfigured with a self-signed certificate.

**Note:** Let's Encrypt certificates expire every 90 days. To automatically renew the certificates, users can use [Certbot](https://certbot.eff.org/). Otherwise, users can renew certificates when they expire. For details on setting up automatic renewal, refer to the Certbot documentation.

**Parent Topic: **[Securing](securing.md)

## Kubernetes {#using_meeting_server_kubernetes}

Obtain one or more certificates and private key. Afterward, run the following commands to configure the Ingress to use them.

1.  Run the following command to verify if the secret currently exists.

    ``` {#codeblock_dnq_5ww_p5b}
    kubectl get secrets
    ```

2.  If the tls-secret exists, delete it.

    ``` {#codeblock_ddy_rxw_p5b}
    kubectl delete secret tls-secret
    ```

3.  Create a new tls-secret secret with the new certificate and private key.

    ``` {#codeblock_rkb_hyw_p5b}
    create secret tls tls-secret --key tls.key --cert tls.crt
    ```

    Where the value for key is the private key file and cert is the certificate file.

4.  Verify

    ``` {#codeblock_k1x_l4x_p5b}
    kubectl get secret tls-secret -o yaml
    ```


## Docker {#using_meeting_servers_docker}

Generate a Let's Encrypt certificate. Afterward, apply the encryption certificate on the Sametime server.

1.  Set ENABLE\_LETSENCRYPT to 1 in the docker-compose.yml file.

2.  Retrieve the PEM files provided by Let's Encrypt and locate the following files

    -   fullchain.pem
    -   privkey.pem
3.  Copy the specified files in the folder below:

    ``` {#codeblock_a5h_d5v_tsb}
    sametime-config/web/acme-certs/
    ```

    **Note:** If a value for the LETSENCRYPT\_DOMAIN is specified, then the path is sametime-config/web/acme-certs/<LETSENCRYPT\_DOMAIN\>/.

4.  Restart the server to apply the changes.

    ```
    
    docker-compose down
    docker-compose up -d
    ```


