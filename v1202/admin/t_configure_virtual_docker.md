# Adding default virtual backgrounds on Docker {#t_configure_virtual_docker .task}

By default, virtual background is enabled. You can choose which backgrounds are available to users by default. Depending on your business needs, you can customize the global library and prevent users from uploading custom background images. For more information, refer to [Disabling custom background uploads](t_disable_background_upload.md).

Ensure that all images are in JPG or GIF format.

1.  Copy the image files into the sametime-config/web/virtual-background/custom directory.

2.  Run docker-compose up -d command to apply all changes.


**Parent topic:**[Adding virtual backgrounds to the global library](t_configure_default_virtual_background.md)

## Removing default virtual backgrounds on Docker {#task_e31_gql_z5b}

Existing default background can be deleted from the global library.

1.  Edit the custom.env file in the directory where the installation package was decompressed.

2.  Add the following statement under the REMOVE\_BACKGROUND\_IMAGES variable specifying the image name.

    ``` {#codeblock_nzf_4cf_htb}
    REMOVE_VIRTUAL_BACKGROUNDS=<background-N>,*<background-N\>*
    ```

    *N* is a number from 1 through 7.

3.  Run docker-compose up -d command to apply all changes.


