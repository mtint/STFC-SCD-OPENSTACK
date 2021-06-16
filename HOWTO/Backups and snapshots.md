Backups and snapshots
=====================

[](https://gitlab.cern.ch/cloud-infrastructure/clouddocs/blob/master/docs/using_openstack/backups.md "Edit this page")

There is no integrated automated backup as part of the cloud. For many configurations, data is stored on reliable data stores such as

* [Database-on-Demand](http://information-technology.web.cern.ch/services/database-on-demand)
* Oracle
* [AFS](http://information-technology.web.cern.ch/services/afs-service)
* [DFS](https://dfsweb.web.cern.ch/dfsweb/)
* [EOS](http://information-technology.web.cern.ch/services/eos-service)

These services can arrange backup and monitoring of the data stores with the virtual machines being stateless clients which can be re-created rapidly using a tool such as Puppet.

In some cases, there is a desire for backup and restore of data stored on a virtual machine. A number of approaches can be used to cover these needs.

Snapshotting also provides the possibility to clone a VM such as for testing or a production upgrade where you clone the current production to a new VM, upgrade and then adjust an Ip alias to point to the new VM.

Locally installed backup client
-------------------------------

The [IT Backup Service](http://cern.ch/backup) provides a facility to perform backups within the virtual machine by installing a client program and providing the list of directories to save.

In particular, if Puppet is used to configure the backup client, this can be automated as described in the [backup user guide](https://information-technology.web.cern.ch/book/cern-backup-and-restore-service-user-guide/getting-started/client-installation/configure-tsm).

Snapshots for rollback & rebuild
--------------------------------

Typical use cases for a rollback and rebuild is a test environment with a reference configuration for the start of the tests. The test can be executed, checked and then the original state recovered.

* Create a snapshot file of the virtual machine into glance for the reference configuration at the start of the test. This snapshot can then be used later for the rebuild reinstallation.
* Use `openstack server rebuild` to roll back to the same state with same IP and hostname. This is much faster than deleting the old server and creating a new one with the same name (of the order of 2-3 minutes)

**Note:** During the time it takes to do the snapshot, the machine can become unresponsive. It is recommended to resync the VM clocks using the NTP daemon or running ntpdate after the snapshot has completed.

```
$ openstack server image create --name my-snapshot --wait my-vm
Finished
$ openstack image show --fit-width my-snapshot

```

Using this snapshot, the VM can be rolled back to the previous state with a server rebuild.

```
$ openstack server rebuild --image my-snapshot my-vm

```

Snapshots for testing and cloning
---------------------------------

In this use case, a VM is being used for a production service and you need to test a new software version. If your VM is under control of a configuration management system such as Puppet, it is recommended to create a new instance from the configuration templates.

Workflows can be used to perform standard operations on a scheduled basis. This is currently an experiment feature of the CERN cloud described in [Workflows](safari-reader://clouddocs.web.cern.ch/workflows/standard_workflows.html).

Alternatively, the procedures below can be executed on an lxplus8 class machine in order to use the `virt-sysprep` tool.

### Snapshot a virtual machine

```
$ openstack server image create --name my-snapshot --wait my-vm

```

### Download the image file

```
$ openstack image save --file /tmp/my-snapshot.qcow2 my-snapshot

```

### Remove context information from the snapshot

Running the sysprep tools on the snapshot removes the custom host information such as the hardware addresses and unique identifiers. This is necessary to avoid conflicts with the currently running VM when a new clone of the VM is created.

Note: If your snapshotted image is based on SLC6, sysprep won't work when run on a CC7 machine. In this case you'll need to prepare the image first:

```
$ qemu-img amend -f qcow2 -o compat=0.10 /tmp/my-snapshot.qcow2

```

For CC7 based snapshots (and SL6 snapshots with amended images), you can clean the image by running a command like:

```
$ LIBGUESTFS_BACKEND=direct virt-sysprep --add /tmp/my-snapshot.qcow2 --delete /etc/krb5.keytab --delete /var/lib/cern-private-cloud-addons/state
[   0.0] Examining the guest ...
[ 195.0] Performing "abrt-data" ...
[ 195.0] Performing "backup-files" ...
[ 223.9] Performing "bash-history" ...
[ 224.0] Performing "blkid-tab" ...
[ 224.3] Performing "crash-data" ...
[ 224.3] Performing "cron-spool" ...
[ 224.4] Performing "dhcp-client-state" ...
[ 224.4] Performing "dhcp-server-state" ...
[ 224.4] Performing "dovecot-data" ...
[ 224.4] Performing "logfiles" ...
[ 226.5] Performing "machine-id" ...
[ 226.5] Performing "mail-spool" ...
[ 226.5] Performing "net-hostname" ...
[ 226.6] Performing "net-hwaddr" ...
[ 226.7] Performing "pacct-log" ...
[ 226.8] Performing "package-manager-cache" ...
[ 227.7] Performing "pam-data" ...
[ 227.7] Performing "passwd-backups" ...
[ 227.7] Performing "puppet-data-log" ...
[ 227.9] Performing "rh-subscription-manager" ...
[ 227.9] Performing "rhn-systemid" ...
[ 227.9] Performing "rpm-db" ...
[ 228.0] Performing "samba-db-log" ...
[ 228.0] Performing "script" ...
[ 228.0] Performing "smolt-uuid" ...
[ 228.1] Performing "ssh-hostkeys" ...
[ 228.1] Performing "ssh-userdir" ...
[ 228.1] Performing "sssd-db-log" ...
[ 228.1] Performing "tmp-files" ...
[ 228.2] Performing "udev-persistent-net" ...
[ 228.3] Performing "utmp" ...
[ 228.3] Performing "yum-uuid" ...
[ 228.3] Performing "customize" ...
[ 228.4] Setting a random seed
[ 228.4] Setting the machine ID in /etc/machine-id
[ 228.4] Deleting: /etc/krb5.keytab
[ 228.4] Deleting: /var/lib/cern-private-cloud-addons/state
[ 230.2] Performing "lvm-uuids" ...

```

### Now upload the cleaned image to Glance so a new VM can be created from it

```
$ openstack image create --file /tmp/my-snapshot.qcow2 --property os=LINUX --disk-format=qcow2 --container-format=bare my-cleaned-snapshot

```

Note: setting the property `os=LINUX` on the image will ensure that the VMs booted from this image are properly registered in Landb and Active directory. For Windows images, please set the property `landb-os=WINDOWS`.

### Create a new server from the snaphot

```
$ openstack server create --key-name lxplus --flavor m2.small --image my-cleaned-snapshot my-new-vm

```

Snapshots to move between projects or clouds
--------------------------------------------

In some scenarios, you need to move a virtual machine between projects. Typical example would be if you have accidentally created a VM in your Personal project and actually need it for production use in a shared project.

Other scenarios would be if you have a working virtual machine in one OpenStack cloud and you needed to move it to another.

The following procedure is available for Linux virtual machines, for the Windows VMs please open a request ticket via SNOW.

The steps are

* Authenticate to the source project
* Shutdown the source virtual machine
* Make a snapshot of the source virtual machine
* Download the snapshot to a file
* Apply the de-contextualization step described in the previous section, limiting the number of operations:

`$ LIBGUESTFS_BACKEND=direct virt-sysprep --add /tmp/my-snapshot.qcow2 --enable udev-persistent-net,net-hwaddr --delete /etc/krb5.keytab --delete /var/lib/cern-private-cloud-addons/state`

* If you want to keep the same hostname, check the snapshot is correct (i.e. it seems a reasonable size) and then delete the source VM. You will need to wait for 15 minutes or so until the DNS entry has expired. Check this with the 'host' command
* Authenticate to the new project you want to create the destination VM in
* Upload the snapshot file to Glance in the new project
* Create a new server from the snapshot

Rename a virtual machine
------------------------

As above, the steps are similar

* Authenticate to the source project
* Shutdown the source virtual machine
* Make a snapshot of the source virtual machine
* Download the snapshot to a file
* Sysprep the snapshot to clean the hostname information
* Upload the new image to Glance
* Create a new server from the snapshot file with the new hostname
* (If all is working OK), delete the old VM