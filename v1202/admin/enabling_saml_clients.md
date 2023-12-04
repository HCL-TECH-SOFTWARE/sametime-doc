# Enabling SAML authentication in installed clients {#enabling_saml_clients .task}

Enable SAML authentication from within the HCL® Sametime® Connect or Embedded client that is already installed on a computer.

Enabling SAML authentication in an installed client requires the following information, which the Sametime administrator can provide to users:

-   URL of the authentication server
-   HTML tag ID or tag name for the following fields depending on the type of login: **User name**, **Password**, and **Submit**

These instructions only apply to a client that is already installed on a computer \(the stand-alone Connect client or the Embedded client that runs in HCL Notes®\).

1.  Open the Sametime **Preferences** dialog box.

    -   In the stand-alone Connect client, click **Actions and Preferences** \> **Preferences** .
    -   n the client embedded in HCL Notes, click **File** \> **Preferences** \> **Sametime**.
2.  In the **Preferences** list, click **Server Communities**.

3.  On the Server Communities page, click **New Server Community**.

4.  On the New Server Community page, fill in the information listed in Table 1.

    Server community type
    :   Select **Sametime**.

    Server community type
    :       Server community name
    :   Type the community name.

5.  Click the **Log In** tab.

    1.  Turn on the **Use token-based single sign-on** parameter.

    2.  In the **Authentication server** field, type the authentication server's URL, which you can obtain from your administrator.

    3.  In the **Authentication type** field, select **SAML** and complete the following fields.

        Login
        :   If users log in to your company's authentication server by typing a user name and password in the browser login page, select **Browser** and do not specify a value for the **User name** and **Password** fields.

        :   If users log in to your company's authentication server by typing a user name and password in a Sametime dialog box, select **Form** and specify a value for the **User name** and **Password** fields.

        User name tag
        :   Specify either the HTML tag ID or the tag name of the user name field in the IdP.

        Password tag
        :   Specify either the HTML tag ID or the tag name of the password field in the IdP.

        Submit tag
        :   If **Browser** was selected, this field is optional. Specify a value for this field if you want to enable automatic log-ins after network interruptions, provide either the HTML tag ID or the tag name of the submit field in the IdP. If you do not specify a value, passwords are not retained from one log-in to the next.

        :   If **Form** was selected, specify either the HTML tag ID or the tag name of the submit field in the IdP.

6.  Click the **Server** tab and provide the following information.

    Host server
    :   The fully qualified host name of the Sametime server.

    Server community port
    :   The Sametime server port, specify 1533.

7.  Click **OK** to save your changes and close the dialog box.


**Parent Topic: **[Setting up SSO using SAML](enabling_sso_saml.md)

