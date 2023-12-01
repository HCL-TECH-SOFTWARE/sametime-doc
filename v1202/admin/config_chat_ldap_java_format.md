# Example: Writing a Java class to format names returned in a search {#config_chat_ldap_java_format .task}

To return a user name in a format that is not available in an LDAP directory entry attribute, you can write a Java™ class that manipulates existing information in the LDAP directory to produce the user name in the desired format.

In most environments, the value of the **The attribute of the person entry that defines the user's name** setting can specify a common LDAP directory attribute, such as **cn** \(common name\) or **mail** \(email address\). When configured in this way, the search returns the value assigned to a user's cn or mail directory attribute and displays this value in the HCL® Sametime® client user interface.

To return names in a format different from the LDAP directory attributes, create a custom Java class. For example, you might create a Java class that does the following:

-   Combines the values of two LDAP directory attributes to produce the user name in a desired format.
-   Edits the information in a single LDAP directory attribute to produce the user name in a format that is different than the value specified by the attribute.

The sample code that follows shows how to combines the values of the sn and givenName attributes to return a user name with the surname shown first, assuming the following requirements:

-   LDAP searches must return a user name in the format surname, given name \(for example: Smith, John\)
-   None of the LDAP directory attributes specify the user name in the surname, given name format.
-   The LDAP directory attribute **sn** specifies each user's surname.
-   The LDAP directory attribute **givenName** specifies each user's given name.

Sample code

This example takes values from the sn and givenName directory attributes and combines these values into a single display name in the format of surname, given name.

```
public class StLdapCustomizedAttributes

{

public static String displayName (String givenName, String sn) 

{

String result = sn + ", " + givenName;

return result;

}

}

```

After writing your Java class, complete the tasks in this section to implement it in either Docker or Kubernetes.

**Parent topic:**[Creating custom Java classes for searching LDAP](creating_custom_java.md)

