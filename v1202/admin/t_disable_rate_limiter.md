# Disabling the mobile notification limiter {#t_disable_rate_limiter .task}

A notification limiter service monitors various conditions and ensures that mobile device notifications are sent at appropriate times and frequencies. Additionally, the service limits notifications to avoid redundancy among multiple devices. You can turn off the notification limiter to send notifications to all connected clients.

The following technologies handle notifications to mobile devices that use Sametime:

-   Apple Push Notification service \(APNs\) for Apple devices
-   Google Firebase Cloud Messaging service \(FCM\) for Android devices

The mobile notification limiter service monitors various conditions to help ensure that mobile device notifications are sent at appropriate times and frequencies. For example, suppose you have multipe active devices, the notification limiter service determines the most recently active device, and whether messages have been read. Depending on its findigns, the service might limit the notifications to avoid redundancy.

-   **[Disabling reports on Kubernetes](meeting_report_kubernetes.md)**  

-   **[Disabling reports on Docker or Podman](meeting_report_setting_docker.md)**  


**Parent topic: **[meetings\_configuring.md](meetings_configuring.md)

