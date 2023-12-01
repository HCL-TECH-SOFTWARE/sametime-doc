# Creating persistent volume for a single node deployment {#t_single_node .task}

This procedure describes an approach to configuring persistent local node storage for the meeting recordings pod in a Kubernetes environment.

This procedure assumes that you have a single worker node running the meetings-recording.node and persistence is mapped from the available disk space on the node itself. However, there are many complexities related to managing persistence in a Kubernetes environment. So you should find a solution that meets your needs, which might involve using network mounts, elastic cloud storage, and so forth.

1.  Extract the sametime\_meetings.zip file and change to the directory with the extracted files. The extracted files contain YAML configuration files used in the following steps.

2.  From the worker node, run the following commands to create a mount point on the host.

    ```
    sudo mkdir -p /mnt/disk/vol1
    sudo chcon -Rt svirt_sandbox_file_t /mnt/disk/vol1
    sudo chmod 777 /mnt/disk/vol1
    ```

3.  Run the following command to create a local storage class.

    ```
    kubectl create -f kubernetes/storage/single-node/storage-class.yaml
    ```

4.  From the directory with the extracted files, edit the following settings in thekubernetes/storage/single-node/persistent-volume.yaml file.

    -   Replace the value of `REPLACE_WITH_NODE_NAME` with your single node name.
    -   Adjust the capacity: storage: value to reflect your expected storage needs.
5.  Run the following command to create a persistent volume.

    ```
    kubectl create -f kubernetes/storage/single-node/peristent-volume.yaml
    ```

6.  Run the following command to create the persistent volume claim.

    ```
    kubectl create -f kubernetes/storage/single-node/peristent-volume-claim.yaml
    ```


**Parent topic:**[Creating the persistent volume](t_meetings_recordings.md)

