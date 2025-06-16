# Integrating with HCL Verse

This topic includes the steps required to configure Sametime integration with HCL Verse.

## Before you begin

For Single Sign-On (SSO) to function correctly with Verse, the user identity must be consistent in Sametime and HCL Verse. Sametime uses the email address to identify the user; therefore, the LDAP directory used by Sametime must return the same email address used in Verse.

LTPA SSO requires both servers to share the same DNS suffix (for example, example.com), and each hostname participating in the SSO must have a fully qualified domain name consisting of at least three parts. For instance, verse.example.com and sametime.example.com.

LTPA SSO does not support IP addresses or shortnames.

### Procedure

Complete the following steps on an HCL Verse server. 

1. Complete the steps from the Domino documentation.  Refer to [Configuring integration with HCL Sametime](https://help.hcl-software.com/verse_onprem/3.2/admin/configuring_integration_with_ibm_sametime.html). 

2. Complete the steps in the Integrating Sametime with Domino topic. Refer to [Integrating Sametime with HCL Domino](ltpa_configure_domino.md).


Complete the following steps on an HCL Sametime server. 

1. Complete the following to enable web client integration.

      a.  Instructions for Docker or Podmon. Refer to [Enabling web client integration on Docker and Podman](verse_integration_docker.md)  

      b.  Instructions for Kubernetes.  Refer to [Enabling web client integration on Kubernetes](verse_integration_kubernetes.md) 
      
2. Complete the following to enable content security headers

      a.  Instructions for Docker or Podmon. Refer to [Enabling content security headers on Docker and Podman](verse_integration_contentsecurity_docker.md)  

      b.  Instructions for Kubernetes.  Refer to [Enabling content security headers on Kubernetes](verse_integration_contentsecurity_kubernetes.md) 
      
3. Configure Cross Origin Resource Sharing (CORS). Refer to [Configuring CORS](nomad_integration_cors.md) 

4. Apply these changes in the environment.

      a.  Instructions for Docker or Podmon. Refer to [Applying configuration changes in Docker or Podman](apply_configchanges_docker.md)  

      b.  Instructions for Kubernetes.  Refer to [Applying configuration changes in Kubernetes or Openshift](apply_configchanges_kubernetes.md) 
       
**Related:**

[Troubleshooting LTPA SSO](https://support.hcl-software.com/csm?id=kb_article&sysparm_article=KB0106722)
