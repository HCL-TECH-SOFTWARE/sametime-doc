# Enabling content security headers on Docker and Podman {#verse_integration_contentsecurity_docker .task}

The Docker and Podman commands are similar. The only difference is that docker precedes the command when issued in a Docker environment and podman precedes the name in a Podman environment. Example commands used in the Sametime documentation are shown using Docker. For Podman, change docker to podman.

1.  Edit the custom.env file.

2.  Add the following parameter to the file, where company\_domain is the domain name.

    ``` {#codeblock_ktx_hvk_dwb}
    CONTENT_SECURITY_POLICY=frame-ancestors https://*.company\_domain.com
    ```

    To apply the changes, stop the Sametime server and start it again.

3.  To stop the Sametime server, run the following script from the Sametime installation directory.

    ``` {#codeblock_mlj_pqk_25b}
    docker-compose down 
    ```

4.  Start the Sametime server to apply the changes.

    ``` {#codeblock_btc_lj4_k5b}
    docker compose up -d
    
    ```


**Parent Topic:  **[Integrating with other applications](verse_integration.md)

