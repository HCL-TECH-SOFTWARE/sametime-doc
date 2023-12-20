# Configuring Grafana dashboard {#adminui_grafana_config_console .task}

When using the managed charts to install Sametime, the Grafana dashboard is created. However, if using a manual install process, you can manually create the Grafana dashboard.

Before you can create your first dashboard, you need to add your data source. You must have Grafana administrator access to add data sources.

1.  Log into the Sametime Admin interface and click the **Grafana icon** \(![Grafana icon](Images/adminui_icon_grafana.png)\) to access the Grafana dashboard.

    If you have not logged into the dashboard, the login window displays. Enter your Grafana administrator credentials. If prompted for a new password, click **OK** and enter the new password

2.  From the left panel, click **+ Create** and select **Import**.

3.  Upload the JSON file.

    -   Docker\_Sametime\_Dashboard.json
    -   K8\_Sametime\_Dashboard.json
    The JSON files are included in the Sametime Premium install product image. After decompressing the product image, the files are in the root directory.

4.  Select **Prometheus \(default\)** as the data source and then select **Import**.

5.  Save the dashboard.


**Parent topic: **[adminui\_grafana\_overview.md](adminui_grafana_overview.md)

