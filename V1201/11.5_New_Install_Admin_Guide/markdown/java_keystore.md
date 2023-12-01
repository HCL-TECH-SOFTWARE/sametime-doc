# How to create a new Java Keystore with a Third Party certificate {#java_keystore .task}

Initially from the Installation and Administration guide in deploying a Sametime Proxy Server 11 there's a section which describes on how to automatically create a new self-signed certificate for SSL without any configuration changes. As you know using a self-signed certificate - it is possible that some web browsers/mobile devices may have problems with this certificate and you will have to create exceptions with the browsers/mobile devices.

The question is how are we going to replace the self-signed certificate with a qualified certificate from a Certificate Authority \(like GeoTrust, GoDaddy, etc\)?

The steps are not so complicated and as a Domino Administrator you have an advantage in following the steps since it is almost the same flow with OpenSSL/Kyrtool.

Reference: https://support.hcltechsw.com/csm?id=kb\_article&sysparm\_article=KB0074599

**Instructions**

Suppose you already have Sametime Community Server and Sametime Proxy Server installed then your default program directory of the Proxy Server is "example: C:\\sametimeproxy" \(described in the instructions document\). Since Sametime version 11, the Proxy Server is now based on Apache Tomcat which reduces hardware requirements and much simplified installation. Compared to Domino, Sametime 11 is using keytool instead of kyrtool file, so we will need the "keytool.exe" which is is located in "C:\\sametimeproxy\\openjdk\\bin".

**Note:** The following examples assume Windows OS.

1.  Open a command prompt and navigate to the folder C:\\sametimeproxy\\openjdk\\bin.
2.  Now we will create a new Certificate or Java Keystore using the "keytool.exe" file, where we will then import the necessary certificates. In our example we will name the keystore as "sametime.keystore", then directly create the keystore under the "C:\\sametimeproxy\\conf" folder or any folder of your choice.

    ```
    keytool -genkey -alias tomcat -keyalg RSA -keystore C:\sametimeproxy\conf\sametime.keystore
    ```

    **Note:**

    -   In here you will be prompted to create a new password for the keystore and re-enter it to confirm the password.
    -   Fill in the basic information about the keystore. In the "First & Last Name", use the FQDN of the Proxy Server "ie: proxy.hcl.com" and complete the other data such as Company, City, etc.
3.  After creating the keystore we will create the Certificate Signing Request \(CSR\). This file is going to be used by the Certificate Authority to create a certificate that will identify your website.

    ``` {#codeblock_s5j_t1l_4qb}
    keytool -certreq -keyalg RSA -alias tomcat -file C:\sametimeproxy\conf\streq.csr -keystore C:\sametimeproxy\conf\sametime.keystore
    ```

    Submit the generated CSR to the Certificate Authority and in return you will receive the certificates.

4.  Once you have the certificates it must be installed to the keystore where the CSR was created. Import the root & intermediate certificates into the keystore, one at a time.

    Make sure you specify the correct alias of "root" and "intermediate" respectively.

    ```
    keytool -import -trustcacerts -alias root -file <PATH>\root.crt -keystore C:\sametimeproxy\conf\sametime.keystore
    keytool -import -trustcacerts -alias intermediate -file <PATH>\intermediate.crt -keystore C:\sametimeproxy\conf\sametime.keystore
    ```

    Now for the Server/Site certificate ensure when importing the cert -- you use the same alias as the private key so it associates them together. The alias here must match the alias of the private key in the first command where we created the Java Keystore - in our case the alias is "tomcat".

    ```
    keytool -import -trustcacerts -alias tomcat -file <PATH>\mydomain.crt -keystore C:\sametimeproxy\conf\sametime.keystore
    ```

5.  The keystore is now complete and can be used for the Sametime Proxy Server. In order to change the default certificate, you need to configure the SSL Connector. Open the C:\\sametimeproxy\\conf\\server.xml file then find the connector that should work for the new keystore and uncomment it if necessary. In the connector configuration, specify the correct file location and keystore password.

    Example:

    ```
    < Connector protocol=”org.apache.coyote.http11.Http11NioProtocol” port=”8443″ maxThreads=”200″ scheme=”https” secure=”true” SSLEnabled=”true” keystoreFile=”conf/sametime.keystore” keystorePass=”<password>” clientAuth=”false” sslProtocol=”TLS”/>
    ```

6.  Restart the Sametime Proxy Server and open chat in your web browser to confirm.

**Parent topic:**[Securing connections](securing_connections.md)

