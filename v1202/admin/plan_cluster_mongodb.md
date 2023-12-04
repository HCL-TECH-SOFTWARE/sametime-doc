# Configuring MongoDB for high availability {#plan_cluster_mongodb .task}

This topic covers the steps on how to configure MongoDB for high availability.

MongoDB clustering is handled during the installation process for both Docker and Kubernetes.

**Note:** In the MongoDB URL, if the user name or password includes the following characters, they must be converted by using a percent sign: / ? \# \[ \] : @.

**Parent Topic: **[Clustering and high availability](cluster_highavailability.md)

## Configuring MongoDB clustering on Docker {#ncl_ddm_x5b}

In the custom.env configuration file on the Sametime server, update the MONGO\_URL field. For information about how to create the MongoDB URL, see the [Connection String URI Format](https://docs.mongodb.com/manual/reference/connection-string/) topic in the MongoDB documentation.

## Configuring MongoDB clustering on Kubernetes {#nky_cdm_x5b}

1.  Provide a single node MongoDB information while running the prepareDeployment script.

2.  When the prepareDeployment process is complete, prepare your MongoDB cluster URL. For more details, see [Connection String URI Format](https://docs.mongodb.com/manual/reference/connection-string/).

3.  Use Base64 encoding to encrypt your MongoDB URL.

    You can review online websites that provide Base64 encoding or you can set up one on your own.

4.  Use the kubectl command to update the `sametime-meetings-global-secrets` secret configuration file.

    ```
    kubectl edit secret sametime-meetings-global-secrets
    ```

5.  Inside the `sametime-meetings-global-secrets`, locate the `MongoConnectionUrl` section. Replace the value for it with the value from step 3.

6.  Save your changes.


