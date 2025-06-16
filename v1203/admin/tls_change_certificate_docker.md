# Updating the TLS certificates on Docker {#tls_change_cetificate_docker .task}

Ensure that you have the certificate and private key to be used.

1.  Run the following command to stop the Sametime services.

    ``` {#codeblock_fhw_grb_b5b}
    docker compose down
    ```

2.  Copy the two files to the /keys folder where the Sametime is deployed.

3.  Replace the cert.key and cert.crt files with the new certificate files.

    The files are located in the sametime-config/web/keys/ folder which is in the your installation directory.

    **Note:** These changes are lost if you delete or remove the sametime-config directory.

4.  Start the Sametime server to apply the changes.

    ``` {#codeblock_btc_lj4_k5b}
    docker compose up -d
    
    ```


**Parent topic:   **[Replacing the TLS certificates for Web Chat and Meetings](tls_change_certificate.md)

