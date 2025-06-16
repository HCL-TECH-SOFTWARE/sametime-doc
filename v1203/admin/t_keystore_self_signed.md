# Creating a keystore for Sametime mux: self-signed certificate {#t_keystore_self_signed .task}

1.  Run the following command to create a private key.

    ``` {#codeblock_zzy_nrq_ywb}
    openssl genrsa -des3 -out server.key 2048
    ```

    The key length can be modified to meet your requirements. The longer the key length, the more secure it is.

    **Note:** The command prompts for a password. Record this password in a secure place for future reference.

2.  Create a certificate signing request, which in this case, is signed by the self-signed CA. Run the command to create the self-signed x509 certificate.

    ``` {#codeblock_o1k_csq_ywb}
    openssl req -new -key server.key -out server.csr
    ```

    When you run the command, you must provide the following:

    -   Country Name: Enter a two-letter country code
    -   State or Province Name: Enter the state or province
    -   Locality name: Enter the city name
    -   Organization Name: Enter the name of your organization or company
    -   Common Name: Enter the fully qualified domain name to be used by clients to connect to Sametime mux. For example, chat.example.com
    -   Email Address: Enter an email address
3.  Run the command to create the self-signed x509 certificate.

    ``` {#codeblock_yzs_3tq_ywb}
    openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
    ```

    In the above command, the days parameter is 365 and can be modified.

4.  Create the keystore.

    ``` {#codeblock_bln_yxq_ywb}
    openssl pkcs12 -export -in server.crt -inkey server.key -name ‘mux’ -out keystore.p12
    ```

    The sample command makes use of the following naming conventions.

    ``` {#codeblock_k3b_lyq_ywb}
    `server.crt`: Signed certificate filename
    `server.key`: Private key filename
    `‘mux’`: Alias name (how it appears in the keystore)
    `keystore.p12`: The resulting keystore file name
    ```


After the keystore is created, do the following:

1.  Move the .KEY, .CRT, and .PEM files to a secure location and remove them from the machine.
2.  Record the keystore password that is used in another step.

**Parent Topic:  **[Creating a keystore for Sametime mux](t_keystore_mux.md)

