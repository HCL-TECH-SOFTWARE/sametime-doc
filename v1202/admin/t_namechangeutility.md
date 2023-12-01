# Updating Sametime data in MongoDB {#t_namechangeutility .concept}

When you update existing contact information in the directory, you must run the Sametime database utility in order to synchronize the information with that of the Community Server databases.

**Note:** You do not need to run the Sametime database utility when adding new users or groups to the Domino or LDAP directory.

The Sametime database utility uses a comma-separated value list that you compile to change names, delete names, or convert all names from Domino to Domino LDAP formatted names.

When you create a CSV file, include the descriptor that corresponds to the task you are running. CSV files are case-sensitive and sensitive to spaces. You can create multiple CSV files, but each CSV file can include only *one descriptor* and can complete only one task.

**Note:** The ID task allows case-insensitive comparisons of user IDs by adding NC\_ID\_TASK\_CASE\_INSENSITIVE=1 to the `sametime.ini` file. For more information, refer to [Configuring the sametime.ini file](chat_configuring_sametimeini.md).

|Descriptor|Purpose|
|----------|-------|
|ID|Changes specified first names, last names, display names, or group names.|
|LDAP|Changes all contact list information from Domino Directory format to LDAP format. For example, a user listed as CN=Maria Smith/OU=Sales/O=HCL changes to CN=Maria Smith,OU=Sales,O=HCL. **Note:** This task can be performed only once because you can only convert the directory format one time.

|
|DELETE|Removes specified individual contact names from contact lists and privacy lists.

|

-   **[Updating user IDs](t_namechange_docker.md)**  

-   **[Converting user information from Domino Directory format to LDAP format](t_ldap_change.md)**  

-   **[Deleting user IDs](t_delete_ldap.md)**  

-   **[Sametime DB Utility reporting](t_verify_namechange.md)**  


**Parent topic:**[MongoDB](administering_mongodb.md)

