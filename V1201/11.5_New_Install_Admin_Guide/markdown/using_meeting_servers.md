# Applying Let's Encrypt certificates {#using_meeting_servers .task}

The Sametime Meeting server is preconfigured with a self-signed certificate. This section describes how to replace the self-signed certificate with a third-party certificate.

**Note:** Let's Encrypt certificates expire every 90 days. To automatically renew the certificates, users can use [Certbot](https://certbot.eff.org/). Otherwise, users can renew certificates when they expire.

**Parent topic:**[Securing](securing.md)

## Kubernetes {#using_meeting_server_kubernetes}

Obtain one or more certificates and private key. Afterward, run the following commands to configure the Ingress to use them.

1.  For KEY\_FILE specify the private key file and for CERT\_FILE specify the certificates file.

    ```
    
    kubectl -n ingress-nginx delete secret ingress-tls-cert
    export CERT_NAME=ingress-tls-cert
    export KEY_FILE=privkey.pem
    export CERT_FILE=fullchain.pem
    kubectl -n ingress-nginx create secret tls ${CERT_NAME} --key ${KEY_FILE} --cert ${CERT_FILE}
    kubectl patch deployment nginx-ingress-controller -n ingress-nginx --patch "$(cat kubernetes/ingress/nginx-tls-patch.yaml)"
    ```

2.  Restart the ingress controller:

    ```
    
    kubectl scale deployment nginx-ingress-controller -n ingress-nginx --replicas=0
    kubectl scale deployment nginx-ingress-controller -n ingress-nginx --replicas=1
    ```

3.  Setup Certbot to automatically renew certificates.

    Refer to the Let's Encrypt documentation for details on using Certbot with Kubernetes.


## Docker {#using_meeting_servers_docker}

Generate a Let's Encrypt certificate. Afterward, apply the encryption certificate on the Sametime Meeting server.

1.  Set ENABLE\_LETSENCRYPT to 1 in the docker-compose.yml file.

2.  Find

    ``` {#codeblock_u2q_wtv_tsb}
    fullchain.pem
    privkey.pem
    ```

3.  Copy the specified files in the following folder:

    ``` {#codeblock_a5h_d5v_tsb}
    jitsi-config/web/letsencrypt/live/
    ```

    **Note:** If a value for the LETSENCRYPT\_DOMAIN is specified, the path is `jitsi-config/web/letsencrypt/live/<LETSENCRYPT_DOMAIN >/.`

4.  Restart to apply the changes.

    ```
    > docker-compose down
    > docker-compose up -d
    ```

5.  Use Certbot to renew the certificates.

    1.  Under the NGINX section add the following code to the volumes section.

        ```
         ${CONFIG}/web/data/letsencrypt:/data/letsencrypt:Z
        
        ```

    2.  Run `Docker-compose up -d`.

    3.  After the initial start, add the following in the jitsi-config/web/nginx/meet.conf file. Follow the syntax pattern in the file.

        ```
        
        location ^~ /.well-known
        { allow all; root /data/letsencrypt/; } 
        ```

    4.  Modify Docker-compose down, Docker-compose up -d to restart.

    5.  Validate if they are working properly.

    6.  Use Docker to run the certbot/letsencrypt request to renew certificates.

        For example:

        ```
        
        docker run -it --rm \
        -v certs:/etc/letsencrypt \
        -v certs-data:/data/letsencrypt \
        deliverous/certbot \
        certonly \
        --webroot --webroot-path=/data/letsencrypt \
        -d example.com -d www.example.com
        ```

        Specify the full absolute path to the jitsi-config folder on the certs and certs-data commands. For example: `-v certs:/etc/letsencrypt \` would be

        ```
        
        -v /stmeetings/jitsi-config/web/letsencrypt:/etc/letsencrypt \
        ```

        and `-v certs-data:/data/letsencrypt \` would be

        ```
        
        -v /stmeetings/jitsi-config/web/data/letsencrypt:/data/letsencrypt \
        
        ```

    7.  Validate that Certbot is working as expected.


