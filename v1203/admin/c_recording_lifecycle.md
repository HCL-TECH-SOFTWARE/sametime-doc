# Recording lifecycle {#c_recording_lifecycle .task}

To save storage space, you can automatically remove old recordings after the specified time.

By default, recordings are available for download and playback for three \(3\) days. This is configured using the following parameter:

-   For Docker, modify the .env file.

    ``` {#codeblock_km1_h2m_5wb}
    EXPIRES_IN_DAYS=n
    ```

    Where *n* defines the number of days the recordings are available before getting archived. For example, to change the value to seven days, enter EXPIRES\_IN\_DAYS=7.

-   For Kubernetes, modify the .yaml file.

    ``` {#codeblock_lm1_h2m_5wb}
    recordingsExpireInDays: n
    ```

    Where *n* defines the number of days the recordings are available before getting archived. For example, to change the value to seven days, enter recordingsExpireInDays: 7. For more information, see [Applying configuration changes in Kubernetes or Openshift](apply_configchanges_kubernetes.md).


**Parent Topic:  **[Managing recording options](recording.md)

