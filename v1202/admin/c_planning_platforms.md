# Platforms {#c_planning_platforms .concept}

Docker and Kubernetes have different goals and outcomes. The decision about which platform to use depends on your end goal.

Sametime is a containerized application that you can install on the following container platforms that manage containerized applications like Sametime:

-   Docker
-   Podman
-   Kubernetes
-   OpenShift

Your organization’s needs drive the container environment that you select. For example, your organization might value security, scalability, and other factors. The following concepts identify some aspects of container platforms. Both Docker and Podman are container engines that you use to manage containers. Sametime runs as if in a single, isolated container. When applications run in isolated containers, they run on a single-node container platform. On a single-node platform, each application runs as a separate container. A deployment environment that contains few containers to produce a solution works well in this type of platform environment. However, if you implement a solution that requires multiple containers to be managed as a unit, a single-node platform doesn’t provide the required features.

A platform that performs container orchestration, such as Kubernetes and OpenShift, offers features that enterprise solution environments require. These features, which include deployment automation, scaling, and load balancing, provide great flexibility for enterprise solutions. Multiple nodes that contain various containers are used to implement enterprise solutions. They are referred to as multiple-node container platforms.

Sametime Meetings are sized according to server activity at any given time. A large single-node container platform instance can support up to 200 concurrent peak users. However, that load doesn’t account for the number of meetings that are being recorded, which are processor-intensive. The autoscaling feature in a multiple-node container platform enables adding and removing nodes as needed based upon current usage and monitoring. For sizing and deployment-related questions, [contact HCL](https://volt.myhclsandbox.com/volt-apps/anon/org/app/7fc42e3c-19f4-48df-87fc-09d0ac7c3296/launch/index.html?form=F_Form1).

-   **[Running and managing containers with Docker and Podman](c_planning_docker.md)**  

-   **[Planning for Sametime in a Kubernetes environment](c_planning_kubernetes.md)**  
Kubernetes provides container orchestration for managing containers. When using this platform, you must consider how to manage operations, scalability, and security.

**Parent Topic:  **[Planning](planning.md)

