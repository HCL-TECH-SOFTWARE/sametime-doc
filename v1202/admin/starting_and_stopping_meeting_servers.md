# Starting and stopping Meeting servers {#starting_and_stopping_meeting_servers .task}

This section provides information on starting and stopping HCL Sametime Meeting servers.

This page will provide steps to stop and start the Sametime Meeting server on Docker and Kubernetes.

**Procedure**

1.  Stop the Meeting server.

    **Docker:**

    ```
    docker compose down
    
    ```

    **Kubernetes:**

    ```
    helm uninstall sametime-meetings
    ```

    **Note:** In helm, the term **uninstall** is terminating the deployment. Additionally, the command assumes you are in the helm directory. The . represents current directory.

2.  Start the Meeting server.

    **Docker:**

    ```
    docker compose up -d
    
    ```

    **Kubernetes:**

    ```
    helm install sametime-meetings .
    
    ```

    **Note:** In helm, the term **install** is a deployment of the applications. Additionally, the command assumes you are in the helm directory. The . represents current directory.


