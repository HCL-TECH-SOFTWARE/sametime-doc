# Updating the Sametime server TLS certificates {#updating_meeting_servers .task}

The Sametime server is pre-configured with a self-signed certificate. You can replace the self-signed certificate with a third party certificate.

Ensure that the certificate chain is complete and in the correct order. An incorrectly configured list of certificates can cause authentication failures.

-   **[Updating the TLS certificates on Docker](tls_change_certificate_docker.md)**  

-   **[Updating the TLS certificates on Kubernetes](tls_change_certificate_kubernetes.md)**  
In Kubernetes, TLS certificates are contained within a secret called tls\_secret.

**Parent topic:**[Securing](securing.md)

