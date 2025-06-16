# Moving the users {#migrating_moveusers .task}

Review the [Planning for migration to Sametime 12](c_migration_planning.md) topic.

After you are finished testing of the new Sametime version and are ready to migrate the users, you can use one of the following strategies.

-   Using the DNS. The host name is the same and there is nothing additional to configure on the client side. In this scenario, the DNS would be changed to point to the new environment.
    -   DNS may take some time to propagate throughout your network, thus you may need to leave both old and new servers running simultaneously for a period of time. Be certain the vpuserinfo.nsf has been migrated to the Sametime 12 deployment to keep the contacts up to date. You can check stlog.nsf or *Community Logins by Date* to see how many users are still on the old server. Restarting the old servers periodically also forces users onto the new servers as soon as DNS is updated.
-   Using a load balancer. If your existing environment has a load balancer in front of it, you can add the new servers behind the load balancer and shut down the old servers.
-   Pushing a new host name using Managed-Community-Configs.xml. You can create the managed-community-configs.xml file and push it to the users using a Sametime policy. The changes take effect the next time a user restarts their client. It is configured for the new host name.

**Parent Topic:  **[Planning for migration to Sametime 12](c_migration_planning.md)

