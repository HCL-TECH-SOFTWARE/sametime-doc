# Configuring live streaming {#enable_disable .task}

If you have a high number of users that need to attend a meeting without two-way interaction, you can live stream the conference to YouTube. It will only be a listen and watch experience for attendees in the live stream. The users will attend this meeting using a YouTube URL. Most of the live stream requirements are on the YouTube account that belongs to the user who moderates the meeting. In the context of YouTube live streaming, consider the Sametime Meeting server as an “encoder” for YouTube. There is no requirement to install additional software.

**Prerequisites for Livestream:**

-   To use the live stream feature, you must have meeting recordings enabled on the Sametime Meeting Server. If you do not have a meeting recorder, a live stream will not be available.
-   Only meeting moderators can start the live stream. Meeting moderators are indicated with a small star on their participant tile.

**YouTube Requirements for Live Streaming**

-   The person who moderates the meeting must have a YouTube publishing enabled account. It can take up to 24 hours for YouTube to enable this feature on an account. Users should plan accordingly.
-   Your YouTube channel needs to be verified. See the [YouTube Studio help](https://support.google.com/youtube/answer/2474026#enable) for details.
-   You require a YouTube Studio tool to create a live stream and obtain a streaming key. The stream name/key and YouTube Live URL are necessary for the Sametime meeting.s

**Disabling Live stream:**

-   Disabling live stream is a server-wide setting; there is no user-based policy available to disable the feature.
-   The live stream will be disabled if you do not have a Sametime meeting recorder.

This page describes the requirements for live streaming, as well as the steps to disable the feature.

If you need meeting recordings enabled and live stream disabled, follow this procedure:

**Note:** All commands provided require running as ROOT or SUDO access. If not running as root user, preface all commands with ‘sudo'.

**Procedure for Docker based Meeting Servers**

1.  Place the custom.env in edit mode.

    ```
    vi custom.env 
    ```

2.  Add the following line:

    ```
    REACT_APP_LIVE_STREAMING_ENABLED=false
    ```

3.  Save the custom.env file.
4.  Restart the Sametime Meeting Server using the instructions in the topic [Starting and stopping Meeting servers](starting_and_stopping_meeting_servers.md).

**Procedure for Kubernetes based Meeting Servers**

1.  Place the helm/values.yaml in edit mode.

    ```
    vi helm/values.yaml
    ```

2.  Change the following line to **false**.

    ```
    enableLiveStreaming=false
    ```

3.  Update the deployment use the helm command:

    ```
    helm upgrade deployment helm/. 
    ```

4.  Restart the Sametime Meeting Server using the instructions in the topic [Starting and stopping Meeting servers](starting_and_stopping_meeting_servers.md).

**Parent topic:**[Managing Sametime Meetings](sametime_meeting_administering.md)

