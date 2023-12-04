# Setting up a replica set with keyfile access control {#t_create_mongo_replset .task}

Deploying a replica set with keyfile authentication is an important part of setting up a secure MongoDB cluster. This topic covers the said procedure as it applies to Sametime with MongoDB 6.0. For a detailed discussion on the topic and information regarding setup considerations, refer to the [official MongoDB documentation](https://www.mongodb.com/docs/manual/tutorial/deploy-replica-set-with-keyfile-access-control/).

Ensure that the following security settings have been configured.

-   [Internal Authentication](https://www.mongodb.com/docs/manual/core/security-internal-authentication/)—Security between members of the replica set.
-   [Role-Based Access Control](https://www.mongodb.com/docs/manual/core/authorization/)—Security between connecting clients and the replica set.

Keyfile authentication requires each node in the replica set to have a shared keyfile that is used to authenticate each node to the others. Keyfile authentication is a powerful tool for securing a MongoDB cluster.

**Note:** As a best practice, use DNS hostnames instead of IP addresses when configuring replica set members or sharded cluster members and when configuring clusters across a split network horizon. Starting in MongoDB 5.0, nodes that are only configured with an IP address fail startup validation and do not start.

To set up a replica set with keyfile access control for Sametime, do the following.

1.  Generate a keyfile. Run the following command using `openssl`.

    ``` {#codeblock_bhc_sb2_3yb}
    openssl rand -base64 756 > /var/lib/mongo/keyfile
    chown mongod:mongod /var/lib/mongo/keyfile
    chmod 400 /var/lib/mongo/keyfile
    ```

2.  Distribute the keyfile to each node in the replica set. This can be done manually, by copying the keyfile to each node, or using a config file with the shared keyfile path. See the [official MongoDB documentation](https://www.mongodb.com/docs/manual/tutorial/deploy-replica-set-with-keyfile-access-control/) for storage medium recommendations.

    **Note:** Only the owner of the file can access the keyfile while running the [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) instances.

3.  Update the MongoDB configuration file on each node to include the replica set name and the list of other members in the replica set.

    -   Enforce both [Internal/Membership Authentication](https://www.mongodb.com/docs/manual/core/security-internal-authentication/) and [Role-Based Access Control](https://www.mongodb.com/docs/manual/core/authorization/):
    -   If using the [`security.keyFile`](https://www.mongodb.com/docs/manual/reference/configuration-options/#mongodb-setting-security.keyFile) configuration file, do the following.
        1.  Define the keyfile path and replica set name in the configuration file. Include additional options as applicable.

            ``` {#codeblock_anx_d1l_3yb}
            security:
              keyFile: /var/lib/mongo/keyfile
            replication:
              replSetName: rs0
            net:
               bindIp: localhost,<hostname(s)|ip address(es)>
            ```

        2.  Run the following command.

            ``` {#codeblock_vhn_fgl_3yb}
            mongod --config <path-to-config-file>
            ```

    -   If using the `--keyFile` command-line option, do the following:
        1.  Define the keyfile path and replica set name in the following command. Include additional options as applicable.

            ``` {#codeblock_th2_31l_3yb}
            mongod --keyFile <path-to-keyfile> --replSet <replicaSetName> --bind_ip localhost,<hostname(s)|ip address(es)>
            ```

            Where the keyfile path is `/var/lib/mongo/keyfile` and the replica set name is `rs0`.

4.  Over the localhost interface, launch mongosh and connect to one of the mongod instances. Run mongosh on the same physical machine as the mongod instance.

    **Note:** The localhost interface is solely accessible in the absence of any users created for the deployment.

5.  Initiate the replica set.

    1.  From mongosh, run the following method. This procedure selects and assigns one of the members to be the primary.

        **Note:** Ensure that you are running `rs.initiate(` in only one mongod instance for the replica set.

        ``` {#codeblock_kkc_s2l_3yb}
        rs.initiate(
          {
            _id : "myReplSet",
            members: [
              { _id : 0, host : "mongo1.example.net:27017" },
              { _id : 1, host : "mongo2.example.net:27017" },
              { _id : 2, host : "mongo3.example.net:27017" }
            ]
          }
        )
        ```

    2.  Connect to the primary member. To locate the primary member, run `rs.status()`.
6.  Create users. For more information, refer to [Configuring MongoDB for Sametime](t_configure_mongodb.md).


**Parent Topic: **[Installing MongoDB](installation_mongodb.md)

