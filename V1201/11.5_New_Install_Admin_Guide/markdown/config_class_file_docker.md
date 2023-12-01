# Configuring the class file on Docker {#config_class_file_docker .task}

Use a custom Java class file to transform your searches for LDAP for the community pod.

You must have already created and compiled the class file using Java 1.8.

To configure a custom Java class file to transform your searches for LDAP for the Sametime server on Docker you need to complete the following tasks.

-   Override the default LDAP settings to use the class file

1.  Name the compiled class file StLdapCustomizedAttributes.classfile.

2.  Place the StLdapCustomizedAttributes.classfile into the Sametime installation directory or a sub directory, example: ldap-custom-filter.

3.  Identify the chat-server container ID by running the docker container ls command and finding the chat-server IMAGE. The NAME is the container name. For example: sametime-community-1.

4.  Pull a copy of the StCommunityConfig.xml from the chat-servercontainer by running the following command, where containerid is the container name for the chat server identified in step 2.

    If the StCommunityConfig.xml has already been copied and edited previously for a different setting, skip this step and edit the existingStCommunityConfig.xml.

    ``` {#codeblock_yvy_jlk_mvb}
    
    docker cp <container_name>:/local/notesdata/StCommunityConfig.xml . 
    ```

5.  Update the configuration that pertains to your custom Java class. Open theStCommunityConfig.xml file that was copied from the chat-server contain and edit the <LDAP\> section as it pertains to your configuration.

    The changes depend on what you are modifying, refer to the following table for guidance.

    |Type of change|Parameter name|What to specify|Example|
    |--------------|--------------|---------------|-------|
    |Search filter for resolving person names|PersonResolveFilter|classname.methodname\(\) for your custom code|`StLdapCustomized.peopleResolveFilter()`|
    |Search filter for resolving group names|GroupResolveFilter|Class name and method name for a group filter, using the following format: `Classname.methodname()`|`StLdapCustomized.groupsResolveFilter()`.|
    |Attribute of the person entry that defines the person's name|DescAttribute|Class name and method name for the formatting, with the name of the attribute inside, for example: Classname.methodname\(attribute\_name\)|`StLdapCustomizedAttributes.displayName(cn)`|

6.  Save and close the StCommunityConfig.xmlfile.

7.  Edit the docker-compose.yaml file and add the following under the `community section:`

    ``` {#codeblock_ww1_vkk_mvb}
    
    volumes: 
     - ./ StLdapCustomizedAttributes.class:/local/notesdata/java/ StLdapCustomizedAttributes.class
    ```

    If the class files is placed in a sub-directory, it must be specified in the above volume path.

8.  Save and Restart the server to apply the changes.

    ``` {#codeblock_emt_4kk_mvb}
    
    docker-compose down 
    docker-compose up -d
    ```


**Parent topic:**[Creating custom Java classes for searching LDAP](creating_custom_java.md)

