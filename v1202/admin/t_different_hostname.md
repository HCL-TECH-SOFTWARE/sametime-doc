# Configuring alternate host name for Web Chat {#t_different_hostname .task}

The default host name for Meetings and Web Chat are the same. However, you can configure Web Chat to use a different host name.

**Parent topic:**[Meetings](meetings_configuring.md)

## Configuring an alternate host name in Kubernetes {#task_jww_2k2_rvb}

To specify a different host name for your Web Chat access, update the values.yaml file. For example, if you want to webchat.company.com as your host name add the following statement in the values.yaml file.

``` {#codeblock_wl4_1l2_rvb}
extraChatHostname: webchat.company.com
```

## Configuring an alternate host name in Docker {#task_jx3_hk2_rvb}

To specify a different host name, edit the custom.env file. For example, if you want to webchat.company.com as your host name add the following statement in the

``` {#codeblock_wpq_ll2_rvb}
REACT_APP_chat\_server\_hostname
```

