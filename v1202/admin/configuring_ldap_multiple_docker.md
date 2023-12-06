# Configuring additional LDAP servers on Docker and Podman {#configuring_ldap_multiple_docker .task}

You can configure the Sametime server to connect to two or more LDAP servers.

When you connect to more than one LDAP server, it is important for the names to be unique. If you are trying to achieve high availability to the same directory, use a load balancer to front-end the connection between the multiple LDAP servers.

-   Configure the cluster for the first LDAP server. This must be done when the cluster was installed.
-   You must know the host name, port and optional bind credentials for each LDAP server.
-   If you are using a secure connection to LDAP, the LDAP server’s certificate for each server must be stored in the same .p12 trust store file. You must create a secret containing the trust store that holds each LDAP server’s certificate.

The Docker and Podman commands are similar. The only difference is that docker precedes the command when issued in a Docker environment and podman precedes the name in a Podman environment. Example commands used in the Sametime documentation are shown using Docker. For Podman, change docker to podman.

When more than one LDAP is defined in an environment, they are searched in the order defined in the StCommunityConfig.xml and UserInfoConfig.xml files. When you define each LDAP server, the order in which they are listed in the configuration is the same order in which they are searched.

The process described in this procedure involves copying the StCommunityConfig.xml and UserInfoConfig.xml files from the Sametime community \(chat\) container. These copied configurations overrides the default LDAP configuration settings. The LDAP servers are defined within each configuration file.

Docker-compose commands are used to pull the existing configuration files from the Sametime server to your local machine. Modify these files locally with the required settings, then add a volume under the community section of the docker-compose.yml file to enable the modified settings.

This procedure is to configure Sametime to connect to two or more separate LDAP servers that have unique names.

1.  Change to the sametime\_installation\_directory directory.

2.  Identify the chat-server container ID by running the command 'docker container ls' and finding the chat-server IMAGE. The NAME is the container name, as an example: sametime-community-1.

3.  Pull a copy of the StCommunityConfig.xml and UserInfoConfig.xml from the chat-server container by running the below command, where container\_name is the container name for the chat-server identified in step 2.

    ``` {#codeblock_zqq_1py_mvb}
    
    docker cp <container_name>:/local/notesdata/UserInfoConfig.xml . 
    
    ```

    ``` {#codeblock_jvp_hpy_mvb}
    
    docker cp <container_name>:/local/notesdata/StCommunityConfig.xml .
    ```

4.  Find the base64 encoded value of your bind credentials. If you are using an authenticated bind, issue the following command in a Linux shell that contains your user name and password separated by a colon. The resulting value is used in a later step.

    ``` {#codeblock_atj_jpy_mvb}
    echo -n “username:password” | base64 -d
    ```

    If the Bind DN is CN=bind,O=Example and the password is password, then the command is:

    ``` {#codeblock_pcw_npy_mvb}
    echo -n “CN=bind,O=Example:password” | base64 -d 
    ```

5.  Open your local copy of the UserInfoConfig.xml file for editing.

6.  Duplicate the line that begins with `StorageDetails`.

7.  The order in which you list your `StorageDetails` statement is the search order to be used.

    HostName
    :   The fully qualified host name or IP address of the second LDAP server.

    Port
    :   If using unsecured LDAP, specify the port number used by LDAP. If you are using secure LDAP, you don't need to modify this field.

    UserName
    :   Set this field to empty double-quotes \( “” \).

    Password
    :   Set this field to empty double-quotes \(“”\). If using an authenticated bind, add a new parameter after UserName and Password called UserEncodedAuth= and set it to the value that was determined in a previous step.

    BaseDN
    :   Define a base DN for searching the directory. If left blank, the entire directory is searched.

    SearchFilter
    :   SearchFilter Modify the search filter if needed. The defaults work well with Domino LDAP.

    You can make other changes to the business cards configuration if needed at this time.

8.  When finished, save and close the UserInfoConfig.xml file.

9.  Edit the StCommunityConfig.xml file with a text editor and make the following changes.

    1.  Within the <LDAP\> section, duplicate the line that begins with <Connection Hostname.

    2.  Modify the new line to contain the details of the second LDAP server.

    3.  Modify the SearchOrder parameter for the additional LDAP server to a unique number. This must match the search order you selected for UserInfoConfig.xml.

10. Save and close the StCommunityConfig.xml file.

11. Edit the docker-compose.yml by adding the following under the community section:

    ``` {#codeblock_jtx_tqy_mvb}
    
    volumes:
      - ./StCommunityConfig.xml:/local/notesdata/StCommunityConfig.xml
      - ./UserInfoConfig.xml:/local/notesdata/UserInfoConfig.xml 
    ```

12. Start the Sametime server to apply the changes.

    ``` {#codeblock_btc_lj4_k5b}
    docker compose up -d
    
    ```


**Parent Topic:  **[Configuring LDAP](configuring_ldap.md)

