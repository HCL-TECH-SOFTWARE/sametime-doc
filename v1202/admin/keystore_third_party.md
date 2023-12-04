# Creating a keystore for Sametime mux: third-party CA {#keystore_third_party .task}

Two scenarios are described in this topic.

Scenario 1: A single certificate and private key are issued from the CA.
:   1.  Run the command to create the keystore.

    ``` {#codeblock_ych_tnq_ywb}
    openssl pkcs12 -export -in server.crt -inkey server.key -name ‘mux’ -out keystore.p12
    ```

    The sample command makes use of the following naming conventions.

    ``` {#codeblock_yqh_vpq_ywb}
    `server.crt`: Signed certificate filename
    `server.key`: Private key filename
    `‘mux’`: Alias name (how it appears in the keystore)
    `keystore.p12`: The resulting keystore file name
    ```


Scenario 2: A chained certificate which consists of multiple certificate files are provided, along with the private key.
:   1.  Use `cat` to combine the certificates into a single file \(cert-chain.txt\), which is used in the command. These certificates must be combined in this order: server, intermediate, CA root.

    ``` {#codeblock_zst_fqq_ywb}
    cat signed.crt intermediate.crt root_CA.crt > cert-chain.txt 
    ```

    In the above example, the server’s signed cert is `signed.crt`, the intermediate certificate is `intermediate.crt`, and the root CA certificate is `root_CA.crt`.

2.  Run the command to create the keystore.

    ``` {#codeblock_bdc_sqq_ywb}
    openssl pkcs12 -export -in cert-chain.txt -inkey server.key -name ‘mux’ -out keystore.p12
    ```

    The sample command makes use of the following naming conventions.

    ``` {#codeblock_cdc_sqq_ywb}
    cert-chain.txt: File created from step 1 containing chained cert
    server.key: Private key filename
    ‘mux’: Alias name 
    `keystore.p12`: The resulting keystore file name
    ```


After the keystore is created, do the following:

1.  Move the .KEY, .CRT, and .PEM files to a secure location and remove them from the machine.
2.  Record the keystore password that is used in another step.

**Parent Topic: **[Creating a keystore for Sametime mux](t_keystore_mux.md)

