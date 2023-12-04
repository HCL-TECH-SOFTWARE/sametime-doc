# Securing LDAP on Docker or Podman {#securing_ldap_docker .task}

This topic covers the steps to import your LDAP trust store and password into Docker as a secret, then define the secret in the Sametime configuration.

Before getting started, create a trust store with the LDAP certificate from the LDAP server. Name the file ldaptruststore.p12 and place it into the directory where the docker-compose.yml file is located.

The steps in the following procedure must be completed with root access or you can use sudo which allows you to run commands as root.

1.  Change directories to the root directory where Sametime installation package was decompressed.

2.  Create a new file called tlsldap.env.

    ``` {#codeblock_jxd_vhj_k5b}
    vi tlsldap.env
    ```

3.  Add the following lines into the tlsldap.env file.

    ``` {#codeblock_kt5_xhj_k5b}
    
    STI__Config__STLDAP_TLS_TRUST_STORE_TYPE=p12 
    STI__Config__STLDAP_TLS_TRUST_STORE_FILE=/local/notesdata/ldaptruststore.p12 
    STI__Config__STLDAP_TLS_TRUST_STORE_PASSWORD=ldaptruststorepass
    ```

4.  Open the docker-compose.yml for editing.

    1.  Locate the `env_file:` section under the `community:` subsection within the `services:` section.

    2.  Move `custom.env` to a new line.

    3.  Add the following line below `custom.env`.

        ``` {#codeblock_ybs_j24_k5b}
         tlsldap.env
        ```

        The results should look like the following:

        ``` {#codeblock_tc5_l24_k5b}
        
        services:
            community:
              env_file: 
                - custom.env
                - tlsldap.env
              environment:
        
        ```

5.  Add a path to the LDAP trust store under the `community:` section in the docker-compose.yml file.

    -   If you do not have a volumes section, create one under the `networks` section and add the following line.
    -   If you already have a `volumes` section, add the following line to the section.
    ``` {#codeblock_gt3_x24_k5b}
    - ./ldaptruststore.p12:/local/notesdata/ldaptruststore.p12 
    ```

    The section should look like the following example. Ensure that the indentations look like the example.

    ``` {#codeblock_zb1_bf4_k5b}
    
    networks:
      - sametime.test
    volumes:
      - ./ldaptruststore.p12:/local/notesdata/ldaptruststore.p12
    ```

6.  Start the Sametime server to apply the changes.

    ``` {#codeblock_btc_lj4_k5b}
    docker compose up -d
    
    ```


**Parent Topic: **[Securing connections between Sametime servers and LDAP](securing_connections_sametime_community_and_ldap.md)

