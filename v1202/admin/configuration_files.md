# Configuration files {#configuration_files .concept}

Configuration files maintain information used by the Sametime server for various reasons.

Override the defaults of the Sametime community container or pod.

In Sametime v12, configuration files are generated on demand based on information in the Docker or Kubernetes container management configuration file.

|File Name|Environment|Description|
|---------|-----------|-----------|
|sametime.ini|Kubernetes Docker|Sectioned configuration file used by the Sametime server. It is generated on demand based on values in custom.env or values.yaml files. Settings can be over-ridden if needed**Note:** The file must conform to the XML syntax rules.

|
|StCommunityConfig.xml|Kubernetes Docker|Contains LDAP settings and more. **Note:** In versions previous to V12 this file was named stconfig.nsf.

|
|UserInfoConfig.xml|Kubernetes Docker|Contains configuration data for business cards.**Note:** The file must conform to the XML syntax rules.

|
|Policies.server.xml|Kubernetes Docker| |
|Policies.user.xml|Kubernetes Docker| |
|Clustering|Kubernetes| |

**Note:** In releases prior to version 12, there are several configuration files used by different Sametime servers.

Configuration values can be modified. Where a modification can be done it is covered in the appropriate topic. For example, updates to LTPA keys are covered in the [Setting up SSO using LTPA](enabling_sso_ltpa.md) topics.

**Parent Topic:  **[Administering](administering.md)

