# Configuring SAML on Docker and Podman {#enabling_saml_docker .task}

A truststore is needed for Sametime to decrypt SAML tokens. For information on creating a samltruststore.p12 file, see [Creating a truststore with a third-party certificate](t_create_truststore.md).

The IdP URL is defined in the configuration. See [Setting up SSO using SAML](enabling_sso_saml.md) for information on determining the IdP URL value.

The changes in this task affect the following pods:

-   community

The steps in the following procedure must be completed with root access or you can use sudo which allows you to run commands as root.

The Docker and Podman commands are similar. The only difference is that docker precedes the command when issued in a Docker environment and podman precedes the name in a Podman environment. Example commands used in the Sametime documentation are shown using Docker. For Podman, change docker to podman.

1.  Change directories to the root directory where the Sametime installation package was decompressed.

2.  Place the samltruststore.p12 file in the directory where the docker-compose.yml file is located.

3.  Create a file with the name saml.env.

    ``` {#codeblock_n3n_tcq_k5b}
    vi saml.env
    ```

4.  Add the following lines to the saml.env file.

    ``` {#codeblock_crt_vcq_k5b}
    
    STI__Config__STSAML_TRUST_STORE_TYPE=p12  
    STI__Config__STSAML_TRUST_STORE_FILE=/local/notesdata/samltruststore.p12 
    STI__Config__STSAML_TRUST_STORE_PASSWORD=samltruststorepass 
    ```

5.  Open the docker-compose.yml file for editing.

    1.  Locate the `env_file:` section under the `community:` subsection within the `services:` section.

    2.  Move `custom.env` to a new line.

    3.  Add the following line below `custom.env`.

        ``` {#codeblock_ybs_j24_k5b}
        saml.env
        ```

        The results should look like the following:

        ``` {#codeblock_tc5_l24_k5b}
        
        services:
            community:
              env_file: 
                - custom.env
                - saml.env
              environment:
        
        ```

6.  Add a path to the SAML trust store.

    -   If you do not have a `volumes` section in the docker-compose.yml file, create one under the `networks` section and add the following line to the section.
    -   If you already have a `volumes` section, add the following line to the section.
    ``` {#codeblock_pvw_w3x_k5b}
    - ./samltruststore.p12:/local/notesdata/samltruststore.p12 
    ```

    The section should look like the following example. Ensure that the indentations look like the example.

    ``` {#codeblock_qvw_w3x_k5b}
    
    networks:
      - sametime.test
    volumes:
      - ./samltruststore.p12:/local/notesdata/samltruststore.p12
    ```

7.  Update the custom.env file to include the IdP URL as well as the authentication options.

    Authentication options to include are: Jwt, Ltpa, and Saml. If you are uncertain of the value to use for your IdP URL, see [Setting up SSO using SAML](enabling_sso_saml.md) for details. For example:

    ``` {#codeblock_scg_rsh_ywb}
    STI__ST_BB_NAMES__ST_AUTH_TOKEN=Fork:Jwt,Ltpa,Saml
    IDP_URL=https://idp.example.com/example_tenant&appid=1234?TARGET=https://sametime.example.com/chat
    ```

    **Note:** The TARGET parameter is for the re-direct after a SAML assertion is posted back to Sametime after it has been validated. Ensure that the target points back to the chat host name or chat \(as the example shows\).

8.  Open the .env file for editing, and then add the STCONF\_IDPURL parameter.

    For example:

    ``` {#codeblock_ohf_3xb_wxb}
    STCONF_IDPURL=https://idp.example.com/example_tenant&appid=1234?TARGET=https://sametime.example.com/chat
    ```

9.  Start the Sametime server to apply the changes.

    ``` {#codeblock_btc_lj4_k5b}
    docker compose up -d
    
    ```


**Parent Topic: **[Setting up SSO using SAML](enabling_sso_saml.md)

