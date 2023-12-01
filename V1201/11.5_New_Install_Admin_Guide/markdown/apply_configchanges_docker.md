# Applying configuration changes in Docker {#apply_confichanges_docker .task}

Configuration files contain environment variables that can be changed and applied to the Sametime server.

You can make configuration changes by modifying the following files.

-   custom.env
-   .env
-   docker-compose.yml

The docker-compose command is used to apply the changes.

**Note:** Values in the Docker commands are case sensitive and must be entered in lower case.

1.  Shut down the Sametime server.

    ``` {#codeblock_rxs_k2h_15b}
    docker-compose down
    
    ```

2.  Modify the configuration file.

3.  Save changes to the configuration files.

4.  Delete the jitsi-conifg directory with the options recursive and force.

    ```
    rm -rf jitsi-config/
    ```

    The jitsi-config directory on Docker is built on start up with the new configuration values.

5.  Save and Restart the server to apply the changes.

    ``` {#codeblock_emt_4kk_mvb}
    
    docker-compose down 
    docker-compose up -d
    ```


**Parent topic:**[Configuring](configuring.md)

