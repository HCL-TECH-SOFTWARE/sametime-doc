# Creating a new policy other than the default policy {#creating_new_policy .task}

Sametime policies are configured in the policies.user.xml file.

1.  Remote into the Sametime server.

2.  Browse to the policies.user.xml file located in the Domino program directory.

3.  Open the file using a text or XML editor.

4.  To create a new instant messaging policy, locate the sample at the top of the file. It is inside of the commented lines that begin with `<!—` and end with `--!>`.

5.  Remove the comment syntax `<! –` and `--!>`.

6.  Make modifications as desired to the sample.

7.  Save and close the file.

8.  For the policy to take immediate effect, restart the Sametime server. Otherwise, the policy refresh happens once per hour. "


**Parent topic:**[Managing policies](managing_policies.md)

