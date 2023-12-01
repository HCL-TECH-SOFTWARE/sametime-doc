# Disabling custom background uploads {#t_disable_background_upload .task}

By default, you can upload any supported image type to use as your background during a meeting. Depending on your organization's requirements, you can disable custom background uploads by modifying the applicable file.

-   Docker
    -   .env
-   Kubernetes
    -   values.yaml

1.  Modify the configuration file. The default value is TRUE.

    -   For Docker, update the value of the ENABLE\_USER\_VIRTUAL\_BACKGROUND parameter:

        ``` {#codeblock_dp1_dzq_p5b}
        ENABLE_USER_VIRTUAL_BACKGROUND=false
        ```

    -   For Kubernetes, update the value of the UserVirtualBackgroundsEnabled parameter:

        ``` {#codeblock_wmg_fzq_p5b}
        userVirtualBackgroundsEnabled: false
        ```

2.  Restart the Sametime server to apply the changes. For more information, refer to [Starting and stopping servers](https://help.hcltechsw.com/sametime/12/admin/starting_and_stopping_servers.html).


**Parent topic:**[Managing Sametime Meetings](sametime_meeting_administering.md)

