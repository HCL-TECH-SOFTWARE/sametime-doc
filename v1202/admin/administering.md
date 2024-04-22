# Administering {#administering .task}

This section provides information on administering on Sametime environments.

-   **[Sametime Admin overview](adminui_overview.md)**  
The Sametime Admin is a web access interface used to work with policies and analytic data related to Sametime Meetings and chat features.
-   **[Managing policies](adminui_policy_manage.md)**  
Sametime policies allow administrators to control user access to features.
-   **[Monitoring your meeting and chat metrics with Grafana](adminui_grafana_overview.md)**  
Sametime uses the third-party software, Grafana, to generate insightful graphs and visualizations derived from time-series database \(TSDB\) data. Integrating Grafana into your Sametime environment allows you to see analytic metrics about Sametime meetings and chats on a Grafana dashboard. The metrics can be used to monitor Sametime usage and resources.
-   **[Managing Sametime clients](managing_sametime_client_preferences.md)**  
This section provides information on managing Sametime clients.
-   **[Managing file transfer data](t_managing_transfer_data.md)**  
As with meeting recordings and reports, files that are shared in the chat are stored in a Docker volume or a Kubernetes persistent volume. By default, you can download these files within *90 days*.
-   **[Testing Sametime chat and meeting clients](t_testing_sametime_chat.md)**  
This article assumes that you have successfully installed and configured Sametime or Sametime Premium.
-   **[Starting and stopping the Sametime server](starting_and_stopping_servers.md)**  
Starting and stopping the Sametime server involves starting and stopping the Sametime services running in the container management system.
-   **[Starting and stopping MongoDB](starting_and_stopping_mongodb.md)**  

-   **[Configuration files](configuration_files.md)**  
Configuration files maintain information used by the Sametime server for various reasons.
-   **[Enabling multi-tenancy](configuring_multi_tenacy.md)**  
Multi-tenancy allows multiple organizations to be part of the Sametime community. With multi-tenancy, Sametime users can chat, add users and groups to contact lists, and have awareness of users in their organization or in other organizations that are configured to be visible to them.
-   **[Using the Sametime Database utility](c_dbutility.md)**  
The Sametime Database utility is used to synchronize the information with that of the Sametime server database.
-   **[MongoDB](administering_mongodb.md)**  
This section provides information relating to administering MongoDB.
-   **[Defining chat message deletion limits](chat_msg_delete_options.md)**  
The chat deletion settings define how long a user has the ability to delete a message and undo the deletion. The default deletion time is twenty-four hours and one hour to undo the deletion.
-   **[Managing Sametime Meetings](sametime_meeting_administering.md)**  
This topic explains the features you can enable or disable for meetings. Currently, the settings that you can change are global settings that apply to the entire server. User policies cannot control the settings.
