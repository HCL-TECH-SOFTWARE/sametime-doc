# Enabling Microsoft Outlook Add-in {#enable_microsoft_outlook .task}

To use the Sametime Meetings add-in for Microsoft Outlook, it must be enabled on the Sametime server. The add-in is provided as part of Sametime installation package.

For additonal information about Microsoft add-ins, see the following Microsoft documentation:

-   [Deploy and publish Office Add-ins](https://docs.microsoft.com/en-us/office/dev/add-ins/publish/publish)
-   [Publish add-ins via Centralized Deployment](https://docs.microsoft.com/en-us/office/dev/add-ins/publish/centralized-deployment)

**Parent Topic:  **[Meetings](meetings_configuring.md)

## Enabling the add-in on Docker {#task_yck_p4k_3tb}

1.  Edit the .envfile.

2.  Change the `ENABLE_OUTLOOK_ADDIN` parameter from false to true.

3.  Find the parameter `COMPOSE_PROFILES=outlookAddin` parmater and remove the comment character \(\#\).

4.  Save your changes and restart the server to apply the changes.

    See [Starting and stopping Meeting servers](starting_and_stopping_meeting_servers.md) for additional information.


## Enabling the add-in on Kubernetes {#task_yqx_q4k_3tb}

1.  Edit the values.yaml file.

2.  Change the `enableOutlookAddin` parameter from false to true.

3.  Save your changes and restart the server to apply the changes.

    See [Starting and stopping Meeting servers](starting_and_stopping_meeting_servers.md) for additional information.


