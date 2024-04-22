# Hosting client files for Sametime on Docker or Podman {#example_preferences .task}

Sametime clients can be configured by administrators using a managed-settings.xml or managed-community-configs.xml file which is hosted by a web server. Additionally, the Sametime client can be pre-configured with settings such as the hostname, port, etc. The client package can be hosted on a web server for download. This topic has the steps to host files in the Sametime web container for Docker or Podman.

-   Ensure that you can access the client files and the Sametime server.
-   Prior to placing the managed-settings.xml or managed-community-configs.xml on Docker or Podman, open the file using a browser and ensure it is not producing any syntax errors. If errors are present, they should be resolved first.

The Docker and Podman commands are similar. The only difference is that docker precedes the command when issued in a Docker environment and podman precedes the name in a Podman environment. Example commands used in the Sametime documentation are shown using Docker. For Podman, change docker to podman.

1.  Shut down the Sametime server.

    ``` {#codeblock_rxs_k2h_15b}
    docker-compose down
    ```

2.  Run the following command to copy the managed-settings.xml or managed-community-configs.xml file into the sametime-config/web/downloads directory.

    ``` {#codeblock_vpc_t2h_1yb}
    cp SametimeClient.exe sametime-config/web/downloads/.
    ```

    The managed-settings.xml file must be named *managed-settings.xml*. If you require more than one managed-settings.xml file, you must place those files in different folders on the web server.

3.  **Optional:** Create additional directories in the downloads folder. For example, create a folder named `default` under that tree.

    ``` {#codeblock_bkr_hrn_jyb}
    sametime-config/web/downloads/default/
    ```

    The Sametime client looks in the folder specified in the policy for both a managed-settings.xml and a managed-community-configs.xml. If you are using both types of files, the URL defined in the policy must be scoped to the folder path where the two files reside.

    If you need to support multiple policies containing different managed-settings.xml and managed-community-configs.xml files, then place them in folders with different names.

    For example:

    ``` {#codeblock_ajh_m15_jyb}
    http://www.example.com/default 
    
    http://www.example.com/nomeetings
    ```

    **Note:** Do not use the following special characters in your folder names

    -   Ampersand \(&\)
    -   Apostrophe\(‘\)
    -   Quotation mark \(“\)
    -   Greater than character \(\>\)
    -   Less than character \(<\)
    -   backslash character \(\\\)
    -   Forward slash \(/\)
    -   spaces \( \)
    -   hash symbol \(\#\)

**Parent Topic:  **[Defining preferences in the managed-settings.xml file](config_client_xml_file.md)

