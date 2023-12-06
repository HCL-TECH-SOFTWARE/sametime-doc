# Disabling the mobile notification limiter on Docker or Podman {#t_disable_rate_limiter_docker .task}

Sametime sends notifications to mobile devices \(phones and tablets\) through the Apple Push Notification service \(APNs\) for Apple and through the Google Firebase Cloud Messaging service \(FCM\) for Android. Sametime includes a mobile notification limiter service that monitors various conditions to help ensure that mobile device notifications are sent at appropriate times and frequencies. By default, the service monitors whether multiple clients are active, which client was most recently active, and whether messages have been read, and might limit the notifications to avoid redundancy. You can disable the notification limiter to send notifications to all connected clients.

1.  Open the custom.env file for editing.

2.  Add the following parameter.

    ``` {#codeblock_rxw_5tb_fxb}
    STCONF_MOBILE_DISABLERATELIMITER=true
    ```

3.  Save the changes.

4.  Start the Sametime server to apply the changes.

    ``` {#codeblock_btc_lj4_k5b}
    docker compose up -d
    
    ```


**Parent Topic:  **[Administering](administering.md)

