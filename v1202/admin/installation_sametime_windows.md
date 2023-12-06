# Installing Sametime on Windows using Docker Desktop {#installation_sametime_windows .task}

Sametime can be installed on a Windows OS as a single-node environment using a supplied Helm chart. The Sametime product image includes a pre-configured managed Helm Chart to deploy Sametime on Windows. The chart is run from a Helm dashboard a graphical user interface.

The values in the Helm Charts can be modified before running the Install step. For example, you must specify the value for the location of the Sametime images. Other values such as the location of LDAP and other servers also need to be reviewed for your environment. The input fields in the managed charts are the same as if you were using the install script and prompted for values. See [installation\_prompt\_descriptions.md](installation_prompt_descriptions.md) for more information. Additionally, the Helm Charts contain information for each field to assist you with necessary updates.

1.  Open the Windows Feature window and turn on the **Windows Subsystem for Linux** feature.

    From the **Control Panel**, click **Programs** \> **Turn Windows features on or off**. This feature allows you to install a Linux system and run a Linux file system, along with Linux command-line tools and GUI apps on Windows.

2.  Install Docker Desktop.

    From the Docker website, see [Install Docker Desktop on Windows](https://docs.docker.com/desktop/install/windows-install/) for install information and product download.

    Docker Desktop is a Windows interface for interacting with a Docker system to manage images and containers.

3.  Start the Docker Desktop.

    From the Start menu, locate and click **Docker Desktop**.

    There are multiple manage-Helm Charts located in the root of the Sametime install ZIP file. For Windows, you can use one of the following.

    sametime-single-node
    :   Install Sametime as a single node.

    sametime-single-node-metrics
    :   Installs Sametime and includes Prometheus and Grafana.

    sametime-premimum-single-node
    :   Install Sametime Premium as a single node.

    sametime-premimum-single-node-metrics
    :   Installs Sametime Premium and includes Prometheus and Grafana.

4.  Enable Kubernetes.

    From the Docker Desktop dashboard, click the **Settings** icon and then **Kubernetes**. Turn on the **Enable Kubernetes**. Click **Apply and Restart**.

5.  Install the Help dashboard.

    [https://github.com/komodorio/helm-dashboard](https://github.com/komodorio/helm-dashboard)

6.  Run the Helm chart to deploy Sametime.

    Run the Helm Dashboard including the location of the TAR file containing the Helm Chart.

    ``` {#codeblock_t4y_r3x_lzb}
    run helm-dashboard.exe /local-chart tar\_file\_path
    ```

    Select the **Repository** tab and highlight the sametime-premimum-single-node file and click **Install**.

    The Install window displays information about the Helm Chart. Make the necessary changes such as the value for where the Sametime images are located. You can modify and add values before running the chart. When finished, click **Confirm**.


