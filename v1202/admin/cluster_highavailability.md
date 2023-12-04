# Clustering and high availability {#cluster_highavailability .concept}

High availability and high capacity configuration for Sametime is achieved in different ways depending on which component is being configured for HA. See the topics below to learn more about chat, meetings, and MongoDB.

-   **[Configure high capacity for chat](plan_cluster_chat.md)**  
Sametime supports up to 10,000 simultaneous log-ins with a standard single community pod, mux pod, and proxy pod in a Kubernetes deployment. Docker deployments of Sametime support 10,000 simultaneous log-ins.
-   **[Configure high capacity for meetings](plan_cluster_meetings.md)**  
High availability is supported for the front-end web traffic to the Kubernetes cluster. You can deploy multiple front ends on different physical and virtual nodes pointing to the same back end in order to distribute load and survive a node outage.
-   **[Configuring MongoDB for high availability](plan_cluster_mongodb.md)**  
This topic covers the steps on how to configure MongoDB for high availability.

**Parent Topic: **[Planning](planning.md)

