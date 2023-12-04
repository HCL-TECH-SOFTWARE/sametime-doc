# Uninstalling Sametime on Docker or Podman {#t_uninstall_docker .task}

To uninstall Sametime on Docker, follow these steps.

1.  Run the command to remove the images from the image repository.

    -   For Docker,

        ``` {#codeblock_qfg_4fl_nwb}
        docker rmi
        ```

        For the full list of Docker commands, refer to [Docker rmi](https://docs.docker.com/engine/reference/commandline/rmi/) in the Docker documentation for additional information.

    -   For Podman,

        ``` {#codeblock_unc_sfl_nwb}
        $ podman rmi --all
        ```

        **Attention:** This command removes all images in the local storage, including the images that are not Sametime specific. For the full list of Podman commands, refer to [Podman-rmi](https://docs.podman.io/en/latest/markdown/podman-rmi.1.html).

2.  Find the installation directory and remove the extracted files from that folder. For more information, refer to [Installing Sametime on Docker or Podman](installing_on_docker.md) in the Podman documentation for additional information.


If you plan to re-install Sametime, refer to [Installing Sametime in a Docker or Podman environment](installation_sametime_docker.md). To migrate or upgrade to a higher version, refer to [Migrating and Upgrading](migrating.md).

**Parent Topic: **[Uninstalling Sametime](t_uninstall.md)

