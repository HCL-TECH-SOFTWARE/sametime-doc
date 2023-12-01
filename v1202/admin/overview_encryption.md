# Encryption usage in Sametime {#overview_encryption .concept}

HCL® Sametime® uses several types of encryption to protect data.

The following table lists the types of encryption for various types of data and the length of each type of encryption key.

|Algorithm|Mode|Related key length|Function|
|---------|----|------------------|--------|
|HMAC-SHA256|Signature|256-bit \(via server shared secret\)|JWT|
|SHA256|Integrity check|256-bit|Conversation integrity|
|RC2|Confidentiality \(user data\)|Various key length \(40-bit/128-bit in different circumstances\) \(generated via Diffie-Helman\)|Message encryption|
|TLS 1.2|In transit data|128/256-bit depending on cipher chosen|HTTPS c2s traffic|
|DTLS/SRTP|In transit data|256-bit|Media c2s traffic|
|OLM|In transit data|256-bit|E2EE c2c media|
|bcrypt|Stored data|10 salt rounds|Meeting password|

**Parent topic:**[HCL Sametime Administration Guide 12.0.1](administrator_doc.md)

