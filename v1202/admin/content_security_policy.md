# Content Security Policy {#content_security_policy .task}

This topic describes how the Content-Security-Policy header is configured by default and what changes might be applied as needed for a given deployment.

The Sametime server is preconfigured with a Content-Security-Policy on Windows and if deployed with multiple host names, on containerized deployments. The CSP may be overridden as needed to tweak the deployment in any type of deployment, but there are certain restrictions that must be considered.

### Restrictions

* The legacy chat client requires `script-src 'unsafe-eval'` despite the recommended best practice of not allowing 'unsafe-eval'.

* Some configuration of `frame-ancestors` is required. Sametime uses iframes or floating windows for a few scenarios even without integration with other applications, so it is important to have a `frame-ancestors` rule that specifies 'self' (if single host and no integration with other origins) or a list of other origins as required for either a multiple host deployment or integration with other applications. See [Integrating with other applications](verse_integration.md) for additional details about setting `frame-ancestors`.

**Parent Topic:  **[Securing](securing.md)

## Kubernetes {#content_security_policy_kubernetes}

In order to configure a customized content security policy, the setting `global.contentSecurityPolicy` can be set when deploying the helm chart.

For example, `csp.yaml` could be configured like:

   ```
   global:
     contentSecurityPolicy: "frame-ancestors 'self'; default-src 'self'; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline'; img-src 'self' data:; connect-src 'self';"
   ```

and then applied to the deployment like:

   ```
   helm upgrade sametime helm/. -f csp.yaml
   ```

## Docker {#content_security_policy_docker}

A custom content security policy can be applied to the deployment by simply adding it to the `custom.env` file:

   ```
   CONTENT_SECURITY_POLICY=frame-ancestors 'self'; default-src 'self'; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline'; img-src 'self' data:; connect-src 'self';
   ```

## Windows {#content_security_policy_windows}

A Windows deployment already has Content-Security-Policy configured for both the new and legacy web clients in the nginx configuration. You can edit either or both of these existing settings with your own customizations subject to the restrictions identified above.

1. Locate the file(s) `chatCommonHeaders.conf` and `legacyChatCommonHeaders.conf` in the `<SametimeInstallationFolder>\nginx-win-x64\conf` folder.

2. Modify the line that starts with `add_header Content-Security-Policy`

3. Save the file and restart the server. You may short circuit a full server restart by simply restarting the `ST Web` service.

