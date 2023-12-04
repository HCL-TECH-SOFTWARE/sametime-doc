# Deploying multiple videobridges in different locations {#t_configure_jitsi .task}

Deploying multiple Kubernetes clusters each with a separate Sametime deployment allows for distribution of videobridges at different location. This type of deployment improves video streaming by reducing latency and improves bandwidth when users are geographically far from a single videobridge.The Octo Protocol is required when to route video streams between videobridge servers.

multi-video bridges is lower latency and likely higher bandwidth between those users and that bridge. This section covers the steps on how to enable multiple video bridges. Below is a list of several secrets defined in the sametime-global-secrets resource. There are others not mentioned here as well. Refer to [Managing secrets in Kubernetes](managing_secrets_kubernetes.md) for the basic guidelines regarding post-installation configuration. you are deploying multiple kubernetes clusters each with a separate sametime deployment. It also describes the necessary steps to enable octo so that those two deployments can work together. The only reason you would do that is for geographic distribution of video bridges. The thought being: if you install a video bridge "closer" to the users it serves then they will have a better experience because there is lower latency and likely higher bandwidth between those users and that bridge.

Obtain the geolocation license key from [Geolocation DB](https://geolocation-db.com/). The location service determines the region matching and is needed for the primary installation.

This configuration must be done as part of installation.

1.  Run the command to prepare the primary deployment.

    ``` {#codeblock_lzm_5lk_55b}
    ./prepareDeployment.sh
    ```

    When prompted, answer Y to the Enable Octo prompt. For more information, refer to [Preparing the deployment](t_meetings_configure_deployment.md).

2.  Deploy the helm charts. Save the deployed charts for future reference. For more information, refer to [Deploying Sametime to Kubernetes cluster](t_installing_deploy_kubernetes.md).

    ``` {#codeblock_pgr_pjh_y5b}
    helm install sametime .
    ```

    **Note:**

    -   The command assumes you are in the helm directory. The `.` represents current directory.
    -   Instead of `sametime`, you can choose any descriptive name for the deployment. You can also deploy the application in a namespace through the `-n or --namespace` option. First create the namespace with `kubectl create namespace`.
3.  Confirm if you have a working single region deployment. For more information, refer to Kubernetes [Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/).

4.  Obtain `MeetingLocationSecret`, `JvbAuthPassword`, and `JwtSecret` from the primary installation. You can find this in `<ReleaseName>-global-secrets`.

5.  Ensure that the TCP primary prosody is open on port 5222 for the secondary JVB to connect. The prosody host is accessible through the network load balancer if one is available in your deployment. Every deployment has a different FQDN and region. Run the command to obtain the FQDN of the prosody host on the primary deployment.

    ``` {#codeblock_dd2_kzh_y5b}
    kubectl get service jitsi -o yaml | grep -E 'hostname|ip'
    ```

    If your deployment does not have a load balancer, you can use the nginx ingress controller to forward tcp-services for port 5222. Make sure you configure the nginx-ingress-controller to [enable tcp-services](https://kubernetes.github.io/ingress-nginx/user-guide/exposing-tcp-udp-services/). Then in the tcp-services configmap, add an entry. In the following example, the primary Sametime deployment is in the default namespace.

    ``` {#codeblock_gzs_b13_y5b}
    "5222": default/jitsi:5222
    ```

6.  Run the command for the second deployment, using the information gathered in step 4.

    ``` {#codeblock_egn_qc4_v5b}
    ./prepareDeployment.sh 
    ```

7.  Optional: Repeat step 6 for every deployment if you have more than one primary or secondary installation.

8.  Switch to each remote regional cluster and deploy each deployment using helm. Save the deployed charts.

    **Note:** Assuming you use a single kubectl client to deploy against the primary and remote clusters, you can run the command to see the possible cluster contexts.

    ``` {#codeblock_pyl_xnh_y5b}
    kubectl config get-contexts
    ```

    You can use the `--kube-context` on the helm command and the `--context` option on the kubectl command to switch the context as you perform tasks against each deployment.

    After enabling multiple video bridges, you end up with a single primary installation and one or more secondary installations. Having multiple primary installations in one or multiple regions is not required.


1.  Open the correct port to establish a UDP connection. Primary JVB talks to secondary JVB and vice versa through JVB\_OCTO\_BIND\_PORT.

    -   In a Kubernetes environment, JVB has a separate node group. Port 4096 should be open for UDP in that node group.
    -   JVB should be reachable from the other JVB through port 4096.
    **Note:** You can obtain the IP address of JVB using [ifconfig.me](http://ifconfig.me). An alternative method is to set harvestOctoPublic to false in the values.yaml file and then enter the JVB public address in jvbOctoPublicAddress in values.yaml for both primary and secondary installations.

2.  Test the UDP connection to ensure that the users who have joined from separate bridges are able to communicate.

**Parent Topic: **[Installing Sametime in a Kubernetes environment](installation_sametime_kubernetes.md)

