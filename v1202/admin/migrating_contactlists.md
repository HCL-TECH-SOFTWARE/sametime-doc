# Migrating contact lists {#migrating_contactlists .task}

Review the [Planning for migration to Sametime 12](c_migration_planning.md) topic.

In Sametime 9.x, 10.x and 11.x, vpuserinfo.nsf stores all the contact list for users. Before you can migrate contact lists to MongoDB, you must first convert the vpuserinfo.nsf data to LDAP using the Stnamechange utility on your current deployment environment.

1.  On the Sametime server being migrated, decompress the notes-migration.zip file to the server's program directory where the Sametime 12 product image was placed.

    You must run this command from the Sametime server's program directory where the sametime.ini and notes.ini files exist.

2.  For Linux, run the following commands to setup the environment. Otherwise, skip to the nex step. and perform the migration task.

    ``` {#codeblock_lq5_bdr_3xb}
    source ./setenv.sh
    ```

3.  Run the following command to move your contact list to MongoDB. Before the migration begins, you are prompted for locations and options.

    -   Linux

        ``` {#codeblock_t5v_1dr_3xb}
        ./notes-migration.sh
        ```

    -   Windows

        ``` {#codeblock_v5v_1dr_3xb}
        notes-migration.bat
        ```


**Parent Topic:  **[Planning for migration to Sametime 12](c_migration_planning.md)

