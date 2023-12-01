# Changing a user policy’s weight {#changing_user_policy .task}

Each Sametime policy has a weight assigned to it. The weight should be unique. When assigning a weight to a policy, please ensure the weight is unique on each policy and not duplicated.

By default, users will get the policy with the highest weight.

**For example,**if no changes are made to the default configuration, the default policy has a weight of 1, and the anonymous policy has a weight of 0. If a user were to login, they would receive the default policy with weight of 1.

For more information on how Sametime handles finding more than one policy for a user, please see the topic [Policy Behaviors](admin_ssc_policies_understand.md).

**Note:** Do not change the weight on the default or anonymous policies.

1.  Open the policies.user.xml file with a text or XML editor.

2.  Ensure you are in the correct policy inside the file. Look for the line that begins with **`policy id=”YourCustomPolicy”`**.

    Where `“YourCustomPolicy”` is the name of the policy you wish to modify.

3.  Change the weight to the desired weight number. The higher the weight, the higher the precedence.

    For example, if you have created a new Instant Messaging policy called “Marketing” and want to assign a policy weight, of 2, then the syntax is:

    `<policy id="im.Marketing.policy" weight="2">`


**Parent topic:**[Managing policies](managing_policies.md)

