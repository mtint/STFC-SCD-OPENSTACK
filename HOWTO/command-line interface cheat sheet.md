**command-line interface cheat sheet**

Overview

November 29, 2020 20:56

This article lists several common commands for your reference.

**Images**

List images you can access:

[user@localhost]$ openstack image list

Delete specified image:

[user@localhost]$ openstack image delete IMAGE

Describe a specific image:

[user@localhost]$ openstack image show IMAGE

Create a new image from an existing volume, which allows you to make copies of an exiting volume-based instance:

[user@localhost]$ openstack image create --volume VOLUME

**Compute**

List instances and check status of instance:

[user@localhost]$ openstack server list

List flavors:

[user@localhost]$ openstack flavor list

Boot an ephemeral instance:

[user@localhost]$ openstack server create --image IMAGE \\

--flavor FLAVOR --key-name KEY INSTANCE\_NAME

Show details of instance:

[user@localhost]$ openstack server show INSTANCE

View console log of instance:

[user@localhost]$ openstack console log show INSTANCE

Generate console URL for instance:

[user@localhost]$ openstack console url show INSTANCE

Set metadata on an instance:

[user@localhost]$ openstack server set --property newmeta='my meta data' INSTANCE

Create and verify details of an instance snapshot:

[user@localhost]$ openstack server image create --name IMAGE --wait INSTANCE

[user@localhost]$ openstack image show IMAGE

**Pause, suspend, stop, resize, rebuild, reboot an instance**

Pause – stores the state of the VM in RAM. A paused instance continues to run in a frozen state. **Pausing instances does not make them unbillable:**

[user@localhost]$ openstack server pause INSTANCE

**Unpause** – returns a paused instance back to an active state:

[user@localhost]$ openstack server unpause INSTANCE

**Suspend** – suspends an instance. Administrative users may wish to suspend an instance if it's infrequently used or to perform a system maintenance. When you suspend an instance, its VM state is stored on disk, all memory is written to disk, and the virtual machine is stopped. **Suspending instances does not make them unbillable:**

[user@localhost]$ openstack server suspend INSTANCE

**Unsuspend** – resumes a suspended server to an active state:

[user@localhost]$ openstack server resume INSTANCE

**Lock** – locks an instance. This prevents any non-administrative users with access to your DreamCompute project from modifying or manipulating the instance itself using either the dashboard ('https://iad2.dreamcompute.com') or the OpenStack command-line client:

[user@localhost]$ openstack server lock INSTANCE

**Unlock** – unlocks an instance in locked state so additional operations can be performed on the server by non-admin users. By default, only owner or administrator can unlock a server:

[user@localhost]$ openstack server unlock INSTANCE

**Stop**:

[user@localhost]$ openstack server stop INSTANCE

**Start**:

[user@localhost]$ openstack server start INSTANCE

**Resize**:

[user@localhost]$ openstack server resize --flavor FLAVOR INSTANCE

[user@localhost]$ openstack server resize --confirm --wait INSTANCE

[user@localhost]$ openstack server resize --revert --wait INSTANCE

**Rebuild**:

[user@localhost]$ openstack server rebuild --wait INSTANCE

**Reboot**:

[user@localhost]$ openstack server reboot --wait --soft INSTANCE

[user@localhost]$ openstack server reboot --hard --wait INSTANCE

**Block Storage**

Used to manage volumes that attach to instances and volume snapshots.

Create a new and empty 6 GB volume:

[user@localhost]$ openstack volume create --size 6 VOLUME

Boot an instance to attach the new volume to:

[user@localhost]$ openstack server create --image IMAGE \\

--flavor FLAVOR --key-name KEY INSTANCE

List volumes and view status of volume:

[user@localhost]$ openstack volume list

Attach volume to an instance after an instance is active and volume is available:

[user@localhost]$ openstack server add volume INSTANCE VOLUME

**Block Storage backups**

Used to create and manage volume backups.

Create a new backup of an existing volume:

[user@localhost]$ openstack volume backup create VOLUME

[user@localhost]$ openstack volume backup create --force VOLUME

[user@localhost]$ openstack volume backup create --force --incremental VOLUME

Delete a backup of a volume:

[user@localhost]$ openstack volume backup delete VOLUME

[user@localhost]$ openstack volume backup delete --force VOLUME

List volume backups:

[user@localhost]$ openstack volume backup list

Display volume backup details:

[user@localhost]$ openstack volume backup show VOLUME