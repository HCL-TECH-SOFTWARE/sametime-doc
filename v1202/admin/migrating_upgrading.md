# Migrating from older Sametime versions {#migrating_upgrading .task}

**Parent topic:**[Migrating and Upgrading](migrating.md)

## Planning for migration to Sametime 12 {#task_osh_n2m_c5b}

Review [Planning for migration to Sametime 12](c_migration_planning.md) before continuing.

## Converting from native Domino directory to LDAP {#task_fxj_t2m_c5b}

If the older Sametime deployment is not configured for LDAP, the contact lists must be converted using the Stnamechange utility before migrating. The Stnamechange utility is currently unavailable on Sametime 12. Run the utility on Sametime 9, 10, or 11 before migrating.

Follow the instructions provided in previous Sametime versions to perform the Stnamechange utility.

-   [Sametime Name Change Utility 9.0](https://help.hcltechsw.com/sametime/9.0.1/config/changing__names_in_contact_and_privacy_lists.html)
-   [Sametime Name Change Utility 10.0](https://help.hcltechsw.com/sametime/10.0/config/changing__names_in_contact_and_privacy_lists.html)
-   [Sametime Name Change Utility 11.0 \| 11.5 \| 11.6](https://help.hcltechsw.com/sametime/11.6/admin/changing__names_in_contact_and_privacy_lists.html)

The LDAP task is used to convert to LDAP. Run the task on the older Sametime Community server.

## Migrating contact lists \(VPUSERINFO.NSF\) {#task_owl_y2m_c5b}

In Sametime 9.x, 10.x and 11.x, VPUserinfo.nsf stores all the contact list for users. To migrate your contact list from a previous release to Sametime 12, the contact list data must be migrated to MongoDB. Follow the steps below to migrate your contact list.

1. On the Sametime server you wish to migrate from, unzip notes-migration.zip to the server's program directory from the Sametime\_12.0.zip or Sametime\_Premium\_12.0.zip downloaded from HCL Software Portal.

**Note:** You must run this command from the Sametime server's program directory where sametime.ini and notes.ini exist.

2. Run the following commands to setup the environment and run the migration task.

-   Linux

    ``` {#codeblock_cbg_gfm_c5b}
    source ./setenv.sh
    ```

    ``` {#codeblock_nyc_hfm_c5b}
    ./notes-migration.sh
    ```

    **Note:** This prompts for locations and options before running the task. Running the notes-migration.zip tool moves your contact list to MongoDB.

-   Windows

    ``` {#codeblock_ylm_lfm_c5b}
    notes-migration.bat
    ```

    **Note:** Windows does not require the setup command and prompts for locations and options before running the task.


## Moving the users {#task_tgf_pfm_c5b}

Once you are finished testing and are ready to migrate the users, there are a few different strategies to choose from.

-   Using the DNS. The hostname is the same and there is nothing additional to configure on the client side. In this scenario, the DNS would be changed to point to the new environment.
    -   DNS may take some time to propagate throughout your network, thus you may need to leave both old and new servers running simultaneously for a period of time. Be certain the vpuserinfo.nsf has been migrated to the Sametime 12 deployment to keep the contacts up to date. You can check stlog.nsf or *Community Logins by Date* to see how many users are still on the old server. Restarting the old servers periodically also forces users onto the new servers as soon as DNS is updated.
-   Using a load balancer. If your existing environment has a load balancer in front of it, you can simply add the new servers behind the load balancer and shut down the old servers.
-   Pushing a new hostname using Managed-Community-Configs.xml. You can create the managed-community-configs.xml file and push it to the users using a Sametime policy. The changes take effect the next time a user restarts their client. It is configured for the new hostname.

## Have a back-out plan {#task_d1r_rfm_c5b}

You must have a back-out plan in case your migration does not succeed.

