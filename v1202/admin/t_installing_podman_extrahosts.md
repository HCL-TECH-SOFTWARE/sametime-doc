# Configuring container networking with Podman {#t_installing_podman_extrahosts .task}

The network layer does not have DNS resolve available between containers. This topic provides information on the network configurations needed to resolve network or DNS issues in Podman environments.

Ensure that the podman-compose version is 1.0.4 or higher. To update podman-compose, run the following command.

``` {#codeblock_s3q_hhg_2yb}
curl -o /usr/local/bin/podman-compose https://raw.githubusercontent.com/containers/podman-compose/devel/podman_compose.py
chmod +x /usr/local/bin/podman-compose
```

If you are using Red Hat® Enterprise Linux® and Podman, you must configure the RHEL nodes to ensure the connections are successful.

**Note:** All commands provided require running as ROOT or SUDO access. If not running as root user, preface the commands in steps 1 and 2 with `sudo`.

1.  Run the command to install Netavark.

    ``` {#codeblock_dv5_2hq_3xb}
    dnf install netavark
    ```

2.  Place the `containers.conf` file in edit mode.

    ``` {#codeblock_pxg_pfr_3xb}
    vi /etc/containers/containers.conf
    ```

3.  After installation, migrate all your containers to use Netavark by running this command:

    ``` {#codeblock_d3f_rfr_3xb}
    network_backend = "netavark"
    ```

4.  Do a force reset.

    ``` {#codeblock_jn2_znq_15b}
    podman system reset --force
    ```

5.  Bind Sametime to port 443.

    ``` {#codeblock_ajb_tgr_3xb}
    sysctl net.ipv4.ip_unprivileged_port_start=443
    ```


**Parent Topic: **[Installing Sametime in a Docker or Podman environment](installation_sametime_docker.md)

