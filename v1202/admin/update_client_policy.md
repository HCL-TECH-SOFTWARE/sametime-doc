# Updating the client policy to include client preferences {#update_client_policy .task}

After creating or updating the managed-settings.xml file and managed-community-configs.xml file to define client preferences, store them on a web server. The URL to the files is defined to the Sametime server throught a Sametime policy.

You must have operating system access to the Sametime server.

1.  Access the Sametime Admin. See [Sametime Admin overview](adminui_overview.md).

2.  Locate or create the policy. If you create a new policy, be certain to increase the policy weight and assign the policy to a group.

3.  In the Sametime Admin, update the following policy attributes.

    -   To define the location of the managed-settings.xml and managed-community-configs.xml files, specify the URL to the directory containing one or both file in the **Sametime update site URL** field. This field is located in the policy's Administration section.
    -   To define the default community server information, specify the **User can set the community server as the default server** field in the Chat section.

**Parent Topic:  **[Defining preferences in the managed-settings.xml file](config_client_xml_file.md)

