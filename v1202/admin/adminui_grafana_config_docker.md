# Configuring Grafana on Docker and Podman {#adminui_grafana_config_docker .task}

When installing Sametime, you have the option of enabling extra docker containers used for monitoring. When this is selected a specialized Grafana dashboard is created. If using a manual install or update process, Grafana can be configured as a post-installation task.

After Grafana is configured, port 3001 is the default port used for Grafana.

1.  Edit the custom.env file and add ensure that the following settings are set to true.

    ``` {#codeblock_h1v_rvk_rzb}
    ENABLE_GRAFANA_PROXY=true
    MONITORING_ENABLED=true
    ```

2.  Edit the monitoring.env file and add the Grafana administrator ID and password.

    ``` {#codeblock_rsp_rvk_rzb}
    GF_SECURITY_ADMIN_USER
    GF_SECURITY_ADMIN_PASSWORD
    ```

3.  For Docker, edit the .env file and add the following statement.

    ``` {#codeblock_nv4_lvk_rzb}
    COMPOSE_PROFILES=monitoring
    ```

    **Note:** If you are have enabled the Outlook addin, the `COMPOSE_PROFILES` statement looks like the following:

    ``` {#codeblock_bnr_m5p_rzb}
    COMPOSE_PROFILES=monitoring, outlookAddin
    ```

4. Restart the Sametime server to apply the changes.

      Docker:

       ``` docker compose up -d ```

      Podman:

       ``` podman-compose --profile monitoring up -d ```
