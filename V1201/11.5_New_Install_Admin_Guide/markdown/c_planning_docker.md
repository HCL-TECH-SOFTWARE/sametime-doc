# Planning for Docker {#c_planning_docker .concept}

## Is Docker better than Kubernetes? { .section}

Docker and Kubernetes have different goals and outcomes. The decision should depend on your end goal. Docker is about containerization; Kubernetes is about container orchestration. The Docker containers are the building blocks. A small deployment has the bare minimum number of containers to produce a solution that allows users to collaborate, but without scalability, load balancing, etc. If you are deploying for a small group and do not require scalability, Docker is a simple solution. Kubernetes builds on the base containers and allows them to auto scale; load balance across multiple physical or virtual hosts, even bringing up and tearing down new hosts to deal with load variance.

Meetings are sized based on what is happening on the server at any given time. There are many variables including the CPU and memory size of the Docker instance. A large Docker instance can support up to 200 concurrent peak users, but that does not take into consideration how many of the meetings are being recorded. Meeting recordings are CPU intensive. A Docker instance is best suited for a small department or focused team than an enterprise size deployment.

You can overcome these limitations through Kubernetes autoscaling. Autoscaling adds and removes nodes as needed based upon current usage and monitoring. Kubernetes is recommended if you are deploying Sametime meetings for your entire organization. For sizing and deployment related questions, [contact HCL](https://volt.myhclsandbox.com/volt-apps/anon/org/app/7fc42e3c-19f4-48df-87fc-09d0ac7c3296/launch/index.html?form=F_Form1).

**Note:** You can set up a basic, non-production Kubernetes cluster that can be used to host a non-production Sametime server. you can have a fixed number of recorders always running on that fixed number of nodes.

## What level of help does HCL technical support provide for Docker-related issues? {#section_qbz_ysn_dtb .section}

Docker is a third-party products. HCL support is available to assist in configuration and support-related issues as it pertains to the Sametime product. If you require assistance with a full Docker deployment, reach out to [HCL Services](https://www.hcltechsw.com/wps/portal/contact-us) or one of our HCL Business Partners to inquire about professional services.

## How do I migrate from different versions of Docker when moving servers? { .section}

When moving to a new server, redeploy Sametime Meetings as a new configuration. If the server hostname in the URL changes, you can push the new URL to the users using Managed Settings. Existing meeting URLs should work if the hostname remains the same.

## What is the maximum number of participants in a meeting? { .section}

By default, there is a limit of 100 participants for every meeting. To reach a wider audience, you can start a live stream and share the link to all intended participants.

## How many concurrent users can Sametime support? {#section_cx5_511_ftb .section}

This depends on the size of the deployment. For sizing and deployment related questions, [contact HCL](https://volt.myhclsandbox.com/volt-apps/anon/org/app/7fc42e3c-19f4-48df-87fc-09d0ac7c3296/launch/index.html?form=F_Form1).

## What are the system requirements? {#section_fkj_yrr_2tb .section}

The minimum requirements must be available to install the product successfully. For detail system requirements, see the [System requirements](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0097599) article.

## Are the supported packages for Docker available on the HCL License and Delivery Portal? {#section_lr4_wb1_ftb .section}

No, packages for Docker can be downloaded directly from your vendor.

## How do we backup and restore Docker? {#section_o5k_yb1_ftb .section}

The backup and restore process is handled outside of Sametime. Consult with your Docker vendor for details.

**Parent topic:**[Platforms](c_planning_platforms.md)

