# Deployment customization best practices in Kubernetes

Helm allows configuration to be layered together to build the Kubernetes assets that comprise the deployment. When you run the `prepareDeployment.sh` script, some aspects of the deployment are configured with the answers to the questions that are part of that script. Those settings are configured in the `helm/values.yaml` or in various other YAML files below the `helm/` folder. Alternatively, deployment of the managed charts allows you to run the `prepareDeployment.sh` with a filename argument. In that scenario, the customized settings are stored in the filename provided and are then kept separate from the rest of the helm chart.

Storing configuration in separate YAML files allows for compartmentalization of the various settings. It is possible to have additional self-managed YAML files that maintain other deployment-specific overrides based on the requirements for a deployment to have certain features configured in unique ways.

When it comes time to install a deployment, these YAML files can be specified at install time with the "last one wins" mechanic so that if you have a setting specified in more than one file, the last time it is mentioned will be the setting that takes effect in the deployment.

The settings stored in a YAML file will be used when installing the deployment, if this file is specified using the `-f file.yaml` option:

```
helm install sametime helm/ -f custom.yaml
```

For example, suppose you want to customize the privacy settings on a deployment, you could create a `privacy.yaml` file with the content:

```
global:
  privacy:
    acknowledgementEnabled: true
    recording:
      share:
        enabled: false
        allowed: false
```

You can then install and apply your settings as priority over the default settings:

```
helm install sametime helm/ -f privacy.yaml
```

Suppose you also want to customize the length of time that a user has to be able to delete a chat message and you use `chat-delete-policy.yaml` to hold this configuration:

```
global:
  messageMutationAllowedAgeInMinutes: 10
```

You can combine both sets of configuration like this:

```
helm install sametime helm/ -f privacy.yaml -f chat-delete-policy.yaml
```

Another advantage of storing configuration customization this way is that the user-supplied files are preserved within the chart metadata so you can query a deployment to see how it was configured:

```
$ helm get values sametime
USER-SUPPLIED VALUES:
global:
  messageMutationAllowedAgeInMinutes: 10
  privacy:
    acknowledgementEnabled: true
    recording:
      share:
        allowed: false
        enabled: false
```

The layering of configuration like this allows for very flexible application of configuration across multiple deployments and for keeping deployment-specific configuration safe over upgrade cycles as the product default settings might change over time. By applying your own deployment-specific configuration last, your settings will be preserved as desired because they will override whatever application defaults that were provided.

**Parent Topic:  **[Configuring](configuring.md)

