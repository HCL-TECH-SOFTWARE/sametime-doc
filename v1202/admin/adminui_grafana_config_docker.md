# Configuring Grafana on Docker and Podman {#adminui_grafana_config_docker .task}

Grafana can be configured either during the installation process or post installation.

Prometheus is required

To include Grafana configuration during installation, run the following exportcommand before running the installation process.

``` {#codeblock_qzc_pw3_rzb}
export ENABLE_DARK_LAUNCH_MONITORING=true
```

You are then prompted during the install to enable Grafana: Do you want to enable monitoring?.

Port
:   The default port is 3001.

If adding Grafana post-installation,

1.  Click the **Grafana icon** \(![](Images/adminui_icon_grafana.png)\) .

2.  Add Prometheus as the data source.

    In the Grafana dashboard, click **Home** \> **Connections** \> **Data sources** \> **Add new data source**. Locate and select**Prometheus**.

3.  Open the Prometheus data source and edit the settings. Under the **HTTP** section, enter the following URL.

    ``` {#codeblock_sjt_gy1_mvb}
    http://host.docker.internal:9091
    ```

4.  Select **Save and test**. A message is displayed to confirm if the data source is working.

5.  Upload the Docker\_Sametime\_Dashboard.json file. For more information, contact [HCL Customer Support](https://hclpnpsupport.hcltech.com/csm).

6.  Select **Prometheus \(default\)** as data source and then select **Import**.

7.  Save the dashboard.

