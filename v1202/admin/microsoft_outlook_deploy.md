# Deploying Microsoft Outlook add-ins to users {#microsoft_outlook_deploy .task}

An administrator can centralize the deployment the HCL Microsoft Add-in so that it is available for users within the organization.

See [Determine if Centralized Deployment of add-ins works for your organization](https://docs.microsoft.com/en-us/microsoft-365/admin/manage/centralized-deployment-of-add-ins?view=o365-worldwide).

To distribute the HCL Microsoft Outlook add-in within your environment use the Office 365 admin center. The deployment can be assigned to all users or to specific users and groups. When deployed, the **Get Addin** button to be available to users.

For additional information, see the Micorsoft [Deploy add-ins in the Microsoft 365 admin center](https://learn.microsoft.com/en-us/microsoft-365/admin/manage/manage-deployment-of-add-ins?view=o365-worldwide) topic.

1.  Open the Microsoft Outlook admin center.

2.  Click **Deploy Add-in** and click**Next**.

3.  Click **Upload custom apps**.

4.  Select where to upload the add-in from.

    You should normally choose **Add from URL** and enter the URL for your Sametime Meetings add-in. For example: https://host\_name\_url/outlook/manifest.xml. If the URL is not publicly accessible, open the URL and save the XML file, then select the **Add from file**.

5.  Click **Upload**.

6.  Choose which users and groups to deploy to and whether the add-in is mandated or not.

7.  Click **Deploy**.

    Deployment can take up to 24 hours. Outlook clients must launched their Outlook client again for the add-in to appear in the user interface.


**Parent Topic:  **[Meetings](meetings_configuring.md)

