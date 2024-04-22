# Disabling reports on Kubernetes {#meeting_report_kubernetes .task}

1.  Change to the helm directory where the Sametime installation package was decompressed.

    ``` {#codeblock_rbc_4km_s5b}
    cd helm
    ```

2.  Open the values.yaml file and put in edit mode.

3.  Locate the `meetingReportsDisabled` value and change the value to false.

    ``` {#codeblock_ucj_5km_s5b}
    MeetingReportsDisabled: false
    
    ```

4.  Save and close the values.yaml file.

