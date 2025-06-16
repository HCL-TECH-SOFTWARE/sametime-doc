# Encryption usage in Sametime {#overview_encryption .concept}

HCL Sametime uses several types of encryption to protect data.

The following table lists the types of encryption for various types of data and the length of each type of encryption key.

|Algorithm|Mode|Related key length|Function|
|---------|----|------------------|--------|
|HMAC-SHA256|Integrity check|256-bit \(through server shared secret\)|Hash-based message authentication code \(HMAC\) that protects the integrity of JSON Web Tokens \(JWT\).|
|SHA256|Signature|256-bit|Generates an almost-unique 256-bit \(32-byte\) signature for a text or data file.|
|RC2|Confidentiality \(all applicable user data\)|Various key length \(40-bit or 128-bit in different circumstances; generated using Diffie-Helman\)|Encrypts field data or messages between client to client and client to server. This is the default encryption used in the Sametime Connect and Embedded clients.|
|TLS 1.2|In-transit data|128/256-bit depending on cipher chosen|Provides security including privacy, by encrypting data sent over the internet through the use of certificates between a client and a server.|
|DTLS/SRTP|In-transit data|256-bit|Prevents hacks or man-in-the-middle attacks against voice communications between a client and a server.|
|OLM|In-transit data|256-bit|Provides end-to-end encryption between client-to-client media.|
|bcrypt|Stored data|10 salt rounds|Hashes passwords stored in the database.|

**Parent Topic:  **[Securing](securing.md)

