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