# Managing secrets in Kubernetes 

Sensitive information such as passwords, service account names, certificates, and other confidential data needed by Sametime pods are stored in secrets. In addition to helm charts and configuration map, the Sametime configuration is also derived from secrets.

A secret is considered part of the live runtime or the current configuration. Secrets are created based upon a template or a command line. You can modify the templates to re-create secrets if needed. An example is when you need to update your LDAP bind credentials. For more information see, [Changing the LDAP service account password in Kubernetes](configuring_ldap_password.md).

For additional information about secrets in Kubernetes, see the [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/) topic in the Kubernetes documentation.

Some secrets are required by Sametime. They are created during the installation and configuration of Sametime.

Some secrets are required by Sametime and others are based on features being used, such as SAML. The following are global secrets that are required.

### Table 1. Required secrets

|Secret|Description|Template|
|------|-----------|--------|
|sametime-global-secrets|The `helm/templates/sametime-secrets.yaml` is used to define this secret. | `helm/templates/sametime-secrets.yaml` |
| | **Note:** that all values within this secret are based64 encoded. The following parameters are contained in the global secret.JwtSecret | |
| | The secret key used by the Sametime service to verify and decide the hash of JWT tokens.| | 
| | **LdapBindEntryDn**  The LDAP Bind account. | |
| | **LdapBindEntryPassword** The password for the LDAP bind account. 
|| **MongoConnectionUrl** The MongoDB formatted URL containing the login name and password used by Sametime. The host name and port number are also included. | |
| | **JigasiSipUri** The name of the of the account and the host name of the SIP user fortelephony integration with ilink. | |
| | **JigasiSipPassword** The password for telephony integration with ilink. | |
| | **ltpaKeysPassword** The password for the LTPA keys. | |
| | **MeetingLocationSecret** The secret key used to communicate to the primary location service. | |
| | **JvbAuthPassword** The password for the JVB authentication account. | |
| sametime-internal-keys-secret|Contains information about the certificate key store.|None|
|tls-secret|The name of this secret can vary because it is configurable. The name can also vary depending on the ingress controller. The ingress controller might be secured with a certificate within a secret as well.|None|

The following are default internal secrets and based off the listed template. Do not change the content within these secrets unless instructed by the software support team.

### Table 2. Internal secrets

|Secret Name|Template|
|-----------|--------|
|app-registry-config-secret|helm/templates/app-registry-config-secrets.yaml|
|auth-config-secret|helm/templates/auth-config-secrets.yaml|
|catalog-config-secret|helm/templates/catalog-config-secrets.yaml|

The following is a list of optional secrets that are dependent on a feature being enabled, such as SAML.

### Table 3. Option secrets

|Secret name|Description|
|-----------|-----------|
|extra-community-config|A configurable secret that contains extra configuration details for the Community pod. It can contain a copy of the StCommunityConfig.xml, UserInfoConfig.xml, and other community files.|
|ldap-config-secret|The certificate trust store and password for LDAP. See [Securing LDAP on Kubernetes](securing_ldap_kubernetes.md) for more details.|
|saml-config-secret|The certificate trust store and password for SAML. See [Configuring SAML in Kubernetes](enabling_saml_kubernetes.md) for more details.|

## Considerations for when namespaces are used { .section}

In Kubernetes, the Sametime cluster can be deployed in a namespace which makes administration easier for organizations that have multiple users sharing cluster resources. For example, you might want to run MongoDB in the same Kubernetes cluster as Sametime. They could be separated into different namespaces.

When creating secrets in a Sametime cluster that is scoped to a namespace, the secrets also need to be scoped to the same namespace where Sametime is installed. To define the namespace, add the -n argument followed by the namespace name to the command. For example, the following shows the get command for a namespace with the name st.

``` {#codeblock_oqd_3wc_ytb}
kubectl get secrets -n st
```

-   **[Viewing secrets](secrets_view.md)**  
The get command can be used to list secrets and view their contents.
-   **[Deleting a secret](secrets_delete.md)**  
The kubectl delete command can be used to delete a secret.
-   **[Modifying secrets](secrets_modify.md)**  
Some of the content within a secret can be changed using the edit secret command.

**Parent Topic:  **[Configuring](configuring.md)

