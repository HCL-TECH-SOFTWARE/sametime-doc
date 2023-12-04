# Obtaining the cert.key and cert.crt files for Sametime {#t_generate_certkey .task}

The CSR is generated on the same server you plan to install the certificate on and contains information the Certificate Authority \(CA\) uses to create your certificate. It also contains the public key that is included in your certificate and is signed with the corresponding private key.

The CSR contains three sets of information:

-   Business information and the \(sub\)domain that you are equipping with SSL or TLS. See the table for more information.
-   The public key that is included in the certificate. The public key is used to encrypt and the corresponding private key is used to decrypt.
-   Information about the key type and length.

|Information type| |
|----------------|--|
|Common name \(CN\)|The fully qualified domain name \(FQDN\) of your server. Enter the hostname in lowercase characters.|
|Organization \(O\)|The legal name of the company as registered in the locality. When applicable, include any suffixes, such as Inc., Corp., or LLC.|
|Locality or city \(L\)|The full name of the city where your organization is located.|
|State or county or region \(S\)|The full name of the state or province where your organization is located.|
|Country \(C\)|Two-letter country code where the organization is located.|
|Email address|Email address used to contact your organization.|

1.  Open the terminal on your computer, and depending on the platform that you are using, run the applicable code to create the certificate signing request \(CSR\). If you see the name of your user account in the terminal, then the task is done. Two new files \(.KEY and .CSR\) are generated in this process.

2.  Provide the needed business information and submit to the Certificate Authority for signing. When successful, the Certificate Authority sends back a .CRT file.

3.  Rename the .KEY and .CRT files into *cert.key* and *cert.crt* respectively.

4.  Place the renamed files in the following directory.

    ```
    <installation_directory.>/sametime-config/web/keys/
    ```

    Where `installation_directory` is the Sametime installation directory.


You can replace or update the TLS certificates. For more information, refer to [Replacing the TLS certificates for Web Chat and Meetings](tls_change_certificate.md), [Updating the TLS certificates on Docker](tls_change_certificate_docker.md), and [Updating the TLS certificates on Kubernetes](tls_change_certificate_kubernetes.md).

**Parent Topic: **[Securing connections](securing_connections.md)

