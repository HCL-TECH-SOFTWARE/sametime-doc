# Configuring the sametime.ini file on Kubernetes {#chat_config_sametimeini_kubernetes .task}



Determine the setting format by reviewing the topic “Configuring the sametime.ini file” If enabling community server debug, do not use this procedure. Follow the procedure documented in Enabling Community trace in Kubernetes .

Note: Use caution when modifying the values.yaml file, indentation is important and should be done using spaces only.

1.  Change directories to helm.

2.  Open the values.yaml file for editing.

3.  Locate the setting “sametimeIni: \{\}”..

    1.  Remove the hashtag comment on the example and use it as a guide for indentation on your settings.

    2.  When setting the value, the parameter should end with a : and the value should be defined in double-quotes.

    3.  After adding the desired changes you can comment out the example setting or remove i

4.  After adding desired parameters, save and close the values.yaml.

5.  Complete the steps Applying configuration changes in Kubernetes for the changes to take effect.


**Parent topic:**[Configuring the sametime.ini file](chat_configuring_sametimeini.md)

