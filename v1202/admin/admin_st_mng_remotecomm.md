# Updating connectivity settings with the managed-community-configs.xml file {#admin_st_mng_remotecomm .task}

You can distribute updates to HCL® Sametime® client communities automatically using a managed-community-configs.xml file. The managed-community-configs.xml file is policy-based, so you can control communities for different user groups.

You can also use the managed-community-configs.xml file to manage secondary communities, while preventing users from adding or deleting communities. Set the Allow Multiple Communities policy to **false** and use the managed-community-configs.xml to define the desired secondary communities. The client allows the user to log into secondary communities defined in the .xml file, but the user cannot delete secondary communities defined in the file.

At login time, the client receives policies and checks for the existence of a managed-community-configs.xml file according to the **Sametime update site URL** policy. For example, if the administration update site URL is http://example.com/updates, the client looks for the file in http://example.com/updates/managed-community-configs.xml.

Follow these steps to create and post a managed-community-configs.xml file.

1.  Create a settings XML file and save it as managed-community-configs.xml.

2.  Add settings for communities and actions in the file.

3.  Place the file on a web server, and post the URL \(starting with http://\) for the file to the **Sametime update site URL** in the Chat section of the Instant Messaging policy.

4.  If you changed the settings file to update the host name of a community to a new server that is part of the same community, users' contact lists are still valid with the new host. Set the ST\_COMMUNITY\_ID in the sametime.ini file of both servers to the same value and ensure that all the communities in your cluster are using the same community ID. This prevents duplicate communities from being created on the client when logging into the new host for the first time.


You can now test the managed-community-configs.xml file:

1.  Create a policy set that includes the administration update site URL and place the .xml file in the location specified by the update site URL.
2.  Apply the policy to yourself.
3.  Log in to the client to verify the expected changes take effect.
4.  \(Optional\) Enable logging of the managed community settings to help debug problems. To enable logging for the handling of the remote managed-community-configs.xml file, set the following log level in your client's user.home/HCL/Sametime/.config/rcpinstall.properties file: 

    ```
    com.ibm.collaboration.realtime.community.internal.config.level=FINEST
    com.ibm.collaboration.realtime.policy.sametime.level=FINEST
    ```

    where user.home/HCL/Sametime represents the client's workspace location.


-   **[Managed community settings](managed_community.md)**  
Define managed community settings in the managed-community-configs.xml file.

**Parent Topic: **[Sametime client configuration options](sametime_client_configuration.md)

