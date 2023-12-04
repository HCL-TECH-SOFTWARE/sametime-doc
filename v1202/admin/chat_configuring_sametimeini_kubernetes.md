# Configuring the sametime.ini file on Kubernetes {#chat_config_sametimeini_kubernetes .task}

Determine the setting format by reviewing the [Configuring the sametime.ini file](chat_configuring_sametimeini.md) topic. If you are enabling the community server debug, do not use the following procedure, see the [Enabling Community debug in Kubernetes](t_enabling_community_debug.md) topic for details.

**Note:** When modifying the values.yaml file indentation is important and should be done using spaces only.

1.  Change directories to the helm directory.

2.  Open the values.yaml file for editing.

3.  Locate the `sametimeIni: {}` setting in the file.

    1.  Remove the double brackets \(\{\}\).

    2.  Remove the comment tag \(\#\) and use the line as a guide for indentation on your settings.

    3.  When setting the value, end the parameter with a colon \(:\) and the value in double-quotes \("value"\).

    4.  After adding your changes, confirm that the indication is correct. There should be four spaces before the parameter.

4.  When finished, save and close the values.yaml file.

5.  Complete the steps Applying configuration changes in Kubernetes [Applying configuration changes in Kubernetes or Openshift](apply_configchanges_kubernetes.md) for the changes to take effect.


**Parent Topic: **[Configuring the sametime.ini file](chat_configuring_sametimeini.md)

