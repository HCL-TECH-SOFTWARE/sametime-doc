# Notification preferences {#config_client_notification_pref .concept}

The following table lists the notification preferences for the HCL® Sametime® Connect Client and Sametime Embedded Client for Notes®.

|Attribute|Variable type|Description|Release|
|---------|-------------|-----------|-------|
|pref\_alertbubble\_window\_corner|String. Default is "SE". Four possible values, "NE", "NW", "SE", SW" \(corresponding to northeast, northwest, southeast, southwest\).|This stores one of four possible values, which indicate the corner of the user's screen where alert bubble will appear.|7.5.1 and later|
|pref\_alertbubble\_window\_width|Positive integer value|Stores the width in pixels of the alert bubble.|7.5.1 and later|
|pref\_alertbubble\_window\_height|Positive integer value|Stores the height in pixels of the alert bubble.|7.5.1 and later|
|pref\_alertbubble\_window\_  
 edge\_padding

|Positive integer value|Stores the number of pixels to add as horizontal padding for the alert bubble to separate it from the edge of the desktop.|7.5.1 and later|
|pref\_alertbubble\_show|String value, "standard" = show standard OS window, "less" or others = show alert bubble for an alert|Determines whether to show the alert bubble or a standard OS window for an alert.|7.5.1 and later|
|pref\_alertbubble\_close\_alerts|Boolean. TRUE = automatically close alert, FALSE = do not automatically close alert|Determines whether to automatically close an alert after it appears.|7.5.1 and later|
|pref\_alertbubble\_close\_alerts\_  
 delay

|Positive integer value|If alerts are set to automatically close, this is the delay amount in seconds before the alert is closed.|7.5.1 and later|
|pref\_alertbubble\_animation|String value, "none" = no window animation, "slide" = animate using slide effect, and "fade" = animate using fade effect. The default value is "slide"|Specify the Alert bubble animation type.|7.5.1 and later|
|pref\_alertbubble\_bring\_window\_  
 to\_front

|Boolean|The default value, whether to Bring the Popup window to front.|7.5.1 and later|
|pref\_alertbubble\_flash\_taskbar|Boolean|The default value, whether to Flash the taskbar to indicate new Popup window.|7.5.1 and later|
|pref\_event\_0\_playsound|Boolean|Determines whether to play sound when a new chat window opens.|7.5.1 and later|
|pref\_event\_0\_playsound\_response|Boolean|For one-on-one chat, determines whether to play sound on chat response.|8.5.2 and later|
|pref\_event\_1\_playsound|Boolean|For multi-party chats, determines whether to play sound when there is an invitation to a multi-party chat.|7.5.1 and later|
|pref\_event\_1\_playsound\_response|Boolean|For multi-party chats, determines whether to play sound on chat response.|8.5.2 and later|
|pref\_event\_2\_playsound|Boolean|Determines whether announcement events play a sound.|7.5.1 and later|
|pref\_event\_3\_playsound|Boolean|Determines whether Invitations to Sametime Classic online meeting play a sound.|7.5.1 and later|
|pref\_event\_6\_playsound|Boolean|Determines whether status alert events \(Alert me When\) play a sound.|7.5.1 and later|
|pref\_event\_7\_playsound|Boolean|Determines whether Location Awareness events play a sound.|7.5.1 and later|
|pref\_event\_0\_soundfile|Text string. Full path to a valid sound file of .WAV format.|The sound file that will play for one-on-one chat events, if playing sounds is enabled for this event. Do not use '\\' as the file separator. Use '\\\\' or '/' instead. For example, com.ibm.collaboration.realtime.alertmanager/pref\_event\_0\_soundfile=C:\\\\Documents\\\\sound.wav ``

|7.5.1 and later|
|pref\_event\_1\_soundfile|Text string. Full path to a valid sound file of .WAV format.|The sound file that will play for Invitations to multi-party chat events, if playing sounds is enabled for this event. Do no't use '\\' as the file separator. Use '\\\\' or '/' instead. For example, ``com.ibm.collaboration.realtime.alertmanager/pref\_event\_1\_soundfile=C:\\\\Documents\\\\sound.wav

