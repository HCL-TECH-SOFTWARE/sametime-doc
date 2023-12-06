# Disabling guest access {#disable_guest_access .task}

You can disable guest access and remove the option from the meeting attend page.

1.  Set the following policy to 0.

    ``` {#codeblock_q2z_hbf_lzb}
    policy - anonymous - im.meetingsEnabled = 0
    ```

2.  Enter the following commands to remove guest access from the meeting attend page.

    -   For Docker, in the .env file, specify the following setting:

        ``` {#codeblock_ytq_4bf_lzb}
        ENABLE_GUESTS=0
        ```

    -   For Kubernets, Specify the following setting in meetings-configmap.yaml

        ``` {#codeblock_tkp_rbf_lzb}
        ReactAppShowGuestLoginByDefault in meetings-configmap.yaml (helm/templates)
        ```


**Parent Topic:  **[Managing Sametime Meetings](sametime_meeting_administering.md)

