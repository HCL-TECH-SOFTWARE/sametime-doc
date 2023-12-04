# Configuring Kubernetes to use a proxy server for push messaging {#t_proxy_k8s .task}

When Sametime proxy interacts with mobile devices \(phones, pads, watches, and cars\), it sends notifications through push networks such as Apple's "APNS" and Google's "FCM." To send APNS or FCM messages through a proxy server in Kubernetes, follow these steps:

1.  Update the following values in your values.yaml file.

    -   pushProxyServer: ""—Enter the fully qualified domain name. For example, `push-proxy.company.com`. Alternatively, you can enter the IP address of the push-proxy. For example, `123.111.222.333`.
    -   pushProxyPort: "0"—Enter the port of the of the push-proxy. For example, `3128`.
    -   pushProxyUser: ""—When necessary, enter the functional ID of the account required to use the push proxy.
    -   pushProxyPasswordBase64: ""—When necessary, enter the password of the functional ID for the account required to use the push proxy. The value should the base64 encoded in your Kubernetes environment.
    Ensure that the syntax for the YAML file is followed, as shown in the example below.

    ``` {#codeblock_gwj_g5r_lvb}
    pushProxyServer: "push-proxy.company.com"
    pushProxyPort: "3128"
    pushProxyUser: ""
    pushProxyPasswordBase64: ""
    ```

2.  Restart the pod.


**Parent Topic: **[Push messaging through a proxy](t_push_proxy.md)

