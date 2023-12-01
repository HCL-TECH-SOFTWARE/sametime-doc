# Deleting a secret {#secrets_delete .task}

The kubectl delete command can be used to delete a secret.

To delete a secret, issue the command specifying the secret.

``` {#codeblock_znj_3xc_ytb}
 kubectl delete secret secretname
```

The following example shows the command to delete extra-community-configs secret.

``` {#codeblock_zrs_jxc_ytb}
 kubectl delete secret extra-community-configs
```

**Parent topic:**[Managing secrets in Kubernetes](managing_secrets_kubernetes.md)

