# File transfer preferences {#config_client_file_tran_pref .concept}

The following table lists the file transfer preferences for the HCL® Sametime® Connect Client and Sametime Embedded Client for Notes®.

|Attribute|Variable type|Description|Release|
|---------|-------------|-----------|-------|
|allowTransferToAnonymous|Boolean. Default is true.|Specifies whether or not to disable file transfers to anonymous users. Setting the value to **true** does not prevent incoming file transfers from anonymous users.|8.5.2 and later|
|saveFileLocation|A text string of a valid full path to a folder on the user's computer.|Specifies the path on the user's computer where files from File Transfers will be saved. Do not use '\\' as the file separator. Use '\\\\' or '/' instead. Example using absolute path: ```
com.ibm.collaboration.realtime.filetransfer/saveFileLocation=C:\\Documents\\user\\SametimeFileTransfer
```

Releases 8.0.2 and later support the use of a relative path. Example using a path relative to the user profile folder for Windows™ and Mac: ```
com.ibm.collaboration.
realtime.filetransfer/
saveFileLocation=
\\SametimeFileTransfer

```

 For Linux™, ```
com.ibm.collaboration.
realtime.filetransfer/
saveFileLocation=
SametimeFileTransfer
```

|7.5.1 and later|

**Parent Topic:  **[Sametime client preferences](config_client_pref_tables.md)

