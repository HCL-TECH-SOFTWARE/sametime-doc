# Disable sharing of meeting recording {#disable_sharing_meetings .task}

By default meeting recordings can be shared with others. You can change a setting to disable sharing of meeting recordings.

To disable sharing of meetings recordings, set the SHARE\_RECORDINGS\_BY\_DEFAULT parameter to false on the Meetings server. When the value is set to false, the option to share recordings when editing meeting settings or stopping a recording is not available.

-   For Docker, change `SHARE_RECORDINGS_BY_DEFAULT` setting in the custom.env file.

    ``` {#codeblock_v3c_ssd_xtb}
    SHARE_RECORDINGS_BY_DEFAULT=false
    ```

-   For Kubernetes, add the following to the helm/values.yaml file.

    ``` {#codeblock_axs_ssd_xtb}
    shareRecordingsByDefault=false
    ```


**Parent Topic:  **[Meetings](meetings_configuring.md)

