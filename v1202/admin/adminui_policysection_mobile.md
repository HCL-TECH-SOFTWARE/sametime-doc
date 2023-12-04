# Mobile {#adminui_policysection_mobile .concept}

|Policy|Description|Policy ID|
|------|-----------|---------|
|Allow mobile client| |im.2010|
|Disable untrusted SSL|User cannot log into a server that doesn't have a certificate trusted by the device. Turn this setting off to enable the use of self-signed certificates. This rule also applies to pre-production environments that use self-signed certificates. The default value is on.|im.mobile.disableUntrustedSsl|
|Disable password save|User cannot save password on their mobile device. Default value is on.To save your password for the next login, retain the default setting of this policy and enable Remember Password from the community settings. Turn this setting on to require users to enter their password at every login. When turned on, the client removes the password regardless if Remember Password is enabled.

This policy also applies to meeting passwords. For safety reasons, Apple restricts users from texting while driving. The ability to save meeting passwords allows CarPlay users to safely enter meeting rooms while driving. When turned off, the Save Password switch is displayed on the password entry dialog when joining password-protected meetings. When turned on, the Save Password switch is disabled. In the event that a password has been saved prior to changing the default settings, then the password is stored in a secure storage.

|im.mobile.disablePasswordSave|
|Allow mobile user to send files|By default, you can upload files in a one-to-one chat. This policy only applies to the Choose from Files menu item in the chat window. Leave this setting on with Policy id = 1 to allow users to upload files in a one-to-one chat. Uploading files in a group chat will also require Policy id = im.allowTransferringFilesToNwayParticipants to be turned on.Sending photos from either the camera or the photos app is controlled with Policy id = im.mobile.allowSendImages which is discussed below.

|im.mobile.allowSendFiles|
|User can share files with other apps| | |
|Allow mobile user to send images|This policy must be turned on to allow images from the device camera or photos app to be sent as inline images in a chat. It does not prevent image files such as PNG or JPG images from being sent through the Choose from Files menu. Default is on.|m.mobile.allowSendImages|
|Allow mobile user to share chat images with other apps|By default, you can share images from the chat. Turn this setting off to restrict users from sharing images from the chat.|m.mobile.allowShareChatImages|
|Restrict copy/paste from chat|Prevent users from copying clipboard data in to other apps.| |
|Enable URL preview| | |
|User can export their Sametime contact information to a device contact application on their device|Applied only to Android devices.

| |

**Parent Topic: **[Policy sections](adminui_policy_sections.md)

