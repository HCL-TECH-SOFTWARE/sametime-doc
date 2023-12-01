# Logging and tracing on the Sametime Embedded and Connect Client {#t_logging_tracing .task}

You can provide these instructions to Sametime Embedded and Connect Client users to enable tracing on their clients. Trace logs are stored in a workspace folder on the user's local hard drive or a network drive.

1.  Locate the client workspace.
2.  On the computer where you use the client, use a text editor and open the `rcpinstall.properties` file which is located in the following directory according to the client:

    **Windows**

    -   Sametime Connect Client

        `C:\Users\user_name\AppData\Roaming\HCL\Sametime\.config\rcpinstall.properties`

    -   Sametime Embedded Client \(single user install path\)

        `C:\Program Files\HCL\Notes\Data\workspace\.config\rcpinstall.properties`

    -   Sametime Embedded Client \(multi user install path\)

        `C:\users\user_name\AppData\Local\HCL\Notes\Data\workspace\.config\rcpinstall.properties`

    **Mac OS \(use keyboard combination "Cmd+Shift+Dot" to show hidden folders\)**

    -   Sametime Connect Client

        `/Users/user_name/Library/Application Support/HCL Sametime Data/.config/rcpinstall.properties`

    -   Sametime Embedded Client

        `/Users/user_name/Library/Application Support/HCL Notes Data/Expeditor/Applications/.config/rcpinstall.properties`

    -   Sametime Embedded Client \(multi user install path\)

        `C:\users\user_name\AppData\Local\HCL\Notes\Data\workspace\.config\rcpinstall.properties`

3.  Add the following lines to the end of the file, depending on what kind of issue you're diagnosing. General client issues:

    `com.ibm.collaboration.realtime.level=FINE`

    **Instant messaging issues:**

    `com.lotus.sametime.community.kernel.level=FINER`

    `com.lotus.sametime.im.level=FINEST`

    `com.lotus.sametime.places.level=FINEST`

    `com.ibm.collaboration.realtime.rtcadapter.level=FINEST`

    `com.ibm.collaboration.realtime.people.internal.level=FINE`

    `com.ibm.collaboration.realtime.internal.sametime.level=FINER`

    `com.ibm.collaboration.realtime.login.level=FINEST`

    `com.ibm.collaboration.realtime.community.internal.level=FINEST`

    **Login issues:**

    **General login failures:**

    `com.ibm.collaboration.realtime.community.internal.level=FINEST`

    `com.ibm.collaboration.realtime.im.community.level=FINEST`

    `org.apache.commons.httpclient.level=FINE`

    `com.ibm.rcp.internal.security.auth.module.level=FINEST`

    `com.ibm.collaboration.realtime.login.level=FINEST`

    `com.lotus.sametime.community.level=FINEST`

    **SSO failures:**

    `com.ibm.collaboration.realtime.community.internal.level=FINEST`

    `com.ibm.collaboration.realtime.im.community.level=FINEST`

    `org.apache.commons.httpclient.level=FINE`

    `com.ibm.rcp.internal.security.auth.module.level=FINEST`

    `com.ibm.collaboration.realtime.login.level=FINEST`

    `com.lotus.sametime.community.level=FINEST`

    `com.ibm.rcp.internal.security.level=FINEST`

    `com.ibm.rcp.security.level=FINEST`

    **Managed settings:**

    `com.ibm.collaboration.realtime.policy.sametime.managedsettings.level=FINEST`

    **Calendar integration issues:**

    `com.ibm.rtc.meetings.servers.level=FINEST`

    `com.ibm.rtc.meetings.shelf.level=FINEST`

    `com.ibm.rtc.meetings.shelf.ui.level=FINEST`

    `com.ibm.rtc.meetings.util.level=FINEST`

    `com.ibm.collaboration.realtime.calendar.level=FINER`

    `com.ibm.collaboration.realtime.calendar.notes.level=FINEST`

    **Connectivity issues:**

    `com.ibm.rtccore.level=FINEST`

    `com.ibm.rtc.spaces.level=FINER`

    **\(Optional\) Prevent more of the log and trace files from being overwritten by increasing the values of the following settings from the default to a larger number:**

    `com.ibm.rcp.core.internal.logger.boot.RCPTraceHandler.count=20`

    `com.ibm.rcp.core.internal.logger.boot.RCPLogHandler.count=12`

    The default settings save 12 trace files and 6 log files \(Connect client\) or 10 trace files and 6 log files \(Embedded client\). In this example, we are saving 20 trace files and 12 log files for the Connect client.

4.  Save and close the file.
5.  Restart your Connect Client.
6.  View the error log and trace files in the Connect Client, by clicking **Help** \> **Support** \> **View Log and View Trace**. In most cases, **View Trace** provides the most useful information.
7.  **Optional:** You can collect logs and other data into a zip file and provide it to someone else for diagnostics.

    1.  In the Notes embedded client, click **Help** \> **Support** \> **Collect Support Data**.

        In the stand-alone Connect Client, click **gear icon** \> **Help** \> **Support** \> **Collect Support Data**.

    2.  Select **Enable Customized Tracing**, and then click **Next**.
    3.  Select one or more Sametime options, and then click **Next**.
    4.  Specify if you want to reproduce the issue, and then click **Collect**. When the collection completes, a link to the collection zip file is provided.
    5.  The resulting file will be located
    **Windows**

    -   Standalone Client `C:\Users\user_name\AppData\Roaming\HCL\Sametime\autopd`
    -   Notes Embedded single user path `C:\Program Files\HCL\Notes\Data\workspace\autopd`
    -   Notes Embedded multi user path `C:\users\user_name\AppData\Local\HCL\Notes\Data\workspace\.autopd`
    **Mac OS**

    -   Standalone Client `/Users/user_name/Library/Application Support/HCL Sametime Data/autopd`
    -   Notes Embedded `/Users/user_name/Library/Application Support/HCL Notes Data/Expeditor/Applications/autopd`

**Parent topic:**[Troubleshooting Sametime clients](t_troubleshooting_clients.md)

