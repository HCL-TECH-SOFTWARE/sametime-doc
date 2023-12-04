# Chat preferences {#config_client_chat_history_pref .concept}

The following tables list the chat preferences for the HCL Sametime Connect Client and Sametime Embedded Client for Notes®.

|Attribute|Variable type|Description|Release|
|---------|-------------|-----------|-------|
|enableNwayRichText|Boolean. Default is false.|Specifies whether or not to enable the client to support rich text in a multi-user chat. Rich text is enabled in a multi-user chat session only if all clients participating in the chat session have this setting enabled.|8.5.1.1 and later|

|Attribute|Variable type|Description|Release|
|---------|-------------|-----------|-------|
|days.storage.max|A positive number.|Delete saved transcripts after this number of days. This setting will be overwritten by the value set on the server policy.|7.5.1 and later|
|delete.old|A positive number. The default is false.|Delete saved transcripts. This setting will be overwritten by the value set on the server policy. If the policy allows transcripts to be deleted, set this value to true initially.|7.5.1 and later|
|logging.default|0 = Automatically save chats, 1 = Do not automatically save chats, 2 = Prompt me to save chats|Default chat logging action.|7.5.1 and later|
|logging.enabled|Boolean. Default is false.|Specify whether or not to save a local copy of the chat history. If the server policy is not configured to allow save chat, this setting is ignored.**Note:** Local chat history is unencrypted. To disable and restrict users from saving a local copy, refer to [Updating client preferences with the managed-settings.xml file](config_client_xml_location.md).

|7.5.1 and later|
|display.context|True = Display, false = Do not display|Display the saved transcript between two users for the current day in the chat window.|7.5.1 and later|
|display.context.background|True = Display, false = Do not display|Display background highlighting when displaying saved transcripts in chats.|7.5.1 and later|
|root.location|A string of a valid path on the computer.|Location for automatically saved chats Directory path. Do not use '\\' as the file separator. Use '\\\\' or '/' instead. Example using absolute path: ```
com.ibm.collaboration.
realtime.chat.logging/
root.location=
C:\\Documents\\user\\
SametimeTranscripts 
```

Releases 8.0.2 and later support the use of a relative path. Example using a path relative to the user profile folder for Windows™ and Mac: ```
com.ibm.collaboration.
realtime.chat.logging
/root.location=
\\SametimeTranscripts

```

 For Linux™, ```
com.ibm.collaboration.
realtime.chat.logging/
root.location=
SametimeTranscripts
```

|7.5.1 and later|
|save.file.location|A string of a valid path on the computer.|Default location for manually saved chats. Do not use '\\' as the file separator. Use '\\\\' or '/' instead. Example using absolute path: ```
com.ibm.collaboration.realtime.chat.logging/ave.file.location=C:\\Documents\\user\\SavedChats 
```

Releases 8.0.2 and later support the use of a relative path. Example using a path relative to the user profile folder for Windows and Mac: ```
com.ibm.collaboration.
realtime.chat.logging/
root.location=
\\SametimeTranscripts 

```

 For Linux, ```
com.ibm.collaboration.
realtime.chat.logging/
root.location=
SametimeTranscripts
```

|7.5.1 and later|
|prompt.save|Boolean|If using mail service for logging, specify whether to display a confirmation after manually saving chats to the mail file.|7.5.1 and later|
|reset.user.resets.logging.prefs|Boolean. Default is false.|Specify whether to prompt user to reset logging preferences after resetting user.|7.5.1 and later|
|firsttime.askprefs|Boolean. Default is true.|Specify whether to prompt user to set logging preferences when Sametime® launched for the first time. When the value is set to true, loggging.enabled should also be set to define the default enablement state for saving chat transcripts.|7.5.1 and later|
|schedule.delete.old|Boolean. Default is false.|Specify whether or not to start the scheduled file-based chat history deletion task. The task is scheduled at a 12-hour interval, starting from the login time. The local chat history is deleted automatically only if the corresponding server policy is enabled for it.|8.5.2 IFR1 and later|

|Attribute|Variable type|Description|Release|
|---------|-------------|-----------|-------|
|allowSaveOverride|Boolean. Default is true.|Specifies whether to show menu item "Prevent Transcript save" in chat window Tools menu|7.5.1 and later|
|noPersonListLiveNames|Boolean. Default is false.|Specifies whether to use Live Names in the chat history viewer person list.|8.5.2 and later|

