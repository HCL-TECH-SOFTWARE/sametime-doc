# Configuring the TURN server for Docker and Podman {#turnserver_meetings_docker .task}

You can configure the Sametime Meeting service to enable a TURN server on port 443 for Docker.

The Docker and Podman commands are similar. The only difference is that docker precedes the command when issued in a Docker environment and podman precedes the name in a Podman environment. Example commands used in the Sametime documentation are shown using Docker. For Podman, change docker to podman.

1.  Update the following configuration in the custom.env file.

    ```
    # Enable TURN for JVB (bridge mode) connections
    TURN_ENABLE=1
    
    # Secret for connect to TURN server
    # Add the same secret that you used to configure TURN server.
    TURN_SECRET=secret
    
    # Announce FQDN/IP address of the turn server via XMPP server (XEP-0215).
    # If empty or not set, variable DOCKER_HOST_ADDRESS will be used by default.
    TURN_HOST=turn.example.com
    
    # TLS/TCP/UDP turn port for connection
    TURN_PORT=443
    
    # Transport for stun/turn connection. Can be tcp or udp.
    TURN_TRANSPORT=tcp
    ```

2.  Add the following configuration to the custom.env file.

    ``` {#codeblock_amd_5y1_m5b}
    TURN_CREDENTIALS=secret
    ```

3.  Update the following configuration in the .env file.

    ```
    GLOBAL_MODULES=turncredentials
    ```

4.  Start the Sametime server to apply the changes.

    ``` {#codeblock_btc_lj4_k5b}
    docker compose up -d
    
    ```


**Parent Topic:  **[Setting up a TURN server](turnserver_intro.md)

