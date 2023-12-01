# Managing policies {#managing_policies .task}

Sametime policies allows administrators to control user access to features.

Policies are grouped based on the following features:

-   Instant messaging \(chat, image settings, file transfer, plugin management, and mobile features provided by the Sametime server\).
-   Meetings \(conferencing features provided by Sametime server.
-   Media services \(audio and video features provided by Sametime v9 Media Manager\).

When a user authenticates, Sametime applies a default policy if no other policy can be found for that user. You can also assign a custom policy. Custom policies can be designed for specific groups in the company. Sametime 9 Meetings policy changes take effect immediately, while Instant Messaging and Media Services policy changes take effect within an hour. If a user is assigned to more than one policy, then Sametime uses the policy weight to determine precedence.

Policies are only applied from the primary Sametime community defined in the client. Additional server communities' policies are not pushed down to the users' desktops. A user's primary Sametime community is the first community listed in their Sametime client Server Communities Properties settings.

There is also an anonymous policy that is assigned by default to users who have not authenticated, and unauthenticated users always receive this policy.

-   **[Policy behaviors](admin_ssc_policies_understand.md)**  
You can assign anonymous, default, or custom user policies to users or groups to allow or restrict access to certain Sametime features. Sametime uses policy weights and group nesting levels to determine which policies take precedence.
-   **[Configuring policies](configuring_policies.md)**  
In previous versions of Sametime there was a graphical user interface available to configure policies. In Sametime 12.0 configuring policies are done in the policies.user.xml file, which is located on the Sametime server.
-   **[Sametime policy IDs](admin_policy_im_ids.md)**  
This section describes the policies and configurations available in the Sametime deployment.
-   **[Mobile client policies](c_mobileclient_policies.md)**  
While many user policies are available in the Sametime ecosystem, only a subset of these policies apply to the mobile clients. This section describes the policies and configurations available to the said clients.
-   **[Creating a new policy other than the default policy](creating_new_policy.md)**  
Sametime policies are configured in the policies.user.xml file.
-   **[Changing a user policy’s weight](changing_user_policy.md)**  
Each Sametime policy has a weight assigned to it. The weight should be unique. When assigning a weight to a policy, please ensure the weight is unique on each policy and not duplicated.
-   **[Assigning users and groups to policies](assign_user_policy.md)**  
Policies can be assigned to users or groups. Policy configuration is done inside the policies.user.xml file.
-   **[Allowing or restricting custom policies for Sametime clients](admin_policy_enable_custom.md)**  
Optionally allow or restrict features for clients by creating exception rules for the policy service in the policyExceptions.xml file.

**Parent topic:**[Administering](administering.md)

