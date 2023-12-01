# Troubleshooting the Sametime server {#troubleshooting_meeting .task}

Use this information on troubleshooting and logging tools to diagnose and resolve problems affecting the HCL Sametime server.

This section will introduce the different Meeting server containers and what their roles are.

This is important to know to help understand what certain container logs are reviewed for specific issues.

The remainder of this section will introduce commonly reported issues, how to troubleshoot them and known causes.

**Sametime server images**

When installing Sametime Meetings on Docker, the following list of images are loaded.

-   meetings-auth.node
-   meetings-recordings.node
-   meetings-web
-   meetings-prosody
-   meetings-jicofo
-   meetings-jvb
-   meetings-jigasi
-   meetings-jibri
-   meetings-persistence

|Meeting images|Description|
|--------------|-----------|
|*meetings-auth.node*|Responsible for authentication via the nginx proxy to the Sametime Proxy server. The Sametime Proxy server in turn connects to the Sametime Community server for authentication.|
|*meetings-web*|Front end web server that uses the nginx proxy.|
|*meetings-jvb*|Responsible for the jitsi video bridge.|
|*meetings-jibri*|Responsible for the meeting recordings.|
|*meetings-persistence:*|Responsible for the MongoDB connection to create or retrieve Meeting room names and settings.|

These Meeting images work together to support all the required Meeting features. On Docker, the docker-compose-yaml file defines the Meeting server configuration. The Meeting server environment details are defined in the custom.env file.

**Note:** These values are case sensitive and must be entered in lower case.

**Meeting Server Connections**

It’s important to review and understand the required Meeting server connectivity and ports. The image provided is highlighting these connections and ports. Ensure the Meeting server is not blocked or prevented from successfully making these connections.

![](Images/meeting_server_connections.png)

**Meetings Common Installation Issues**

**Q1. Confirm version of Docker**

**A1.** CentOS ships with Docker installed, but not the most recent which is required. Use the command `docker version` to confirm 9.03.13.

**Q2. When running ./install.sh, receive `docker-compose: command is not found`.**

**A2.** For example:

``` {#codeblock_cfh_m11_ptb}
 

                    Starting composition... 

                    ./install.sh: line 48: docker-compose: command not found 

                    [root@meetings tmp]# 

 

```

