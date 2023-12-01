# Customizing business cards in Docker {#config_buscard_custom_docker .task}

You can override the default business cards configuration by editing a UserInfoConfig.xml file and adding it as a volume in the docker-compose.yml.

1.  Copy the existing file out of the community container and place it in the current Sametime installation directory.

    ``` {#codeblock_zww_wdc_k5b}
    
    docker cp <container_name>:/local/notesdata/UserInfoConfig.xml . 
    
    ```

    To identify the community container ID, run the command docker container ls and look for the chat-server IMAGE. The NAME is the container name, as an example: `sametime-community-1`.

2.  Make needed changes, then update docker-compose.yaml by adding: volumes:

    ``` {#codeblock_g33_n2c_k5b}
    - ./StCommunityConfig.xml:/local/notesdata/StCommunityConfig.xml - ./UserInfoConfig.xml:/local/notesdata/UserInfoConfig.xml networks: - sametime.test 
    ```

3.  Update and save docker-compose.yml by adding:

    ``` {#codeblock_qgz_hly_mvb}
    volumes: - ./UserInfoConfig.xml:/local/notesdata/UserInfoConfig.xml
    ```

4.  Restart the server to apply the changes.

    ``` {#codeblock_bxh_4ly_mvb}
    
    docker-compose down
    docker-compose up -d
    ```


**Parent topic:**[Setting up business cards](admin_st_buscard.md)

