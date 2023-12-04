# Example: Writing a Java class to filter searches for people and groups {#config_chat_ldap_java_people .task}

If a single search filter is not adequate to resolve user or group name searches, you can write a Java™ class containing a method that specifies exactly how directory searches are conducted. The class can invoke different LDAP search filters depending on search criteria entered by users.

The **Search filter for resolving person names** and the **Search filter for resolving group names** settings in the LDAP directory settings of the Sametime® Administration Tool define the LDAP directory search filters responsible for selecting user and group names from the LDAP directory.

**Note:** You do not have to write Java classes to control the search behavior for both users and groups. You can use a Java class to control the search behavior for users while using a single LDAP search filter to control the search behavior for groups, or vice versa.

The specific source code that you write to support customized LDAP searches is entirely dependent on your environment. This section provides a code sample to help you understand how to write the Java class appropriate for your environment.

**Note:** The searched name must be escaped according to LDAP RFC2254 before adding it to the created LDAP filter. Use the escape and the isHex methods as is from the following example.

The following example invokes different LDAP directory search filters based on the text string that is entered into the Sametime user interface by a user. The search filters invoked by the method are dependent on the directory schema and the search behavior needed for the environment. Assume that three different users want to add the user Victor Lazlow to their Sametime Connect Client buddy lists. Each of the three users searches for Victor Lazlow in a different way. The logic of the Java class dictates the results of these three user searches:

-   User 1

    Input: User 1 enters Victor L\* into the Sametime client user interface to add Victor Lazlow to the Contacts list.

    Results: This search attempt returns an error because the Java class is programmed to return an error when the user enters a text string that includes an asterisk.

-   User 2

    Input: User 2 enters Victor\_Lazlow@example.com into the Sametime client interface.

    Results: This search attempt succeeds and returns the value "Victor\_Lazlow@example.com" \(Victor Lazlow's email address\) from the LDAP directory. The search attempt succeeds in this way because the Java class is programmed to return an LDAP search filter that can resolve an LDAP directory search to a user's email address. The Java class returns this email address search filter if the search text string entered by the end user includes the "at" character \(@\).

-   User 3

    Input: User 3 enters "Victor L" into the Sametime client interface. This search attempt succeeds and returns the common name \(cn\) directory attribute of "Victor Lazlow."

    Results: The search attempt succeeds in this way because the Java class is programmed to return an LDAP search filter that can resolve an LDAP directory search to a user's common name \(cn\). The Java class returns this common name search filter if the search text string entered by the end user does not include either an asterisk or "at" \(@\) character.


Sample code

The code sample that follows shows the Java source code that produces this search behavior. This code creates a Java class named StLdapCustomized that includes the peopleResolveFilter method. The if statements in the peopleResolveFilter method examine the text string entered by the user in the Sametime client user interface and return the appropriate LDAP search filter based on this text string. The comments in the source code explain the purpose of each if statement.

```
public class StLdapCustomized
{
	/**
	 * String representing an escaped forward slash sign '\'
	 */
	private final static String SLASH_SIGN_CONVERTED = "\\5c";

	/**
	 * String representing an escaped * sign '*'
	 */
	private final static String STAR_SIGN_CONVERTED = "\\2a";

	/**
	 * String representing an escaped opening bracket sign '('
	 */
	private final static String OPENING_BRACKET_SIGN_CONVERTED = "\\28";

	/**
	 * String representing an escaped closing bracket sign ')'
	 */
	private final static String CLOSING_BRACKET_SIGN_CONVERTED = "\\29";

	/**
	 * Escape problematic characters in the name to match the LDAP filter escaping
	 * criteria according to RFC2254
	 * rfc2254 - The String Representation of LDAP Search 
	 * @param name the name to escape
	 * @return an escaped string
	 */
	private static String escape(String name)
	{
		StringBuffer escapedName = new StringBuffer();
		for (int i=0; i< name.length(); ){
			switch(name.charAt(i)){
			case '\\':
				// if the next 2 chars are hex we don't need to escape
				if((i< name.length()-2) && isHex(name.charAt(i+1)) &&
						isHex(name.charAt(i+2))){
					escapedName.append('\\');
					escapedName.append(name.charAt(++i));
					escapedName.append(name.charAt(++i));
				}
				else{
					escapedName.append(SLASH_SIGN_CONVERTED);
				}
				i++;
				break;

			case '*':
				escapedName.append(STAR_SIGN_CONVERTED);
				i++;
				break;

			case '(':
				escapedName.append(OPENING_BRACKET_SIGN_CONVERTED);
				i++;
				break;

			case ')':
				escapedName.append(CLOSING_BRACKET_SIGN_CONVERTED);
				i++;
				break;

			default:
				escapedName.append(name.charAt(i));
			i++;

			}
		}

		return escapedName.toString();
	}

	/**
	 * Verifies whether this char is a hex char
	 * @param c
	 * @return
	 */
	private static  boolean isHex(char c){
		boolean hex = true;
		hex = !( Character.digit(c, 16) == -1);
		return hex;
	}

	/**
	 * Generates a search filter for finding a user, given the user's 
	 * name. 
	 * The searched name is escaped according to LDAP filters escaping rules.
	 * The checks on the searched name format should be done before escaping the value.
	 * @param name The user's name as provided by the Sametime client.
	 * @return The search filter, or null if the name is invalid. 
	 * */ 

	public static String peopleResolveFilter (String name) 
	{ 
		String escapedName;
		// prevent users from adding their own wildcards
		if (name.indexOf('*') != -1) 
			return null;

		// if name looks like email, do not search with wildcards, and only search in mail attribute 
		if (name.indexOf('@') != -1) 
		{
			escapedName = escape(name);
			return "(&(objectclass=person)(mail=" + escapedName + ")) ";
		}

		// otherwise, search as CN with wildcard
		escapedName = escape(name);
		return "(&(objectclass=person) (cn=" + escapedName + "*))";
	}
}
```

After writing your Java class, complete the tasks in this section to implement it in either Docker or Kubernetes.

**Parent Topic: **[Creating custom Java classes for searching LDAP](creating_custom_java.md)

