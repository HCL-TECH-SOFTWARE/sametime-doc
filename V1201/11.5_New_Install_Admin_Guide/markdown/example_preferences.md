# Deploy managed-settings.xml or managed-community-configs.xml file to a web server {#example_preferences .task}

Once the xml file\(s\) is ready to be deployed to users, the file must be placed on a web server to host it. This can be any web server the users can reach.

The web server that hosts the managed-settings.xml and/or managed-community-configs.xml must allow these two files to be accessed anonymously.

**Procedure**

1.  Prior to placing the managed-settings.xml and/or managed-community-configs.xml on the web server, open the file using a browser and ensure it is not producing any syntax errors. If errors are present, they should be resolved first.

2.  If choosing Domino for the web server it must be running the http task. Place the managed-settings.xml file in the Domino web server directory:

    For windows:

    ```
    c:\Program Files\HCL\Domino\data\domino\html
    ```

    For Linux:

    ```
    /local/notesdata/domino/html 
    ```

    Example resulting URL:

    ```
    http://www.example.com/managed-settings.xml 
    ```

3.  The managed-settings.xml file must be named “managed-settings.xml”.

    If you require more than one managed-settings.xml file, they can be placed in different folders on the web server, for example \(on Windows\):

    ```
    c:\Program Files\HCL\Domino\data\domino\html\default\managed-settings.xml 
    
    c:\Program Files\HCL\Domino\data\domino\html\nomeetings\managed-settings.xml 
    ```

    Example resulting URLs:

    ```
    http://www.example.com/default/managed-settings.xml 
    
    http://www.example.com/nomeetings/managed-settings.xml 
    ```

4.  The Sametime server will look in the folder specified in the URL for both a managed-settings.xml and a managed-community-configs.xml. If you are using both types of files, your URL defined in the policy must be scoped to the folder path where the two files reside.

    For example:

    ```
    http://www.example.com/default 
    
    http://www.example.com/nomeetings 
    ```

    **Note:** Do not use the following special characters in your folder names

    -   Ampersand \(&\)
    -   Apostrophe\(‘\)
    -   Quotation mark \(“\)
    -   Greater than character \(\>\)
    -   Less than character \(<\)
    -   backslash character \(\\\)
    -   Forward slash \(/\)
    -   spaces \( \)
    -   hash symbol \(\#\)

[Updating the client policy to include the managed settings URL](update_client_policy.md).

**Parent topic:**[Defining preferences in the managed-settings.xml file](config_client_xml_file.md)

