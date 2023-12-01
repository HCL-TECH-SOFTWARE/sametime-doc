# Modifying secrets {#secret_modiify .task}

Some of the content within a secret can be changed using the edit secret command.

When the secret is in edit mode, you can modify the content by placing data in secrets. Most of the secret fields, such as user names, passwords, and URLs, are base64 encoded. To view a base64 encoded value, you can copy the value and decode using the following command:

```
echo -n secret\_value | base64 -d
```

To change the value to a new encoded value, you can base64 encode the new value using the following command:

```
echo -n "new\_secret\_value" | base64
```

For example to set a new LdapBindEntryDn in the sametime-global-secrets, enter the command:

```
echo -n “CN=LDAPBind,O=Example” | base64
```

The resulting value should be used in the configuration.

The following are considerations when making configuration modifications:

-   If you make a permanent change to the configuration and the secret has a template, the template must also be changed. See [Managing secrets in Kubernetes](managing_secrets_kubernetes.md) for list of secrets with templates.
-   If changes to the configuration helm charts are not committed, the next time you run a helm upgrade, the secret is overwritten with the values that are defined in the templates.

1.  Issue the following command specifying the name of the secret.

    ``` {#codeblock_gzh_cgw_d5b}
    kubectl edit secret secret\_name
    ```

2.  Type the letter `i` to get into insert mode and make modifications.

3.  To save the changes, type the characters:`Esc+ :wq!`.

    To close the file without saving changes, type in the characters `Esc+ :q!`.


**Parent topic:**[Managing secrets in Kubernetes](managing_secrets_kubernetes.md)

