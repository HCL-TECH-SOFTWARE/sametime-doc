# Configuring the sametime.ini file on Docker or Podman {#chat_config_sametimeini_docker .task}

1.  Open the custom.env file for editing.

2.  Insert the sametime.ini parameters.

    Ensure that parameters ares specified in the correct format. See [Configuring the sametime.ini file](chat_configuring_sametimeini.md) for parameter format.

3.  Save and close the custom.env file.

4.  Start the Sametime server to apply the changes.

    ``` {#codeblock_btc_lj4_k5b}
    docker compose up -d
    
    ```


**Parent Topic: **[Configuring the sametime.ini file](chat_configuring_sametimeini.md)

