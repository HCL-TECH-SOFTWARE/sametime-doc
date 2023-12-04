# Creating a community provisioning URL for mobile users {#community_provisioning .task}

This section describes how to create a provisioning URL that automatically creates a Sametime community definition on mobile devices running Google Android or Apple iOS, so users can easily connect to Sametime.

A mobile user cannot connect to the Sametime server without a special mobile community definition that provides details needed for the connection. Creating the mobile community is often frustrating for users because they do not have ready access to required information such as the Sametime proxy server's hostname and port. A provisioning URL for the mobile community makes it easy for users to connect to Sametime from their mobile devices after installing the client.

To connect to Sametime, the user simply taps the provisioning link or scans the associated QR code, and then:

-   If the user is logged in to Sametime, an alert explains that the user must log out of Sametime to use the link, and then resumes the previous session so the user can log out and try again.
-   If the user already belongs to a community with the same configurations \(server, port, and user name\) an alert prompts the user to confirm that the existing community definition should be updated. When the user confirms the update, the new settings are applied.
-   If the user does not already belong to the community associated with the configuration, Sametime displays the Add Community panel with fields filled in with information from the URL. The user verifies and saves the information.

You can format the URL as a link or as a QR code, and distribute it in email or post it on a website. The provisioned URL is supported on the following mobile operating systems:

-   Google Android 6 or later.
-   Apple iOS 13 or later.

**Note:** Starting with HCL Sametime version 11, the browser client displays a QR code that can be used to configure the HCL Sametime client for Android or iOS. Once logged into the browser client, open Settings and then **Configure Mobile Client.** The QR code displayed represents a secure community configuration for the Sametime proxy server and port that the browser is connected to. The QR code also includes the users’ ID and a default community name of Sametime. The user only needs to follow the instructions to scan the code and enter their password before connecting with a mobile device.

If you wish to use a different community name or perhaps the mobile clients need to connect through an authenticating proxy, the administrator can create a custom provisioning URL using the information contained in this article and then configure the Sametime proxy to display the QR code for the custom provisioning URL rather than the default one mentioned above.

**Procedure to create the custom provisioning URL**

Create and distribute a custom provisioning URL by completing the following steps:

