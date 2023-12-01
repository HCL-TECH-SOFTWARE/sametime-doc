# Configuration settings related to SAML authentication {#configuring_sso_saml .task}

Use these optional configuration settings with SAML authentication.

If the Sametime® server is running when you set or modify a sametime.ini file setting, the setting takes effect after you restart the Sametime server.

**FIPS 140-2 compliance**

The default Sametime configuration is not FIPS 140-2 compliant. If your Sametime deployment requires FIPS 140-2 compliance, set "FIPS 140-2 compliance" to true in the TLS configuration, under the "Server application connections" column. This affects both TLS and SAML. For more information about applying settings in a TLS configuration, see the topic [Implementing the Global TLS Scope](implement_tls_configuration.md).

**Security level**

The default configuration imposes no restrictions on the use of cryptographic algorithms and certificate strength. If strong cryptography is required, change the **Minimum security level** setting in the TLS configuration, in the **Server application connections** column. This affects both TLS and SAML. For more information about applying settings in a TLS configuration, see [Implementing the Global TLS Scope](implement_tls_configuration.md).

Alternatively, you can set a specific value for SAML, using the following SAML settings in the `[Config]` section of sametime.ini file:

```
STSAML_SECURITY_LEVEL=numeric value between 0 and 4, inclusive 
```

A value of 0 implies no restriction on the cryptographic algorithms or certificate strength. The higher the value, the stronger the security level enforcement. Any security strength higher than 0 causes SAML validation to fail in case the SAML signature validation involves weak cryptography that does not comply with the minimum security level. For a list of available security levels, see the topic Implementing the Global TLS Scope.

**Trusted audiences**

The SAML identity provider \(IdP\) may optionally address the assertion to a limited set of audiences. This information is included in the assertion element, according to the SAML standard, and typically contains one or more URLs that identify the trusted audiences. By default, Sametime ignores this information, and validates the assertion whether or not the Sametime Community Server is a member of the specified audiences. If the trusted audiences setting is present in a configuration, and the assertion contains a trusted audience condition, the Community Server matches the assertion audience condition against the trusted audiences setting, and validation fails if there is no match. The trusted audiences are set in the \[Config\] section of the sametime.ini file:

```
STSAML_TRUSTED_AUDIENCES=trusted-audiences 
```

The value of this setting is a comma-separated list of one or more host names. Each audience in the assertion condition is matched against each trusted audience in the configuration. At least one match is needed for passing the condition. Audience matching is performed by comparing the host portion of the audience URL to the host name in the configuration. If the strings are equal \(ignoring letter case\) there is a match. It is possible to set a trusted-audience string with wild card domain components, using the asterisk character \("\*"\) to represent a wild card domain component. For example, this setting uses the asterisk: 

``` {#codeblock_dps_5jj_g5b}
STSAML_TRUSTED_AUDIENCES=*.example.com 
```

And the following audience condition in the SAML assertion:

``` {#codeblock_yzj_bkj_g5b}
<saml:Audience>https://sametime.example.com/saml/<saml:Audience> 
```

Given this configuration and audience condition, matching passes, because "sametime.example.com" matches "\*.example.com". In another example, "sametime.example.com" would not match "\*.com" because the number of domain components is different - sametime.example.com contains 3 components, while \*.com contains only 2.

**Response signature validation**

The SAML authentication token contains a SAML response element, which in turn contains a child assertion element. According to the SAML standard, either element can be signed. The default Sametime configuration does not require a valid response signature if the underlying assertion has a valid signature. You can change the Sametime Community Server to require a valid response signature, regardless of the underlying assertion signature, by setting this flag in the \[Config\] section of the sametime.ini file:

`STSAML_REQUIRE_SIGNED_RESPONSE=1`

**Parent topic:**[Setting up SSO using SAML](enabling_sso_saml.md)

