# Policy types 

There are three types of policies. The Anonymous and Default policies are predefined and cannot be deleted. There is only one of these policy types. All other policies are considered custom policies. There can be many of this type of policy.

The anonymous user policy and the default user policy are automatically assigned.

|Policy type|Description|
|-----------|-----------|
|Anonymous| Users who have not authenticated are assigned the anonymous policy by default.|
| | The anonymous policy cannot be deleted but can be edited if you want to allow or restrict access to certain Sametime features for unauthenticated users.|
| | The anonymous policy always has the lowest policy weight \(0\) and this weight cannot be changed.|
|Default| Users who have authenticated are assigned the default policy if no other policy can be found for that user.|
| | The default policy can be inherited or assigned.|
| | The default policy cannot be deleted but can be edited if you want to allow or restrict access to certain Sametime features.|
| | The default policy has the next lowest policy weight \(1\) after the anonymous policy and this weight cannot be changed.|
|custom policies| Custom policies can be designed for specific users or groups to allow or restrict access to certain Sametime features.|
| | When you create a new policy, the default policy settings are applied as the base settings of the new policy. You can update these settings.|

**Parent topic:   **[Managing policies](adminui_policy_manage.md)

