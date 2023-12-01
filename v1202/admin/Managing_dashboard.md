# Monitoring your meeting and chat metrics with Grafana® {#Managing_dashboard .task}

Sametime uses the third-party software, Grafana®, to generate insightful graphs and visualizations derived from time-series database \(TSDB\) data. This section covers the steps on how to use Grafana in your Sametime environment. ![](Images/Managing_dashboard_1.png)

There are two Dashboard JSON file in the build:

-   Docker\_Sametime\_Dashboard.json
-   K8\_Sametime\_Dashboard.json file

By default, the basic Grafana dashboard consists of four rows:

-   Overview
-   Chat Server
-   Chat Proxy
-   Meetings

Each row consist of panels giving chat and meetings information to the admin.

Currently, only users that have permission to view the monitoring dashboard are allowed access. Some configuration options require *admin* access to make changes to the dashboard. As an administrator, you can configure your dashboard to generate insights using certain specific information. Refer to [Dashboards](https://grafana.com/docs/grafana/latest/dashboards/) for the details.

-   **[Configuring Docker to run Grafana](t_grafana_docker.md)**  

-   **[Configuring Kubernetes to run Grafana](t_grafana_k8s.md)**  


**Parent topic:**[Configuring](configuring.md)

