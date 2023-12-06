# Configuring Docker and Podman to use a proxy server for push messaging {#t_proxy_Safelinx .task}

When Sametime proxy interacts with mobile devices \(phones, pads, watches, and cars\), it sends notifications through push networks such as Apple's "APNS" and Google's "FCM." To send APNS or FCM messages through a proxy server in Docker or Podman, follow these steps:

The Docker and Podman commands are similar. The only difference is that docker precedes the command when issued in a Docker environment and podman precedes the name in a Podman environment. Example commands used in the Sametime documentation are shown using Docker. For Podman, change docker to podman.

1.  Update the following values in your custom.env file.

    -   STCONF\_PUSH\_PROXY\_SERVER—Enter the fully qualified domain name. For example, `push-proxy.company.com`. Alternatively, you can enter the IP address of the push-proxy. For example, `123.111.222.333`.
    -   STCONF\_PUSH\_PROXY\_PORT—Enter the port of the of the push-proxy. For example, `3128`.
    -   STCONF\_PUSH\_PROXY\_USER—When necessary, enter the functional ID of the account required to use the push proxy.
    -   STCONF\_PUSH\_PROXY\_PASSWORD—When necessary, enter the password of the functional ID for the account required to use the push proxy.
    Ensure that the syntax for the .env file is followed, as shown in the example below.

    ``` {#codeblock_n2y_5xr_lvb}
    STCONF\_PUSH\_PROXY\_SERVER="push-proxy.company.com"
    STCONF\_PUSH\_PROXY\_PORT="3128"
    STCONF_PUSH_PROXY_USER=""
    `STCONF_PUSH_PROXY_PASSWORD`=""
    ```

2.  Start the Sametime server to apply the changes.

    ``` {#codeblock_btc_lj4_k5b}
    docker compose up -d
    
    ```


**Parent Topic:  **[Push messaging through a proxy](t_push_proxy.md)

