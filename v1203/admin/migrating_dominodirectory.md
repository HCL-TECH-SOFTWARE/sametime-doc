# Converting from native Domino directory to LDAP {#migrating_dominodirectory .task}

Review the [Planning for migration to Sametime 12](c_migration_planning.md) topic.

If the older Sametime deployment is not configured for LDAP, the contact lists must be converted using the Stnamechange utility before migrating. The Stnamechange utility is not available on Sametime 12. Run the utility on Sametime 9, 10, or 11 before migrating.

For previous Sametime versions, see the *Changing user names* topic for the version that is being migrated to Sametime 12.

-   [V9.0](https://help.hcltechsw.com/sametime/11.6/admin/changing__names_in_contact_and_privacy_lists.html)
-   [V10](https://help.hcltechsw.com/sametime/10.0/config/changing__names_in_contact_and_privacy_lists.html)
-   [11.0, 11.5, and 11.6](https://help.hcltechsw.com/sametime/11.6/admin/changing__names_in_contact_and_privacy_lists.html)

The LDAP task is used to convert to LDAP. Run the task on the older Sametime Community server.

**Parent Topic:  **[Planning for migration to Sametime 12](c_migration_planning.md)

