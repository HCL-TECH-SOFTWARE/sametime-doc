# Disabling the recording feature {#t_disable_recordings .task}

By default, authenticated users can record meetings. As an administrator, you can disable this functionality.

1.  Update the following parameter.

    -   For Docker, modify the value of ENABLE\_RECORDING in the .env file. The default value is 1.

        ``` {#codeblock_nc4_41m_5wb}
        ENABLE_RECORDING=0
        ```

        Where 0 is *false*.

    -   For Kubernetes, modify the value of enableRecording in the .yaml file. The default value is true

        ``` {#codeblock_sdl_51m_5wb}
        enableRecording: false
        ```

2.  Restart the Sametime server to apply the changes. For more information, refer to [Starting and stopping the Sametime server](starting_and_stopping_servers.md).


**Parent Topic: **[Managing recording options](recording.md)

