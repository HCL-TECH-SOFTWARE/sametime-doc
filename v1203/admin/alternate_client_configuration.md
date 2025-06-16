# Configuring Sametime preferences using HCL Notes policies {#alternate_client_configuration .task}

To configure preferences for the HCL Sametime Embedded Client for Notes, you can also use the [Domino® Desktop policy settings document](https://help.hcltechsw.com/domino/11.0.0/conf_policies_c.html). These policies are applied when a Notes user logs into their home mail server and retrieves their desktop policy. These settings will not apply to any other client.

The Domino desktop policy settings document [Custom Settings](https://help.hcltechsw.com/domino/11.0.0/conf_specifying_custom_settings_for_a_desktop_policy_t.html?hl=managed%2Csettings) tab contains a Managed Settings option, through which you can define preferences.

If you do not use Domino Administrative policies in your organization, you can configure the same settings by leveraging the managed-settings.xml file and defining it in the Sametime policy.

If the preference is set in both the Domino Desktop policy settings document and the managed settings, the preference in the Desktop policy settings document takes precedence. Best practices indicate that it's preferable to set the preference in the Desktop policy settings document or the managed settings, but not in both places.

**For step-by-step instructions see the article:**

[How to use a Notes desktop policy to push Sametime embedded client settings](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0036468).

**Parent Topic:  **[Sametime client configuration options](sametime_client_configuration.md)

