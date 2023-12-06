# Configuring TLS for Sametime mux on Docker and Podman {#securing_connections_between_community_clients_docker .task}

The following steps enable TLS for the Sametime mux, which overrides the default security with TLS 1.2 between Sametime Connect clients and the Sametime mux. For more details, see [Securing connections between the Sametime mux and the Connect and Embedded clients](securing_connections_between_community_clients.md).

The Docker and Podman commands are similar. The only difference is that docker precedes the command when issued in a Docker environment and podman precedes the name in a Podman environment. Example commands used in the Sametime documentation are shown using Docker. For Podman, change docker to podman.

1.  Create a mux.env with the following setting and values appropriate for your configuration.

    ``` {#codeblock_utp_nmk_y5b}
    
    STI__Debug__VPMX_DISABLE_CONFIGURATION_UPDATE=1
    STI__Debug__VPMX_PORT=1533
    STI__Debug__VPMX_TLS_PORT=1533
    STI__Config__VPMX_CAPACITY=20000
    STI__Config__ST_TLS_KEY_STORE_TYPE=p12
    STI__Config__ST_TLS_KEY_STORE_FILE=/local/sametimemuxdata/keystore.p12
    STI__Config__ST_TLS_KEY_STORE_PASSWORD=keystore\_password
    STI__Config__ST_TLS_SECURITY_LEVEL=2
    ```

2.  Add `mux.env` to the environment file variable in to the `mux` section of docker-compose.yml file.

    ``` {#codeblock_osb_smk_y5b}
    
    env file:
     -mux.env
    ```

3.  Map the keyfile into the container

    ``` {#codeblock_xg2_ymk_y5b}
    
    volumes:
      - ./keystore.p12:/local/sametimemuxdata/keystore.p12 
    
    ```

4.  Start the Sametime server to apply the changes.

    ``` {#codeblock_btc_lj4_k5b}
    docker compose up -d
    
    ```


**Parent Topic:  **[Securing connections between the Sametime mux and the Connect and Embedded clients](securing_connections_between_community_clients.md)

