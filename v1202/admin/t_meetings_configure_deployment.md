# Preparing the deployment {#t_meetings_configure_deployment .task}

This section provides information on how to configure secrets for deployment.

1.  Run the following script to prepare the deployment.

    ``` {#codeblock_v5q_bk4_m5b}
    ./prepareDeployment.sh
    ```

    LDAP server host
    :   Enter the fully qualified host name or the IP address of the LDAP server.

    LDAP server port
    :   Enter the port used by LDAP.

    Configure advanced LDAP settings
    :   -   Enter Y to configure advanced LDAP settings. Provide the following information.
    -   LDAP bind user name
    -   LDAP bind password
    -   LDAP base DN for searching users
    -   LDAP base DN for searching groups
-   Enter N to bypass the above prompts. This option results in an anonymous LDAP connection and sets the default settings for searching.
    Sametime server name
    :   Enter the fully qualified Sametime server name. This value needs to be the fully qualified host name of the Sametime server. If you are separating host names for meeting and chat, enter the meeting host name.

    Server domain name
    :   Enter the server domain name. This should be the DNS suffix of the host name of the server.

    Video bridge IP address
    :   Enter the video bridge IP address. When left empty, the system automatically scans and populates the field with the discovered IP address.

    Base64 encoded secret
    :   Enter the Base64 encoded `JWT_SECRET` from the Sametime deployment. If migrating from another version of Sametime, you can re-use your existing secret. Otherwise, leave blank and press **Enter** to generate a new one.

    Mongo host
    :   Enter the fully qualified host name of your MongoDB server. The default value is mongo. If you have more than one host, provide any of the hosts. You can provide the rest later on when prompted.

    Mongo port
    :   Enter the MongoDB port. The default value is 27017.

    Mongo admin user name
    :   Enter the Mongo administrator user name.

    Mongo admin user password
    :   Enter the Mongo administrator password

    MongoDB connection URL
    :   The default Mongo connection URL is `[($TEMP_URL)]`. Would you like to override? \[Y/N\]

    :   -   Enter Y if you have a MongoDB cluster with more than one host name. This allows you to enter your own MongoDB URL that includes the 3 host names.

    ``` {#codeblock_tzj_jqv_m5b}
    mongodb://<user>:<password>@<server1>:<port>,<server2>:<port>,<server3>:<port>
    ```

-   Enter N to use the default value.
    TURN server address
    :   Leave blank if you are not using TURN. Otherwise, enter the fully qualified host name of the TURN server. For more information, refer to [Configuring the TURN server for Docker and Podman](turnserver_meetings_docker.md) and [Configuring the TURN server for Kubernetes](turnserver_meetings_kubernetes.md).

    Configure LTPA
    :   Lightweight Third-Party Authentication \(LTPA\) is useful for achieving single sign-on with HCL Domino \(including HCL Verse and iNotes\), HCL Connections, HCL Digital Experience, and IBM WebSphere Application Server. The default value is N.

    :   To configure LTPA, enter Y and provide the following information.

        -   The full path to the LTPA keys file. This should be the full path on the machine where the `prepareDeployment.sh` script is running. For example: /tmp/ltpa.keys
        -   LTPA keys password
    :   For more information, refer to [Setting up SSO using LTPA](enabling_sso_ltpa.md).

    Enable Octo
    :   Octo allows you to extend the audio-video traffic to another network in an efficient way. If enabled, at least one other secondary cluster must be configured in order for this to work. To enable octo, enter Y. The following prompts are displayed. For more information, refer to [Deploying multiple videobridges in different locations](t_configure_jitsi.md).

        -   Is this a primary installation?
            -   Select **Yes** to set this instance as the primary server. For primary servers, you must provide the region name. Enter the name of the primary region.
            -   Select **No** to set this instance as a regional server. For regional servers, you must provide the region name. Enter the secondary region name.
                -   If no, you must enter the fully qualified host name of your primary installation. Provide the following information.
                    -   Prosody host from primary installation
                    -   Meeting location secret in base64 from primary installation
                    -   JVB authentication password in base64 from primary installation

                        **Note:** On your primary cluster, run this script to obtain the values for the meeting location secret and JVB authentication password.

                        ``` {#codeblock_pdy_r1l_z5b}
                        kubectl get secret sametime-global-secrets -o yaml | grep -E 'MeetingLocationSecret|JvbAuthPassword'
                        ```

2.  Change directories to helm.

3.  Open values.yaml for editing.

4.  Locate the setting `hclImageRegistry:` and then set the value to your image repository name. If you are using a secret to access the image repository, then set the `hclImagePullSecret` value with the name of the secret for the image repository.

    This is the Docker repository where the Sametime Docker images are located. If you use a cloud provider image registry or your own private registry, you should update this setting to the base name of that image registry. The default is [http://hclcr.io/st](http://hclcr.io/st) and assumes that you have executed the `./load.sh` script with its default configuration on each Kubernetes node.

5.  Locate the setting `sametimeClaim`. This is the name of the persistent storage volume claim that is used by recordings, proxy, files, and backgrounds for storage.

    You can also modify other values at this time to enable, disable, or configure features.

6.  Save and close values.yaml.


**Parent Topic: **[Installing Sametime in a Kubernetes environment](installation_sametime_kubernetes.md)