|Attribute|Variable type|Description|Release|
|---------|-------------|-----------|-------|
|showuserinfo|Boolean. Default is true.|Specifies whether or not to display the business card in the chat window.|7.5.1 and later|
|showtimestamp|Boolean. Default is true.|Specifies whether or not to display timestamps in the chat transcript area.|7.5.1 and later|
|showdatestamp|Boolean.|Specifies whether or not to display date stamps in the chat transcript area.|7.5.1 and later|
|showemoticons|Boolean. Default is true.|Specifies whether or not to display emoticons in the chat transcript.|7.5.1 and later|
|usemyfont|Boolean. Default is false.|Specifies whether or not to override chat partner's font settings with my own.|7.5.1 and later|
|entersend|Boolean. Default is true.|Specifies whether or not Enter is used to send a message or Shift+Enter. Enter sends, Shift+Enter newline|7.5.1 and later|
|showstatusupdates|Boolean. Default is false.|Specifies whether or not to display status updates for my chat partner in the transcript.|7.5.1 and later|
|esccloses|Boolean. Default is true.|Specifies whether or not ESC closes the chat window.|7.5.1 and later|
|showuserleft|Boolean. Default is false.|Specifies whether or not to display a message when my chat partner closes their chat window.|7.5.1 and later|
|warnWhenInMtg|Boolean. Default is true.|Specifies whether or not to pop a warning message when I try to open a chat window when a person is in a meeting.|7.5.1 and later|
|warnWhenAway|Boolean. Default is true.|Specifies whether or not to pop a warning message when I try to open a chat window when a person is away.|7.5.1 and later|
|dontPopWhenMin|Boolean. Default is true.|Specifies whether or not the chat window pops to the front when I manually minimize the window.|7.5.1 and later|
|showActionBar|Boolean. Default is true.|Specifies whether or not to show the actions toolbar.|7.5.1 and later|
|showStatusBar|Boolean. Default is true.|Specifies whether or not to show the status message bar at the bottom.|7.5.1 and later|
|showToolsBar|Boolean. Default is true.|Specifies whether or not to show the message tools bar.|7.5.1 and later|
|showSendButton|Boolean.|Specifies whether or not to show send button in the chat window.|7.5.1 and later|
|showQuickFind|Boolean.|Specifies whether or not to show quick find in the tabbed chat window.|7.5.1 and later|
|useTabs|Boolean. Default is false.|Specifies whether or not to use a single tabbed window for all chats.|7.5.1 and later|
|horizontalTabs|Boolean. Default is false \(vertical\).|Specifies whether to use horizontal or vertical tabs. Does not apply unless useTabs is true.|7.5.1 and later|
|warnNewMessageArrived|Boolean. Default is true.|Specifies whether or not to pop a message dialog when I try to close the window at the same time I am receiving a message.|7.5.1 and later|
|warnNewMessageArrived  
 Threshhold

|Long. Default is 450.|It is used in conjunction with the warnNewMessageArrived preference. When warnNewMessageArrived is true, if set this to 10000 \(10 seconds\) and try to close chat window 5 seconds after the last message, the warning dialog will pop up. It is not recommended to change the default value.|7.5.1 and later|
|useDefaultGO|Boolean. Default is true.|Specifies whether or not to use the system's default orientation for typing or to manually set one.|7.5.1 and later|
|sendAreaGO|Integer.|Specifies which orientation to use in the typing area if useDefaultGO is false. Not set by default because useDefaultGO is true. Only accepts two values, 67108864 \(SWT.RIGHT\_TO\_LEFT\) or 33554432 \(SWT.LEFT\_TO\_RIGHT\)|7.5.1 and later|
|timeformat|Integer. Default is 12.|Specifies the default time format to use \(12 or 24 hour clock\).|7.5.1 and later|
|maxChatsShowWarn|Boolean|If using tabbed window, specifies whether or not to show a warning dialog when current chat count exceeds the predefined value.|7.5.1 and later|
|maxChats|Integer. Default is 50.|Specifies a predefined value for maxChatsShowWarn|7.5.1 and later|
|saveChats|Boolean|Specifies whether or not to save opened chats across sessions.|7.5.1 and later|
|transcript.view.limit|Integer. Default is 0.|Specifies a limit to the number of text/graphics lines that are maintained in the chat window. Setting to 0 means no limit.|8.5 and later|
|ProvideTabbedBrowser  
 Cache

|Boolean. Default is true.|Specifies whether when using tabbed chats if the browser window can be cached to improve memory when the chat is not active.|8.5.1 and later|
|persistPosition|Boolean|Specify whether to remember the position of chat windows. If it is set, the chat window position is remembered each time on window close action and used as the default location for next chat window open action.|8.5 and later|
|xpos|Integer|Specify the X value of chat window position.|7.5.1 and later|
|ypos|Integer|Specify the Y value of chat window position.|7.5.1 and later|
|windowWidth|Integer|Specify the width of chat window.|7.5.1 and later|
|windowHeight|Integer|Specify the height of chat window.|7.5.1 and later|
|sendAreaHeight|Integer|Specify the height of the input box of chat window.|7.5.1 and later|
|replyWithOfflineMessageContent|Boolean. Default is true.|Specify whether or not to include the received message when replying to an offline message.|8.5.2 IFR1 and later|
|disableInlineIME|Boolean. Default is false.|Specify whether or not to disable inline mode for an input method in the chat input area of a chat window. Apply this setting if there is problem with a specific input method, such as a Traditional Chinese Input Method Editor \(IME\).|8.5.2 IFR1 and later|
|participantsViewPosition|String.|Specifies the location of the n-way chat participant list panel on either the side of the chat transcript area.|9.0 and later|
|sortTabs|Boolean. Default is false.|Specifies whether or not to sort the chat tabs in a tabbed chat window.|9.0 and later|
|sortOrder|String. Default is two\_way:n\_way:chat\_room|Specifies the order of chat tab types, if the setting is true for sortTabs. The user can change the sort of if desired.|9.0 and later|
|autoAcceptInvitation|Boolean. Default is true.|Allows invitee to automatically join a multi-person chat without clicking Accept when invited to join the chat.|9.0 and later|
|allowOthersToSeeTranscript|Boolean. Default is true.|Allows new chat invitees to see the previous chat transcript when they join the chat.|9.0 and later|

|Attribute|Variable type|Description|Release|
|---------|-------------|-----------|-------|
|disableRichText|Boolean. Default is false.|Specifies whether or not to disable rich text for all chats.|8.5.2 and later|
|disableRichTextWithAnon|Boolean. Default is false.|Specifies whether or not to disable rich text for chats with anonymous users.|8.5.2 and later|

**Parent Topic: **[Sametime client preferences](config_client_pref_tables.md)

