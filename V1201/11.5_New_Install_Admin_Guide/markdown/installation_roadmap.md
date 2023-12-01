# Installation road map {#installation_roadmap .concept}

The installation road map list the high-level steps for installing your product. Reviewing the high-level steps before you start the install process helps you to be prepared when prompted for information during the installation.

1.  Verify that your computer meets the minimum hardware and software requirements for installing the product.
2.  Verify that your user ID meets the access requirements for installing and configuring the product.
3.  Install MongoDB as the Sametime database. Sametime uses MongoDB to store configuration information, contact lists, chat history and reserved meeting rooms.
4.  Setup and configure LDAP directory to authenticate and store user information.
5.  Setup a Docker or Kubernetes environment.
6.  Install the Sametime Premium or Sametime product.
7.  Configure the client.
8.  Manage clients with policies.
9.  Configure servers and open ports for mobile users.

|Item|More information|
|----|----------------|
|System requirements|[HCL Sametime® System Requirements](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0100619)|
|Planning|-   [Planning the network topology and connectivity](topology.md)
-   [Sametime client preferences](config_client_pref_tables.md)
-   [Sametime client configuration options](sametime_client_configuration.md)

|
|Installing|-   [Installing the MongoDB](installation_mongodb.md)
-   [Installing Sametime](installation_sametime.md)
-   [Installing Sametime clients](installing_sametime_clients.md)
-   [Configuring LDAP](configuring_ldap.md)

|
|Clustering and high availability|-   [Clustering and high availability](cluster_highavailability.md)

|
|Migrating and upgrading|-   [Migrating from older Sametime versions](migrating_upgrading.md)
-   [Upgrading from Meetings 11.5 and 11.6](upgrading_meetings.md)

|

**Parent topic:**[Installing](installing.md)

