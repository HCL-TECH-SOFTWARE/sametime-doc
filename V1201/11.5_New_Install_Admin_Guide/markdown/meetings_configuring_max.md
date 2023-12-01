# Configuring the maximum number of meeting participants {#meetings_configuring_max .task}

Sametime currently supports a maximum of 100 users in a meeting regardless of the selected meeting mode. To reach a wider audience, you can start a live stream and share the link to all intended participants.

By default, you can host a meeting with up to 100 participants. You can lower the maximum capacity to any value below 100 as needed. Users who attempt to join a meeting that has reached maximum capacity encounter a message indicating that the meeting room is full.

**Note:** The greater the number of concurrent users accessing the server, the greater the resources consumed, particularly CPU resources. Other factors, such as meeting recordings, can influence the total capacity. Refrain from changing this setting without proper sizing information from HCL. For sizing-related questions, [contact HCL](https://voltsandbox.hcltechsw.com/volt-apps/anon/org/app/7fc42e3c-19f4-48df-87fc-09d0ac7c3296/launch/index.html?form=F_Form1).

**Procedure for Kubernetes**

1.  Place the helm/values.yaml in edit mode.

    ```
    vi helm/values.yaml 
    ```

2.  Edit the following line:

    ```
    MaxOccupants= <new value representing the number of total users in a meeting> 
    ```

3.  Save the file.
4.  Restart the Sametime Meeting Server using the instructions in the topic [Starting and stopping Meeting servers](starting_and_stopping_meeting_servers.md).

**Procedure for Docker:**

1.  Place the docker-compose.yml file in edit mode.
2.  Under the prosody section, modify the value of MAX\_OCCUPANTS:

    ```
    MAX_OCCUPANTS=<new value> 
    ```

3.  Save the docker-compose.xml file.
4.  Restart the Sametime Meeting Server using the instructions in the topic [Starting and stopping Meeting servers](starting_and_stopping_meeting_servers.md).

**Parent topic:**[Meetings](meetings_configuring.md)

