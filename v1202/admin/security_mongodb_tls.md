# Setting up TLS for the Mongo database {#security_mongodb_tls .task}

You can update the MongoDB connection with the Sametime server to encrypt data flowing between the Sametime server and a TLS-enabled MongoDB. This step is optional but is recommended for [multi-Kubernetes-cluster deployments](https://www.mongodb.com/docs/kubernetes-operator/stable/multi-cluster-overview/#multi-cluster-overview-ref).

Ensure that the following conditions are met.

1.  You have a truststore. In Docker, you can have a single truststore for everything. Alternatively, you can create a truststore for every connection \(LDAP, SAML, etc.\). In Kubernetes, however, you must create a separate truststore for each connection. For more information, refer to [Creating a truststore with a third-party certificate](t_create_truststore.md).
2.  You have a valid TLS certificate. See [Creating a truststore with a third-party certificate](t_create_truststore.md) for the details.
3.  You have a TLS-enabled MongoDB server. For details, refer to the topic [Configure mongod and mongos for TLS/SSL](https://docs.mongodb.com/manual/tutorial/configure-ssl/) in the MongoDB documentation.

You can enable TLS on a connection to your MongoDB instance in two ways:

-   Adding a parameter in the connection string
-   Using a method in the MongoClientSettings.Builder class

This topic covers the first method. During Sametime Meeting installation, the chatlogging.ini file is created to contain MongoDB server connection information. The connection configuration information within the chatlogging.ini file must be modified to include parameters necessary to establish a secure connection.

The Sametime administrator can specify a custom connection URL to the MongoDB server. The CL\_MONGO\_URL configuration parameter can be set with a MongoDB server URL which includes the required settings for the Sametime server to establish a secure connection to the MongoDB server. After adding the CL\_MONGO\_URL configuration parameter to the chatlogging.ini file, the default setting is overridden by the settings contained within the URL string.

If a self-signed certificate is being used, the certificate must be added to the Sametime certificate store.

1.  Open the chatlogging.ini file which is in the HCL Notes data directory.

2.  Update or add the CL\_MONGO\_URL configuration parameter.

    This parameter is used to override existing configuration settings specified during installation. If changes were made post installation, this parameter exists in the file. If no changes have been made, add the parameter.

    ```
    CL_MONGO_URL=mongodb://user:password@hostname\_tcpip:port/tls\_information
    ```

    where:

    hostname\_tcpip
    :   The hostname or TCPIP address of the MongoDB server.

    port
    :   The port to be used for communication.

    tls\_information
    :   The attributes that identify use of a TLS MongoDB. Copy and past the following into the CL\_MONGO\_URL parameter.

        ```
         /admin?retryWrites=true&w=majority&ssl=true&tlsCAFile=/local/notesdata/cacert.pem
        ```

    For example:

    ```
    CL_MONGO_URL=mongodb://user:password@192.168.150.1:27017/admin?retryWrites=true&w=majority&ssl=true&tlsCAFile=/local/notesdata/cacert.pem
    ```

3.  Save the file and restart the Sametime server to apply the changes.


[Enable TLS for the Mongo database on Kubernetes](t_security_tls_mongodb_k8s.md) or [Enable TLS for the Mongo database on Docker or Podman](t_security_mongodb_tls_docker.md).

-   **[Verifying if TLS connection can be established](t_verify_tlsconnection.md)**  

-   **[Enabling TLS for the Mongo database on Kubernetes](t_security_tls_mongodb_k8s.md)**  

-   **[Enabling TLS for the Mongo database on Docker or Podman](t_security_mongodb_tls_docker.md)**  


**Parent Topic: **[Securing](securing.md)

