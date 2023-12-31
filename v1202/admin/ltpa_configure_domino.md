# Integrating Sametime with HCL Domino {#ltpa_configure_domino .task}

This topic includes the procedure to enable LTPA when Sametime is integrated with the Domino server for use with web based mail, Verse and iNotes.

Before you start you need an LTPA key which as an example can be generated by WebSphere Liberty. For more information on using WebSphere Liberty to generate LTPA keys, see [Generating LTPA keys](ltpa_generate_key.md).

You also must configure the LTPA keys on the Sametime server.

To configure the Domino server, you must create a Web SSO configuration document and import the WebSphere LTPA keys. The following procedure describes the steps which are completed on the Domino mail server.

1.  Open the names.nsf and select the `Web Configurations`. Edit the `Web SSO LtpaToken` document.

    **Note:** If a `Web SSO LtpaToken` document does not exit, it must be created from the Notes or Admin client **Create** menu. See [Creating a Web SSO configuration document](https://help.hcltechsw.com/domino/12.0.2/admin/conf_creatingawebssoconfigurationdocument_t.html) for the details.

2.  Select **Keys** \> **Import WebSphere LTPA Keys**.

3.  Specify the path to the LTPA Keys file created following [Generating LTPA keys](ltpa_generate_key.md) and select **OK**.

    **Note:** If prompted, select **Format: LtpaToken and LtpaToken2** as the **Use Token** value.

4.  Save and close the Web SSO LtpaToken document.

5.  In the Domino mail server document under **Internet Protocols - Domino Web Engine**, select **Multiple Servers \(SSO\)** as the session authentication.

6.  Start the Domino and Sametime servers to apply the changes. For more information, refer to [Starting and stopping the Sametime server](starting_and_stopping_servers.md).


**Parent Topic:  **[Setting up SSO using LTPA](enabling_sso_ltpa.md)

