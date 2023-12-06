# Changing MongoDB log file size {#control_mongodb .task}

This section provides information on how to control MongoDB log file size.

This seems to be a limitation on MongoDB side , in that there are no parameters or settings to automatically control this.

You can do a couple of things to help keep it under control -

in etc/mongod.conf

add

logRotate: rename

and anytime the mongod service is restarted, it will create a new log file \(and older ones can be deleted or archived\)

You can also manually rotate log files in the mongo shell by giving the command

db.adminCommand\( \{ logRotate : 1 \} \)

There are more details here -

[https://docs.mongodb.com/v3.6/tutorial/rotate-log-files/%22%20rel=%22nofollow%22%20style=%22box-sizing:%20border-box;%20text-decoration-line:%20none;%20padding:%200px;%20cursor:%20pointer;%20color:%20rgb\(31,%20132,%20118\);%20background:%20transparent;%20https://docs.mongodb.com/v3.6/tutorial/rotate-log-files/](https://docs.mongodb.com/v3.6/tutorial/rotate-log-files/%22%20rel=%22nofollow%22%20style=%22box-sizing:%20border-box;%20text-decoration-line:%20none;%20padding:%200px;%20cursor:%20pointer;%20color:%20rgb(31,%20132,%20118);%20background:%20transparent;%20https://docs.mongodb.com/v3.6/tutorial/rotate-log-files/)

**Parent Topic:  **[MongoDB](administering_mongodb.md)

