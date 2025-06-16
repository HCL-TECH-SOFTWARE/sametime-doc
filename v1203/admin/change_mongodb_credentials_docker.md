# Changing MongoDB credentials in Sametime for Docker and Podman {#change_mongodb_credentials_docker .task}

1.  Edit the custom.env file and locate the MONGO\_URL parameters in the file.

    Sametime configures the MongoDB details in a Mongo URL, for example:

    ``` {#codeblock_hcx_xb5_cyb}
    
    mongodb://sametime_user:mongodb_password.mongodb_host:port
    ```

    where:

    -   sametime\_user is the name of the MongoDB used by the MongoDB user.
    -   mongodb\_password is the password used by the MongoDB user.
    -   mongodb\_host is the fully qualified host name of the MongoDB server.
    -   port is the port number used by MongoDB.
	
2.  Update the MONGO\_URL values to the new user and password.

3.  Save the changes.

4.  Start the Sametime server to apply the changes.

    ``` {#codeblock_btc_lj4_k5b}
    docker compose up -d
    
    ```


**Parent Topic:  **[MongoDB](administering_mongodb.md)

