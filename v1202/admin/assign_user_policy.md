# Assigning users and groups to policies {#assign_user_policy .task}

Policies can be assigned to users or groups. Policy configuration is done inside the policies.user.xml file.

1.  Open the policies.user.xml file with a text or XML editor.

2.  Ensure you are in the correct policy inside the file. Look for the line that begins with **`<policy id=”Your Custom Policy”`**.

    Where “Your Custom Policy” is the name of the policy you wish to modify.

3.  Inside the policy there is a tag called `<policyAssignment>` ending with `<policyAssignment>`. Enter your policy groups between these tags using: **`<assignment type=”1” id=”v11TestGroup”/>`**

    **Note:** When using Domino groups, they should be created as Multi-Purpose Groups.

    Where the `“v11TestGroup”` is the name of your group.

4.  Save and close the file when complete.


**Parent topic:**[Managing policies](managing_policies.md)

