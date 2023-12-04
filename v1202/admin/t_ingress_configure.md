# Configuring Ingress for Mux {#t_ingress_configure .task}

Complete the steps in the topic [Installing Ingress](t_ingress_install.md). It is recommended to save the file that you are creating as a result of this topic. Do not save the file in the helm folder; save it at the root directory or sub-directory where the Sametime installation package was unzipped.

Sametime mux serves connections from Sametime Connect and embedded clients on port 1533. This connection can be routed through the ingress controller as well. This is suitable for an on-premise Kubernetes cluster.

If you are deploying in a cloud hosted Kubernetes environment \(Google Kubernetes Engine, Amazon Elastic Kubernetes Service, etc\) the Sametime mux is deployed as a Kubernetes load balancer service automatically. These steps are not necessary for cloud hosted environments.

1.  For traffic to flow through the Ingress controller, you must apply a configuration map to Ingress.

    Create a file called mux-configmap.yaml with the following content.

    ``` {#codeblock_rl1_43b_mvb}
    
    apiVersion: v1
    kind: ConfigMap
    metadata:
       name: tcp-services
       namespace: namespace\_name
    data:
       1533: "default/mux:mux"
    ```

    If ingress is installed in a namespace, include the `namespace: namespace\_name` statement, otherwise remove it.

2.  Apply the configMap values to the configuration by running the following command.

    ``` {#codeblock_itb_y34_4tb}
    kubectl apply -f mux-configmap.yaml
    ```

3.  Run the following kubectl patch command so that port 1533 is available.

    ``` {#codeblock_mwv_snb_mvb}
    kubectl -n ingress-nginx patch deployment ingress-nginx-controller --type=json -p='[\{"op": "replace", "path": "/spec/template/spec/containers/0/args", "value": ["/nginx-ingress-controller","--publish-service=$(POD_NAMESPACE)/ingress-nginx-controller","--election-id=ingress-controller-leader","--controller-class=k8s.io/ingress-nginx","--configmap=$(POD_NAMESPACE)/ingress-nginx-controller","--tcp-services-configmap=$(POD_NAMESPACE)/tcp-services"] }]' 
    ```


Verify the service. For more information, see [Testing Sametime chat and meeting clients](t_testing_sametime_chat.md).

**Parent Topic: **[Installing Ingress](t_ingress_install.md)

