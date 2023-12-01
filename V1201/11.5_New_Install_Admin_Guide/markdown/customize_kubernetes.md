# Adding corporate branding to meeting pages using Kubernetes {#customize_kubernetes .task}

1.  To customize the product name, product logo, and banner edit the values.yaml file in the /helm directory.

    1.  Add the appropriate statements to the YAML file to reflect your changes.

        -   To change the product name, add the following statement specifying the new product name.

            ``` {#codeblock_nzf_4cf_htb}
             productName: new\_product\_name
            ```

        -   To change the logo, add the following statement specifying the location and name of the new logo. The image file can be any size. It is re-sized to approximately 260x260 pixels.

            ``` {#codeblock_ozf_4cf_htb}
             productLogo: /images/branding/<your\_logo\_file\>
            ```

            **Note:** `/images/branding` is static and you can not edit this part. It also does not represent where the referenced file resides outside the Kubernetes pods.

            Copy the logo to the persistent volume and start the web pod again.

            ``` {#codeblock_hjs_ycf_htb}
            
            POD=$(kubectl get po --selector=name=web-0 | tail -1 | awk ' { print $1 } ')
            kubectl cp <your_image_file> $POD:/usr/share/jitsi-meet/images/branding/.
            kubectl delete po $POD
            ```

            **Attention:** Check the access rights after copying the files by running `chmod 744` inside of the server-brandingdirectory on the Sametime NFS.

            **Note:** Alternatively, you can use an accessible URL that you do not have to copy to the persistent volume.

            ``` {#codeblock_zns_hdf_htb}
            productLogo: "http://mycompany.com/assets/<your_logo_file>"
            ```

        -   To change the meeting banner, add the following statement specifying the location and name of the new banner.

            ```
            meetingBannerImage: /images/branding/<your\_logo\_file\>
            ```

            **Note:** `/images/branding` is static and you can not edit this part. It also does not represent where the referenced file resides outside the Kubernetes pods.

            Copy the image to the persistent volume and restart the web pod.

            ``` {#codeblock_hqd_xdf_htb}
            
            POD=$(kubectl get po --selector=name=web-0 | tail -1 | awk ' { print $1 } ')
            kubectl cp <your_image_file> $POD:/usr/share/jitsi-meet/images/branding/.
            kubectl delete po $POD
            ```

            **Attention:** Check the access rights after copying the files by running `chmod 744` inside of the server-brandingdirectory on the Sametime NFS.

            **Note:** Alternatively, you can use an accessible URL that you do not have to copy to the persistent volume.

            ``` {#codeblock_c5p_c2f_htb}
            meetingBannerImage: http://mycompany.com/assets/<your\_logo\_file\>
            ```

        -   To change the meeting background, add the following statement specifying the location and name of the new background.

            ``` {#codeblock_fhf_32f_htb}
            meetingBackgroundImage: /images/branding/<your\_logo\_file\>
            ```

            **Note:** `/images/branding` is static and you can not edit this part. It also does not represent where the referenced file resides outside the Kubernetes pods.

            Copy the image to the persistent volume and restart the web pod.

            ``` {#codeblock_ags_m2f_htb}
            
            POD=$(kubectl get po --selector=name=web-0 | tail -1 | awk ' { print $1 } ')
            kubectl cp <your_image_file> $POD:/usr/share/jitsi-meet/images/branding/.
            kubectl delete po $POD
            ```

            **Attention:** Check the access rights after copying the files by running `chmod 744` inside of the server-brandingdirectory on the Sametime NFS.

            **Note:** Alternatively, you can use an accessible URL that you do not have to copy to the persistent volume.

            ``` {#codeblock_gjr_p2f_htb}
             meetingBackgroundImage: http://mycompany.com/assets/<your\_logo\_file\>
            ```

    2.  Run a helm upgrade command to apply the changes to your registry.

        ``` {#codeblock_qzx_4cf_htb}
        helm upgrade {release-name} helm/.
        ```

2.  To update the favicon, do the following.

    1.  Copy the files to the persistent volume. This replaces the following files with your version.

        -   favicon.ico
        -   favicon-16x16.ico
        -   favicon-24x24.ico
        -   favicon-32x32.ico
        -   favicon-64x64.ico
        You must specify at a minimum the favicon.ico file. When it is the only file available, it is used for each of the other .ico files. For the best resolution, keep the favicon.ico file to 64x64. For the other files, use the size indicated as part of the file name.

        A PNG file type image can be used, just renamed to ICO file type.

    2.  Restart the pod.

        ``` {#codeblock_jtg_spn_cvb}
        
        POD=$(kubectl get po --selector=name=web-0 | tail -1 | awk ' { print $1 } ')
        kubectl cp favicon.ico $POD:/usr/share/jitsi-meet/images/branding/.
        kubectl delete po $POD
        ```

        **Attention:** Check the access rights after copying the files by running `chmod 744` inside of the server-brandingdirectory on the Sametime NFS.

3.  To update the app icons, do the following.

    1.  Copy the files to the persistent volume. This replaces the following files. For the app icons, replace the following files with your version.

        -   app-512x512.png
        -   app-192x192.png
        You must specify at a minimum the app-app-512x512.png file. When it is the only file available, it also used for the app-192x192.png file.

    2.  Restart the pod.

        ``` {#codeblock_ix4_14m_cvb}
        
        POD=$(kubectl get po --selector=name=web-0 | tail -1 | awk ' { print $1 } ')
        kubectl cp app-512x512.png $POD:/usr/share/jitsi-meet/images/branding/.
        kubectl delete po $POD
        ```

        **Attention:** Check the access rights after copying the files by running `chmod 744` inside of the server-brandingdirectory on the Sametime NFS.


**Parent topic:**[Adding corporate branding to meeting pages](customize_branding.md)

