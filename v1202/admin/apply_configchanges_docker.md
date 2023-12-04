# Applying configuration changes in Docker or Podman {#apply_confichanges_docker .task}

Configuration files contain environment variables that can be changed and applied to the Sametime server.

You can make configuration changes by modifying the following files.

-   custom.env
-   .env
-   docker-compose.yml

The Docker and Podman commands are similar. The only difference is that docker precedes the command when issued in a Docker environment and podman precedes the name in a Podman environment. Example commands used in the Sametime documentation are shown using Docker. For Podman, change docker to podman.

**Note:** Values in the Docker commands are case-sensitive and must be entered in lowercase.

1.  Shut down the Sametime server.

    ``` {#codeblock_rxs_k2h_15b}
    docker compose down
    
    ```

2.  Modify the configuration file.

3.  Save changes to the configuration files.

4.  Start the Sametime server to apply the changes.

    ``` {#codeblock_btc_lj4_k5b}
    docker compose up -d
    
    ```


**Parent Topic: **[Configuring](configuring.md)

