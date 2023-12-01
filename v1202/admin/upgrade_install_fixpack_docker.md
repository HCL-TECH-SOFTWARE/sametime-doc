# Installing a fix pack on Docker {#upgrade_install_fixpack_docker .task}

To install a new version or fix pack, the following conditions must be satisfied:

-   HCL Sametime 12 version is installed and configured
-   Sametime server has access to a MongoDB server

Creating a backup of the installation directory, allows you to return to your previous version if a problem occurs related to installing the fix pack.

**Note:** Make a backup of your key files, such as docker-compose.yml and any customized files on the system so that you can validate any custom settings from the previous installation. If you have placed files in the sametime-config folder like custom branding or TLS certificates, those files need to be restored after the fix pack is installed. For the docker-compose.yml file, after the upgrade reference the backup version and add the modifications to the new docker-compose.yml provided during the upgrade. Changes to the custom.env and .env files are retained when upgrading to version 12.0.1 and later.

1.  In the directory where Sametime is installed, issue the following command to stop the Sametime server.

    ``` {#codeblock_zxy_ypk_25b}
     docker-compose down 
    ```

2.  Make a copy of the Sametime installation directory as a backup before installing the fix pack.

    Copy the contents of the installation directory into another directory. For example, /sametime\_install\_backup where sametime\_install is the Sametime installation directory.

3.  Download and decompress the Sametime fix pack archive to the Sametime installation directory.

    ``` {#codeblock_icc_gqk_25b}
    unzip sametime\_fixpack\_zip -d /sametime\_install\_path 
    ```

4.  In the sametime\_install directory, run the following script to initiate the installation process.

    ``` {#codeblock_c3j_3qk_25b}
     ./install.sh
    ```

5.  Follow the prompts to provide the required information. The install process detects if the install is an upgrade or full install.


**Parent topic:**[Upgrading to a new version or applying a fixpack](upgrade_install_fixpack.md)

