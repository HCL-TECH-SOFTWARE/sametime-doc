# Enabling TLS for the Mongo database on Docker or Podman

Ensure that the you have read the [introductory topic](security_mongodb_tls.md) and verified that the TLS connection itself can be established. For more information, refer to [Verifying if TLS connection can be established](t_verify_tlsconnection.md).







 


1.  Locate the local .pem file to use with your Mongo deployment. For more information, refer to the [official MongoDB documentation.](https://www.mongodb.com/docs/manual/reference/connection-string/#mongodb-urioption-urioption.tlsCAFile)

2.  Modify your Mongo URL to use TLS. For more information, refer to [Setting up TLS for the Mongo database](security_mongodb_tls.md).

3.  Open the docker-compose.yml file in edit mode.

4.  Add the volume mount to the Community section of the YAML file.

    ``` {#codeblock_h5d_g32_5yb}
    /opt/sametime/cacerts.pem:/local/notesdata/cacerts.pem
    ```

    The example above assumes that you have the `cacerts.pem` file on the host system at the `/opt/sametime` location. It will mount into the container at the location `/local/notesdata/cacerts.pem` which should be the same path/filename as specified in the `tlsCAFile` parameter on the Mongo connection string.

5.  Save the changes.

6.  Start the Sametime server to apply the changes.

    ``` {#codeblock_btc_lj4_k5b}
    docker compose up -d
    
    ```


**Parent Topic:  **[Setting up TLS for the Mongo database](security_mongodb_tls.md)

