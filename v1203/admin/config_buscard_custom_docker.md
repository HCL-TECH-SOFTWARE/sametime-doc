# Customizing business cards in Docker and Podman {#config_buscard_custom_docker .task}

You can override the default business cards configuration by editing a UserInfoConfig.xml file and adding it as a volume in the docker-compose.yml.

The Docker and Podman commands are similar. The only difference is that docker precedes the command when issued in a Docker environment and podman precedes the name in a Podman environment. Example commands used in the Sametime documentation are shown using Docker. For Podman, change docker to podman.

1.  Copy the existing file out of the community container and place it in the current Sametime installation directory.

    ``` {#codeblock_zww_wdc_k5b}
    docker cp <container_name>:/local/notesdata/UserInfoConfig.xml . 
    ```

    To identify the community container ID, run the command docker container ls and look for the chat-server IMAGE. The NAME is the container name, as an example: `sametime-community-1`.

2.  Make needed changes, then update volumes in the Community service section of docker-compose.yml by adding the following.

    ``` {#codeblock_g33_n2c_k5b}
    ./UserInfoConfig.xml:/local/notesdata/UserInfoConfig.xml
    ```

3.  Restart the Sametime server to apply the changes.

    ``` {#codeblock_bxh_4ly_mvb}
    
    docker-compose down
    docker-compose up -d
    ```


**Parent Topic:  **[Setting up business cards](admin_st_buscard.md)

