# Build and Deployment Tools

## getAwsToken.ps1

This powershell script is made to simplify getting and setting of aws token when MFA is activated(and is required). To use this script, simply open you powershell, go to this location, and call the file and append your MFA code from your Authenticator application.

```powershell
PS> .\getAwsToken.ps1 123456
```

### Prerequisite
- Must have powershell.

- Must have aws cli installed.

- Must have aws cli configured.

   - type command in cmd or powershell: `aws configure`

- MFA should be enabled in AWS Console.

- Must have enabled powershell script execution. (run in admin).

   - type command in powershell: `Set-ExecutionPolicy unrestricted`

</br>
</br>

## getAwsToken.sh

This shell script is made to simplify getting and setting of aws token when MFA is activated(and is required). To use this script, simply open you bash, go to this location, and call the file and append your MFA code from your Authenticator application.

```shell
$ sh getAwsToken.sh 123456
```

### Prerequisite

- Must have aws cli installed.

- Must have aws cli configured.

   - type command in cmd or powershell: `aws configure`

- MFA should be enabled in AWS Console.

</br>
</br>

## redirect.html

This html file is use to redirect the user to the specified URL or relative location. 

### How to use redirect.html

1. Edit the file and change the url value in this line. 

```html
<meta http-equiv="refresh" content="0; url=https://help.hcltechsw.com">
``` 

   - example 1: Using Actual Link

```html
<meta http-equiv="refresh" content="0; url=https://help.hcltechsw.com/digital-experience/welcome_hcl_dx.html">
```

   - example 2: Using Relative Path
      - note that the value in the url should be relative where this (redirect.html) file is located.
      
  ```html
  <meta http-equiv="refresh" content="0; url=../../admin/user.html">
  ```

  2. Edit the file name to something you want to use in a link.
      - example: latest.html
   
   3. Place this file on your doc sets to where you want this to be located.
      - example 1: In local copy.
         - c:/Users/myUser/doc/out/productName/latest.html
      - example 2: In S3 bucket.
         - s3://help.hcltechsw.com/digital-experience/latest.html