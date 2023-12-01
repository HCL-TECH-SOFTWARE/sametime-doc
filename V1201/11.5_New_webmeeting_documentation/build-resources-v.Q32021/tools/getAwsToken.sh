<<'###'
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
###

MFASERIAL=$(aws iam list-mfa-devices --profile default | sed -n 5,5p | cut -d ',' -f 1 | awk '{print $2}' | tr -d '"')
INF=$(aws sts get-session-token --serial-number $MFASERIAL --profile default --token-code $1 | sed -n 3,5p)
ID=$(echo $INF | cut -d ',' -f 1 | cut -d ':' -f 2 | sed 's/\"//g' | tr -d '[:space:]')
SECRET=$(echo $INF | cut -d ',' -f 2 | cut -d ':' -f 2 | sed 's/\"//g' | tr -d '[:space:]')
TOKEN=$(echo $INF | cut -d ',' -f 3 | cut -d ':' -f 2 | sed 's/\"//g' | tr -d '[:space:]')
export AWS_ACCESS_KEY_ID=$ID
echo AWS_ACCESS_KEY_ID=$ID
export AWS_SECRET_ACCESS_KEY=$SECRET
echo AWS_SECRET_ACCESS_KEY=$SECRET
export AWS_SESSION_TOKEN=$TOKEN
echo AWS_SESSION_TOKEN=$TOKEN  