# Starting and stopping the Sametime server {#starting_and_stopping_servers .task}

Starting and stopping the Sametime server involves starting and stopping the Sametime services running in the container management system.

To manage the Sametime server on Docker, you use the docker-compose command.

-   To start the Sametime server on Docker, run the following command.

    ``` {#codeblock_m4f_g1t_s5b}
    docker-compose up -d
    
    ```

-   To stop the Sametime server, run the following command.

    ``` {#codeblock_ixn_31t_s5b}
    docker-compose down
    
    ```


On Kubernetes, scaling the pods can be used to start and stop the Sametime service. The kubectl scale command is use.

-   Scale the pod to one, starts the service.

    ``` {#codeblock_v3p_41t_s5b}
    
    kubectl scale deploy deployment\_name --replicas=1
    ```

-   Scale the pod to zero, where pod\_deployment\_name is the pod name.

    ``` {#codeblock_d2d_t1t_s5b}
    
    kubectl scale deploy deployment\_name --replicas=0
    
    ```


**Parent Topic: **[Administering](administering.md)

