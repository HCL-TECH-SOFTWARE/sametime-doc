# Calendar preferences {#config_client_cal_pref .concept}

The following table lists the calendar preferences for the HCL® Sametime® Connect Client and Sametime Embedded Client for Notes®.

|Attribute|Variable type|Description|Release|
|---------|-------------|-----------|-------|
|alertMeWhenMeetingStarts|Boolean|In Auto-Status Changes for Meetings scheduled in my calendar, specify whether to alert user when user has a meeting scheduled in the calendar.|8.5.1.1 and later|
|enabled|Boolean|Specify wether or not to enable auto status change for meetings scheduled in user's calendar.|8.0 and later|
|promptMe|Boolean|In Auto-Status Changes for meetings scheduled in my calendar, specify whether to prompt user before changing the status when user have a meeting scheduled in the calendar.|8.0 and later|
|statusMsg|String|In Auto-Status Changes for meetings scheduled in my calendar, specify the status message when user select "Automatically change my status."|8.0 and later|
|setback|Boolean|In Auto-Status Changes for meetings scheduled in my calendar, specify whether to return to user's previous status when the meeting is over.|8.0 and later|
|outlook\_enabled|Boolean|In Calendar Service page, specify whether to check Outlook calendar for meetings to allow auto status changes. It's valid only if the Outlook service is available.|8.0 and later|
|notes\_enabled|Boolean|In Calendar Service page, specify whether to check Notes calendar for meetings to allow auto status changes. It's valid only if the Notes service is available.|8.0 and later|
|interval|Positive integer value, unit is minutes. 10 minutes is the default.|In Calendar Service page, specify the interval that Sametime retrieves calendar information for an auto-status change. This value is not for the interval to update auto-status.|8.0 and later|

**Parent Topic:  **[Sametime client preferences](config_client_pref_tables.md)