1.  Create the URL by defining its components:

    The URL is formatted as shown:

    ```
    hclsametime://st_user@stproxy_host:port/?action=AddCommunity&communityName=community_name
    ```

    where:

    -   *`hclsametime://`* is a required prefix to ensure that the URL is recognized and processed correctly.
    -   *`st_user`* the user name, or login ID, of a particular Sametime user; for example, *`myid@mycompany.com`*

        If you are sending or posting a URL for use by multiple people, you will probably not want to code a specific user's ID into the URL because other users may find that confusing. Instead, you can supply a variable or a partial user name and instruct users to modify the URL with the completed user name on their own devices, or you can omit the user name entirely so that each user is prompted for credentials when logging in to Sametime. If you want users to be able to simply click a link or QR code to use the URL, you should omit the user name and allow the user to provide credentials at login.

        **Note:**

        In addition, you can optionally instruct users to include the associated password in the URL with the following syntax: *`st_user:st_password`*; however, this is not a good practice because the password could potentially be consumed by an untrusted app.

    -   *`stproxy_host`* is the fully qualified host name of the Sametime Proxy Server; for example: `stproxy.example.com`.
    -   *`port`* is the port that the Sametime Proxy Server is listening on. If omitted, 443 will be used.
    -   `?action=AddCommunity` is a required parameter that ensures the information within the URL is added to the mobile client as a community definition.
    -   `&communityName=*community\_name*` is an optional URL-encoded string that provides a name for the new community. If you do not specify a name with this parameter, a default name will be created based on the Sametime Proxy Server's host name.
    The table below provides the complete list of parameters that you can include in the URL and indicates whether each parameter is required.

    |Name|Value|Description|
    |----|-----|-----------|
    |action|AddCommunity|Required. This string identifies the URL as an auto-provisioning operation.|
    |communityName|URL-encoded string|**Optional:** A user-friendly nickname for the newly created community. If you do not specify a name with this parameter, a default name will be created based on the Sametime Proxy Server's host name.|
    |savePassword|true or false|**Optional:**Indicates whether passwords are remembered for this connection. Applies to both Sametime and authenticating proxy passwords. The default value is false.|
    |authProxyEnabled|true or false|**Optional:**Indicates whether the connection requires authentication with a reverse-proxy server. The default value is false. If this parameter is omitted but authenticating proxy credentials are supplied, Sametime behaves if this parameter is set to true.|
    |authProxyReuseCredentials|true|**Optional,**but if you include this parameter, you must set it to true. Indicates whether reverse-proxy authentication will use the Sametime user ID and password provided earlier in the URL|
    |authProxyUser|URL-encoded user ID value|**Optional:** User ID value to use for reverse proxy authentication. If present, proxy authentication is assumed to be enabled. Users can input proxy passwords separately before login.|
    |allowUntrustedSSL|true or false|**Optional:**Determines whether untrusted SSL is allowed for this connection. The default and recommended values are ***false***. When this option is enabled, Sametime allows connections over untrusted channels and you risk exposure of your data to attackers attempting to steal your information.|

    **Examples:**

    -   Encrypted \(SSL\) direct connection to server stproxyserver.example.com on default port 443 with no user-specified but the community name is specified as "Sametime Server" :

        ```
        hclsametime://stproxyserver.example.com/?action=AddCommunity&communityName=Sametime%20Server
        ```

        To preserve correct URL syntax, the space in "Sametime Server" is represented with `%20`.

    -   Encrypted \(SSL\) direct connection to server `stproxyserver.example.com` on port `9080` for user dmisawa:

        ```
        hclsametime://dmisawa@stproxyserver.example.com:9080/?action=AddCommunity
        ```

        If the user name itself contains the `@` symbol you will need to format it as the URL-encoded character `%40` to preserve correct syntax, as in

        ```
        dmisawa%40auto_sales@stproxyserver.example.com:9080
        ```

    -   Encrypted \(SSL\) authenticating proxy connection to `safelinx.example.com` on default port `443` reusing authenticating proxy credentials and supplying a variable for the user name, which each user must replace with their own ID:

        ```
        hclsametime://Your_Sametime_ID@safelinx.example.com/?action=AddCommunity&authProxyReuseCredentials=true
        ```

        In this case both the auth proxy user ID and the sametime user ID would be set to **Your\_Sametime\_ID.**

    -   Encrypted \(SSL\) authenticating proxy connection to `safelinx.example.com` on port `8881` reusing credentials, with no credentials specified so that each user will be prompted for credentials when logging into Sametime:

        ```
        hclsametime://safelinx.example.com:8881/?action=AddCommunity&authProxyEnabled=true
        ```

2.  Distribute the URL to mobile users:
    -   Format the URL as a link or use a third-party application to generate a scannable QR code.
    -   Post the link or QR code to a website, or distribute to users it by email.
    -   Configure the Sametime server to display the QR code for your custom provisioning URL using the browser clients Configure Mobile Client feature.

**Configuring the Sametime server to use the custom provisioning URL**

Before updating the stproxyconfig.xml, examine the URL. URL encode any ampersands or spaces. For example, if the URL.

```

hclsametime://stproxyserver.example.com/?action=AddCommunity&communityName=Sametime%20Server

```

The ampersand character is replaced with %26.

```

hclsametime://stproxyserver.example.com/?action=AddCommunity%26communityName=Sametime%20Server

```

1.  Use a text or XML editor to open the stproxyconfig.xml file, located in the sametimeproxy\\conf\\stproxyconfig.xml directory.
2.  Add a <mobile\> section if it does not exist with <configUrl\> providing the provisioning URL as shown in the following example.

    ```
    
    <mobile>
    <configUrl>CUSTOM_PROVISIONING_URL</configUrl>
    </mobile>
    
    ```

3.  Save and close the file
4.  Restart the Sametime Proxy server to enable.

-   **[Creating a community provisioning URL on Docker or Podman](t_community_provisioning_docker.md)**  
As discussed in [Creating a community provisioning URL for mobile users](community_provisioning.md), mobile users cannot connect to the Sametime server without a special mobile community definition that provides details needed for the connection. This topic discusses the specific steps to set up the community provisioning URL on Docker or Podman.
-   **[Creating a community provisioning on Kubernetes](t_community_provisioning_k8s.md)**  
As discussed in [Creating a community provisioning URL for mobile users](community_provisioning.md), mobile users cannot connect to the Sametime server without a special mobile community definition that provides details needed for the connection. This topic discusses the steps to set up the community provisioning URL on Kubernetes.

**Parent Topic: **[Sametime client configuration options](sametime_client_configuration.md)

