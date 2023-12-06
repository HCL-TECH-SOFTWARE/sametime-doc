# Configuring the LTPA token expiry interval on Docker or Podman {#t_configure_ltpa_duration_docker .task}

LTPA tokens expire by design. In the process of enabling LTPA, you can define the amount of time after which a token expires in minutes. When necessary, you can update the token expiration interval again after the value has been defined during enablement.

The following conditions must be satisfied.

-   LTPA must be enabled. For more information, refer to [Configuring LTPA in Docker or Podman](ltpa_configure_docker.md).
-   Ensure that the LTPA token created when you sign in to Sametime chat allows access to other Domino applications until the expiration time has elapsed.

1.  Open the .env file for editing.

2.  Update the value of `LTPA_DURATION_MINUTES`. Specify the duration in this format:

    ``` {#codeblock_rxw_5tb_fxb}
    LTPA_DURATION_MINUTES=<minutes_token_valid>
    ```

    The following example shows `LTPA_DURATION_MINUTES` set to 90 minutes.

    ``` {#codeblock_zz3_x4l_gxb}
    LTPA_DURATION_MINUTES=90
    ```

3.  Add or update the value of `JWT_ACCESS_DURATION_MINUTES`. Specify the duration in this format:

    ``` {#codeblock_dkb_vz2_gxb}
    JWT_ACCESS_DURATION_MINUTES=minutes_token_valid
    ```

    The following example shows `JWT_ACCESS_DURATION_MINUTES` set to 30 minutes.

    ``` {#codeblock_r2x_npl_gxb}
    JWT_ACCESS_DURATION_MINUTES=30
    ```

4.  Save the changes.

5.  Start the Sametime server to apply the changes.

    ``` {#codeblock_btc_lj4_k5b}
    docker compose up -d
    
    ```


**Parent Topic:  **[Setting up SSO using LTPA](enabling_sso_ltpa.md)

