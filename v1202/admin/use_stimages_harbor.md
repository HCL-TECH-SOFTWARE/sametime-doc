# Using Sametime images from the HCL Harbor registry {#use_stimages_harbor .task}

1.  Sign in to the [HCL Harbor registry](https://hclcr.io/) using the same credentials that you use for the HCL Software License & Download Portal. You are granted access through HCL's identity provider, Okta.

2.  Obtain the access token you need for command line authentication with Harbor by clicking your account profile picture. The CLI secret that is displayed is the access token.

3.  If you already have Docker installed, you can use your Docker login to create the necessary secret to give your Kubernetes environment access to the HCL Harbor Registry.

    Run the command:

    ``` {#codeblock_fvn_2fm_pzb}
    docker login hclcr.io -u yourEmailAddress
    ```

    Use the access token you obtain in Step 2 when prompted for password. Make sure the case ofyourEmailAddress matches what is in the Harbor Registry user profile.

4.  Create a secret that references your Docker config

    ``` {#codeblock_gvn_2fm_pzb}
    kubectl create secret generic hcl-harbor-registry-secret \
        --from-file=.dockerconfigjson=<path/to/.docker/config.json> \
        --type=kubernetes.io/dockerconfigjson
    ```

    **Note:** If you are not using Docker, run the following command.

    ``` {#codeblock_ivn_2fm_pzb}
    kubectl create secret docker-registry hcl-harbor-registry-secret --docker-server=hclcr.io '--docker-username=your\_email\_address\>' '--docker-password=your\_access\_token'
    ```

    The quote that surrounds the Docker user name and password parameters are needed. This is because the @ and possible special characters in a password might have special meaning in the command interpreter.

5.  Edit the values.yaml file and include the following setting.

    ``` {#codeblock_jvn_2fm_pzb}
     hclImagePullSecret: 'hcl-harbor-registry-secret'
    
    ```


