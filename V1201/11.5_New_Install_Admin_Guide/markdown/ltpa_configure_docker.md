# Configuring LTPA in Docker {#ltpa_configure_docker .task}

This topic includes the steps to configure LTPA keys on Docker.

You must have already created a secret that contains your LPTA keys before you can compete this task. For more information on using WebSphere Liberty to generate LTPA keys, see [Generating LTPA keys](ltpa_generate_key.md).

If LTPA was not selected during the install process, you must add it to the sametime.ini file to use LTPA authentication. Edit the sametime.ini file and verify that `Ltpa` is included on the following line. If not, add it before continuing with configuring LTPA steps.

``` {#codeblock_ybv_dnd_35b}
STI_ST_BB_NAMES_ST_AUTH_TOKEN=Fork:Jwt, Ltpa
```

**Note:** There are two double underscores after STI and NAMES.

1.  Update the .env file to reflect the following attributes and values.

    ``` {#codeblock_jp3_pgj_k5b}
    
    ENABLE_LTPA=true
    LTPA_KEYS_FILE_PATH=key\_file\_path
    LTPA_KEYS=/ltpa-config/ltpa.keys
    LTPA_KEYS_PASSWORD=liberty\_server\_password
    ```

    The value for key\_file\_path must be the absolute path to the file. For example, if keys are in the ltpa.key file and in the /opt/hcl/sametime directory.

    ``` {#codeblock_enl_x15_j5b}
     LTPA_KEYS_FILE_PATH=/opt/hcl/sametime/ltpa.keys
    ```

2.  Update the custom.env file to include the following.

    ``` {#codeblock_kr3_gld_35b}
    STI_ST_BB_NAMES_ST_AUTH_TOKEN=Fork:Jwt,Ltpa
    ```

3.  Update the docker-compose.yml file to include the following.

    ``` {#codeblock_lfl_jld_35b}
    SAMETIME_EXTERNAL_WARINTEGRATION=true
    ```


**Parent topic:**[Setting up SSO using LTPA](enabling_sso_ltpa.md)