|7.5.1 and later|
|pref\_event\_2\_soundfile|Text string. Full path to a valid sound file of .WAV format.|The sound file that will play for announcement events, if playing sounds is enabled for this event. Do not use '\\' as the file separator. Use '\\\\' or '/' instead. For example, `com.ibm.collaboration.realtime.alertmanager/pref_event_2_soundfile=C:\\Documents\\sound.wav`.

|7.5.1 and later|
|pref\_event\_3\_soundfile|Text string. Full path to a valid sound file of .WAV format.|The sound file that will play for Invitations to Sametime Classic online meeting events, if playing sounds is enabled for this event. Do not use '\\' as the file separator. Use '\\\\' or '/' instead. For example, com.ibm.collaboration.realtime.alertmanager/pref\_event\_3\_soundfile=C:\\\\Documents\\\\sound.wav ``

|7.5.1 and later|
|pref\_event\_6\_soundfile|Text string. Full path to a valid sound file of .WAV format.|The sound file that will play for status alert events \(Alert me When\) events, if playing sounds is enabled for this event. Do not use '\\' as the file separator. Use '\\\\' or '/' instead. For example, `com.ibm.collaboration.realtime.alertmanager/pref_event_6_soundfile=C:\\Documents\\sound.wav`.

|7.5.1 and later|
|pref\_event\_7\_soundfile|Text string. Full path to a valid sound file of .WAV format.|The sound file that will play for Location Awareness events, if playing sounds is enabled for this event. Do not use '\\' as the file separator. Use '\\\\' or '/' instead. For example, `com.ibm.collaboration.  
 realtime.alertmanager/  
 pref_event_7_soundfile=  
 C:\\Documents\\  
 sound.wav`.

|7.5.1 and later|
|pref\_event\_0\_option\_1|Boolean|For one-on-one chats, determines whether to bring chat window to front.|7.5.1 and later|
|pref\_event\_0\_option\_2|Boolean|For one-on-one chats, determines whether to flash the taskbar to indicate new window.|7.5.1 and later|
|pref\_event\_0\_option\_3|Boolean|For one-on-one chats, determines whether to show a system tray icon to indicate new message.|7.5.1 and later|
|pref\_event\_0\_option\_4|Boolean|For one-on-one chats, determines whether to bring chat window to front on chat response.|8.5.2 and later|
|pref\_event\_0\_option\_5|Boolean|For one-on-one chats, determines whether to flash the taskbar to indicate new message on chat response.|8.5.2 and later|
|pref\_event\_0\_option\_6|Boolean|For one-on-one chats, determines, whether to show a system tray icon to indicate new message on chat response.|8.5.2 and later|
|pref\_event\_1\_option\_1|Boolean|For invitations to multi-party chats, determines whether to bring invitation window to front.|7.5.1 and later|
|pref\_event\_1\_option\_2|Boolean|For invitations to multi-party chats, determines whether to flash the taskbar to indicate new invitation.|7.5.1 and later|
|pref\_event\_1\_option\_4|Boolean|For multi-party chats, determines whether to bring multi-party chat window to front on chat response.|8.5.2 and later|
|pref\_event\_1\_option\_5|Boolean|For multi-party chats, determines whether to flash the taskbar on chat response.|8.5.2 and later|
|pref\_event\_1\_option\_6|Boolean|For multi-party chats, determines whether to show a system tray icon on chat response.|8.5.2 and later|
|pref\_event\_9\_option\_1|Boolean|For calls, determines whether to bring the invitation window to front.|8.5 and later|
|pref\_event\_9\_option\_2|Boolean|For calls, determines whether to flash the taskbar to indicate new window.|8.5 and later|
|pref\_event\_9\_timeout\_seconds|Integer, unit is second|For calls, specify the seconds before incoming invitation time out.|8.5 and later|
|allow\_response|Boolean|For Send Announcement dialog, determines whether to allow recipients to send responses.|7.5.1 and later|
|pref\_event\_9\_alert\_incoming|Boolean|For calls, determines whether to display incoming invitation.|8.5 and later|
|pref\_event\_10\_playsound|Boolean|Determines whether calendar events play a sound.|8.5 and later|
|pref\_event\_10\_soundfile|Boolean|The sound file that will play for calendar events, if playing sounds is enabled for this event.|8.5 and later|

**Parent Topic: **[Sametime client preferences](config_client_pref_tables.md)

