# Creating a community provisioning URL on Docker or Podman {#t_community_provisioning_docker .task}

As discussed in [Creating a community provisioning URL for mobile users](community_provisioning.md), mobile users cannot connect to the Sametime server without a special mobile community definition that provides details needed for the connection. This topic discusses the specific steps to set up the community provisioning URL on Docker or Podman.

Ensure that you have read [Creating a community provisioning URL for mobile users](community_provisioning.md) for the general guidelines on how to create and configure the custom provisioning URL.

1.  Open the .env file for editing.

2.  Add the following line.

    ``` {#codeblock_mf3_nds_kyb}
    MOBILE_CONFIGURL=hclsametime://stproxyserver.example.com/?action=AddCommunity&communityName=Sametime%20Server
    ```

    **Note:** To use the user name as part of the provisioning URL, follow this format:

    ``` {#codeblock_zfz_pds_kyb}
    MOBILE_CONFIGURL=hclsametime://%s@stproxyserver.example.com/?action=AddCommunity&communityName=Sametime%20Server
    ```

    When using the user name, take note of the % symbol preceding the hostname. The proxy adds the current user to the provisioning URL when the URL is generated using the web client.

3.  Save the changes.

4.  Start the Sametime server to apply the changes.

    ``` {#codeblock_btc_lj4_k5b}
    docker compose up -d
    
    ```


**Parent Topic:  **[Creating a community provisioning URL for mobile users](community_provisioning.md)

