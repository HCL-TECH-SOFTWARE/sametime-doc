# Mobile file transfer policies {#c_mobile_file_transfer_policies .concept}

By default, you can send files to other users and subsequently download the shared files. Edit the following policies to fit your business needs.

## Policy id = im.mobile.allowSendFiles, Default Setting: ON {#section_mpp_hdg_htb .section}

By default, you can upload files in a one-to-one chat. This policy only applies to the *Choose from Files* menu item in the chat window. Leave this setting on with Policy id = 1 to allow users to upload files in a one-to-one chat. Uploading files in a group chat will also require Policy id = im.allowTransferringFilesToNwayParticipants to be turned on.

**Note:** Sending photos from either the camera or the photos app is controlled with Policy id = im.mobile.allowSendImages which is discussed below.

## Policy id = im.mobile.allowReceiveFiles, Default Setting: ON {#section_ix3_jdg_htb .section}

By default, downloaded files on mobile devices are stored outside of Sametime. Turn this setting off if you don't want files to be stored outside of the application. This policy covers the following download types.

-   Files shared in a chat — Policy id = im.mobile.allowReceiveFiles must be turned on to allow files to be downloaded and subsequently saved outside of the application.
-   Meeting recordings—By default, you can stream the playback of a recording on Sametime. To allow the download and subsequent saving of a meeting recording. Policy id = im.mobile.allowReceiveFiles must be turned on.
-   Meeting reports—By default, reports can always be downloaded and viewed within Sametime. To allow reports to be saved outside of Sametime, Policy id = im.mobile.allowReceiveFiles must be turned on.

## Policy id = im.mobile.allowSendImages, Default Setting: ON {#section_d4p_sdg_htb .section}

This policy must be turned on to allow images from the device camera or photos app to be sent as inline images in a chat. It does not prevent image files such as PNG or JPG images from being sent through the *Choose from Files* menu.

**Note:** Starting with Sametime 12.0, mobile clients no longer consider Policy 2009 when sending inline images.

## Policy id = im.mobile.allowShareChatImages, Default Setting: ON {#section_aks_wdg_htb .section}

By default, you can share images from the chat. Turn this setting off to restrict users from sharing images from the chat.

**Parent topic:**[File transfer policies](c_file_transfer.md)

