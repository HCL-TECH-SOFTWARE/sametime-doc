# Configuring content security headers on Windows {#verse_integration_security_windows .task}

By default, a Windows deployment has a Content Security Policy that is separately configured for the Web Client and the Legacy Chat Client.

Both should be updated in order to integrate with a Verse deployment:

1.  Using notepad or another text editor, open both the `chatCommonHeaders.conf` and `legacyChatCommonHeader.conf` files located in the `nginx-win-x64\conf` directory beneath the Sametime Installation folder.

2.  Find the `Content-Security-Policy` header which defines 'self' as the only allowable frame-ancestor:

    ``` {#codeblock_hk3_nnp_dwb}
    Content-Security-Policy "frame-ancestors 'self';  ...
    ```

3.  Update to include the origin of the Verse deployment:

    ``` {#codeblock_hk3_nnp_dwb}
    Content-Security-Policy "frame-ancestors https://*.company_domain.com 'self';  ...
    ```

    **Note:** Leave the rest of the Content-Security-Policy setting unchanged.

4.  Save the file and restart the `ST Web` service to load the new configuration.

**Parent Topic:  **[Integrating with other applications](verse_integration.md)

