# Configuring Chat Read Receipts

Chat Read Receipts allow users to see when their messages have been read by others, providing real-time feedback on message delivery and visibility.

This feature improves communication efficiency by confirming message receipt, reducing uncertainty, and enabling quicker responses, thereby enhancing productivity.

**Note:** Read Receipts is enabled by default

To turn-off the Read Receipt setting, access the custom.env file for the deployment and follow these steps.

### Docker / Podman

1.  Edit the custom.env file and add the following 

    ``` {#codeblock_xq2_1vy_ztb}
        STI_STCONVOMAP_CONVOMAP_READ_LIST_ENABLED=0
    ```

    For more information on how to configure the sametime.ini file, refer to [Configuring the sametime.ini file](chat_configuring_sametimeini.md).

2.  Save and close the file.

### Kubernetes

1. Place the values.yaml file in edit mode.
1. Locate the sametimeIni: setting in the file, and then add the new line, indented with four spaces:
    
    ``` {#codeblock_xq2_1vy_ztb}
        STI_STCONVOMAP_CONVOMAP_READ_LIST_ENABLED=0
    ```
    
    For more information on how to configure the sametime.ini file, refer to [Configuring the sametime.ini file](chat_configuring_sametimeini.md).

3.  Save and close the file.

4.  Apply your changes to the environment.

    Verify that you are in the helm directory and run the following command to apply changes. Specify the Sametime deployment name for your environment. The default for Sametime Premium version 12 is sametime.

    ``` {#codeblock_iyn_51d_d5b}
    helm upgrade sametime\_deployment\_name .
    ```

    **Note:** Be sure to include the dot at the end. It is part of the command.

    If you are unsure of your deployment name, issue the helm list command to find the name. If you upgraded from an earlier Sametime release, the default name is sametime-meetings.

5.  Restart the pods with the changes. Use the kubectl scale command to scale the pods to zero and then to one that have been changed. You must run the commands for each pod that the change affects.

    1.  Run the following command to scale the pod to zero.

        Scale the pod to zero, where pod\_deployment\_name is the pod name.

        ``` {#codeblock_cwz_mwc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=0
        
        ```

    2.  Run the following command to scale the pod to one.

        ``` {#codeblock_i2c_4wc_d5b}
        
        kubectl scale deploy pod\_deployment\_name --replicas=1
        ```

