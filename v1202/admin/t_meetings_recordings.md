# Creating the persistent volume

This section provides information to create the persistent volume.

In previous releases of Sametime, only the recordings pod require access to the persistent volume. In Sametime 12, workloads moved from virtual or physical machines into Kubernetes pods. There is more than one type of pod that requires access to storage in Sametime 12. Sametime requires an access mode called read write many or RWX which allows more than one node to access the volume at a time.

**Recordings**

Meeting recordings are stored as MP4 files in a temp directory on the meeting recorder nodes during the meeting. After the meeting, the recordings are moved to a persistent volume. Allocate a volume accessible to the Kubernetes cluster that is substantial enough to handle the expected number of meeting recordings, assuming a rate of about 100M per 1 hour of meeting.

By default, recordings persist for three days, so keep that in consideration as well when sizing the volume.

**Backgrounds**

When users upload personal backgrounds to their meetings for use as a video background, these images are stored in the persistent volume.

**Files**

When users upload files to chats in the chat clients or meeting, the files are stored in the persistent volume.

**Branding**

When enabling custom meeting branding, the images used are stored in the persistent volume.

**Reports**

Meeting reports are saved in the persistent volume.

For additional information, see the [Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes) topic in the Kubernetes documentation.

**Parent Topic:  **[Installing Sametime in a Kubernetes environment](installation_sametime_kubernetes.md)

