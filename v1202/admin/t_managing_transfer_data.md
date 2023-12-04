# Managing file transfer data {#t_managing_transfer_data .task}

As with meeting recordings and reports, files that are shared in the chat are stored in a Docker volume or a Kubernetes persistent volume. By default, you can download these files within *90 days*.

You can modify the limit by updating the following files.

-   Docker
    -   custom.env
-   Kubernetes
    -   helm/values.yaml

        **Note:** The values are case sensitive and must be entered as shown below.


1.  Modify the configuration file. The minimum value is 1.
    1.  For Docker environments, update the **FILES\_EXPIRE\_IN\_DAYS** parameter. For example, **FILES\_EXPIRE\_IN\_DAYS=77** to indicate 77 days.
    2.  For Kubernetes environments, update the **filesExpireInDays** parameter. For example, **filesExpireInDays: 77** to indicate 77 days.
2.  Restart the Sametime server to apply the changes. For more information, refer to [Starting and stopping servers](https://help.hcltechsw.com/sametime/12/admin/starting_and_stopping_servers.html).

**Parent Topic: **[Administering](administering.md)

