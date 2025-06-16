# Configuring CORS {#nomad_integration_cors .task}

This topic describes how to configure Cross Origin Resource Sharing (CORS) headers for integration with other applications such as Verse and Nomad. Some of the steps follow from advice about generally configuring additional security headers, so it is advisable to also familiarize yourself with the topic [Customizing HTTP Headers](customizing_http_headers.md).

Depending on the style of deployment, the steps used to configure CORS will vary. For Docker and Kubernetes deployments, there are some CORS configuration options directly available in the deployment configuration, but there are additional configuration steps required based on the specific needs of the integration. Those additional required settings are documented below as well as the general, basic CORS configuration options available in the deployment.

For Windows deployments, it is advised to use the Traefik configuration documented below for configuring CORS.

**Parent Topic:  **[Integrating with other applications](verse_integration.md)

## Kubernetes {#nomad_integration_cors_kubernetes}

At the most basic level, CORS will require a list of allowed origins. When this list is set during deployment of the helm chart, the assumption is that an NGINX Ingress Controller will be managing the CORS settings. Each Ingress that exposes some endpoint for Sametime will have the `cors-allowed-origin` annotation set with this configured list of allowed origins. If more advanced or specific CORS configuration is required or if the Ingress Controller is not NGINX, it is also possible to disable CORS support by specifying the `global.disableCorsInIngress=true` option during deployment.

To configure the list of allowed origins, an example `cors.yaml` should have content like this:

   ```
   global:
     corsAllowedOrigins: https://vop.mycompany.com, https://nomad.mycompany.com
   ```

And then to apply to the deployment (assuming you have some other configuration you want to preserve in `other-config.yaml`):

   ```
   helm upgrade sametime helm/. -f cors.yaml -f other-config.yaml
   ```

The following additional annotations must also be added to the web and proxy Ingress object(s) following these steps:

1.  Edit the ingress (do these edits individually so that if you make a mistake you know where to check):
    ```
    kubectl edit ingress web
    kubectl edit ingress proxy
    ```

2. Add these 2 annotations:
    ``` {#codeblock_dnq_5ww_p5b}
    kind: Ingress
      metadata:
        annotations:
          nginx.ingress.kubernetes.io/cors-allow-headers: DNT,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range,Authorization,x-csrf-token,rtc4web-nonce,x-sametime-app
          nginx.ingress.kubernetes.io/cors-expose-headers: x-csrf-token, x-sametime-app
        ...
    ```

3. Save the ingress


## Docker {#nomad_integration_cors_docker}

To configure the basic list of allowed origins for Docker, add the following to `custom.env`:

   ```
   CORS_ALLOWED_ORIGINS=https://vop.mycompany.com, https://nomad.mycompany.com
   ```

The following additional CORS config should be added to override the default headers in a Docker environment. You must create a `custom-meet.conf` file within the web configuration of the Sametime server.

1.  Create a file called `sametime-config/web/nginx/custom-meet.conf`

2.  In the file, you should have this content:

    ``` {#codeblock_dnq_5ww_p5b}
    set $cors_origin  "";
    set $cors_creds   "";
    set $cors_headers "";
    set $cors_methods "";
    if ($allowed_origin != "") {
    set $cors_origin $allowed_origin;
    set $cors_creds "true";
    set $cors_headers "Content-Type,Authorization,x-csrf-token,rtc4web-nonce,x-sametime-app";
    set $cors_methods "GET, PUT, POST, DELETE, PATCH, OPTIONS";
    }
    more_set_headers -s '401 403' "Access-Control-Allow-Origin: $cors_origin";
    more_set_headers -s '401 403' "Access-Control-Allow-Credentials: $cors_creds";
    more_set_headers -s '401 403' "Access-Control-Allow-Headers: $cors_headers";
    more_set_headers -s '401 403' "Access-Control-Allow-Methods: $cors_methods";
    more_set_headers "Access-Control-Expose-Headers: x-csrf-token, x-sametime-app";
    ```

3.  Restart nginx:
    ```
    docker-compose restart nginx
    ```

## Windows {#nomad_integration_cors_windows}

Traefik is used on Windows to configure CORS. The following changes should be made to the file called `<InstallationFolder>/traefik-windows-amd64/conf/dynamic.yaml`.

1.  Add the `- cors` middleware reference to each of the routes near the top of that file like this:

    ```
      http:
        routers:
          router-stwebapi:
            rule: "PathPrefix(`/stwebapi`)"
            middlewares:
              - securityHeaders
              - cors
            service: stwebapi-service
            entryPoints:
              - websecure
            tls: {}

          router-catchall:
            rule: "PathPrefix(`/`)"
            middlewares:
              - hideServer
              - cors
            service: catchall-service
            entryPoints:
              - websecure
            tls: {}
    ```

2.  Add the `cors:` middleware to the `middlewares:` section like this:

    ```
      middlewares:
        cors:
          headers:
            accessControlAllowOriginList:
              - https://vop.mycompany.com
              - https://nomad.mycompany.com
            accessControlAllowMethods:
              - GET
              - PUT
              - POST
              - DELETE
              - PATCH
              - OPTIONS
            accessControlAllowHeaders:
              - authorization
              - x-csrf-token
              - rtc4web-nonce
              - x-sametime-app
            accessControlExposeHeaders:
              - x-csrf-token
              - x-sametime-app
    ```

    *NOTE:* Make sure to list your own allowed origins instead of the example shown above.

3.  Save the file.

    There is no need to restart any service after saving `dynamic.yaml` as it is loaded dynamically by Traefik.
