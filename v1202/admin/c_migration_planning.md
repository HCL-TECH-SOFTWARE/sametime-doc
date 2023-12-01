# Planning for migration to Sametime 12 {#c_migration_planning .concept}

This section describes the best practices for planning migration from an earlier Sametime release.

If the older Sametime deployment is not configured for LDAP, then the contact lists must be converted using the `Stnamechange` utility before migrating. The `Stnamechange` utility is currently unavailable on Sametime 12. Run the utility on Sametime 9, 10, or 11 before migrating.

## Side-by-side migration {#section_wqy_grv_15b .section}

-   Sametime 12 does not support upgrades from an existing community or proxy server to Sametime 12. Sametime 12 is now containerized, and you have to deploy the new images and then migrate your users.
-   If the new server is part of the same community as your existing servers, block port 1516 between the new server and existing server to prevent confusion while testing and validating new features. Prior to migrating, make sure port 1516 is open.

## VPUSERINFO.NSF {#section_ahy_55v_15b .section}

**Note:** Running the `notes-migration` tool moves your contact list to MongoDB. For more information on how to migrate your contacts, refer to [Migrating from older Sametime versions](migrating_upgrading.md).

-   Prior to the migration, you must purge stale users from vpuserinfo.nsf. This step can be done manually with a Lotuscript agent, or by using the `NameChange` utility. Domino database maintenance should be performed after purging stale users.
-   If the older Sametime deployment is not configured for LDAP, then the contact lists must be converted using the `Stnamechange` utility. The `Stnamechange` utility is currently unavailable on Sametime 12. Run the utility on Sametime 9, 10 or 11 before migrating.

## SAMETIME.INI {#section_xvg_1xv_15b .section}

-   You can migrate your tuning settings for LDAP from the old server to the new server. Note the setting in the sametime.ini and add them to the Sametime 12 environment.
-   `ST_COMMUNITY_ID` should match the old server. This step ensures the clients show awareness properly after migrating.

## Policies {#section_q5t_d1b_b5b .section}

-   Policies are configured in policies.user.xml. You must start your new server configuration with the policies.user.xml file that comes with the Sametime 12 install and manually configure, when needed. There are settings in the new server version that were not in the older versions of Sametime and in the deployment.
-   If you are using managed-settings.xml or managed-community-conf.xml, be sure to include these files in the new Sametime 12 policies.

## Moving the users {#section_yl4_f1b_b5b .section}

Once you are finished testing and are ready to migrate the users, there are a few different strategies to choose from.

-   Using the DNS. The hostname is the same, and there are no additional configurations on the client side. In this scenario, the DNS would be changed to point to the new environment.
    -   DNS may take some time to propagate throughout your network. You may need to leave both old and new servers running simultaneously for a period of time. Be certain the vpuserinfo.nsf has been migrated to the Sametime 12 deployment to keep the contacts up to date. You can check the stlog.nsf or community logins by date to see how many users are still on the old server. Restarting the old servers periodically also forces users onto the new servers as soon as DNS is updated.

-   Using a load balancer. If existing environment has a load balancer in front of it, then you can simply add the new servers behind the load balancer and shut down the old servers.
-   Pushing a new hostname using Managed-Community-Configs.xml. You can create the managed-community-configs.xml file and push it to the users using a Sametime policy. The settings takes effect the next time a user restarts their client. It is configured for the new hostname.

## Have a back-out plan {#section_byy_31b_b5b .section}

You must have a back-out plan in case your migration does not succeed.

**Parent topic:**[Migrating and Upgrading](migrating.md)

