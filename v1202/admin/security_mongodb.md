# Enabling security in the MongoDB {#security_mongodb .task}

To enable MongoDB securing, edit the mongod.conf file **authorization: enabled** setting.

More information on this can be found in MongoDB documentation found in the MongoDB Documention [Configuration File Options](https://docs.mongodb.com/manual/reference/configuration-options/#security.authorization) topic.

```
security: 
              authorization: enabled
```

After security is enabled, you must enter the mongo shell as an authenticated user. More information regarding this requirement see the MongoDB Documentation [Authentication](https://docs.mongodb.com/manual/core/authentication/) topic.

Enable security after all installation steps for Sametime Community, Sametime Proxy, and Sametime Meetings are successful. If necessary, you can disable the security to complete the installation and configuration steps, and after installation and configuration of the Sametime servers are verified, enable security.

**Parent topic:**[Securing](securing.md)

