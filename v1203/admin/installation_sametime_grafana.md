# Enabling monitoring and statistics {#installation_sametime_grafana .task}

You can configure Grafana during the installation process provided it has been enabled. Alternately, Grafana can be configured post-installation.

You are then prompted during the install to enable Grafana: Do you want to enable monitoring?.

**NOTE:** podman-compose does not support the `COMPOSE_PROFILES` environment variable that is configured via the installation script. In order to enable monitoring when starting up via podman-compose, you need to explicitly list the monitoring profile when starting the server:
```
  podman-compose --profile monitoring up -d
```

**NOTE:** In v12.0.2, In order to see this option during installation, run the following exportcommand before running the installation process.

``` {#codeblock_khq_qpk_rzb}
export ENABLE_DARK_LAUNCH_MONITORING=true
```



If configuring Grafana after installation, see the following topics:

-   [Configuring Grafana on Docker and Podman](adminui_grafana_config_docker.md)
-   [adminui\_grafana\_config\_kubernetes.md](adminui_grafana_config_kubernetes.md)

