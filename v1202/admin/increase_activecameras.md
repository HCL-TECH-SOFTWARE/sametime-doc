# Increasing active cameras {#increase_activecameras .task}

The default allowed active cameras is eight, with the most recent active cameras displaying.

Including your own, by default the maximum number of videos that can be shown simultaneously in a meeting is *nine*. The default is the officially supported and recommended setting based on testing. Depending on your business needs, you can increase the value. Restore to the default setting if performance isses are encountered.

-   Docker
    -   custom.env
-   Kubernetes
    -   helm/values.yaml

**Note:** These values are case sensitive and must be entered as shown below.

1.  Modify the configuration file. The default value is 8.

    1.  For Docker environments, update the CHANNEL\_LAST\_N parameter to increase the number of active cameras. For example, CHANNEL\_LAST\_N = 11. When applied, you are able to view up to 12 simultaneous videos in a meeting including your own tile.
    2.  For Kubernetes environments, update the channelLastN parameter to increase the number of active cameras. For example, channelLastN : 11. When applied, you are able to view up to 12 simultaneous videos in a meeting including your own tile.
2.  Restart the Sametime server to apply the changes. For more information, refer to [Starting and stopping servers](https://help.hcltechsw.com/sametime/12/admin/starting_and_stopping_servers.html).


**Parent topic:**[Managing Sametime Meetings](sametime_meeting_administering.md)

