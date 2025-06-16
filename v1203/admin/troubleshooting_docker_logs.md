# Viewing and saving log files {#troubleshooting_docker_logs .task}

Use the docker compose logs command to view errors and events. You can view all containers or a specific container by specifying the container name.

To view logs for all components, issue the following command:

``` {#codeblock_mdx_k2b_kxb}
docker compose logs
```

To view individual components, add the component name to the command. For example to view community logs:

``` {#codeblock_ahk_n2b_kxb}
docker compose logs community
```

To save logs to a file, use the `>` character followed by the path and file name for the saved file.

``` {#codeblock_ixr_q2b_kxb}
docker compose logs > /tmp/all_logs.txt
```

**Parent topic:   **[Troubleshooting Sametime on Docker](t_troubleshooting_sametime_docker.md)

