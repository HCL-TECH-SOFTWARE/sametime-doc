# Enabling monitoring and statistics {#installation_sametime_grafana .task}

You can configure Grafana during the installation process provided it has been enabled. Alternately, Grafana can be configured post-installation.

To include Grafana configuration during installation, run the following exportcommand before running the installation process.

``` {#codeblock_khq_qpk_rzb}
export ENABLE_DARK_LAUNCH_MONITORING=true
```

You are then prompted during the install to enable Grafana: Do you want to enable monitoring?.

If configuring Grafana after installation, see the following topics:

-   [Configuring Grafana on Docker and Podman](adminui_grafana_config_docker.md)
-   [adminui\_grafana\_config\_kubernetes.md](adminui_grafana_config_kubernetes.md)

