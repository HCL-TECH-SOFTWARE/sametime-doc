# Configuring live streaming {#enable_disable .task}

If you have a high number of users that need to attend a meeting that does not require two-way interaction, you can live stream the conference to YouTube, and users can access the meeting using a YouTube URL.

A meeting recorder must be enabled on the Sametime Meeting server. If the meeting recorder doesn't exist, live streaming isn't available.

The YouTube channel must be verified. See [YouTube Studio help](https://support.google.com/youtube/answer/2474026#enable) for the details.

The YouTube Studio tool is required to create the live stream and obtain a streaming key. The stream name/key and YouTube Live URL are needed for the Sametime meeting.

Meeting moderator must have a YouTube publishing enabled account. It can take up to 24 hours for YouTube to enable this feature on an account.

Only meeting moderators can start the live stream. Meeting moderators are indicated with a small star on their participant tile.

In the context of YouTube live streaming, the Sametime Meeting server is considered an encoder for YouTube. There is no requirement to install additional software.

Disabling live stream is a server-wide setting; there is no user-based policy available to disable the feature. The live stream is disabled if you do not have a Sametime Meeting recorder.

**Note:** All commands provided require running as ROOT or SUDO access. If not running as root user, preface all commands with sudo.

**Parent Topic:  **[Managing Sametime Meetings](sametime_meeting_administering.md)

## Configuring live streaming in a Docker environment {#task_dct_chx_wxb}

1.  Open the custom.env file for editing.

    ``` {#codeblock_g45_gjx_wxb}
    vi custom.env 
    ```

2.  Add the following line to the file.

    ``` {#codeblock_dx3_jjx_wxb}
    REACT_APP_LIVE_STREAMING_ENABLED=false 
    ```

3.  Save the custom.env file.

4.  Restart the Sametime Meeting server. Refer to [Starting and stopping Meeting servers](starting_and_stopping_meeting_servers.md) for details.


## Configuring live streaming in a Kubernetes environment {#task_gh2_ghx_wxb}

1.  Open the helm/values.yaml file for editing.

    ``` {#codeblock_hrb_kjx_wxb}
    vi helm/values.yaml 
    ```

2.  Change the value for the enableLiveStreaming to false.

    ``` {#codeblock_bxg_kjx_wxb}
    enableLiveStreaming=false  
    
    
    ```

3.  Update the deployment.

    ``` {#codeblock_trg_dkx_wxb}
    helm upgrade deployment helm/
    ```

4.  Restart the Sametime Meeting server. Refer to [Starting and stopping Meeting servers](starting_and_stopping_meeting_servers.md) for details.


