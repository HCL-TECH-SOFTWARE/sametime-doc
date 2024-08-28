# Planning for Openshift {#c_planning_openshift .concept}

OpenShift is a cloud-based Kubernetes platform. Planning considerations and procedures used to deploy Sametime in an Openshift environment are the same as the Kubernetes platform with the additional considerations addressed in this topic.

While Openshift is similar to other Kubernetes platforms, the following are concepts and considerations that require understanding or a decision.

-   Deploying in a namespace
-   Deploying in the default namespace
-   Deploying video

## Deployment in a name space {#section_ang_hbt_swb .section}

In the Openshift platform, there are namespace labels used to define a common set of arbitrary User IDs \(UID\) to be used as runAs UIDs for the pods running in that namespace. Sametime now supports running whatever arbitrary user ids that are assigned to the namespace within which Sametime is deployed. In previous releases of Sametime, it was necessary to create specialized Security Context Constraints (SCC) in order to restrict the UID used to run containers via the MustRunAs policy. Now, Openshift can run the containers as whatever arbitrary user it chooses. 

## Deployment into the default namespace {#section_lv3_4b3_xwb .section}

By default, labels are not created with a random name, which can cause a problem in the default namespace where all containers labels are random. When deploying in the default namespace, comment out the seLinuxOptions:false setting for each activities, files, and recordings in the default namespace.

You can use the Sametime supplied helm charts to deploy Sametime into the default namespace without any additional configuration.

## Deployment of video {#section_ddy_p13_xwb .section}

There are three ways to deploy video when using the Openshift platform.

-   Host port

    This is the default which provides the best performance and scales automatically scalable. this method requires pod-to-node affinity restriction through node labels.

-   Load balancer

    Using a load balancer is lower performance and has no pod-to-node restrictions. It requires the Kubernetes load balancing infrastructure.

-   Node port

    Using a node port is also lower performance but is restricted to a single node. It requires a no host-network SCC.


**For step details, see**  


[Preparing to install an Openshift environment](installation_sametime_openshift.md)

