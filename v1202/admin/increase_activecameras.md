# Increasing the number of video streams displayed during a meeting {#increase_activecameras .task}

The most recent active video streams are displayed in the meeting window up to the specified maximum value. The default is nine.

The maximum number includes the person viewing the meeting. If the value is increased and performance decreases, reduce the number. Note that specifying a value greater than nine is not supported by HCL.

1.  Open the configuration file for editing.

    -   For Docker, open the custom.env file.
    -   For Kubernetes, open the helm/values.yaml file.
2.  Change the parameter in the configuration file. Note that the value doesn't include your camera which is always displayed.

    -   For Docker, update the CHANNEL\_LAST\_N parameter. For example,

        ``` {#codeblock_tg5_fbx_wxb}
        CHANNEL_LAST_N = 11
        ```

        When applied, up to twelve simultaneous video streams are displayed.

    -   For Kubernetes environments, update the channelLastN parameter. For example,

        ```
        channelLastN : 11
        ```

    The parameters are case sensitive and must be entered as shown.

3.  Apply the changes to the environment.

    -   For Docker and Podman, see [Applying configuration changes in Docker or Podman](apply_configchanges_docker.md)
    -   For Kubernetes and Openshift, see [Applying configuration changes in Kubernetes or Openshift](apply_configchanges_kubernetes.md)

**Parent Topic: **[Managing Sametime Meetings](sametime_meeting_administering.md)

