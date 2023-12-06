# Planning for migration to Sametime 12 {#c_migration_planning .concept}

Sametime 12 requires a new product install and migration of data from your previous version. Do not uninstall the previous version until the V12 installation is finalized and working as expected.

Because Sametime 12 is a fully containerized application, an in-place upgrades from a previous version cannot be done. Previous Sametime versions included a community and proxy server. The services provided by these servers are inclusive within the Sametime 12 container.

Before you begin the migration having a back-out plan is necessary in case the migration does not succeed. Understand the steps to reverse the changes to place the users back on the older environment if the upgrade is not successful.

## Contact lists {#section_ahy_55v_15b .section}

In Sametime 9.x, 10.x and 11.x, vpuserinfo.nsf is used to store contact lists. Starting in Sametime 12, contact lists are maintained in MongoDB. There is a migration tool to move the contact list to MongoDB. If the deployment being migrated is not configured for LDAP, you must first convert the vpuserinfo.nsf data to LDAP using the Stnamechange utility on your current deployment environment. The utility is not available on Sametime 12 which is why you must run the utility on Sametime 9, 10, or 11 before migrating. The notes-migration tool is used to move the LDAP contact list data to MongoDB.

Before you begin the migration, purge stale users from vpuserinfo.nsf. This can be done manually with a Lotuscript agent or by using the NameChange utility. Domino database maintenance should be performed after purging stale users.

For details, see [Migrating contact lists](migrating_contactlists.md).

## Persistent chat {#section_x3c_c4y_ryb .section}

If you were using persistent chat, you must convert it to LDAP format. For details, see [Converting chat history owner data from Domino directory to LDAP format](t_dbutility_convertldap.md).

## Customized settings {#section_xvg_1xv_15b .section}

Customized settings used to tune Sametime for your environment are maintained in the sametime.ini file. You'll need to make the same changes in the new environment, otherwise the settings are lost. The `ST_COMMUNITY_ID` parameter must match the old server to ensures that clients show awareness properly after migrating.

## Policies {#section_q5t_d1b_b5b .section}

Policies are configured in policies.user.xml. You must start your new server configuration with the policies.user.xml file that comes with the Sametime 12 install and manually configure, when needed. There are settings in the new server version that were not in the older versions of Sametime and in the deployment. If you are using managed-settings.xml or managed-community-conf.xml, be sure to include these files in the new Sametime 12 policies.

## Moving the users {#section_yl4_f1b_b5b .section}

After you complete testing of the new environment and ready to migrate the users, you can use one of the following strategies to migrate users.

-   Using DNS
-   Using a load balancer

For details, see [Moving the users](migrating_moveusers.md).

-   **[Converting from native Domino directory to LDAP](migrating_dominodirectory.md)**  

-   **[Migrating contact lists](migrating_contactlists.md)**  

-   **[Moving the users](migrating_moveusers.md)**  


**Parent Topic:  **[Migrating and Upgrading](migrating.md)

