# Configuring the TURN server for Kubernetes {#turnserver_meetings_kubernetes .task}

You can configure the Sametime server to enable a TURN server on port 443 for Kubernetes.

**Note:** Running the script to prepare deployment prompts for TURN server configuration. The following process is to enable TURN post deployment. For more information, refer to [Preparing the deployment](t_meetings_configure_deployment.md).

1.  Update the values.yaml file with the following values. Ensure that the syntax for the YAML file is followed.

    ``` {#codeblock_opt_mnf_m5b}
    turnEnable: true
    globalModules: turncredentials
    turnHost:<turn host name>
    turnPort: 443
    turnTransport: tcp
    jvbTcpHarvesterDisabled: true
    ```

2.  Update the helm/templates/sametime-secrets.yaml file.

    Locate the TurnSecret variable and set the value to the base64 encoded secret as set in the TURN configuration.

    ``` {#codeblock_iyk_1w1_m5b}
    TurnSecret: <base64encoded secret as set in TURN configuration>
    ```

    **Note:** If you need to generate a base64 encoded secret, use the following command. Use the unencoded value provided in your TURN configuration.

    ``` {#codeblock_wzj_vv1_m5b}
    /bin/echo -n $(openssl rand -hex 32) | base64
    ```

3.  Run the helm update command to enable the configuration changes.


**Parent Topic:  **[Setting up a TURN server](turnserver_intro.md)

