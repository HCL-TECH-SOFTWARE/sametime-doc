# Adding corporate branding to meeting pages using Docker or Podman {#customize_docker .task}

The Docker and Podman commands are similar. The only difference is that docker precedes the command when issued in a Docker environment and podman precedes the name in a Podman environment. Example commands used in the Sametime documentation are shown using Docker. For Podman, change docker to podman.

1.  To customize the product name, product logo, and banner edit the custom.env file in the directory where the installation package was decompressed.

    1.  Add the appropriate statements to the custom.env file to reflect your changes.

        -   To change the product name, add the following statement specifying the new product name.

            ``` {#codeblock_nzf_4cf_htb}
            REACT_APP_PRODUCT_NAME=new\_product\_name
            ```

        -   To change the logo used in meeting pages, add the following statement specifying the location and name of the new logo. The image file can be any size. It is re-sized to approximately 260x260 pixels.

            ``` {#codeblock_acs_srq_dvb}
            REACT_APP_PRODUCT_LOGO=https://meetings.hcl-showcase.com/images/branding/Showcase_Logo.jpg
            ```

            You can specify the relative or full URL to the logo. If you use the relative URL, the image must be placed on the system using the following command.

            ``` {#codeblock_kzz_grf_htb}
            cp my-logo.png sametime-config/web/branding/.
            ```

            Add the following statement containing the URL to the Sametime server where you access meetings. This is used for meeting reports.

            ``` {#codeblock_i5p_p33_3tb}
            REACT_APP_PRODUCT_LOGO_URL=https://meetings.hcl-showcase.com/images/branding/Showcase_Logo.jpg"
            ```

        -   To change the meeting banner, add the following statement specifying the location and name of the new banner.

            ```
            REACT_APP_MEETING_BANNER_IMAGE=banner\_image
            ```

        -   To change the meeting background, add the following statement specifying the location and name of the new background.

            ``` {#codeblock_cpv_4rf_htb}
            REACT_APP_MEETING_BACKGROUND_IMAGE=background\_image
            ```

            The background image can be a URL to an accessible image like https://mycompany.com/assets/theme.png or it can be an absolute path like /images/branding/my-logo.png. If you use the absolute path, the image must be placed on the system using the following command.

            ``` {#codeblock_rty_yrf_htb}
            cp my-theme.png sametime-config/web/branding/.
            ```

    2.  Run docker-compose up -d command to apply all changes.

2.  To update the favicon, replace the following files with your version.

    -   favicon.ico
    -   favicon-16x16.ico
    -   favicon-24x24.ico
    -   favicon-32x32.ico
    -   favicon-64x64.ico
    You must specify at a minimum the favicon.ico file. When it is the only file available, it is used for each of the other .ico files.

3.  To update the app icons, copy the files to the persistent volume. This replaces the following files.

    -   app-512x512.png
    -   app-192x192.png
    You must specify at a minimum the app-app-512x512.png file. When it is the only file available, it also used for the app-192x192.png file.


**Parent Topic:  **[Adding corporate branding to meeting pages](customize_branding.md)

