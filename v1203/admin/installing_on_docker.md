# Installing Sametime on Docker or Podman {#installing_on_docker .task}

Installing Sametime involves starting the install procedure and specifying configuration information for the server, such as the credentials, the ports, MongoDB, and LDAP that the server uses.

Download the product from the [HCL Software Portal](https://www.hcltechsw.com/sametime).

The installation process detects if you are installing Sametime on Docker or Podman and prompts for the appropriate information.

Docker commands are used throughout the install process. All commands require running as a root user. If not running as root user, you must preface all commands with sudo. If you are installing on Podman, the commands are the same but instead of being preceded with Docker, the command is preceded with Podman.

1.  Verify that the product files downloaded and extract to the desired installation directory.

    Change to the installation directory and verify that the permissions are set correctly by running the following commands:

    ```
    
    cd sametime\_install
    ls -la
    ```

    Where sametime\_install is the installation directory.

2.  From the installation directory, run the Sametime install command.

    ```
    ./install.sh
    ```

    The install command begins the installation of the Sametime product.

3.  Enter the information for the prompts.

    You are prompted to enter the following information. See [Information to provide during installation](installation_prompt_descriptions.md).

4.  If you are defining extra hosts, see [Defining extra hosts for Docker deployments](t_installing_docker_extrahosts.md).


After the installation is completed, the HCL Sametime services that support chat and meetings should be running.

Test the Sametime chat and meeting services. For details, see [Testing Sametime chat and meeting clients](t_testing_sametime_chat.md).

**Parent Topic:  **[Installing Sametime in a Docker or Podman environment](installation_sametime_docker.md)

