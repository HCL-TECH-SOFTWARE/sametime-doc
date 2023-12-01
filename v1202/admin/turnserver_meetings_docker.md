# Configuring the TURN Server for Docker {#turnserver_meetings_docker .task}

You can configure the Sametime Meeting service to enable a TURN server on port 443 for Docker.

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

4.  Restart Docker.

    ```
    docker-compose up -d
    ```


**Parent topic:**[Setting up a TURN server](turnserver_intro.md)

