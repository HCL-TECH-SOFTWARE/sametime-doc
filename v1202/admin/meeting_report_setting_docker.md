# Disabling reports on Docker or Podman {#meeting_report_setting_docker .task}

You can disallow gathering reports. When this value is turned on, the meeting owner doesn't have the ability to allow reports to be generated. When this value is turned off, the meeting owner can determine if reports about the meeting are generated and how the report is accessed.

The Docker and Podman commands are similar. The only difference is that docker precedes the command when issued in a Docker environment and podman precedes the name in a Podman environment. Example commands used in the Sametime documentation are shown using Docker. For Podman, change docker to podman.

1.  Edit the docker-compose.yml file.

2.  Locate the `MEETING_REPORTS_DISABLED` variable.

    Specify `true` to disallow report generation or `false` to allow the meeting owner to determine if reports can be generated.

3.  Save the changes.

4.  To apply the changes, stop the Sametime server and then start it again.

    1.  Run the following command to stop the server.

        ``` {#codeblock_v3c_2gm_s5b}
        docker-compose down
        ```

    2.  Run the following command to start the server.

        ``` {#codeblock_v4h_fgm_s5b}
        docker-compose up -d
        ```


**Parent Topic:  **[Meetings](meetings_configuring.md)

