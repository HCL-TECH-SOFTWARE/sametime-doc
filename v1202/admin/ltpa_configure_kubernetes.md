# Configuring LTPA in Kubernetes {#ltpa_configure_kubernetes .task}

If you did not enable LTPA authentication during the installation of Sametime, you can enable it manually.

You must have already obtain the LTPA keys before you can compete this task. For more information on using WebSphere Liberty to generate LTPA keys, see [Generating LTPA keys](ltpa_generate_key.md).

The changes in this task affect the following pods:

-   community

## Determine values to use for the configuration

1.	Obtain the base64 encoded value for your LTPA key file. The LTPA key file can be named anything and might have a file extension. For example if your LTPA key file name is <code>ltpa.keys</code>. Enter the following command to base64 encode the file:
```
cat ltpa.keys | base64 -w 0
```
Copy the base64 encoded output on the screen to be used in the configuration. Note: It is a continuous line with no line breaks.

- For managed charts: ltpaKeysBase64: value
- For traditional charts: ltpa.keys: value

2.	Obtain the base64  encoded password to the LTPA Key file. For example, if the password is `ltpapassword`, enter the following command:
```
echo -n ‘ltpapassword’ | base64
```
Create a new parameter, and set the value of the parameter to the encoded output.
```
ltpaKeysPasswordBase64: value
```

3.	Determine the SSO token expiration time, which must be the same for all participating servers. To find the value in Connections see Integrating with [HCL Connections](ltpa_configure_connections.md). 
To find the value in Domino, see [Creating a Web SSO configuration](https://help.hcltechsw.com/domino/12.0.2/admin/conf_creatingawebssoconfigurationdocument_t.html). 

Now that you know the number of minutes until the token expires, create a new parameter and set it to the number of minutes. For example if the number of minutes is 120, then the parameter is:
```
ltpaDurationMinutes: "120"
```

4.	If integrating with HCL Connections, determine the realm name. Use the cat command to view the content of the <code>ltpa.key</code> file and find the name of the WebSphere realm.  
```
cat ltpa.key
```

Look for the <code>com.ibm.websphere.ltpa.Realm=defaultWIMFileBasedRealm</code> parameter.

Create a new parameter with the value, for example:
```
ltpa.realm: defaultWIMFileBasedRealm
```

## Procedure for managed charts
If you are using the managed charts, use the following steps. If you are using traditional charts, scroll down to the next section for traditional charts.

1.	Open your custom <code>values.yaml</code> file for editing. 
2.	In the <code>global</code> section, add the parameters determined from above. Each line is indented with two spaces.
```
  ltpaKeysBase64: value
     ltpaKeysPasswordBase64: value
  ltpaDurationMinutes: "value"
     ltpa.realm: value (for Connections only)
```

3.	Add the following parameter to enable LTPA.
```
  enableLtpa: true
```
  
4.	Save and close your custom <code>values.yaml</code> file.

5.	For these changes to take effect, you must uninstall Sametime, then re-install referencing your custom <code>values.yaml</code> file.

## Procedure for traditional helm charts 
If you are enabling LTPA using traditional helm charts instead of using the managed charts, complete the following steps.

1.	Open the <code>values.yaml</code> file in the helm directory for editing.

2.	Locate the following line and change the value from false to true.
```
enableLtpa
```

3.	Add the parameters:
```
ltpaDurationMinutes: “value”
ltpa.ream: value (for Connections only)
ltpaKeysPasswordBase64: value 
```

4.	Save and close the <code>values.yaml</code> file.

5.	Change directories to <code>helm/templates</code>.

6.	Open the <code>auth-config-secrets.yaml</code> file for editing.

7.	In the <code>ltpa.keys</code> field, remove the text that is there, and add the base64 encoded value from step 1.
8.	Save and close the auth-config-secrets.yaml file.

9.	For these changes to take effect, complete the steps in [Applying Changes](pod_apply_changes.md). 


## What to do next

If you are integrating with HCL Connections or HCL Verse, it might be beneficial to add a content security policy that includes the DNS suffix of the servers participating in the LTPA Single Sign On. For information, see [Enabling content security headers on Kubernetes](verse_integration_contentsecurity_kubernetes.md). 

