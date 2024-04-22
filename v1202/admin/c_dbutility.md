# Using the Sametime Database utility {#c_dbutility .concept}

The Sametime Database utility is used to synchronize the information with that of the Sametime server database.

When you change user or group names in the directory, the change is not reflected in Sametime databases. In order to synchronize the directory names with the names in the Sametime databases, you must run the name conversion utility. You can run the name conversion utility manually on a stand-alone Community Server, or on a server in a cluster which replicates the change throughout the cluster.

**Note:** You do not need to run the Sametime Database utility when adding new users or groups to the Domino or LDAP directory.

The tool performs the following functions:

-   Convert
-   Delete
-   Move
-   Update​

​

**Note:** Refer to the [Converting chat history owner data from Domino directory to LDAP format](t_dbutility_convertldap.md) topic for the convert function.

The utility is loaded to your Docker repository during the Sametime install process, it is located in the image repository. The name of the utility image is sametime-db-utility. The Sametime Database utility uses a comma-separated value \(CVS\) file that you compile to update, convert, or delete names which includes the descriptor that corresponds to the task to be completed. To use the utility, create a CVS that corresponds to the task to be completed. The CVS file must contain only one type of task, that is you cannot run an update and convert using the same CVS file. Note that CSV files are case-sensitive and sensitive to spaces.

|Descriptor|Purpose|
|----------|-------|
|DELETE|Removes specified individual contact names from contact lists and privacy lists.|
|ID|Changes specified first names, last names, display names, or group names.|
|TASK\_LDAP|Changes all contact list information from Domino Directory format to LDAP format.|
|ORGANIZATION|Change the organization name for all users.|

At the end of the Sametime Database utility run, a report file is generated containing a summary of changes applied to the database. You can view the report to verify your changes. The report contains a summary of changes applied to the database, including records touched, modified or deleted. It also has the count of records modified or deleted and which attribute is modified. The report file is created in the data folder. The report file name is in following format:

``` {#codeblock_b3d_rw2_nvb}
name_change_summary_report_[date_time].log
```

-   **[Converting chat history owner data from Domino directory to LDAP format](t_dbutility_convertldap.md)**  
The convert feature of the Sametime Database utility changes all contact list information from the Domino Directory format to LDAP format.
-   **[Deleting user IDs](t_dbutility_delete.md)**  
The delete feature of the Sametime Database utility removes specified individual contact names from contact lists and privacy lists.
-   **[Moving users](t_dbutility_move.md)**  
The move feature of the Sametime Database utility allows you to move users from one organization to another.
-   **[Updating user IDs](t_dbutility_update.md)**  
The updates feature of the Sametime Database utility changes specified first names, last names, display names, or group names.

**Parent Topic:  **[Administering](administering.md)

