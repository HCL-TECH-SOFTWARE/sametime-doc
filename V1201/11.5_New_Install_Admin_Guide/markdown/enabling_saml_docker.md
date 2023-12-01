# Configuring SAML on Docker {#enabling_saml_docker .task}

Before getting started, create a trust store with the LDAP certificate from the LDAP server. Name the file ldaptruststore.p12 and place it into the directory where the docker-compose.yml file is located.

The steps in the following procedure must be completed with root access or you can use sudo which allows you to run commands as root.

1.  Change directories to the root directory where the Sametime installation package was decompressed.

2.  Create a file with the name saml.env.

    ``` {#codeblock_n3n_tcq_k5b}
    vi saml.env
    ```

3.  Add the following lines to the saml.env file.

    ``` {#codeblock_crt_vcq_k5b}
    
    STI__Config__STSAML_TRUST_STORE_TYPE=p12  
    STI__Config__STSAML_TRUST_STORE_FILE=/local/notesdata/samltruststore.p12 
    STI__Config__STSAML_TRUST_STORE_PASSWORD=samltruststorepass 
    ```

4.  Open the docker-compose.yaml file for editing. Locate the env\_file: parameter in the file and move custom.env to a new line. Add saml.env to the next line after custom.env.

    ``` {#codeblock_b51_h3x_k5b}
    
    env_file: 
     - custom.env
     - saml.env
    
    ```

5.  Add a path to the SAML trust store.

    -   If you do not have a volumes section in the docker-compose.yml file, create one under the networks section and add the following line to the section.
    -   If you already have a volumes section, add the following line to the section.
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

6.  Start the Sametime server to apply the changes.

    ``` {#codeblock_btc_lj4_k5b}
    docker-compose up -d
    
    ```


**Parent topic:**[Setting up SSO using SAML](enabling_sso_saml.md)

