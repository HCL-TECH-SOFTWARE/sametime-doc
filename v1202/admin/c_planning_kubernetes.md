# Planning for Kubernetes {#c_planning_kubernetes .concept}

If you are unfamiliar with these technologies, refer to [Platforms](c_planning_platforms.md). To learn more about Kubernetes, see [An Overview of Kubernetes](https://www.hcltech.com/blogs/overview-kubernetes).

## Is Kubernetes better than Docker? {#section_erh_cgy_2tb .section}

Docker and Kubernetes have different goals and outcomes. The decision should depend on your end goal. Docker is about containerization; Kubernetes is about container orchestration. The Docker containers are the building blocks. A small deployment has the bare minimum number of containers to produce a solution that allows users to collaborate, but without scalability, load balancing, etc. If you are deploying for a small group and do not require scalability, Docker is a simple solution. Kubernetes builds on the base containers and allows them to auto scale; load balance across multiple physical or virtual hosts, even bringing up and tearing down new hosts to deal with load variance.

Meetings are sized based on what is happening on the server at any given time. There are many variables including the size \(CPU and Memory\) of the Docker instance. A large Docker instance can support up to 200 concurrent peak users, but that does not take into consideration how many of the meetings are being recorded. Meeting recordings are CPU intensive. A Docker instance is best suited for a small department or focused team than an enterprise size deployment.

You can overcome these limitations through Kubernetes autoscaling. Autoscaling adds and removes nodes as needed based upon current usage and monitoring. Kubernetes is recommended if you are deploying Sametime meetings for your entire organization. For sizing and deployment related questions, [contact HCL](https://volt.myhclsandbox.com/volt-apps/anon/org/app/7fc42e3c-19f4-48df-87fc-09d0ac7c3296/launch/index.html?form=F_Form1).

## Can Sametime support high availability? {#section_hqt_xvz_2tb .section}

High availability is supported for the front-end web traffic to the Kubernetes cluster. You can deploy multiple web front ends on different physical/virtual nodes pointing to the same back end in order to both distribute load and survive a node outage.

High availability is not supported for active meetings. If a server hosting a meeting goes down, users in meetings on that server will be interrupted. There is a reconnection timer built into the client which will cause all the clients to re-connect and be distributed to another available node. In some circumstances, a server going down will result in the client thinking the meeting has ended. Users can quickly re-join the meeting from their "recent meetings" list and will be meeting again on an available server momentarily.

## What is the maximum number of participants in a meeting? {#section_mf4_1wz_2tb .section}

By default, there is a limit of 100 participants for every meeting. To reach a wider audience, you can start a live stream and share the link to all intended participants.

## How many concurrent users can Sametime support? {#section_cx5_511_ftb .section}

This depends on the size of the deployment. For sizing and deployment related questions, [contact HCL](https://volt.myhclsandbox.com/volt-apps/anon/org/app/7fc42e3c-19f4-48df-87fc-09d0ac7c3296/launch/index.html?form=F_Form1).

## What level of help does HCL technical support provide for Kubernetes-related issues? { .section}

Kubernetes is a third-party products. HCL support is available to assist in configuration and support-related issues as it pertains to the Sametime product. If you require assistance with a full Kubernetes deployment, reach out to [HCL Services](https://www.hcltechsw.com/wps/portal/contact-us) or one of our HCL Business Partners to inquire about professional services.

## Are the supported packages for Kubernetes available on the HCL License and Delivery Portal? {#section_jpf_y11_ftb .section}

No, packages for Kubernetes can be downloaded directly from your vendor.

## How do we backup and restore Kubernetes? {#section_rvv_hw1_ftb .section}

The backup and restore process is handled outside of Sametime. Consult with your Docker vendor for details.

## Is clustering automatic for Kubernetes? {#section_psr_4w1_ftb .section}

Yes, but there is additional configuration required in a Kubernetes environment.

## Can I deploy Sametime Meetings in a Kubernetes Cloud? {#section_azv_pw1_ftb .section}

Yes. For more information, refer to [deploying Sametime Meetings in Amazon's AWS Elastic Kubernetes Services](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0085515). The examples in this knowledge article is based on version 11.5 guide and are not the exact steps for version 12. For version 12, the cluster.yaml file is found in the location of the Sametime 12 installation directory under /kubernetes/stack/eks/cluster.yaml.

For additional information, see[https://support.hcltechsw.com/csm?id=kb\_article&sysparm\_article=KB0099614](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0099614).

**Parent topic:**[Platforms](c_planning_platforms.md)

