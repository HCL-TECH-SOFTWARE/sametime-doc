# Creating a truststore when using business card photos {#t_create_truststore_businesscards .task}

Ensure that you have read the [section overview](t_create_truststore.md).

If you are retrieving photos from an HTTPS trusted URL, the Sametime Proxy service needs a truststore to properly retrieve the photos from the https-protected PhotoURL.

The truststore file name must be named proxytruststore.p12.

To create the truststore, run the following command.

``` {#codeblock_mqh_gkv_fvb}
keytool -importcert -storetype PKCS12 -keystore proxytruststore.p12 -storepass truststore_password -alias alias_name -file file_to_trust.crt -noprompt
```

truststore\_password
:   The desired password for your truststore. Save the password for later use.

use.alias\_name
:   The value to display in the truststore, each certificate must have a unique alias.

file\_to\_trust.crt
:   The full path to the certificate you are adding to the truststore.

After creating the truststore, see [Retrieving photos from HTTPS hosts in Kubernetes](t_adding_signer_certs_k8s.md) and [Retrieving photos from HTTPS hosts in Docker and Podman](t_retrieve_photourl_docker.md).

**Parent Topic:  **[Creating a truststore with a third-party certificate](t_create_truststore.md)

