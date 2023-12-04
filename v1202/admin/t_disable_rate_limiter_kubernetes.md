# Disabling the mobile notification limiter on Kubernetes {#t_disable_rate_limiter_kubernetes .task}

Sametime sends notifications to mobile devices \(phones and tablets\) through the Apple Push Notification service \(APNs\) for Apple and through the Google Firebase Cloud Messaging service \(FCM\) for Android. Sametime includes a mobile notification limiter service that monitors various conditions to help ensure that mobile device notifications are sent at appropriate times and frequencies. By default, the service monitors whether multiple clients are active, which client was most recently active, and whether messages have been read, and might limit the notifications to avoid redundancy. You can disable the notification limiter to send notifications to all connected clients.

1.  Open the values.yaml file for editing.

2.  Add the following parameter.

    ``` {#codeblock_rrl_n23_hxb}
    stproxyMobileDisableRateLimiter: true
    ```

3.  Save and close the file.

4.  Apply your changes to the environment.

    Verify that you are in the helm directory and run the following command to apply changes. Specify the Sametime deployment name for your environment. The default for Sametime Premium version 12 is sametime.

    ``` {#codeblock_iyn_51d_d5b}
    helm upgrade sametime\_deployment\_name .
    ```

    **Note:** Be sure to include the dot at the end. It is part of the command.

    If you are unsure of your deployment name, issue the helm list command to find the name. If you upgraded from an earlier Sametime release, the default name is sametime-meetings.

5.  Restart the pods with the changes. Use the kubectl scale command to scale the pods to zero and then to one that have been changed. You must run the commands for each pod that the change affects.

    1.  Run the following command to scale the pod to zero.

        Scale the pod to zero, where pod\_deployment\_name is the pod name.

        ``` {#codeblock_cwz_mwc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=0
        
        ```

    2.  Run the following command to scale the pod to one.

        ``` {#codeblock_i2c_4wc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=1
        ```


**Parent Topic: **[Administering](administering.md)

