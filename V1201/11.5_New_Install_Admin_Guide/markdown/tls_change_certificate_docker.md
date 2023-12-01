# Updating the TLS certificates on Docker {#tls_change_cetificate_docker .task}

Ensure that you have the certificate and private key to be used.

1.  Run the following command to stop the Sametime services.

    ``` {#codeblock_fhw_grb_b5b}
    docker-compose down
    ```

2.  Copy the two files to the /keys folder where the Sametime is deployed.

3.  Replace the cert.key and cert.crt files with the new certificate files.

    The files are located in the installation\_directory./sametime-config/web/keys/ directory. Where installation\_directory is the Sametime installation directory.

    **Note:** These changes are lost if you delete or remove the sametime-config directory.

4.  Run the following command to start the Sametime services and apply the changes.

    ``` {#codeblock_ip5_5b2_q5b}
    docker compose up -d
    ```


**Parent topic:**[Updating the Sametime server TLS certificates](updating_meeting_servers.md)