If you recieve `docker-compose: command is not found`, confirm running as a user with access to the docker-compose location. Additional confirm docker-compose is correctly installed. For more information, see [Install Docker Compose](https://docs.docker.com/compose/install/).

**Q3. Confirm if the user has the appropriate permissions?**

**A3.** Run the command: `docker-compose logs -f nginx`.

If **"Permission denied"** is returned the user does not have the appropriate permissions.

Example:

``` {#codeblock_dfh_m11_ptb}
nginx_1       | [s6-init] making user provided files available at /var/run/s6/etc...exited 0. 

                    nginx_1       | [s6-init] ensuring user provided files have correct perms...exited 0. 

                    nginx_1       | [fix-attrs.d] applying ownership and permissions fixes... 

                    nginx_1       | [fix-attrs.d] done. 

                    nginx_1       | [cont-init.d] executing container initialization scripts... 

                    nginx_1       | [cont-init.d] 01-set-timezone: executing... 

                    nginx_1       | [cont-init.d] 01-set-timezone: exited 0. 

                    nginx_1       | [cont-init.d] 10-config: executing... 

                    nginx_1       | mkdir: cannot create directory '/config/nginx': Permission denied 

                    nginx_1       | mkdir: cannot create directory '/config/keys': Permission denied 
```

**Q4. Sametime Meetings install fails, what is needed before running the install again.**

**A4.** When Sametime Meetings install fails, delete the `./jitsi-config` directory before attempting another install.

**Meetings Server Common Issues**

**Q1. Install is complete, but I can't access the meeting homepage?**

**A1.** Run the following command from Linux Shell:

``` {#codeblock_efh_m11_ptb}
docker-compose logs -f nginx
```

Sample error from the log:

``` {#codeblock_ffh_m11_ptb}
nginx_1       | [cont-init.d] 10-config: exited 0.
                    nginx_1       | [cont-init.d] 10-set-server-env: executing...
                    nginx_1       | [cont-init.d] 10-set-server-env: exited 0.
                    nginx_1       | [cont-init.d] done.
                    nginx_1       | [services.d] starting services
                    nginx_1       | [services.d] done.
                    nginx_1       | nginx: [emerg] host not found in upstream "chat.mysametimetrial.com" in /config/nginx/meet.conf:18
                    nginx_1       | nginx: [emerg] host not found in upstream "chat.mysametimetrial.com" in /config/nginx/meet.conf:18
                    nginx_1       | nginx: [emerg] host not found in upstream "chat.mysametimetrial.com" in /config/nginx/meet.conf:18
```

The SAMETIME\_PROXY\_HOST and SAMETIME\_PROXY\_PORT values are in the custom.env file. These values must be reachable by the docker container. If you see "host not found in upstream", update or correct DNS so the host is resolvable. Alternatively, the docker-compose.yaml file can be updated so the host name is resolvable locally. Add the host name and IP to the "extra\_hosts" setting in the nginx section of the docker-compose.yaml file \(at the bottom\). To enable the changes, restart by running the commands "docker-compose down" and "docker-compose up -d".

Alternatively, the docker-compose.yaml file can be updated so the host name is resolvable locally. Add the host name and IP to the "extra\_hosts" setting in the nginx section of the docker-compose.yaml file \(at the bottom\). To enable the changes, restart by running the commands docker-compose down and docker-compose up -d. For detailed instructions, see step 3 [here](t_installing_sametime_docker.md).

**Q2. Sametime Meeting login page is successful, but 'oops' message is received when logging in?**

**A2.** Check and confirm:

-   If the meetings policy is enabled on the Sametime Community server.
-   If JWT secrets are correct and enabled on the Sametime Community server.
-   If you can log in to the Sametime Community and Proxy servers after making the JWT changes.
-   Check that the proxy hostname is resolving as expected in the docker container. 500 error in nginx logs on the /user/connect request will be found if this is the case.
-   Review NGINX logs from the Meeting server.

**Q3. Entering a Meeting, receiving infinite "`Loading Meeting...`"**

**A3.** Review Meeting server jvb logs for errors. Confirm the DOCKER\_HOST\_ADDRESS in the custom.env file is correct and a rout-able IP address. Update or correct DNS so the host is resolvable.

Other known causes:

-   Virtual Sound Driver not installed.
-   Unable to connect to STUN server\(s\).
-   Review Meeting server jvb logs.
-   Capture and review HAR file from a browser client.
-   Confirm Port 10000 \(docker\) or 30000 \(kubernetes\) UDP is not blocked.

**Q4. Can’t create a Meeting Room.**

**A4.** The Meetings 11.6 Release requires a connection to MongoDB. \(This was not required in the pre-release version\). Can re-use existing MongoDB server or create one specific for Meetings.

**Sametime Meetings Best Practices**

-   Run as root/sudo access.
-   Run this command to access the docker shell for a given Meeting image.

    ``` {#codeblock_hfh_m11_ptb}
    docker-compose exe <auth/jvb/nginx> /bin/sh 
    
    ```

    **Note:** Replace <auth/jvb/nginx\> with the Meeting image you want to access.

-   From the docker shell you can confirm DNS, firewalls and other details that may differ from the host system.
-   To start and stop the Sametime Meetings server, run these commands from Linux shell:
    -   To Start:

        ``` {#codeblock_jfh_m11_ptb}
        docker-compose up -d 
        ```

    -   To Stop:

        ``` {#codeblock_kfh_m11_ptb}
        docker-compose down 
        ```


For Sametime Meeting issues, the Meeting server services/container logs will vary depending on the issue.

-   For Meeting page failing to load or Login issues, get NGINX and AUTH logs with relevant times.
-   For Meeting Recording issues, get JVB and JIBRI logs with relevant times.
-   For Meeting Loading issues or STUN issues, get JVB logs with relevant times.

**Parent topic:**[Troubleshooting](troubleshooting.md)

