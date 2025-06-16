# Disabling the meeting timer {#t_disabling_timer .task}

By default, Sametime is configured to display the meeting duration. You can change the setting to disable the timer.

To disable the meeting timer, set the parameter to true on the Meetings server.

1.  Modify the configuration file. The default value is false.

    -   For Docker, change the `REACT_APP_HIDE_CONFERENCE_TIMER` setting in the custom.env file.

        ``` {#codeblock_vvs_jpd_xvb}
        REACT_APP_HIDE_CONFERENCE_TIMER=true
        ```

    -   For Kubernetes, update the helm/values.yaml file.

        ``` {#codeblock_wvs_jpd_xvb}
        hideConferenceTimer: true
        ```

2.  Depending on your environment, do the following.

    -   For Docker, restart the Sametime server to apply the changes. For more information, refer to [Starting and stopping servers](https://help.hcltechsw.com/sametime/12/admin/starting_and_stopping_servers.html).
    -   For Kubernetes, run a helm upgrade command to apply the changes to your deployment.

        ``` {#codeblock_qzx_4cf_htb}
        helm upgrade {release-name} helm/.
        ```


**Parent Topic:  **[Managing Sametime Meetings](sametime_meeting_administering.md)

