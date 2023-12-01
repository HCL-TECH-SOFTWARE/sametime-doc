<#
 ********************************************************************
 * Licensed Materials - Property of HCL                             *
 *                                                                  *
 * Copyright HCL Technologies Ltd. 2001, 2020. All Rights Reserved. *
 *                                                                  *
 * Note to US Government Users Restricted Rights:                   *
 *                                                                  *
 * Use, duplication or disclosure restricted by GSA ADP Schedule    *
 *                                                                  *
 * Author: Emmanuel Palogan
 ********************************************************************
#>

$otp=$args[0]
$mfaprofile=Invoke-Expression "aws iam list-mfa-devices --profile default"
$jsonMfa=$mfaprofile | ConvertFrom-Json
$mfa=$jsonMfa.MFADevices[0].SerialNumber
echo "Serialnumber: $mfa"
$aws=Invoke-Expression "aws sts get-session-token --serial-number $mfa --profile default --token-code $otp"
$json=$aws | ConvertFrom-Json
$key=$json.Credentials.AccessKeyId
$secret=$json.Credentials.SecretAccessKey
$token=$json.Credentials.SessionToken
$exp=$json.Credentials.Expiration
echo "AccessKeyId: $key"
echo "SecretAccessKey: $secret"
echo "Expiration: $exp"
echo "SessionToken: $token"
[System.Environment]::SetEnvironmentVariable('AWS_ACCESS_KEY_ID',$key,[System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable('AWS_SECRET_ACCESS_KEY',$secret,[System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable('AWS_SESSION_TOKEN',$token,[System.EnvironmentVariableTarget]::User)