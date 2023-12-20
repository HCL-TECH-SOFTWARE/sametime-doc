# Disabling reports on Docker or Podman {#meeting_report_setting_docker .task}

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


**Parent topic: **[Disabling the mobile notification limiter](t_disable_rate_limiter.md)

