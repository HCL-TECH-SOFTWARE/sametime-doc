# Enabling SAML authentication in installed clients {#enabling_saml_clients .task}

Enable SAML authentication from within the HCL® Sametime® Connect or Embedded client that is already installed on a computer.

Enabling SAML authentication in an installed client requires the following information, which the Sametime administrator can provide to users:

-   URL of the authentication server
-   HTML tag ID or tag name for the following fields depending on the type of login: User name, Password, Submit

These instructions only apply to a client that is already installed on a computer \(the stand-alone Connect client or the Embedded client that runs in HCL Notes®\).

**Procedure**

1.  Open the **Sametime Preferences** dialog box.

    -   In the stand-alone Connect client, click **Actions and Preferences** \> **Preferences** .
    -   In the client embedded in HCL Notes, click **File** \> **Preferences** \> **Sametime**.
2.  In the **Preferences** list, click **Server Communities**.

3.  On the Server Communities page, click **New Server Community**.

4.  On the New Server Community page, fill in the information listed in Table 1.

    |Option|Description|
    |------|-----------|
    |Server Community type|Select **Sametime**.|
    |Server Community name|Type the community name.|

5.  Click the **Log In** tab and fill in the information listed in Table 2.

    |Option|Description|
    |------|-----------|
    |Use token-based single sign-on|Select this option.|
    |Authentication server|Type the authentication server's URL, which you can obtain from your administrator.|
    |Authentication type|Select **SAML**.|
    |Login \> Browser|If users log in to your company's authentication server by typing a user name and password in the browser login page, select **Browser** and ignore the **User name** and **Password** fields. The **Submit tag** field is optional: if you want to enable automatic log-ins after network interruptions, provide either the HTML tag ID or the tag name of the submit field in the IdP. If you omit the **Submit tag**, then passwords are not retained from one log-in to the next.|
    |Login \> Form|If users log in to your company's authentication server by typing a user name and password in a Sametime dialog box, select **Form** and fill in the following fields:

    -   **User name tag:**Provide either the HTML tag ID or the tag name of the user name field in the IdP.
    -   **Password tag:**Provide either the HTML tag ID or the tag name of the password field in the IdP.
    -   **Submit tag:**Provide either the HTML tag ID or the tag name of the submit field in the IdP.
|

6.  Click the **Server** tab and provide the information listed in Table 3.

    |Option|Description|
    |------|-----------|
    |Host server|Type the fully qualified host name of the Sametime Community Server.|
    |Server community port|Type 1533.|

7.  Click **OK** to save your changes and close the dialog box.


**Parent topic:**[Setting up SSO using SAML](enabling_sso_saml.md)

