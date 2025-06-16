# Converting chat history owner data from Domino directory to LDAP format {#t_dbutility_convertldap .task}

The convert feature of the Sametime Database utility changes all contact list information from the Domino Directory format to LDAP format.

Stop the Sametime server prior to running the Sametime Database utility. Refer to [Starting and stopping the Sametime server](starting_and_stopping_servers.md) for the steps.

The convert task changes all contact list information from Domino Directory format to LDAP format. Changing all contact list information from Domino directory format to LDAP format converts forward slashes in the hierarchical name to commas.

**Note:** This task can only be performed once because you can only convert the directory format one time.

1.  Create or edit a file that contains the environment variables.

    1.  Add the MongoDB access information to the file.

        ``` {#codeblock_yqb_lqy_ryb}
        
        MONGO_CONNECTION_URL=mongodb://sametimeUser:xxxxxxxx@192.168.1.1:27017/admin?authSource=admin&authMechanism=SCRAM-SHA-256&readPreference=primary&directConnection=true&ssl=false
        ```

        **Note:** When applicable, using the values indicated, add or insert a new line below the last line for every environment variable.

    2.  Add the following statement.

        ``` {#codeblock_zd5_try_ryb}
        TASK_LDAP=1
        ```

2.  Run the Database utility with the following command. The CSV file is mounted in the container in the /temp directory in the following example for the application to access and process. The tag attribute is the image tag to use.

    ``` {#codeblock_ykl_jsy_ryb}
    docker run -v /temp:/temp:rw --env-file env\_file\_name hclcr.io/st/sametime-db-utility:tag
    ```

3.  To verify your changes, view the report created in the data directory.


**Parent Topic:  **[Using the Sametime Database utility](c_dbutility.md)

