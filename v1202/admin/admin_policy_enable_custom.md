# Allowing or restricting custom policies for Sametime clients {#admin_policy_enable_custom .task}

Optionally allow or restrict features for clients by creating exception rules for the policy service in the policyExceptions.xml file.

Sometimes you need to disable features for a specific client version or for particular client IDs; for example because of a known problem or a limitation. You can either allow or restrict custom policies for specific client versions and IDs.

The policy service on the Sametime server manages a list of exception rules for specific client versions and client types \(IDs\). The exceptions are assigned a "weight" and are then compared with the user's policy assignment weight, which was calculated by the policy service. If the exception is weighted higher, the user will be assigned the exceptions defined in the policyExceptions.xml file.

The code that handles exception rules is invoked after a user policy is calculated. The STPolicy application \(on the Community Server\) looks for exception rules defined for a client ID and for the client version. If more than one exception rule is found, the rule with the higher weight is selected. The selected exception rule is applied to the user only if its weight is higher than a weight of the policy that was already assigned to that user by his or her direct/group assignment\).

The STPolicy application reads the exception rules when the server is started, and again every time the regular policy rules are loaded from the Sametime System Console \(once every 60 minutes\).

1.  Build the policyExceptions.xml file and deploy it on the Sametime server by completing the following steps.
2.  Create an XML file using standard XML syntax rules with a text or XML/HTML editor.

    Use the following opening and closing tags:

    ```
    <PolicyExceptionsRules>
       ...
    </PolicyExceptionsRules>
    ```

3.  Determine values for the `client_ids` and `client_versions` settings.

    The exceptions can apply to either client versions, client IDs, or a combination of both.

    -   The client version is a base version of the client that includes all fix levels \(for example 8.5.2.0\). You can specify multiple client versions.

        The `client_versions` setting uses a 4 digit number that includes the base Sametime version. The policy exception rules apply to any running client that matches one of the specified `client_versions` values. Table 1 lists examples of clients and their corresponding version values.

        |Client|`client_versions` value|
        |------|-----------------------|
        |Sametime® 8.5.2|8520|
        |Sametime 8.5.2 IFR1|8521|
        |Sametime 9|9000|

    -   The client ID is a specific build of a particular client \(such as Notes® 8.5.2 with Sametime embedded 8.5.2\). You can specify multiple client IDs.

        The `client_ids` setting must be formatted in decimal format. Use the HCL® knowledge article [Table of Client types that are connecting to a Sametime server](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0024444) to identify the client IDs and their corresponding decimal values. Table 2 lists examples of clients and their corresponding hexadecimal IDs and decimal values, which are listed in the technote.

        |Client|Hexadecimal ID|Decimal equivalent|
        |------|--------------|------------------|
        |Sametime Connect client 8.5.2|0x130D|4877|
        |Notes 8.5.2 using the Embedded Sametime 8.5.2 client|0x1240|4672|
        |Notes 9.0.1 using the Embedded Sametime 8.5.2 client|0x1298|4760|

4.  Create the rules in the XML file by inserting a `<Rule />` section \(one for each rule\) between the opening and closing tags that you created in step 1.

    1.  The rule is represented as a section in the file, so format the opening and closing tags as follows:

        ```
        <PolicyExceptionsRules>  
            <Rule id="id" weight="weight" product="product" client_versions="client\_versions" client_ids="client\_ids">
                 ...
            </Rule>
        </PolicyExceptionsRules>
        ```

    2.  Assign values to the variables in the `<Rule />` tag.

        Table 3 explains the settings used in the `<Rule />` tag.

        |Setting|Description|Example|
        |-------|-----------|-------|
        |`id`|Required. A number that identifies the rule. The ID must be unique within the file.|`id="1"`|
        |`weight`|Required. A number that defines the priority of the exception rule to determine whether it should override the direct user/group policy assignment. The weight must be unique within the file and cannot match the regular policy weights.|`weight="10"`|
        |`product`|Required. A two-letter prefix that indicates which product feature policy is affected by the rule:         -   `av`: audio and video \(media services\)
        -   `im`: instant messaging
        -   `ms`: meetings
|`product="im"`|
        |`client_versions`|Optional. This is the 4-digit number representing a specific version of the Sametime client. You must include either the `client_versions` setting, the `client_ids` setting, or both settings. If you omit the `client_versions`setting, the rule is applied only to the specified client IDs.|`client_versions="8500,8520"`|
        |`client_ids`|Optional. This is the decimal value representing the ID of a particular type of Sametime client. You must include either the `client_versions` setting, the `client_ids` setting, or both settings. If you omit the `client_ids` setting, the rule is applied only to the specified client versions.|`client_ids="4870,4874"`|

        The following example shows a rule statement:

        ```
        <PolicyExceptionsRules>
        	<Rule id="1" weight="10" product="im" client_versions="8500,8520" client_ids="4870,4874">
        		\(..... the policy settings are specified here ....\)
        	</Rule>
        </PolicyExceptionsRules>
        ```

