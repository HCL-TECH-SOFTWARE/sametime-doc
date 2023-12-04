# Rules manager preferences {#config_client_rules_mng_pref .concept}

The following tables list the rules manager preferences for the HCL® Sametime® Connect Client and Sametime Embedded Client for Notes®.

|Attribute|Variable type|Description|Release|
|---------|-------------|-----------|-------|
|blockIncomingCalls|Boolean. Default is true.|Block all incoming calls.|8.5.1 and later|
|rulesForComputerOnlyUsers|Boolean. Default is true.|Causes default rules to only apply for computer only users.|8.5.1 and later|
|hideCallRoutingPrefs|Boolean. Default is false.|Hide the call routing preference pages.|8.5.1 and later|
|disableRulesEditing|Boolean. Default is true.|Disable the ability to edit call routing rules.|8.5.1 and later|
|disableOfflineCalling|Boolean. Default is true.|Disable ability for a computer only user to call an offline contact.|8.5.1 and later|
|disableExternalCalling|Boolean. Default is true.|Disable ability for a computer only user to call an external contact or phone number.|8.5.1 and later|
|disableNonComputerCalls|Boolean. Default is true.|Disable ability for a computer only user to call using anything other than their computer.|8.5.1 and later|
|hidePreferredDevices|Boolean. Default is false.|Hide the preferred device list.|8.5.1 and later|
|disablePreferredDevices|Boolean. Default is true.|Disable the preferred devices list.|8.5.1 and later|
|hideAllocatedDevices|Boolean. Default is true.|Hide allocated devices so they cannot be used to answer calls or as a transfer target.|8.5.1 and later|
|disablePreferredNumber  
 Changes

|Boolean. Default is true.|Disable the ability to add new preferred numbers.|8.5.1 and later|
|replaceConditions|Boolean. Default is true.|Replace the users conditions with the defaults.|8.5.1 and later|
|computerOnlyPrefix|String. Default is +999.|Unified number prefix which identifies a user as a computer only user.|8.5.1 and later|
|callRoutingConditions|String. Default is ```
/config/callRoutingConditions.xml
```

.|URL pointing to an XML file which defines the default call routing rules.|8.5.1 and later|

**Parent Topic: **[Sametime client preferences](config_client_pref_tables.md)

