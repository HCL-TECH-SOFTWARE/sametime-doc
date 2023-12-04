# Configuring Sametime Connect Client preferences in the plugin\_customization.ini file {#config_client_pref_plugin .task}

Defining a settings file in the plugin\_customization.ini file is an alternate method for distributing preferences to the Sametime® Connect Client. Unlike the managed-settings.xml file posted on an update site, this method does not provide any policy-based distribution of preferences.

Follow these steps to create a settings XML file and define it in the plugin\_customization.ini file.

1.  Create a settings XML file with a name such as managed-settings.xml.

2.  Define preferences in the settings XML file.

3.  Copy the settings XML file to the location where it will be called from the plugin\_customization.ini file.

4.  Add a key that defines the Expeditor Managed settings framework com.ibm.rcp.managedsettings.provider.file/URL and the name and location of the settings XML file to be used. For example:

    ```
    com.ibm.rcp.managedsettings.provider.file/URL=http://www.example.com/managed-settings.xml
    or
    com.ibm.rcp.managedsettings.provider.file/URL=file://c:/data/mananged-settings.xml
    ```

5.  Save the file and make it available to clients.


Every time the client starts, the plugin\_customization.ini preferences are read.

-   **[Changing the URL for the settings XML file in the plugin\_customization.ini file](config_client_url_xml_file.md)**  
If you must change the URL for the managed settings file, do so by updating the plugin\_customization.ini file.

**Parent Topic: **[Configuring Sametime client preferences with the Expeditor managed settings framework](config_client_mng_xml_pref.md)

