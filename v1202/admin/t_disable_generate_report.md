# Disabling Sametime reports {#t_disable_generate_report .task}

By default, meeting owners can generate meeting reports. You can change a setting to disable the ability for owners to generate meeting reports.

1.  Update the following parameter.

    -   For Docker, modify the value of MEETING\_REPORTS\_DISABLED in the .env file. The default value is `false`.

        ``` {#codeblock_l44_vfq_5wb}
        MEETING_REPORTS_DISABLED=true
        ```

    -   For Kubernetes, modify the value of meetingReportsDisabled in the values.yaml file. The default value is `false`.

        ``` {#codeblock_m44_vfq_5wb}
        meetingReportsDisabled: true
        ```

2.  Restart the Sametime server to apply the changes. For more information, refer to [Starting and stopping the Sametime server](starting_and_stopping_servers.md).


**Parent Topic: **[Managing Sametime Meetings](sametime_meeting_administering.md)

