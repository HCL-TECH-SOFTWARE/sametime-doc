# Configuring Windows deployment to run Grafana {#adminui_grafana_config_windows .task}

Prometheus and Grafana are used to collect and monitor metrics relevant to the running Sametime server instance. Windows deployments of both of these applications are available, but it is also possible to configure an external instance of either or both applications, or configure existing instances of Prometheus with the Sametime scrape targets. External configuration is beyond the scope of this document, but the scrape target configuration can be observed in the `prometheus.yml` file referenced below.

## Prometheus

The Prometheus application can be run on Windows. Prometheus is distributed as a zip file, which should be extracted into some folder like `c:\Prometheus`. There are 3rd party mechanisms to run Prometheus as a Windows service, but by default, the Prometheus application on Windows does not install/run as a service. Deployment of Prometheus as a service is beyond the scope of this document, but is recommended to ensure it is always running and collecting metrics.

To configure prometheus, a default `prometheus.yml` file is provided in the `monitoring` folder in the Sametime installation directory. When you unzip the Windows Prometheus deployment into a directory, it will already have a default `prometheus.yml` config file. You may replace that file with the one from the Sametime installation or copy over only the scrape targets defined in Sametime using a text editor.

Run `prometheus.exe` from the directory where the `prometheus.yml` file was copied and it will load that file and register the defined scrape targets.

## Grafana

The Grafana service can be installed on Windows using a normal installation process. Installing Grafana itself is outside the scope of this document, but it is a straightforward process and results in an HTTP-only service accepting traffic on port 3000.

The steps below can then be used to configure Traefik from the Sametime deployment to serve as a reverse proxy to access Grafana via HTTPS which will allow the monitoring dashboard that ships with the Sametime server to be loaded directly on the Sametime Admin page.

1. Locate the traefik `dynamic.yaml` config file in the `traefik-windows-amd64\conf` folder of the Sametime installation and make the following edits:

    Add the following to the `routers:` section:

    ```
        router-grafana:
          rule: "PathPrefix(`/grafana`)"
          service: grafana-service
          entryPoints:
            - websecure
          tls: {} 
    ```

    Add the following to the `services:` section:

    ```
        grafana-service:
          loadBalancer:
            servers:
              - url: "http://127.0.0.1:3000"     
    ```

2. Grafana must be configured to `allow_embedding`, `serve_from_sub_path`, and the `root_url` must be configured to have `/grafana/` at the end.
    Assuming you have used the defaults on the Windows deployment of Grafana, you will have the file `c:\Program Files\GrafanaLabs\grafana\conf\defaults.ini`

    In there, you should find and configure each of the following:

    ```
    allow_embedding = true
    root_url = %(protocol)s://%(domain)s:%(http_port)s/grafana/
    serve_from_sub_path = true
    ```

3. You can log onto Grafana via https://yourserver.name/grafana and manually import the `Windows_Sametime_Dashboard.json` found in `monitoring` folder in the Sametime installation directory or alternatively, you can enable dashboard provisioning.

    To enable provisioning, edit the file `c:\Program Files\GrafanaLabs\grafana\conf\provisioning\dashboards\sample.yaml` and uncomment all of the lines, and update the path to point to the location of the dashboard in the Sametime installation directory. For example:

    ```
    # # config file version
    apiVersion: 1providers:
     - name: 'default'
       orgId: 1
       folder: ''
       folderUid: ''
       type: file
       options:
         path: c:\Program Files\HCL\Sametime\monitoring 
    ```

4. Restart the Grafana service for the provisioning to take affect


**Parent topic: **[Monitoring your meeting and chat metrics with Grafana](adminui_grafana_overview.md)

