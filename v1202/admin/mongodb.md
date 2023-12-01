# MongoDB {#mongodb .concept}

MongoDB is used to store data for persistent chat, mobile push notifications, meetings and contact lists.

If you have an existing MongoDB deployment, you can use it. However, if you do not have a MongoDB already installed you must install one. MongoDB can be installed on a separate server or in the same Kubernetes cluster as Sametime. As with the storage size needed, the use of a dedicated server depends on your organization. After MongoDB is installed, it must be configured to communicate with the Sametime server. See [Installing the MongoDB](installation_mongodb.md) for additional information.

Data related to chats and meetings is stored in MongoDB. This includes screenshots, emojis, chat logs, meeting reservation information, and contact lists. By default, data is saved for 90 days. You can change the default on the time to live \(TTL\) setting. For more information, see [Updating the time-to-live index for persistent chat](update_ttl_index.md).

Data is stored in data/db path which is specified in the mongod.conf configuration file. When determining the size for your MongoDB, consider the activity used by users in your organization. Refer to the MongoDB documentation for information on setting the size for the database.

**Parent topic:**[Prerequistes](c_planning_prereqs.md)

