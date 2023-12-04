# Enable Videobridge for TCP {#enable_video_bridge .task}

This section provides steps to configure TCP for media streams using TCP port 4443.

The following external port must be opened on a firewall. You can use any network command to verify. For example: - netstat \#4443/tcp is used for Real-time Transport Protocol \(RTP\) media over TCP.

Two types of communication can be configured: Transmission Control Protocol \(TCP\) and User Datagram Protocol \(UDP\). You can configure the video bridge for one or both.

**Parent Topic: **[Meetings](meetings_configuring.md)

## Docker {#task_m5l_hfj_5tb}

***Use these settings to allow both UDP and TCP.***

The client tries UDP first and if it fails, TCP is used.

1.  Open the .env file, look for “JVB\_TCP\_HARVESTER\_DISABLED” configuration and change the value to **false**.

    ``` {#codeblock_c2s_jfj_5tb}
    JVB_TCP_HARVESTER_DISABLED=false
    ```

2.  In the .env file, locate the entry for JVB\_TCP\_PORT field. If the value has a \# in front, remove the comment \# to enable the setting.

    ``` {#codeblock_d2s_jfj_5tb}
    JVB_TCP_PORT=4443
    ```

    **Note:** \#JVB\_TCP\_PORT is TCP port for media used by Jitsi Videobridge when the TCP Harvester is enabled.

3.  Open the docker-compose.yml. Add JVB\_TCP\_PORT section for the JVB component:

    ``` {#codeblock_f2s_jfj_5tb}
    # Video bridge
    jvb:
    ports:
    - '${JVB_PORT}:${JVB_PORT}/udp'
    - '${JVB_TCP_PORT}:${JVB_TCP_PORT}'
    ```


With above configuration, A/V media successfully flows through 4443 media-port and media-port state changes from Listening to Established

``` {#codeblock_bnw_qfj_5tb}
tcp6 0 475 a82b7a871950:4443 192.168.75.1:49295 ESTABLISHED
```

*****Use these settings to force TCP only.*****

If there is need to completely switch to the TCP protocol and remove support for UDP, then complete the settings above, remove JVB\_PORT in the docker-compose.yml file and remove the entry from .env file.

``` {#codeblock_cnw_qfj_5tb}
# Video bridge
jvb:
ports:
#- '${JVB_PORT}:${JVB_PORT}/udp'
- '${JVB_TCP_PORT}:${JVB_TCP_PORT}'

```

To enforce the changes made, follow the steps in [Applying configuration changes in Docker or Podman](apply_configchanges_docker.md).

## Kubernetes {#task_gvf_gfj_5tb}

***Use these settings to allow both UDP and TCP.***

UDP will be attempted first and if it fails, then TCP will be used. If you need to disable UDP entirely, UDP will need to be blocked at the network.

1.  Open the helm/charts/video/templates/deployment.yaml, add the following as environment variables. Search for JVB\_PORT to see where to insert them:

    ``` {#codeblock_gps_5fj_5tb}
    - name: JVB_TCP_PORT
    value: "4443"
    - name: JVB_TCP_HARVESTER_DISABLED
    value: "false"
    
    ```


These steps are required for AWS EKS only. In helm/charts/video/templates/deployment.yaml, find the lifecycle section. Below it you will see a `preStop:` section. Insert the following as a sibling section to preStop:

``` {#codeblock_hps_5fj_5tb}
postStart:
exec:
command: ["/bin/sh", "-c", "echo 'org.ice4j.ice.harvest.ALLOWED_INTERFACES=eth0' >> /defaults/sip-communicator.properties"]

```

Save the settings and redeploy using the steps in [Applying configuration changes in Kubernetes or Openshift](apply_configchanges_kubernetes.md).

To update a live deployment, use the following command:

``` {#codeblock_ips_5fj_5tb}
kubectl set env deploy/video -e JVB_TCP_PORT=4443 -e JVB_TCP_HARVESTER_DISABLED=false
```

Use these commands to update a live deployment if you are deployed on AWS:

``` {#codeblock_jps_5fj_5tb}
kubectl patch deploy/video -p '{"spec":{"template":{"spec":{"containers":[{"name":"jvb","lifecycle":{"postStart":{"exec":{"command":["/bin/sh", "-c", "echo \"org.ice4j.ice.harvest.ALLOWED_INTERFACES=eth0\" >> /defaults/sip-communicator.properties"]}}}}]}}}}'
```

**Use these steps to remove UDP port 30000 from AWS:**

1.  Open the AWS Console and navigate to your EC2 Dashboard.
2.  Click Security Groups.
3.  Find the Security Group named eksctl-<your cluster name\>-nodegroup-video/SG.
4.  Locate port 30000 / UDP from the list and click the remove icon.
5.  Click **Save**.

