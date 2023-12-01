# General file transfer policies {#c_general_file_transfers .concept}

General policies apply to all client settings. Edit the following policies to fit your business needs.

## Policy id = 1, Default Setting: ON {#section_mkw_5cg_htb .section}

By default, you can share files with other users. Turn this setting off to restrict file sharing between users. Any configuration made to this policy is applied across all clients. This policy affects one-to-one chats and works in conjunction with Policy id = im.allowTransferringFilesToNwayParticipants.

**Note:** To allow or restrict users from downloading files such as meeting recordings or reports, configure Policy id = im.mobile.allowReceiveFiles. For more information, refer to [Mobile file transfer policies](c_mobile_file_transfer_policies.md).

## Policy id = 2, Default Setting: 100000 {#section_xsg_ycg_htb .section}

By default, the maximum file size of your load file or compressed file is 100,000 KB. You can change the maximum file size. Any configuration made to this policy is applied across all clients.

## Policy id = im.allowTransferringFilesToNwayParticipants, Default Setting: ON {#section_ssp_1dg_htb .section}

By default, you can share files in *group chats*. To allow users to share files in a group chat, enable this policy and Policy id = 1.

**Parent topic:**[File transfer policies](c_file_transfer.md)

