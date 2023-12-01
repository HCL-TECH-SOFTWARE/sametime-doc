# Disabling guest access {#disable_guest_access .task}

You can disable guest access and remove the option from the meeting attend page.

Set the following policy to 0:

**policy - anonymous - im.meetingsEnabled = 0.**

Enter the following commands to remove guest access from the meeting attend page:

**Docker**

In the .env file, specify the following setting:

ENABLE\_GUESTS=0

**Kubernetes**

Specify the following setting in `meetings-configmap.yaml`:

`ReactAppShowGuestLoginByDefault in meetings-configmap.yaml (helm/templates)`

**Parent topic:**[Managing Sametime Meetings](sametime_meeting_administering.md)

