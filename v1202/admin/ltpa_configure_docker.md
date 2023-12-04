# Configuring LTPA in Docker or Podman {#ltpa_configure_docker .task}

This topic includes the steps to configure LTPA keys on Docker.

1.  Update the .env file to reflect the following attributes and values.

    ``` {#codeblock_jp3_pgj_k5b}
    
    ENABLE_LTPA=true
    LTPA_KEYS_FILE_PATH=key\_file\_path
    LTPA_KEYS=/ltpa-config/ltpa.keys
    LTPA_KEYS_PASSWORD=liberty\_server\_password
    LTPA_DURATION_MINUTES=minutes\_token\_valid
    ```

    The value for key\_file\_path must be the absolute path to the file. For example, if keys are in the ltpa.key file and in the /opt/hcl/sametime directory.

    ``` {#codeblock_enl_x15_j5b}
    LTPA_KEYS_FILE_PATH=/opt/hcl/sametime/ltpa.keys
    ```

    The value of LTPA\_DURATION\_MINUTES must be the same as the value for the Domino web SSO token expiration.

2.  Update the custom.env file to include the following.

    ``` {#codeblock_kr3_gld_35b}
    STI__ST_BB_NAMES__ST_AUTH_TOKEN=Fork:Jwt,Ltpa
    ```

3.  Update the docker-compose.yml file to include the following.

    ``` {#codeblock_lfl_jld_35b}
    SAMETIME_EXTERNAL_WARINTEGRATION=true
    ```

4.  **Optional:** If integrating with Connections and using a realm, add the realm name to the .env. For more information on integrating with Connections, see [Integrating with HCL Connections](ltpa_configure_connections.md).

    ``` {#codeblock_wgm_dq4_jyb}
    LTPA_REALM=<realmname>
    ```


**Parent Topic: **[Setting up SSO using LTPA](enabling_sso_ltpa.md)

