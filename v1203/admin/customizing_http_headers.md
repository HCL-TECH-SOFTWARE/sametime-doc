# Customizing HTTP Headers {#customizing_http_headers .task}

This topic describes how to add or override certain HTTP headers. You may wish to do this to enhance or relax the security profile of the Sametime server. 

The Sametime server is preconfigured with certain HTTP headers that may enhance user privacy, but this comes at the cost of being able to perform analytics for how users navigate to, from, and around the Sametime server.

For example, the `Referrer-Policy` is set to `no-referrer` out of the box. If you want to have more visibility into how browsers end up at the Sametime server, you might consider using the value `strict-origin-when-cross-origin` ([https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Referrer-Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Referrer-Policy){:target="_blank"}).


**Parent Topic:  **[Securing](securing.md)

## Kubernetes {#customizing_http_headers_kubernetes}

All traffic into the Sametime server comes through an Ingress Controller. Different Ingress Controllers will have different mechanisms for configuring additional or overriding existing HTTP headers. As the NGINX Ingress Controller is very popular, examples for it are provided.

Additional headers can be added and some can be removed using the `more_set_headers` or `more_clear_headers` nginx directives in a `configuration-snippet` annotation on the Ingress object. For example:

1.  Edit the web ingress
    ```
    kubectl edit ingress web
    ```

2. Add the annotation as desired:
    ``` {#codeblock_dnq_5ww_p5b}
    kind: Ingress
      metadata:
        annotations:
          nginx.ingress.kubernetes.io/configuration-snippet: |
            more_set_headers 'x-my-desired-header: some_value';
            more_clear_headers 'x-permitted-cross-domain-policies';
            more_set_headers 'referrer-policy: strict-origin-when-cross-origin';
        ...
    ```

3. Save the ingress


## Docker {#customizing_http_headers_docker}

To add or override headers in a Docker environment, you can create a `custom-meet.conf` within the web configuration of the Sametime server.

1.  Create a file called `sametime-config/web/nginx/custom-meet.conf`

2.  In the file, you can add or remove headers like this:

    ``` {#codeblock_dnq_5ww_p5b}
    more_set_headers 'x-my-desired-header: some_value';
    more_clear_headers 'x-permitted-cross-domain-policies';
    more_set_headers 'referrer-policy: strict-origin-when-cross-origin';
    ```

3.  Restart nginx:
    ```
    docker-compose restart nginx
    ```

