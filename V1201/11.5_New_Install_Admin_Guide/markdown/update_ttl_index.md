# Updating the time-to-live index for persistent chat {#update_ttl_index .task}

The time-to-live \(TTL\) setting defines how long the chat history is stored in the database. The default value is 90 days. However, administrators can update the value based on the organization's preferred setting.

The TTL index in MongoDB must be rebuilt. For more information, refer to [Manage Indexes](https://www.mongodb.com/docs/v4.4/tutorial/manage-indexes/#manage-indexes) in the MongoDB documentation.

To update the TTL settings used by the Sametime server involves modifying the following files.

-   custom.env for Docker
-   helm/values.yaml for Kubernetes

**Note:** These values are case sensitive and must be entered as shown below.

1.  Modify the configuration file. The minimum value is 1.

    -   For Docker, update the CLI\_\_ChatLogging\_\_CL\_MONGO\_HISTORY\_TTL parameter. In the following example, the value is set to 7 days.

        ``` {#codeblock_k3y_zdq_5tb}
        CLI__ChatLogging__CL_MONGO_HISTORY_TTL=7
        ```

    -   For Kubernetes, update the CLI\_\_ChatLogging\_\_CL\_MONGO\_HISTORY\_TTL parameter. In the following example, the value is set to 7 days.

        ``` {#codeblock_oft_k2q_5tb}
        CLI__ChatLogging__CL_MONGO_HISTORY_TTL: 7
        ```

2.  Modify the Convomap Max Days configuration value to match the MongoDB TTL value. The minimum value is 1.

    -   For Docker, update the STI\_\_convomap\_\_CONVOMAP\_MAX\_DAYS parameter. In the following example, the value is set to 7 days.

        ``` {#codeblock_igt_cfd_g5b}
        STI__convomap__CONVOMAP_MAX_DAYS=7
        ```

    -   For Kubernetes, update the STI\_\_convomap\_\_CONVOMAP\_MAX\_DAYS parameters. In the following example, the value is set to 7 days.

        ``` {#codeblock_jgt_cfd_g5b}
        STI__convomap__CONVOMAP_MAX_DAYS: 7
        ```

3.  You can update the STI\_\_convomap\_\_CONVOMAP\_MAX\_HOURS parameter to add hours to the time frame. In the following examples, the value is set to 2 hours.

    -   Docker:

        ``` {#codeblock_lt2_f2d_g5b}
        STI__convomap__CONVOMAP_MAX_HOURS=2
        ```

    -   Kubernetes:

        ``` {#codeblock_mt2_f2d_g5b}
        STI__convomap__CONVOMAP_MAX_HOURS: 2
        ```

4.  In the Mongo shell, run the following commands.

    ```
    use chatlogging
    ```

    ```
    db.EVENTS.getIndexes()
    ```

    ```
    db.EVENTS.dropIndex("TimeStamp_1")
    ```

    The `db.EVENTS.dropIndex` command defines the name of the index to drop. The value is `TimeStamp_1`.

5.  Restart the Sametime server to apply the changes. The TTL index is updated with the new value.

    For more information, refer to [Starting and stopping servers](https://help.hcltechsw.com/sametime/12/admin/starting_and_stopping_servers.html).

6.  Run the following command to confirm that the value for `TimeStamp_1` is updated.

    ```
    db.EVENTS.getIndexes()
    ```


**Parent topic:**[Configuring](configuring.md)

