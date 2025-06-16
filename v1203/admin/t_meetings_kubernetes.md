# Configuring host aliases for Kubernetes deployments 

If your Kubernetes environment is unable to consistently resolve the host names of the supporting servers \(MongoDB, Sametime Proxy, STUN\) using DNS, configure the hosts manually.

In Kubernetes, you can add host names and their corresponding IP addresses to the host aliases. In a Sametime Meetings on Kubernetes deployment, this setting is defined in the deployment.yaml in the various templates for each Kubernetes pod.

Table 1 lists the pod name and template for each host to be resolved.

Modify each template specified in Table 1 to include the host name and IP address of the required supporting server.

Complete the following steps to modify each template in the table to include the host name and IP address of each supporting server.

**Note:**

-   When modifying YAML files, do not use the tab key for indentation. When using indentation, use two spaces for each indentation.
-   This process should be completed for all templates involved.
-   There should be no extra blank lines in the template.

|Host name to resolve|Pod|Template name|
|--------------------|---|-------------|
|MongoDB|activity|helm/charts/activity/templates/deployment.yaml|
|MongoDB|admin|helm/charts/admin/templates/deployment.yaml|
|MongoDB|app-registry|helm/charts/app-registry/templates/deployment.yaml|
|MongoDB|auth|helm/charts/auth/templates/deployment.yaml|
|MongoDB|backgrounds|helm/charts/backgrounds/templates/deployment.yaml|
|MongoDB|catalog|helm/charts/catalog/templates/deployment.yaml|
|MongoDB|click2call|helm/charts/click2call/templates/deployment.yaml|
|MongoDB|community|helm/charts/community/templates/pod.yaml|
|MongoDB|files|helm/charts/files/templates/deployment.yaml|
|STUN server|jibri-web|helm/charts/jibri-web/templates/deployment.yaml|
|STUN server|jibri|helm/charts/jibri/templates/deployment.yaml|
|MongoDB|lobby|helm/charts/lobby/templates/deployment.yaml|
|MongoDB|location|helm/charts/location/templates/deployment.yaml|
|MongoDB|proxy|helm/charts/proxy/templates/deployment.yaml|
|MongoDB|recordings|helm/charts/recordings/templates/deployment.yaml|
|STUN server|video|helm/charts/video/templates/deployment.yaml|

1.  Open the template for editing.

    Locate the following line and insert a new line.

    ```
    restartPolicy=Always
    ```

    Use this example text as a template and include the host names that need to be resolved:

    ``` {#codeblock_cwn_mcf_pzb}
     
    hostAliases: 
        - hostnames: 
          - "ldap.company.com" 
          ip: "10.10.10.10" 
        - hostnames: 
          - "mongodb.company.com" 
          ip: "10.10.10.11" 
    
    ```

    **Note:** In the `hostnames` field, your server might only be known as one host name. You can add multiple aliases.

2.  Before saving the template, ensure the indentations are correct, using only spaces for indentation. The `hostAliases:` line should line up exactly under the `restartPolicy` line at the same level of indentation. You might need to correct the other lines as well after copying and pasting them.

3.  Save and close the template when changes are complete.


After this process is complete, continue to the steps to install Sametime. See [load\_stimages\_local.md](load_stimages_local.md). If Sametime is already installed, follow the procedures in the [apply\_configchanges\_kubernetes.md](apply_configchanges_kubernetes.md) topic to apply the changes.

