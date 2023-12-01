# Installing a TURN Server {#turnserver_centos .task}

You can install and configure a TURN server to use with Sametime Meetings.

The following procedures uses Coturn and CentOS 7 to implement a TURN server.

1.  Install the CentOS prerequisites.

    ```
    sudo yum install -y make gcc cc gcc-c++ wget openssl-devel libevent libevent-devel
    
    ```

2.  Download the Coturn source package that can be compiled from the [Downloads](https://github.com/coturn/coturn/wiki/Downloads) repository. Ensure it is the latest version.

    The following example is downloading v4.5.2.

    ```
    mkdir /root/turn
    cd /root/turn
    wget https://coturn.net/turnserver/v4.5.2/turnserver-4.5.2.tar.gz
    
    ```

3.  Compile and install.

    ```
    ./configure --prefix=/usr/local/turnserver # Specify the installation directory
    make
    sudo make install
    
    ```

4.  Set the environment variables.

    ```
    vim ~/.bashrc
    
    ```

    Add the following statements.

    ```
    export turnserver_home=/usr/local/turnserver
    export PATH=$PATH:$turnserver_home/bin
    
    ```

5.  Configure the TURN server.

    Create the turnserver.conf file.

    ```
    vim /etc/turnserver.conf
    
    ```

    Add the following content to define the Coturn server. Replace the option values with the appropriate values for your environment.

    ```
    
    # Listener IP address of relay server. Multiple listeners can be specified.
    # If no IP(s) specified in the config file or in the command line options,
    # then all IPv4 and IPv6 system IPs will be used for listening.
    listening-ip=0.0.0.0
    
    # External IP-Address of the TURN server
    external-ip=IP_ADDRESS
    
    # TURN listener port for UDP and TCP (Default: 3478).
    listening-port=3478
    
    # 443 for TURN over TLS, which can bypass firewalls
    tls-listening-port=443
    
    # host domain name.
    realm=mycompany.org
    
    # Path to the SSL certificate and private key.
    # Certificate file.
    cert=/usr/local/etc/turn_server_cert.pem
    
    # Private key file.
    pkey=/usr/local/etc/turn_server_pkey.pem
    
    # Lower and upper bounds of the UDP relay endpoints:
    # Further ports that are open for communication
    min-port=10000
    max-port=20000
    
    # This allows TURN credentials to be accounted for a specific user id.
    # If you don't have a suitable id, the timestamp alone can be used.
    # This option is just turning on secret-based authentication.
    # The actual value of the secret is defined by option static-auth-secret,
    use-auth-secret
    
    static-auth-secret=<YOUR_SECRET>
    
    # Option to set the log file name.
    # By default, the turnserver tries to open a log file in
    # /var/log, /var/tmp, /tmp and current directories directories
    log-file=/var/log/turnserver.log
    
    # Enable verbose logging
    verbose
    
    # Do not allow an TLS/DTLS version of protocol
    no-tlsv1
    no-tlsv1_1
    no-tlsv1_2
    
    ```

    You can make additional customizations to the file. For additional information, see the [turnserver.conf](https://github.com/coturn/coturn/blob/master/examples/etc/turnserver.conf) file. Within the file, configuration options are described as comments.

6.  Start the service.

    ```
    turnserver -v -r extranet-ip:port -a -o -c /etc/turnserver.conf
    
    ```


**Parent topic:**[Setting up a TURN server](turnserver_intro.md)

