# Enabling Community trace in Docker {#troubleshooting_debug_trace_docker .task}

The Community and STProxy traces can be used to troubleshoot problems with the Sametime server and Sametime Meetings. The traces capture the flow between the Sametime server and the Meetings server.

To enable the trace modify the docker-compose.yml file. In the `community:` section, locate the `env_file:` statement.

``` {#codeblock_ikx_xhf_lvb}

community: 
   image: hclcr.io/st/chat-server:${BUILD_LEVEL} 
   restart: ${RESTART_POLICY}   
   env_file: custom.env 
   environment:
```

Add, the `debug.env` parameter to the statement as shown in the following example.

``` {#codeblock_s3j_c3f_lvb}

community: 
    image: hclcr.io/st/chat-server:${BUILD_LEVEL} 
    restart: ${RESTART_POLICY} 
    env_file: - custom.env - debug.env
    environment:
```

**Parent topic:**[Troubleshooting Sametime on Docker](t_troubleshooting_sametime_docker.md)

