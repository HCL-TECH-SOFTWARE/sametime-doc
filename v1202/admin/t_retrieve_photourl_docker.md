# Retrieving photos from HTTPS hosts in Docker and Podman {#t_retrieve_photourl_docker .task}

Signer certificates establish the relationship in SSL communication. This step is needed by the Sametime server, specifically for cases where the PhotoURL is using SSL \(HTTPS\) to access business card photos.

The Docker and Podman commands are similar. The only difference is that docker precedes the command when issued in a Docker environment and podman precedes the name in a Podman environment. Example commands used in the Sametime documentation are shown using Docker. For Podman, change docker to podman.

After obtaining the certificate file for the host, follow these steps.

1.  Place the docker-compose.yml file in edit mode.

2.  Find the proxy section and add the following volume.

    ``` {#codeblock_qgz_hly_mvb}
    volumes: 
         - custom-config/ca-certificates.crt:/etc/ssl/certs/ca-certificates.crt
    ```

    For example,

    ``` {#codeblock_sh2_v32_5yb}
    proxy:
          image: hclcr.io/st/chat-proxy:${BUILD_LEVEL}
          restart: ${RESTART_POLICY}
          env_file: custom.env
          volumes:
            - custom-config/ca-certificates.crt:/etc/ssl/certs/ca-certificates.crt
            - proxy-workspace:/workspace/proxy-storage
          environment:
            - JAVA_TOOL_OPTIONS=-XX:MaxDirectMemorySize=64M -XX:MaxMetaspaceSize=192M
            - SAMETIME_EXTERNAL_WARINTEGRATION
    ```

3.  Save the changes.

4.  Start the Sametime server to apply the changes.

    ``` {#codeblock_btc_lj4_k5b}
    docker compose up -d
    
    ```


**Parent Topic: **[Setting up business cards](admin_st_buscard.md)

