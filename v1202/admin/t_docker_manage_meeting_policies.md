# Managing policies on Docker {#t_docker_manage_meeting_policies .task}

This section outlines the steps on how to manage policies in a Docker environment.

You can manage your policies on Docker by modifying the following file.

-   `docker-compose.yaml`

To manage your policies on Docker, follow these steps:

1.  Copy the applicable files out of the container.

    ``` {#codeblock_wx2_xrc_qtb}
    docker cp <container_name>:/local/notesdata/policies.user.xml .
    docker cp <container_name>:/local/notesdata/policies.server.xml .
    ```

    This step places the files in the current directory.

2.  Locate and edit the policies as necessary.

3.  In the Community section of `docker-compose.yaml`, add a volume reference. Below is an example.

    ``` {#codeblock_g4j_lmk_qtb}
    services:
        community:
          image: hclcr.io/st/chat-server:${BUILD_LEVEL}
          restart: ${RESTART_POLICY}
          env_file:
            - custom.env
            - debug.env
          environment:
            - JWT_SECRET_ENV=${JWT_APP_SECRET}
            - DOMINO_SERVER_HOST_ENV=domino
            - DOMINO_SERVER_NAME_ENV=CN\=domino\/O\=test
            - DOMINO_SERVER_DOMAIN_ENV=test
            - ST_BRANDING_INFO_ENV=standard
          volumes:
            - ./policies.user.xml:/local/notesdata/policies.user.xml
          networks:
            - sametime.test
          extra_hosts:
            - "stmobilev12:10.134.102.40"
    ```

4.  Restart the server to apply the changes.


**Parent topic:**[Configuring policies](configuring_policies.md)

