# Configure high capacity for chat {#plan_cluster_chat .task}

Sametime supports up to 10,000 simultaneous log-ins with a standard single community pod, mux pod and proxy pod in a Kubernetes deployment. Docker deployments of Sametime support 10000 simultaneous log-ins.

The Sametime mux is used to front-end client connections between the Sametime Connect client and the Sametime Embedded client inside of HCL Notes. If you need to additional capacity for these clients, you can deploy multiple community pods inside your Kubernetes cluster. The number of community pods is defined in the values.yaml file and each additional pod supports up to 10,000 additional clients. The community pod does not axiomatically scale, it is important to estimate the number of pods needed and define the setting in the values.yaml file.

1.  In the values.yaml file ensure that this setting is set to true, which is the default setting:

    ``` {#codeblock_t3f_gth_1vb}
    enableMuxDeployment: true
    ```

2.  Change the below setting to the desired number of community pods:

    ``` {#codeblock_cjw_rwh_1vb}
    numberOfCommunityServers: 1 
    ```

    To find the Kubernetes service that front-ends the mux issue the command:

    ``` {#codeblock_yvn_twh_1vb}
     kubectl get svc | grep mux 
    ```

    The ingress controller in a Kubernetes cluster front-ends the connection to the web and mobile clients and the proxy pod services those connections. Additionally, the community pod validates log ins and service the users as well. Sametime supports up to 10,000 simultaneous connections in a Kubernetes environment, and if more are needed, it is recommended to deploy an additional 1 ingress controller pod, 1 proxy pod and 1 community pod per 10,000 web and mobile clients.


**Parent topic:**[Clustering and high availability](cluster_highavailability.md)

