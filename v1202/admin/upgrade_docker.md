# Upgrading Sametime 11.5 and Sametime 11.6 Docker deployments {#upgrade_docker .task}

To upgrade from Sametime 11.5 or Sametime 11.6 to Sametime 12, the following conditions must be satisfied:

-   HCL Sametime Meetings 11.5 or Sametime 11.6 must be installed and configured.
-   Sametime has access to a MongoDB server. You can re-use your existing MongoDB server.

    **Note:** There are no special configuration steps required for the database. It automatically creates when the Sametime server connects to MongoDB.

-   Prepare migration steps before upgrading to the latest Sametime version. The upgrade gives you a new community and proxy component that replaces your existing components.
    -   Have a back-out plan. Create a backup of the following files.
        -   docker-compose.yml
        -   custom.env
        -   .env
-   Docker Compose 1.29 or higher must be installed in your Sametime environment.

Upgrading Sametime 11.5 or Sametime 11.6 Docker deployments are done in the custom.env file. The upgrade requires access to the MongoDB server. For this example, we will use the following directory structure for simplicity:

``` {#codeblock_dgx_y5l_c5b}
/opt/STMeetingServer
```

1.  In /opt/STMeetingserver, stop the Sametime Meeting server by executing:

    ``` {#codeblock_djt_cvl_c5b}
    > docker-compose down
    ```

2.  Unzip the sametime.meeting archive to /opt/STMeetingServer - this will overwrite several files in the folder.

    ``` {#codeblock_dny_hvl_c5b}
    > unzip sametime-meetings.zip -d /opt/STMeetingServer
    ```

3.  Run the script below:

    ``` {#codeblock_uwj_nvl_c5b}
    > ./install.sh
    ```

4.  Follow the prompts to provide the information as required. You can copy the encoded secret from sametime.ini or create a new one with this update. Sametime detects an upgrade or full install.

    **Note:** If the you are not prompted for Auth Token, LDAP and Proxy, the custom.env file must be updated after the upgrade. Specify the appropriate values for the Auth Token, LDAP and set the Proxy to be the Sametime 12 host. Additionally, the MongoDB administrative user \(sametimeUser\) requires that the following be added:

    ``` {#codeblock_hr4_nxh_rvb}
    { role:"readWrite", db:"meeting"},{role:"dbAdmin", db:"meeting"}
    ```

5.  Update the new jitsi-config folder to change TLS certificates or other custom settings as needed. Be sure to follow the standard procedures for that.

6.  After upgrade is complete, clear the browser cache to refresh the authentication tokens that may be stored.


**Parent topic:**[Upgrading from Meetings 11.5 and 11.6](upgrading_meetings.md)

## Revert to the previous version {#task_sxq_dwl_c5b}

If you encounter a problem, run the command below to roll back to the previous version.

``` {#codeblock_vzr_fwl_c5b}
in /opt/STMeetingServer issue
>docker-compose down

in /opt/STMeetingServer_bak issue
> docker-compose up -d
```

