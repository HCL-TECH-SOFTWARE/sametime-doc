# Disabling reports on Kubernetes {#meeting_report_kubernetes .task}

You can disallow gathering reports. When this value is turned on, the meeting owner doesn't have the ability to allow reports to be generated. When this value is turned off, the meeting owner can determine if reports about the meeting are generated and how the report is accessed.

1.  Chang to the helm directory where the Sametime installation package was decompressed.

    ``` {#codeblock_rbc_4km_s5b}
    cd helm
    ```

2.  Open the values.yaml file and put in edit mode.

3.  Locate the `meetingReportsDisabled` value and change the value to false.

    ``` {#codeblock_ucj_5km_s5b}
    MeetingReportsDisabled: false
    
    ```

4.  Save and close the values.yaml file.

5.  Apply your changes to the environment.

    Verify that you are in the helm directory and run the following command to apply changes. Specify the Sametime deployment name for your environment. The default for Sametime Premium version 12 is sametime.

    ``` {#codeblock_iyn_51d_d5b}
    helm upgrade sametime\_deployment\_name .
    ```

    **Note:** Be sure to include the dot at the end. It is part of the command.

    If you are unsure of your deployment name, issue the helm list command to find the name. If you upgraded from an earlier Sametime release, the default name is sametime-meetings.

6.  Restart the pods with the changes. Use the kubectl scale command to scale the pods to zero and then to one that have been changed. You must run the commands for each pod that the change affects.

    1.  Run the following command to scale the pod to zero.

        Scale the pod to zero, where pod\_deployment\_name is the pod name.

        ``` {#codeblock_cwz_mwc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=0
        
        ```

    2.  Run the following command to scale the pod to one.

        ``` {#codeblock_i2c_4wc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=1
        ```


**Parent Topic: **[Meetings](meetings_configuring.md)

