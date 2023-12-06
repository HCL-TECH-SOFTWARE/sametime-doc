# Enabling web client integration on Docker and Podman {#verse_integration_docker .task}

The Docker and Podman commands are similar. The only difference is that docker precedes the command when issued in a Docker environment and podman precedes the name in a Podman environment. Example commands used in the Sametime documentation are shown using Docker. For Podman, change docker to podman.

1.  Edit the docker-compose.yml file.

2.  Locate the `SAMETIME_EXTERNAL_WARINTEGRATION` variable and ensure that it is set to true.

    If the statement doesn't exist, add it in the `proxy` section of the file.

    ``` {#codeblock_hfl_1g1_h5b}
    SAMETIME_EXTERNAL_WARINTEGRATION=true
    ```

    To apply the changes, stop the Sametime server and start it again.

3.  To stop the Sametime server, run the following script from the Sametime installation directory.

    ``` {#codeblock_mlj_pqk_25b}
    docker-compose down 
    ```

    To apply the changes stop the Sametime server and start it again.

4.  Start the Sametime server to apply the changes.

    ``` {#codeblock_btc_lj4_k5b}
    docker compose up -d
    
    ```


**Parent Topic:  **[Integrating with other applications](verse_integration.md)

