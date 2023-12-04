# Viewing secrets {#secrets_view .task}

The get command can be used to list secrets and view their contents.

1.  To view a list of all secrets, run the following command.

    ``` {#codeblock_w45_vyp_ytb}
    kubectl get secrets
    ```

    If a namepace is beign used, the -n argument must be inclued.

    ``` {#codeblock_t1r_q2w_d5b}
    kubectl get secrets -n namespace\_name
    ```

    where namespace\_name is the name of the namespace.

2.  To view the content of a secret, run the following command.

    ``` {#codeblock_tgp_wyp_ytb}
     kubectl describe secret secret\_name
    ```

    where secret\_name is the name of the secret.


**Parent Topic: **[Managing secrets in Kubernetes](managing_secrets_kubernetes.md)

