# Defining chat message deletion limits {#chat_msg_delete_options .task}

The chat deletion settings define how long a user has the ability to delete a message and undo the deletion. The default deletion time is twenty-four hours and one hour to undo the deletion.

To change the default values, modify the following files.

-   custom.env for Docker
-   helm/values.yaml for Kubernetes

Use the following table to determine the configuration option to add to the file.

|Options|Docker|Kubernetes|
|-------|------|----------|
|Maximum amount of time to delete a chat message. Specify the value in seconds. The default value is 1440.|MESSAGE\_MUTATION\_ALLOWED\_AGE\_IN\_MINUTES|messageMutationAllowedAgeInMinutes|
|Maximum amount of time to undo a message deletion. Specify the value in seconds. The default value is 60.|MUTATION\_UNDO\_ALLOWED\_AGE\_IN\_MINUTES|mutationUndoAllowedAgeInMinutes|

**Note:** The configuration options are case sensitive.

After updating the configuration files, restart the Sametime server to apply the changes. For more information, refer to [Starting and stopping servers](https://help.hcltechsw.com/sametime/12/admin/starting_and_stopping_servers.html)

**Parent Topic: **[Administering](administering.md)

