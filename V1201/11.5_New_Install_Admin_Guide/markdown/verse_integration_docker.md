# Enabling the legacy web client on Docker {#verse_integration_docker .task}

1.  Edit the docker-compose.yaml file.

2.  Locate the `SAMETIME_EXTERNAL_WARINTEGRATION` variable and ensure that it is set to true.

    If the statement doesn't exist, add it in the `proxy` section of the file.

    ``` {#codeblock_hfl_1g1_h5b}
    SAMETIME_EXTERNAL_WARINTEGRATION=true
    ```

3.  From the Sametime installation directory, run the following script.

    ``` {#codeblock_mlj_pqk_25b}
    docker-compose down 
    ```

4.  From the backup Sametime installation directory, run the following the script.

    ``` {#codeblock_g45_pqk_25b}
    docker-compose up -d 
    ```


**Parent topic:**[Integrating with other applications](verse_integration.md)

