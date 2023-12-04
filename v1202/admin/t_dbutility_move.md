# Moving users {#t_dbutility_move .task}

The move feature of the Sametime Database utility allows you to move users from one organization to another.

Stop the Sametime server prior to running the Sametime Database utility. Refer to [Starting and stopping the Sametime server](starting_and_stopping_servers.md) for the steps.

The following is the format for the update task in the CVS file. Each ID to be updated is listed on a separate line. The syntax for the update task in the CVS files is:

``` {#codeblock_hnz_1bs_ryb}
ORGANIZATION
"current\_org","new\_org"
```

CSV files are case-sensitive and sensitive to spaces.

1.  Create a CSV file. The file must be saved in UTF-8 format.

    In the CVS file, specify the ORGANIZATION descriptor followed by the UIDs to be deleted. Specify each UID on a separate line.

    ``` {#codeblock_h5c_d2s_ryb}
    
    ORGANIZATION
    "existing\_organization","new\_organization"
    ```

    For example,

    ``` {#codeblock_hgk_k2s_ryb}
    
    ORGANIZATION
    "lotus","ibm" 
    ```

2.  Copy the CSV file into an accessible read or writable location.

3.  Create or edit a file that contains the environment variables.

    1.  Add the MongoDB access information to the file.

        ``` {#codeblock_exm_trr_ryb}
        MONGO_CONNECTION_URL=mongodb://username:password@ip-address:port​
        ```

    2.  Add the location of the CVS file.

        ``` {#codeblock_all_xrr_ryb}
        DELETE_CSV=/temp/test_delete.csv
        ```

    3.  To delete the chat history of the affected IDs, add the following line.

        ``` {#codeblock_q5h_1sr_ryb}
        DEEP_DELETE=1
        ```

    The following is an example env\_file\_name file.

    ``` {#codeblock_k4g_qgx_ryb}
    
    MONGO_CONNECTION_URL=mongodb://sametimeUser:xxxxxxxx@192.168.1.1:27017/admin?authSource=admin&authMechanism=SCRAM-SHA-256&readPreference=primary&directConnection=true&ssl=false
    DELETE_CSV=/temp/test_delete.csv
    DEEP_DELETE=1
    ```

4.  Run the Database utility using the following command. The CSV file is mounted in the container in the /temp directory in the following example for the application to access and process. The tag attribute is the image tag to use.

    ``` {#codeblock_ub4_5nk_nvb}
    docker run -v /temp:/temp:rw --env-file env\_file\_name.env hclcr.io/st/sametime-db-utility:tag
    ```

5.  To verify your changes, view the report created in the data directory.


**Parent Topic: **[Using the Sametime Database utility](c_dbutility.md)