5.  For each policy setting that is affected by the rule, create a `<Policy />` statement that specifies the policy ID and setting for each policy exception.

    1.  Begin each statement with the `<Policy />` tag, formatted as shown in the following example.

        ```
        <PolicyExceptionsRules>
        	<Rule id="1" weight="10" product="im" client_versions="8500,8520" client_ids="4870,4874">
        		<Policy id="id" value="value" />
        	</Rule>
        </PolicyExceptionsRules>
        ```

    2.  Assign values to the variables in the `<Policy />` statement.

        Table 4 explains the settings used in the `<Policy />` tag.

        |Setting|Description|Example|
        |-------|-----------|-------|
        |`id`|Required. Policies are predefined and are specified using their IDs. The list of policy IDs for each product feature is available in the following topics:        -   [Instant messaging policy IDs](admin_policy_im_ids.md#)
|`id="2006"`|
        |`value`|Required. Specify the value to use when the policy is implemented. Some values require a URL or a numeric setting to use as a maximum or minimum amount; others might require 0 to disable or 1 to enable the policy.|`value="0"`|

        Important rules about creating the policy exceptions:

        -   List only the exceptions to a policy. The user still retrieves their regular policy assignment and then the exceptions are applied to that.
        -   Specify only one exception rule per product for a specific client ID or version. If more than one exception rule exists for a particular client ID or version, the highest-weight rule will be applied and the others will be ignored.
        -   Place each setting under the appropriate product prefix \(instant messaging, meetings, or media services, described in Table 3\).
        -   For certain attributes, you must omit the product prefix to ensure compatibility with older clients.

            For historical reasons the Connect client and the Notes embedded client support some policy attributes without a product prefix; however the web and mobile clients support only prefixed IDs. Omit the product prefix from the policyExceptions.xml file for the following policy attributes:

            -   All numeric attributes for the `im` product.
            -   The 2024 and 2025 attributes that include the "sut" prefix in the policies.user.xml file.
            -   The attribute1001 - attribute1005 attributes for the `ms` product \(they appear in the policies.user.xml file without the product prefix as well\).
        -   It is not necessary to include the "label" setting with the policy `id` in your file.

            Examples in the product documentation sometimes include the label; but you can omit it. For example, if you want the policy ID 2006 \(maximum number of days to save a chat transcript\) set to 0 days, the label looks like the following statement:

            ```
            im.2006.label = Maximum days to save automatically saved chat transcripts (IC)
            ```

            You can omit that label and just use the corresponding setting tag to set the value, as in the following statement:

            ```
            <Policy id="2006" value="0"/>
            ```

        -   Exception rules apply only to authenticated community users, each of whom has a record in the organization's directory and is authenticated when connecting to the community. Anonymous users will always be assigned to the strict lowest-weight policy, regardless of the client version or ID.
        The following code example shows an example policy statement:

        ```
        <PolicyExceptionsRules>
        	<Rule id="1" weight="10" product="im" client_versions="8500,8520" client_ids="4870,4874">
        		<Policy id="2006" value="0" />
        	</Rule>
        </PolicyExceptionsRules>
        ```

    The following example shows two rule sections with policy statements:

    ```
    <PolicyExceptionsRules>
    	<Rule id="1" weight="10" product="im" client_versions="8500,8520" client_ids="4870,4874">
    	   <Policy id="2006" value="0" />
    	   <Policy id="2012" value="http://sametime.server.com/updates" />
    	   <Policy id="2014" value="800" />
    	</Rule>
    	<Rule id="2" weight="20" product="av" client_versions="" client_ids="4868,4878">
    	   <Policy id="av.avCapAvailableThroughSMS" value="0" />
    	   <Policy id="av.allowChangesToPrefNumbers" value="0" />
    	   <Policy id="2024" value="0" />
    	</Rule>
    </PolicyExceptionsRules>
    ```

    -   `Rule id="1"` uses a weight of "`10"` and is enabled for instant messaging. It applies to client IDs `4870` and `4874`, but only for client versions `8.5` and `8.5.2` \(other versions of those client IDs will not be affected\). This rule specifies three policies that will be applied to the specified clients when used with instant messaging:
        -   `2006` \(Maximum days to save automatically saved chat transcripts\) is set to 0 days, so transcripts will not be saved.
        -   `2012` \(Sametime update site URL\) specifies the URL where users can access client updates.
        -   `2014` \(Limit contact list size\) is set to 800 contacts per user.
    -   `Rule id="2"` uses a weight of `"20"` and is enabled for media services \(audio and video\). It applies to client IDs `4868` and `4878`, for all versions of those clients. This rule specifies three policies that will be applied to the specified clients when used with media services:
        -   `av.avCapAvailableThroughSMS` \(Voice and video capabilities available through the Sametime Media Server\) is set to 0, so audio/video will not be available through the Media Manager server for the specified clients.
        -   `av.allowChangesToPrefNumbers` \(Allow changes to preferred numbers\) is set to 0, so users cannot change preferred phone numbers.
        -   `2024` \(Allow changes to the permanent call routing rule \) is set to 0, so users cannot change call routing rules.
6.  Deploy and test the policyExceptions.xml file.

    1.  Save and close the policyExceptions.xml file.

    2.  Open the file in a browser and confirm there are no syntax errors displayed \(correct any errors before proceeding\).

    3.  Copy thepolicyExceptions.xml file to the Domino® program directory on every Sametime Community Server in the deployment.

    4.  Restart the Sametime server \(or wait for the configuration refresh interval, which is approximately every 60 minutes\).

    5.  Restart your Sametime client, log in, and confirm that the correct policy exceptions are displayed.


**Parent topic:**[Managing policies](managing_policies.md)

