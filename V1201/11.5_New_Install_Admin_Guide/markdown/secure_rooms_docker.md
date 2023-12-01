# Disabling secure rooms on Docker {#secure_rooms_docker .task}

1.  Edit the docker-compose.yaml file.

2.  Locate the `STCONF_MEETING_SECUREUSERROOMNAME` variable in the Proxy section and set the value to `false`.

3.  Save the changes.

4.  To apply the changes, stop Sametime server and then start it again.

    1.  Run the following command to stop the server.

        ``` {#codeblock_v3c_2gm_s5b}
        docker-compose down
        ```

    2.  Run the following command to start the server.

        ``` {#codeblock_v4h_fgm_s5b}
        docker-compose up -d
        ```


**Parent topic:**[Disabling secure meeting room names](secure_rooms.md)

