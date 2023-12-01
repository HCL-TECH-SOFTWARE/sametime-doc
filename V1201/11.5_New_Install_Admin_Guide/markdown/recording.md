# Managing recording {#recording .task}

You can control how long meeting recordings are available and also disable the recording feature.

**Storing and Archiving Recordings**

Recordings are available for 3 days by default. To change this value, update the EXPIRES\_IN\_DAYS in the custom.env on Docker and the recordingsExpireInDays in the helm/values.yaml on Kubernetes. For more information to apply the changes, see [Applying configuration changes in Kubernetes](apply_configchanges_kubernetes.md).

**Disable Recordings**

If you want to disable the ability to record meetings, use one of the following procedures:

**Docker**

In the .env file, specify the following setting:

ENABLE\_RECORDING=0

**Kubernetes**

In the values.yaml file, specify the following setting:

enableRecording = false

**Parent topic:**[Managing Sametime Meetings](sametime_meeting_administering.md)

