# Updating user IDs {#t_namechange_docker .task}

Stop the Sametime server prior to running the Sametime database utility. Refer to [Starting and stopping the Sametime server](starting_and_stopping_servers.md) for the steps.

The ID task works by comparing existing user IDs with the names provided in the CSV list, and replacing the IDs when a match is found. By default, comparisons are case sensitive. The ID task allows case-insensitive comparisons of user IDs by adding NC\_ID\_TASK\_CASE\_INSENSITIVE=1 to the `sametime.ini` file. For more information, refer to [Managing client types and log-ins](st_adm_comm_manageclientlogin_c.md).

After installing the Sametime Server, you can find the Sametime database utility in the image repository. Any system with access to the image repository and the mongo server can run the utility.

1.  Using a text editor, create a CSV file for only one type of change. You cannot mix name change types in the same CSV. Follow the syntax below. The file must be saved in UTF-8 format.

    ``` {#codeblock_utc_chh_mvb}
    ID
    "old ID", "new ID"[,"new display name"]
    ```

    For example,

    ``` {#codeblock_hm4_hpb_nvb}
    ID
    "Maria Smith," "Maria Smith-Brown"[,"Maria Brown"]
    ```

    **Note:** The brackets \[ \] indicate that the new display name is optional. If you use it, you must precede it with a comma. The new display name must immediately follow the comma. Do not leave a blank space between the comma and the new display name.

2.  Copy the CSV file into an accessible read or writable location.

3.  Edit the .env file used to contain the environment variables. Follow the syntax below.

    ``` {#codeblock_zkj_bfh_mvb}
    MONGO_CONNECTION_URL=mongodb://sametimeUser:xxxxxxxx@192.168.1.1:27017/admin?authSource=admin&authMechanism=SCRAM-SHA-256&readPreference=primary&directConnection=true&ssl=false
    USER_ID_CSV=/data/test_id.csv
    ```

4.  Run the command below manually on a stand-alone community server or on a server in a cluster which replicates the change throughout the cluster. The CSV file is mounted in the container for the application to access and process.

    ``` {#codeblock_dgz_rnk_nvb}
    docker run -v <path-to-data-directory>:<path-to-data-directory>:rw --env-file default.env hclcr.io/st/sametime-db-utility
    ```


Verify if the changes have been applied. For more information, refer to [Sametime DB Utility reporting](t_verify_namechange.md). Below is a sample CSV showing changes from an LDAP directory:

``` {#codeblock_std_zmb_nvb}
ID
"CN=Maria Smith,OU=Sales,O=HCL",
	"CN=Maria Brown,OU=Sales,O=HCL",
	"Maria Brown"
"CN=John,OU=New York,O=HCL",
	"CN=John,OU=Texas,O=HCL"
"CN=Old Group,OU=groups,O=HCL",
	"CN=New Group Name,OU=groups,O=HCL",
	"New Group Name"
```

**Parent topic:**[Updating Sametime data in MongoDB](t_namechangeutility.md)

