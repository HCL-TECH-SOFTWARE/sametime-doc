# Logging and tracing on the Sametime Embedded and Connect clients {#t_logging_tracing .task}

Trace logs are stored in a workspace folder on the user's local hard drive or a network drive. Sametime Embedded and Connect client users can enable tracing on their client with the following instructions.

1.  Locate the client workspace.

2.  On the computer where you use the client, use a text editor and open the `rcpinstall.properties` file which is located in the following directory according to the client:

    -   Windows
        -   Sametime Connect Client `C:\Users\user_name\AppData\Roaming\HCL\Sametime\.config\rcpinstall.properties`
        -   Sametime Embedded Client \(single user install path\) `C:\Program Files\HCL\Notes\Data\workspace\.config\rcpinstall.properties`
        -   Sametime Embedded Client \(multi user install path\) `C:\users\user_name\AppData\Local\HCL\Notes\Data\workspace\.config\rcpinstall.properties`
    -   Mac OS

        **Note:** Use the Cmd+Shift+Dot keyboard combination to show hidden folders.

        -   Sametime Connect Client `/Users/user_name/Library/Application Support/HCL Sametime Data/.config/rcpinstall.properties`
        -   Sametime Embedded Client `/Users/user_name/Library/Application Support/HCL Notes Data/Expeditor/Applications/.config/rcpinstall.properties`
        -   Sametime Embedded Client \(multi user install path\) `C:\users\user_name\AppData\Local\HCL\Notes\Data\workspace\.config\rcpinstall.properties`
3.  Add the following lines to the end of the file, depending on what kind of issue you're diagnosing.

    -   General client issues `com.ibm.collaboration.realtime.level=FINE`
    -   Instant messaging issues

        ```
        com.lotus.sametime.community.kernel.level=FINER 
        com.lotus.sametime.im.level=FINEST
        com.lotus.sametime.places.level=FINEST
        com.ibm.collaboration.realtime.rtcadapter.level=FINEST 
        com.ibm.collaboration.realtime.people.internal.level=FINE 
        com.ibm.collaboration.realtime.internal.sametime.level=FINER 
        com.ibm.collaboration.realtime.login.level=FINEST
        com.ibm.collaboration.realtime.community.internal.level=FINEST
        ```

    -   General login failure

        ```
        com.ibm.collaboration.realtime.community.internal.level=FINEST
        com.ibm.collaboration.realtime.im.community.level=FINEST
        org.apache.commons.httpclient.level=FINE
        com.ibm.rcp.internal.security.auth.module.level=FINEST
        com.ibm.collaboration.realtime.login.level=FINEST
        com.lotus.sametime.community.level=FINEST
        ```

    -   SSO failures

        ```
        com.ibm.collaboration.realtime.community.internal.level=FINEST
        com.ibm.collaboration.realtime.im.community.level=FINEST
        org.apache.commons.httpclient.level=FINE
        com.ibm.rcp.internal.security.auth.module.level=FINEST
        com.ibm.collaboration.realtime.login.level=FINEST
        com.lotus.sametime.community.level=FINEST
        com.ibm.rcp.internal.security.level=FINEST
        com.ibm.rcp.security.level=FINEST
        ```

    -   Managed settings

        ```
        com.ibm.collaboration.realtime.policy.sametime.managedsettings.level=FINEST
        ```

    -   Calendar integration issues

        ```
        com.ibm.rtc.meetings.servers.level=FINEST
        com.ibm.rtc.meetings.shelf.level=FINEST
        com.ibm.rtc.meetings.shelf.ui.level=FINEST
        com.ibm.rtc.meetings.util.level=FINEST
        com.ibm.collaboration.realtime.calendar.level=FINER
        com.ibm.collaboration.realtime.calendar.notes.level=FINEST
        
        ```

    -   Connectivity issues

        ```
        com.ibm.rtccore.level=FINEST
        com.ibm.rtc.spaces.level=FINER
        ```

    -   To reduce the number of log and trace files from being overwritten, increase the option values of the following settings from the default values. The default values are:

        -   For the Connect client: 12 trace files and 6 log files
        -   For the Embedded client: 20 trace files and 12 log files
        In the following example, the values are being changed to save 20 trace and 12 log files.

        ```
        com.ibm.rcp.core.internal.logger.boot.RCPTraceHandler.count=20
        com.ibm.rcp.core.internal.logger.boot.RCPLogHandler.count=12
        ```

4.  Save and close the file.

5.  Restart the Connect client.

6.  View the error log and trace files in the Connect client, by clicking **Help** \> **Support** \> **View Log and View Trace**.

    In most cases, **View Trace** provides the most useful information.

7.  You can include logs and other data into a compressed ifle to send to support for diagnostics.

    1.  In the Notes embedded client, click **Help** \> **Support** \> **Collect Support Data**. In the stand-alone Connect Client, click**Gear icon** \> **Help** \> **Support** \> **Collect Support Data**.

    2.  Select **Enable Customized Tracing**, and then click **Next**.

    3.  Select one or more Sametime options, and then click **Next**.

    4.  Specify if you want to reproduce the issue, and then click **Collect**. When the collection completes, a link to the zip file is provided.

        The resulting file is located

        -   Windows
        -   -   Standalone Client: C:\\Users\\user\_name\\AppData\\Roaming\\HCL\\Sametime\\autopd
-   Notes Embedded single user path: C:\\Program Files\\HCL\\Notes\\Data\\workspace\\autopd
-   Notes Embedded multi user path: C:\\users\\user\_name\\AppData\\Local\\HCL\\Notes\\Data\\workspace\\.autopd
        -   Mac OS
            -   Standalone Client: /Users/user\_name/Library/Application Support/HCL Sametime Data/autopd
            -   Notes Embedded: /Users/user\_name/Library/Application Support/HCL
            -   Notes: Data/Expeditor/Applications/autopd

**Parent Topic: **[Troubleshooting Sametime clients](t_troubleshooting_clients.md)

