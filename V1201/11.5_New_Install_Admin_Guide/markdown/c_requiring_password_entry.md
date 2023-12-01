# Requiring password entry at login {#c_requiring_password_entry .concept}

As an administrator, you can select the type of authentication scheme employed on your environment. Edit the following policy to fit your business needs.

## Policy id = im.mobile.disablePasswordSave, Default Setting: OFF {#section_bv3_jym_htb .section}

To save your password for the next login, retain the default setting of this policy and enable *Remember Password* from the community settings. Turn this setting on to require users to enter their password at every login. When turned on, the client removes the password regardless if *Remember Password* is enabled.

This policy also applies to meeting passwords. For safety reasons, Apple restricts users from texting while driving. The ability to save meeting passwords allows CarPlay users to safely enter meeting rooms while driving. When turned off, the *Save Password* switch is displayed on the password entry dialog when joining password-protected meetings. When turned on, the *Save Password* switch is disabled. In the event that a password has been saved prior to changing the default settings, then the password is stored in a secure storage.

**Note:** This policy does not apply to the login password for environments that use the SAML-based authentication scheme. However, this policy still applies to meeting passwords in these environments.

**Parent topic:**[Security policies](c_security_policies.md)

