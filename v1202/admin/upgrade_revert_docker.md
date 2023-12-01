# Reverting to a previous version on Docker {#upgrade_revert_docker .task}

If you encounter a problem, you can return to the previous Sametime version. One method is to shut the fix pack version and then start the server from the backup directory. This is the method is described in the procedure section.

Alternatively, you can shut down the Sametime server, rename the fix pack installed directory, and then rename the backup directory to the previous version's directory.

1.  From the Sametime installation directory, run the following script.

    ``` {#codeblock_mlj_pqk_25b}
    docker-compose down 
    ```

2.  From the backup Sametime installation directory, run the following the script.

    ``` {#codeblock_g45_pqk_25b}
    docker-compose up -d 
    ```


**Parent topic:**[Upgrading to a new version or applying a fixpack](upgrade_install_fixpack.md)

