# Verifying if TLS connection can be established {#t_verify_tlsconnection .task}

To verify if the TLS connection can be established, do the following.

1.  Edit the custom.env file and locate the MONGO\_URL parameters in the file.

    Sametime configures the MongoDB details in a Mongo URL, for example:

    ``` {#codeblock_bdw_fwb_5yb}
    mongodb://sametime\_user:mongodb\_password.mongodb\_host:port
    ```

    where:

    -   sametime\_user is the name of the MongoDB used by the MongoDB user.
    -   mongodb\_password is the password used by the MongoDB user.
    -   mongodb\_host is the fully qualified host name of the MongoDB server.
    -   port is the port number used by MongoDB.
2.  Add the following parameter to the Mongo URL.

    ``` {#codeblock_v14_5xb_5yb}
    tlsAllowInvalidCertificates=true
    ```

    **Note:** Only use the option on systems where intrusion is not possible. This step bypasses the certificate check on the client side and is a viable option if both MongoDB and the Sametime components are all *on the same host*. Doing this step assumes that there would be no traffic on the network and there is no possibility of the mongo hostname being hijacked in DNS. For more information, refer to the [official MongoDB documentation](https://www.mongodb.com/docs/manual/reference/connection-string/#mongodb-urioption-urioption.tlsAllowInvalidCertificates).

3.  Save the changes.


**Parent Topic:  **[Setting up TLS for the Mongo database](security_mongodb_tls.md)

