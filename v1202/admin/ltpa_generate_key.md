# Generating LTPA keys {#ltpa_generate_key .task}

Lightweight Third Party Authentication \(LTPA\) uses keys to encrypt and decrypt data being passed.

The generated keys must be shared and configured within the Sametime server and must be available before you can configure SSO using LTPA.

Using an instance of Websphere Liberty is one method that you can use to generate LTPA keys. When the Websphere Liberty server is started an LTPA key is created. You can copy the key onto both the host machine and the Domino server.

1.  From Docker, issue the following command to start a Websphere Liberty server.

    ``` {#codeblock_d4k_zxh_ttb}
    docker run -d -p 9080:9080 -p 9443:9443 websphere-liberty:latest
    ```

2.  Copy the key from ltpa.keys from that instance:

    ``` {#codeblock_ly2_j25_j5b}
    docker cp container\_id:/output/resources/security/ltpa.keys ./ltpa.keys
    ```

    container\_id is the Websphere Liberty container ID. To obtain the container ID, open a terminal and issue the following command:

    ``` {#codeblock_my2_j25_j5b}
    docker ps
    ```

    The default password used by Websphere Liberty is WebAS.


Configure the LTPA keys in Docker or Kubernetes where Sametime is running.

**Parent Topic:  **[Setting up SSO using LTPA](enabling_sso_ltpa.md)

