# Configuring the encryption settings on Docker {#securing_connections_between_community_clients_docker .task}

1.  Create a mux.env with the following setting and values appropriate for your configuration.

    ``` {#codeblock_utp_nmk_y5b}
    
    STI__Debug__VPMX_DISABLE_CONFIGURATION_UPDATE=1
    STI__Debug__VPMX_PORT=1533
    STI__Debug__VPMX_TLS_PORT=1533
    STI__Config__VPMX_CAPACITY=20000
    STI__Config__ST_TLS_KEY_STORE_TYPE=p12
    STI__Config__ST_TLS_KEY_STORE_FILE=/local/sametimemuxdata/keystore.p12
    STI__Config__ST_TLS_KEY_STORE_PASSWORD=keystorepass
    
    ```

2.  Add `mux.env` to the environment file variable in to the `mux` section of docker-compose.yaml file.

    ``` {#codeblock_osb_smk_y5b}
    
    env file:
     -mux.env
    ```

3.  Map the keyfile into the container

    ``` {#codeblock_xg2_ymk_y5b}
    
    volumes:
      - ./keystore.p12:/local/sametimemuxdata/keystore.p12 
    
    ```

4.  Restart the server.


**Parent topic:**[Securing connections between the Sametime mux and clients](securing_connections_between_community_clients.md)

