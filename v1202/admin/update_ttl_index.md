# Updating the time-to-live index and chat history for persistent chat 

The time-to-live \(TTL\) setting defines how long the chat history is stored in the database. The default value is 90 days. However, administrators can update the value based on the organization's preferred setting and control chat history available to users.

Changes to the TTL value in MongoDB require the indexes to be rebuilt in MongoDB.  For more information, refer to [Manage Indexes](https://www.mongodb.com/docs/v4.4/tutorial/manage-indexes/#manage-indexes) in the MongoDB documentation.

To update the TTL and chat history settings used by the Sametime server involves modifying the following files.

-   custom.env for Docker
-   helm/values.yaml for Kubernetes

**Note:** These values are case sensitive and must be entered as shown below.

1.  For Docker, update the CLI__ChatLogging__CL_MONGO_HISTORY_TTL parameter. In the following example, the value is set to 7 days.

	- CLI__ChatLogging__CL_MONGO_HISTORY_TTL=7
    - For Kubernetes, update the CLI__ChatLogging__CL_MONGO_HISTORY_TTL parameter. In the following example, the value is set to 7 days.
    - CLI__ChatLogging__CL_MONGO_HISTORY_TTL: 7

2.	To modify the chat conversations available to users, set the MAX_DAYS configuration value to match the MONGO_HISTORY_TTL value. The minimum value is 1.

    - For Docker, update the STI__stconvomap__CONVOMAP_MAX_DAYS parameter. In the following example, the value is set to 7 days.
    - STI__stconvomap__CONVOMAP_MAX_DAYS=7
    - For Kubernetes, update the STI__stconvomap__CONVOMAP_MAX_DAYS parameters. In the following example, the value is set to 7 days.
    - STI__stconvomap__CONVOMAP_MAX_DAYS: 7

3.	You can update the STI__stconvomap__CONVOMAP_MAX_HOURS parameter to add hours to the time frame. In the following examples, the value is set to 2 hours.

    - Docker:
    - STI__stconvomap__CONVOMAP_MAX_HOURS=2
    - Kubernetes:
    - STI__stconvomap__CONVOMAP_MAX_HOURS: 2

4.	In the Mongo shell, run the following commands.
5.	use chatlogging
6.	db.EVENTS.getIndexes()
7.	db.EVENTS.dropIndex("TimeStamp_1")
8.	db.USERS.dropIndex("date_1")

    The db.EVENTS.dropIndex command defines the name of the index to drop. The value is TimeStamp_1.

9.	Restart the Sametime server to apply the changes. The TTL index is updated with the new value.
For more information, refer to [Starting and stopping servers](starting_and_stopping_servers.md).

10.	Run the following command to confirm that the value for TimeStamp_1 is updated.
db.EVENTS.getIndexes()


## To Modify the amount of ChatHistory a user will see in the client

This setting has no affect on the chatlogging TTLs or data that is stored in MongoDB. Instead, it controls how much history the client will request.

1.	There are 2 settings that control this
    - CL__MONGO_USER_HISTORY_TIMELIMIT
    - Default is 90 , minimum is 1
    - CL_MONGO_USER_HISTORY_TIMEUNIT
    - Default is DAYS, values can be DAYS, HOURS, MINUTES, SECONDS

2.	Example
    - CL__MONGO_USER_HISTORY_TIMELIMIT =7
    - CL__MONGO_USER_HISTORY_TIMEUNIT=DAYS

    The user would see 7 days of history in the client, while the server would have a full 90 days available.

    - For Docker, update this value in custom.env
    - For Kubernetes, this value goes in values.yaml

3.	Restart the server and client for the changes to take affect.

**Parent Topic:  **[Configuring](configuring.md)

