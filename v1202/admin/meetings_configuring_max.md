# Configuring the maximum number of meeting participants {#meetings_configuring_max .task}

A maximum of 100 users are supported in a meeting regardless of the selected meeting mode. To reach a wider audience, you can start a live stream and share the link to all intended participants.

You can lower the maximum capacity to any value below 100 as needed. Users who attempt to join a meeting that has reached maximum capacity receive a message indicating that the meeting room is full.

The number of meeting video streams that display in the Meeting window is based on the following:

-   The value set for the maximum number of active video streams to display
-   Most recent active video streams

For example, if the maximum number of participants is 50 and value for maximum video streams is 7. The number of participant tiles displayed is fifty. However, the number of displayed video streams is seven, which includes you. That is, six other video streams plus your video stream are displayed. The six participants displayed are the most active video streams and change as participation in the meeting changes.

The default for the maximum number of displayed video streams is nine. To set the maximum to a different value, see [Increasing the number of video streams displayed during a meeting](increase_activecameras.md).

**Parent Topic:  **[Meetings](meetings_configuring.md)

## Configuring the maximum number of meeting participants in Docker environment {#task_wwg_dfz_wxb}

1.  Open the docker-compose.yml file for editing.

2.  Under the `prosody` section, specify the number of maximum participant in the MAX\_OCCUPANTS parameter.

    ``` {#codeblock_q41_rhz_wxb}
    MAX_OCCUPANTS=max\_number\_meeting\_participants
    ```

3.  Save the docker-compose.xml file.

4.  Restart the Sametime Meeting server. Refer to [Starting and stopping Meeting servers](starting_and_stopping_meeting_servers.md) for details.


## Configuring the maximum number of meeting participants in Docker environment {#task_snj_2fz_wxb}

1.  Open the helm/values.yaml for editing.

    ``` {#codeblock_hcx_4sz_wxb}
    vi helm/values.yaml 
    ```

2.  Specify the number of maximum participant in the MaxOccupants parameter.

    ``` {#codeblock_fps_3sz_wxb}
    MaxOccupants=max\_number\_meeting\_participants 
    ```

3.  Save the file.

4.  Restart the Sametime Meeting Server. Refer to [Starting and stopping Meeting servers](starting_and_stopping_meeting_servers.md) for details.


