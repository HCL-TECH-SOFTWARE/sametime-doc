# Installing Ingress {#t_ingress_install .task}

When running Kubernetes on-prem, managing load-balancing must be considered for Sametime Meetings and Web Chat. Both of these Sametime features require the addition of an ingress controller.

Ingress is secured with a SSL certificate which must be created. Create a secret for ingress by following the steps in [Updating the TLS certificates on Kubernetes](tls_change_certificate_kubernetes.md).

If different the host names for Web Chat and Meetings are different, open the values.yaml file and add the following line to identify the Web Chat host name.

``` {#codeblock_fn4_swc_pvb}
extraChatHostname: web\_chat\_hostname
```

Verify that there are two spaces at the beginning of the line. Save and close the values.yaml file.

There are many different ingress controllers available, however; not all of them have been tested with Sametime. The procedure in this topic describes deploying the NGINX Ingress controller. If you are using another ingress controller, refer to the documentation for that ingress controller.

An Ingress controller is also used for the Connect and Embedded clients mux traffic deployed on-premise Kubernetes. After installing the ingress controller, additional configuraiton steps are needed. See[Configuring Ingress for Mux](t_ingress_configure.md) for details.

Helm commands are used to install and configure the NGINX Ingress controller.

1.  Add the nginx repository using the helm repo command.

    ``` {#codeblock_qrk_3zj_mvb}
    
    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
    ```

2.  Update the repository with the following command.

    ``` {#codeblock_nhy_kzj_mvb}
    
    helm repo update
    ```

3.  Run the following command to install NGINX.

    ``` {#codeblock_tmw_4zj_mvb}
    helm install nginx-ingress ingress-nginx/ingress-nginx --set controller.service.loadBalancerIP=IP\_address 
    ```

    Where IP\_address is the reserved IP address.

    If you have a namespace dedicated to Sametime, include the namespace option on the command.

4.  Verify that nginx-ingress has accepted the correct static IP address by running the kubectl get command. Includes the -w parameter. To break free from this, use Ctrl+C.

    ``` {#codeblock_ong_13d_pvb}
    kubectl get services -o wide -w nginx-ingress-ingress-nginx-controller 
    ```

    Use Contl+C to return to the command prompt.


-   **[Configuring Ingress for Mux](t_ingress_configure.md)**  


**Parent topic:**[Installing Sametime in a Kubernetes environment](installation_sametime_kubernetes.md)

