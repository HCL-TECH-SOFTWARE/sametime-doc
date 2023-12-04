# Changing MongoDB credentials in Sametime for Kubernetes and Openshift {#change_mongodb_credentials_kubernetes .task}

A connection URL is used to configure the Sametime and MongoDB connection. The connection URL tells Sametime how to connect to your MongoDB.

It contains information, such as the user name and password to access the database, MongoDB host name and more.

1.  Locate the MongoDB connection URL.

    For information on the connectoin URL, see [Connection String URI Format](https://www.mongodb.com/docs/manual/reference/connection-string/) topic in the MongoDB documentation.

    The MongoDB details are located in the string in the following format:

    ``` {#codeblock_dw4_bff_qxb}
    mongodb://sametime\_user:mongodb\_password@mongodb\_host:port/?replicaSet=replica\_set
    ```

    -   sametime\_user is the MongoDB user.
    -   mongodb\_password is the password used by the MongoDB user.
    -   mongodb\_host is the fully qualified host name of the MongoDB server.
    -   port is the port number used by MongoDB
    -   replica\_set is the replica set configured by MongoDB. If you followed the steps in the [Configuring MongoDB for Sametime](t_configure_mongodb.md) topic, rs0 is the replica set value used in the topic.
2.  After you have the MongoDB connection URL, run the following command to convert the connection URL to base64 encode value.

    ``` {#codeblock_q5b_3bf_qxb}
    echo -n connection\_url | base64
    ```

    Where connection\_url is the MongoDB connection URL.

3.  Change to the helm/templates directory where the templates are located.

4.  Open the sametime-secrets.yaml file for editing.

5.  Locate the `MongoConnectionUrl:` setting in the file. Replace the existing setting value with the updated base64 encoded value.

6.  Save and close the sametime-secrets.yaml file.

7.  Update the URL in the live configuration by editing the `sametime-global-secrets` secret.

    ``` {#codeblock_elc_ncf_qxb}
    kubectl edit secret sametime-global-secrets
    ```

    **Note:** If you have a namespace dedicated to Sametime, add the -n argument with your namespace to ensure it is created in the correct namespace.

8.  Press **i** to edit the secret.

9.  Locate the `MongoConnectionUrl:` setting. Replace the existing value with the updated base64 encoded value.

10. Press wq! to save the secret.

11. Restart the pods with the changes. Use the kubectl scale command to scale the pods to zero and then to one that have been changed. You must run the commands for each pod that the change affects.

    1.  Run the following command to scale the pod to zero.

        Scale the pod to zero, where pod\_deployment\_name is the pod name.

        ``` {#codeblock_cwz_mwc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=0
        
        ```

    2.  Run the following command to scale the pod to one.

        ``` {#codeblock_i2c_4wc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=1
        ```


For more information on Secrets see the topic: [https://help.hcltechsw.com/sametime/1201/admin/managing\_secrets\_kubernetes.html](https://help.hcltechsw.com/sametime/1201/admin/managing_secrets_kubernetes.html)

**Parent Topic: **[MongoDB](administering_mongodb.md)

