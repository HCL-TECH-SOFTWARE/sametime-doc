# Disable sharing of meetings recording {#disable_sharing_meetings .task}

By default meeting recordings can be shared with others. You can change a setting to disable sharing of meeting recordings.

To disable sharing of meetings recordings, set the `SHARE_RECORDINGS_BY_DEFAULT` parameter to false on the Meetings server. When the value is set to false, the option to share recordings when editing meeting settings or stopping a recording is not available.

-   For Docker, change `SHARE_RECORDINGS_BY_DEFAULT` setting in the custom.env file.

    ``` {#codeblock_v3c_ssd_xtb}
    SHARE_RECORDINGS_BY_DEFAULT=false
    ```

-   For Kubernetes, add the following to the helm/values.yaml file.

    ``` {#codeblock_axs_ssd_xtb}
    shareRecordingsByDefault=false
    ```


**Parent topic:**[Meetings](meetings_configuring.md)

