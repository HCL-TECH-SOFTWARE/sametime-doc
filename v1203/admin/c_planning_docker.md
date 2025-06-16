# Running and managing containers with Docker and Podman {#c_planning_docker .concept}

Docker and Podman are third-party products. HCL support is available to assist in configuration and support-related issues as they pertain to the Sametime product. If you require assistance with a full platform deployment, contact [HCL Services](https://www.hcltechsw.com/wps/portal/contact-us) or one of our HCL Business Partners to inquire about professional services.

**Note:** Download the platform package directly from your vendor.

Docker and Podman are open-source tools used for developing, managing, and running containers on your [Linux®](https://www.redhat.com/en/topics/linux/what-is-linux) systems. What differentiates Podman from Docker is Podman's daemon-less architecture. To learn more about these technologies, refer to [Podman vs. Docker](https://www.redhat.com/en/topics/containers/what-is-podman#podman-vs-docker) topic in the RedHat documentation.

## Deployment and support {#section_vmd_vh3_ywb .section}

The number of concurrent users that Sametime can support depends on the size of the deployment.

System requirements
:   The minimum requirements must be available to install the product successfully. For details on system requirements, see the [System requirements](https://support.hcltechsw.com/csm?id=kb_article&sysparm_article=KB0073898) article.

Meeting size
:   By default, there is a limit of 100 participants for every meeting. To reach a wider audience, you can start a live stream and share the link with all intended participants. The limit is configurable. For more information, refer to [Configuring the maximum number of meeting participants](meetings_configuring_max.md).

## Migration {#section_qgr_233_ywb .section}

When moving to a new server, redeploy Sametime as a new configuration. If the server host name in the URL changes, you can push the new URL to the Connect and Embedded clients using Managed Settings or Domino Desktop policy \(Embedded only\). For more information, refer to [Updating connectivity settings with the managed-community-configs.xml file](admin_st_mng_remotecomm.md).

Existing URLs work if the host name remains the same.

## Disaster recovery {#section_rvv_hw1_ftb .section}

The backup and restore process is handled outside of Sametime. Consult with your Docker or Podman vendor for details.

**Parent Topic:  **[Platforms](c_planning_platforms.md)

