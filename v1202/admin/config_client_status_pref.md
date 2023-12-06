# Auto-status change preferences

The following table lists the auto-status change preferences for the HCL® Sametime® Connect Client and Sametime Embedded Client for Notes®.

|Attribute|Variable type|Description|Release|
|---------|-------------|-----------|-------|
|lockPCWithOSLock|Boolean. Default is true.|Available "Locking computer with operating system lock" feature.|7.5.1 and later|
|keyboardMouseInactivity|Boolean. Default is true.|Available "Keyboard and mouse inactivity" feature.|7.5.1 and later|
|whenIamInAOnlineMtg|Boolean. Default is false.|Available "When I am in an online meeting" feature.|7.5.1 and later|
|selectStatusOnlyScreenShare|Boolean. Default is false.|Determines whether to select the "Change my status only when I'm sharing my screen" check box.|7.5.1 and later|
|autoChangeMyStatusInMtg|Boolean. Default is false.|Determines whether to select the "Automatically change my status" radio button. Note that if this radio button is set as true, then the "Prompt me before changing my status" radio button will be UNavailable. If this is set as "false", the "Prompt me before changing my status" radio button will be available. After| 7.5.1 and laterb |
| | |`com.ibm.collaboration. realtime.imhub/ selectStatusOnly ScreenShare` is set to true| |
| | | `com.ibm.collaboration.  realtime.imhub/  autoChangeMyStatus  InMtg` works for screen share status. | | 
|minutesForIdleKeyboardMouse|Integer. Default is 20|Sets the "When I have not used my keyboard or mouse for the following number of minutes:" text field.|7.5.1 and later|
|backWhenUnlocked|Boolean. Default is true.|Determines whether to select the "Return to previous status when activity is resumed" in "Locking computer with operating system lock" check box.|7.5.1 and later|
|backWhenKeyboardMouseActive|Boolean. Default is true.|Determine whether to select the "Return to previous status when activity is resumed" in "Keyboard and mouse inactivity" check box.|7.5.1 and later|
|blRetrievalRetryDelay|Integer. Default is 15000 ms.|Determines how long the client waits before trying again to retrieve the contact list from the storage service if the initial attempt times out. The default is 15 seconds, expressed as milliseconds.|8.5.2 IFR1 and later|

**Parent Topic:  **[Sametime client preferences](config_client_pref_tables.md)

