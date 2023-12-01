# Updating the client policy to include the managed settings or managed community configs URL {#update_client_policy .task}

Once the xml file\(s\) is ready to be deployed to users, the file must be placed on a web server to host it. This can be any web server the users can reach.

This step requires operating system access to the Sametime Community server.

After creating a managed-settings.xml file or a managed-community-configs.xml file and placing the files on a web server, the URL to the file\(s\) must be defined inside the Sametime Policy.

1.  Follow the instructions in the topic [Configuring policies](configuring_policies.md) for instructions on how to remote into the server and locate the policies.user.xml file.

2.  Create a backup of the policies.user.xml file by making a copy of it and saving it to another location.

3.  You can modify the default policy or [create new policies](creating_new_policy.md). If you create a new policy, be certain to [increase the policy weight](changing_user_policy.md) and [assign the policy to a group](assign_user_policy.md). Each policy weight must be unique.

4.  The Sametime server will look in the folder specified in the URL for both a managed-settings.xml and a managed-community-configs.xml. If you are using both types of files, your URL defined in the policy must be scoped to the folder path where the two files reside.

5.  For the purposes of this topic, these steps will modify the default policy. The managed-settings.xml and managed-community-configs.xml are part of the “im” policy.

    1.  Open the policies.user.xml file using a text or XML editor.
    2.  To modify the default template locate the line that begins with:

        ```
        <policy id="im.default.policy" weight="1"> 
        ```

    3.  Within this section, locate the attribute id=”im.2012”. Change the **default-value=””** to your managed-settings URL folder.

        **Note:** The URL must specify the folder in which the file resides. The server automatically appends both managed-settings.xml and managed-community-configs.xml to the URL and looks for both files.

        ```
        default-value=”http://www.example.com/default/” 
        ```

        For example:

        ```
        <p:policy-attribute current-value="" default-value=" http://www.example.com/default" description="im.2012.desc" id="im.2012" label="im.2012.label" master-attribute-link="null" possible-value-labels="null" possible-values="null" type="string" visible="true"/> 
        
         
        ```

        Managed settings only apply to the user’s primary \(or default\) community. It may also be helpful to set the “im.2019” policy attribute. User must set this community as the default server community” which will force the user to set this server to be their default community.

        For example:

        ```
        <p:policy-attribute current-value="1" default-value="1" description="im.2019.desc" id="im.2019" label="im.2019.label" master-attribute-link="null" possible-value-labels="null" possible-values="null" type="boolean" visible="true"/> 
        ```

6.  Save and close the file.

    **Note:**

    -   As a best practice, open the policies.user.xml file with a browser to check for any formatting problems.
    -   Sametime policies refresh once per hour. You can wait one hour and then test the settings, or you can restart the “ST Policy” service \(Windows only\) to test right away.
    -   When testing Managed Settings, be aware that settings are retrieved upon login. The settings may not take effect until the client is restarted.
    For troubleshooting managed settings and to download a sample file see the article [How to troubleshoot Managed Settings for Sametime](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0038860).


**Parent topic:**[Defining preferences in the managed-settings.xml file](config_client_xml_file.md)

