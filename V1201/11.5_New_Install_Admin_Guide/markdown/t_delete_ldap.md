# Deleting user IDs {#t_delete_ldap .task}

Stop the Sametime server prior to running the Sametime database utility. Refer to [Starting and stopping the Sametime server](starting_and_stopping_servers.md) for the steps.

To remove specified individual contact names from contact lists and privacy lists, follow these steps:

1.  Using a text editor, create a CSV file for only one type of change. You cannot mix name change types in the same CSV. Follow the syntax below. The file must be saved in UTF-8 format.

    ``` {#codeblock_dwv_b4b_nvb}
    Delete
    uid
    ```

    For example,

    ``` {#codeblock_jth_24b_nvb}
    DELETE
    uid=John Deere,ou=sametime,dc=hcl,dc=com
    uid=Marta Smith,ou=sametime,dc=hcl,dc=com
    cn=portaladminid,o=example.com 
    ```

2.  Copy the CSV file into an accessible read or writable location.

3.  Edit the .env file used to contain the environment variables. Follow the syntax below.

    ``` {#codeblock_ewv_b4b_nvb}
    MONGO_CONNECTION_URL=mongodb://sametimeUser:xxxxxxxx@192.168.1.1:27017/admin?authSource=admin&authMechanism=SCRAM-SHA-256&readPreference=primary&directConnection=true&ssl=false
    USER_ID_CSV=/data/test_id.csv
    ```

4.  Run the command below manually on a stand-alone community server or on a server in a cluster which replicates the change throughout the cluster. The CSV file is mounted in the container for the application to access and process.

    ``` {#codeblock_ub4_5nk_nvb}
    docker run -v <path-to-data-directory>:<path-to-data-directory>:rw --env-file default.env hclcr.io/st/sametime-db-utility
    ```


Verify if the changes have been applied. For more information, refer to [Sametime DB Utility reporting](t_verify_namechange.md).

**Parent topic:**[Updating Sametime data in MongoDB](t_namechangeutility.md)

