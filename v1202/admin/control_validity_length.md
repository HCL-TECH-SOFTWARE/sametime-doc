# Managing user sign-on {#control_validity_length .task}

You can control how long your Sametime meeting credentials are maintained to reduce the number of times you have to sign in.

-   **[Managing user sign-on on Docker or Podman](t_manage_user_login_docker.md)**  
A token is maintained by the Sametime server to control how often you sign in. The default value is 30 days. You can modify this value or turn off the feature by including the `JWT_REFRESH_DURATION_DAYS` environment variable in the YAML file. You can specify any number of whole days to retain login credentials. To disable this feature, set the value to 0.
-   **[Managing user sign-on on Kubernetes](t_manage_user_login_k8s.md)**  
A token is maintained by the Sametime server to control how often you sign in. The default value is 30 days. You can modify this value or turn off the feature by adding the `JWT_REFRESH_DURATION_DAYS` environment variable. You can specify any number of whole days to retain login credentials. To disable this feature, set the value to 0.

**Parent Topic: **[Managing Sametime Meetings](sametime_meeting_administering.md)

