# Configuring host aliases for Kubernetes deployments {#t_meetings_kubernetes .task}

If your Kubernetes environment is unable to consistently resolve the host names of the supporting servers \(MongoDB, Sametime Proxy, STUN\) using DNS, configure the hosts manually.

In Kubernetes, you can add host names and their corresponding IP addresses to the host aliases. In a Sametime Meetings on Kubernetes deployment, this setting is defined in the deployment.yaml in the various templates for each Kubernetes pod.

Table 1 lists the pod name and template for each host to be resolved.

Modify each template specified in Table 1 to include the host name and IP address of the required supporting server.

Complete the following steps to modify each template in the table to include the host name and IP address of each supporting server.

**Note:**

-   When modifying yaml files, do not use the tab key for indentation, when using indentation use two spaces for each indentation.
-   This process should be completed for all templates involved.
-   There should be no extra blank lines in the template.

**Procedure**

|Hostname to resolve|Pod|Template name|
|-------------------|---|-------------|
|MongoDB|community|helm/charts/community/templates/pod.yaml|
|MongoDB|proxy|helm/charts/proxy/templates/deployment.yaml|
|MongoDB|catalog|helm/charts/catalog/templates/deployment.yaml|
|LDAP|community|helm/charts/catalog/templates/deployment.yaml|
|STUN server|video|helm/charts/video/templates/deployment.yaml|
|Recording repository and Sametime server|recordings|helm/charts/recordings/templates/deployment.yaml|

1.  Open the template using a text editor and place into edit mode.

    Locate the line `restartPolicy=Always` and insert a new line.

    Use the below example text as a template and include the host names that need to be resolved:

    ```
     
    hostAliases: 
        - hostnames: 
          - "ldap.company.com" 
          ip: "10.10.10.10" 
        - hostnames: 
          - "mongodb.company.com" 
          ip: "10.10.10.11" 
    
    ```

    **Note:** In the `hostnames` field your server might only be known as one host name, you can add multiple aliases if desired.

2.  Before saving the template, ensure the indentations are correct, using only spaces for indentation. The `hostAliases:` line should line up exactly under the `restartPolicy` line at the same level of indentation. You may need to correct the other lines as well after copy and pasting them.
3.  Save and close the template when changes are complete.

After this process is complete continue to the steps to install Sametime, see [Loading the Sametime image to Docker](t_meetings_sametime_image_docker.md). If Sametime is already installed, follow the procedures in the [Applying configuration changes in Kubernetes](apply_configchanges_kubernetes.md) topic to apply the changes.

**Parent topic:**[Preparing the network](t_meetings_prepare_network.md)

