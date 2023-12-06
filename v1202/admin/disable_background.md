# Disabling virtual background {#disable_background .task}

By default, you can use a filter, blur your background, or use a default or custom image or video to obscure your surroundings. Depending on your organization's requirements, you can disable the virtual background feature by modifying the applicable file.

-   For Docker, .env
-   For Kubernetes, values.yaml

To restrict all users from using virtual backgrounds during a meeting, follow these steps:

1.  Modify the configuration file. The default value is `TRUE`.

    -   For Docker, update the value of the ENABLE\_VIRTUAL\_BACKGROUND parameter:

        ``` {#codeblock_avq_5yq_p5b}
        ENABLE_VIRTUAL_BACKGROUND=false
        ```

    -   For Kubernetes, update the value of the VirtualBackgroundEnabled parameter:

        ``` {#codeblock_hs2_wyq_p5b}
        virtualBackgroundEnabled: false
        ```

2.  Restart the Sametime server to apply the changes. For more information, refer to [Starting and stopping servers](https://help.hcltechsw.com/sametime/12/admin/starting_and_stopping_servers.html).


**Parent Topic:  **[Managing Sametime Meetings](sametime_meeting_administering.md)

