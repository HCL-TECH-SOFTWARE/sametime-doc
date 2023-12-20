# Preventing guest access {#disable_guest_access .task}

You can disallow guest access to meeting.

There are two tasks to complete: turn off the meeting policy and meeting login prompt. The user receives a Guest not allowed for this meeting message.

1.  Log into the Sametime Admin and open the Anonymous policy.

    Guests are assigned the Anonymous policy.

2.  Locate the Meeting section of the policy and turn off the Allow Sametime Meetings attribute.

3.  Update the configuration file to not allow a login prompt to display.

    -   For Docker, in the .env file, specify the following:

        ``` {#codeblock_ytq_4bf_lzb}
        REACT_APP_ALLOW_GUEST_LOGIN=false 
        ```

    -   For Kubernetes, Specify the following setting in values.yaml file, specify the following:

        ``` {#codeblock_tkp_rbf_lzb}
        REACT_APP_ALLOW_GUEST_LOGIN:false 
        ```


**Parent topic: **[Managing Sametime Meetings](sametime_meeting_administering.md)

