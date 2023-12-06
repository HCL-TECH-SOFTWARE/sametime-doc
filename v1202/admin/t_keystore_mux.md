# Creating a keystore for Sametime mux {#t_keystore_mux .task}

A keystore consists of a private key and a certificate. Sametime supports both a third-party certificate, signed by a Certification Authority \(CA\), or a self-signed certificate. Request a certificate and private key from your CA for the hostname used by the Sametime mux. This is the microservice that listens on port 1533 for requests from the Sametime Connect clients \(installed clients on desktop\). In Kubernetes, the mux is either a Kubernetes service \(for example, a load balancer type service\) or a Kubernetes ingress service for on-premise Kubernetes. For Docker deployments, the mux listens on port 1533 and does not require any additional service.

-   **[Creating a keystore for Sametime mux: third-party CA](keystore_third_party.md)**  

-   **[Creating a keystore for Sametime mux: self-signed certificate](t_keystore_self_signed.md)**  


**Parent Topic:  **[Securing connections between the Sametime mux and the Connect and Embedded clients](securing_connections_between_community_clients.md)

