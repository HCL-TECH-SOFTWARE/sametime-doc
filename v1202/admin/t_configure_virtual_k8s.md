# Adding default virtual backgrounds on Kubernetes {#t_configure_virtual_k8s .task}

By default, virtual background is enabled. You can choose which backgrounds are available to users by default. Depending on your business needs, you can customize the global library and prevent users from uploading custom background images. For more information, refer to [Disabling custom background uploads](t_disable_background_upload.md).

Ensure that all images are in JPG or GIF format.

1.  Copy the image files into the /usr/share/jitsi-meet/images/virtual-background/custom directory under the web pod and then restart the pod.

    ```
    POD=$(kubectl get po --selector=name=web-0 | tail -1 | awk ' { print $1 } ')
    kubectl cp <filename.gif> $POD:/usr/share/jitsi-meet/images/virtual-background/custom/.
    kubectl delete po $POD
    ```

    **Note:** Add the Namespace argument if Sametime is installed in a Namespace.


**Parent Topic:  **[Adding virtual backgrounds to the global library](t_configure_default_virtual_background.md)

## Removing default virtual backgrounds on Kubernetes {#task_e31_gql_z5b}

Existing default background can be deleted from the global library.

1.  Edit the values.yaml file in the directory where the installation package was decompressed.

2.  Add the following statement under the global.removeVirtualBackgrounds variable specifying the image name and then restart your pod.

    ``` {#codeblock_lgm_21q_y5b}
    global:
      removeVirtualBackgrounds=*<background-N\>*,*<background-N\>*
    ```

    *N* is a number from 1 through 7.

    **Note:** You are not required to scale the backgrounds pod as these settings are global to the web app and only add to or subtract away from the default set of available "system" backgrounds. The backgrounds pod only deals with individual user settings and what background a user has selected.


