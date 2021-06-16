Storage Gymnastics: Migrating Openstack Volumes (The Unconventional Way)
========================================================================

<https://www.techblog.moebius.space/posts/migrating-openstack-volumes-the-unconventional-way/>

-----------------------------------------------------------------------------------------------

Table of Contents
-----------------

* * [0\. Background](https://www.techblog.moebius.space/posts/migrating-openstack-volumes-the-unconventional-way/#0-background)
  * [1\. Preparing The Jump Server - Setup a Temporary NFS Server](https://www.techblog.moebius.space/posts/migrating-openstack-volumes-the-unconventional-way/#1-preparing-the-jump-server-setup-a-temporary-nfs-server)
  * [2\. Client Steps (Convert Original Disk and Transfer):](https://www.techblog.moebius.space/posts/migrating-openstack-volumes-the-unconventional-way/#2-client-steps-convert-original-disk-and-transfer)

0\. Background
--------------

As part of my day job, I help to manage a large Openstack cluster with a large number of virtual instances running on physical infrastructure. Things often go wrong, and sometimes you have to get creative to solve them.

Today, someone reported that a particular instance had failed catastrophically (due to a layer 8 malfunction), and could not be recovered. We decided it would be easier to rebuild a new instance rather than try and fix the instance (it was well and truly borked). But it would be good if we could at least recover some data from the block device attached to the old volume (non-root).

Now there is a [sane way](https://docs.openstack.org/cinder/latest/admin/blockstorage-volume-migration.html) to migrate Openstack volumes between instances. However, we are insane, so we could not do this. One of the reasons for our insanity is the fact that we do not use Cinder to manage volumes. Instead we manage our own local volumes (lvm).

We also use two different methods to manage block devices depending on the physical host. Some hosts possess local magnetic disk storage, so these are configured to use local lvm volumes (raw format). Other hosts do not have these local disks, so the volumes are stored in qcow2 format on a shared NFS volume (NetApp).

Luckily for us, the original instance was an LVM raw image, and the new instance we created was a qcow2 image hosted on NFS. So essentially we had to:

1. Convert the original block device from raw format into qcow2
2. Transfer the qcow2 image onto the NFS share
3. Shutoff the new instace
4. On the NFS share replace the existing block device of the new instance, with the qcow2 image
5. Start the instance, and hope that the old block device is detected within the instance, so that it can be mounted

Unluckily for us, the NFS share could not be mounted on the physical server which hosts the original instance (due to it not being connected to the storage VLAN - and any networking changes could take a while to go through the approval processes). This means we could not convert the disk and place it directly onto the destination (NFS Share). And there is not enough space on the local drives (root or otherwise) to temporarily store the converted file. We had to find a method to convert the file onto another server without it touching the local system disk, and onto a server which *could* mount the NFS share (final destination).

So we performed these additional steps:

1. Identify a server (let’s call it - jump server) which could connect to the NFS share
2. Set up an lvm volume and filesystem on the jump server to host an NFS mount location
3. Setup a local NFS server on the jump server on this new filesystem, and share a directory
4. Mount the shared directory from the jump server onto the physical which hosts the original instance (communication between physical servers is allowed since this is connected through a separate “data” VLAN)
5. Convert the disk and specify the destination as the shared NFS mount from the jump server.
6. On the jump server, copy the image from the local NFS mount to the final destination NFS share.

1\. Preparing The Jump Server - Setup a Temporary NFS Server
------------------------------------------------------------

The jump server we decided to use is one that is a physical server used to host nova instances. Nova creates new volumes under the vg\_nova0 volume group, as shown below (in this case, the volume group is created in the /dev/sda physical volume). There is a lot of space allocated to this device, and we need to see if there is enough space there to host our temporary filesystem to host the NFS mount.

```
\# Check block devices - Nova instance volumes can be found under the vg\_nova0 volume group
[admin@jump-server ~]$ lsblk
NAME                                                             MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
NAME                                                             MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
sda                                                                8:0    0  32.8T  0 disk
└─sda1                                                             8:1    0  32.8T  0 part
  ├─vg_nova0-c3884a08--34ad--4d5a--8cb5--c6612b6049e0_disk       253:2    0    60G  0 lvm
  │ └─vg_nova0-c3884a08--34ad--4d5a--8cb5--c6612b6049e0_disk1    253:4    0    60G  0 part
  ├─vg_nova0-c3884a08--34ad--4d5a--8cb5--c6612b6049e0_disk.swap  253:3    0     1G  0 lvm
  ├─vg_nova0-d82f49e6--27e8--4fcb--9579--d080331dff7a_disk       253:5    0    60G  0 lvm
  ├─vg_nova0-d82f49e6--27e8--4fcb--9579--d080331dff7a_disk.local 253:6    0   9.7T  0 lvm
  ├─vg_nova0-d82f49e6--27e8--4fcb--9579--d080331dff7a_disk.swap  253:7    0     1G  0 lvm
  ├─vg_nova0-74070dd7--001d--4fa9--9f8d--4936b83092a1_disk       253:8    0    20G  0 lvm
  ├─vg_nova0-a52e1f05--0c3e--415f--b221--5b63487696ba_disk       253:9    0    30G  0 lvm
  ├─vg_nova0-74070dd7--001d--4fa9--9f8d--4936b83092a1_disk.local 253:10   0     5T  0 lvm
  └─vg_nova0-a52e1f05--0c3e--415f--b221--5b63487696ba_disk.local 253:14   0     5T  0 lvm
sdb                                                                8:16   0 111.8G  0 disk
├─sdb1                                                             8:17   0   500M  0 part
│ └─md0                                                            9:0    0   500M  0 raid1 /boot
├─sdb2                                                             8:18   0     8G  0 part
└─sdb3                                                             8:19   0 103.3G  0 part
  └─md1                                                            9:1    0 103.2G  0 raid1
    ├─vg01-root                                                  253:0    0    50G  0 lvm   /
    └─vg01-var                                                   253:1    0    40G  0 lvm   /var
sdc                                                                8:32   0 111.8G  0 disk
├─sdc1                                                             8:33   0   500M  0 part
│ └─md0                                                            9:0    0   500M  0 raid1 /boot
├─sdc2                                                             8:34   0     8G  0 part
└─sdc3                                                             8:35   0 103.3G  0 part
  └─md1                                                            9:1    0 103.2G  0 raid1
    ├─vg01-root                                                  253:0    0    50G  0 lvm   /
    └─vg01-var                                                   253:1    0    40G  0 lvm   /var

```

```
\# Check disk space remaining in volume groups:
[admin@jump-server ~]$ sudo vgdisplay
  --- Volume group ---
  VG Name               vg_nova0
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  4
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                3
  Open LV               3
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               32.74 TiB
  PE Size               4.00 MiB
  Total PE              8583067
  Alloc PE / Size       3948032 / 15.06 TiB
  Free  PE / Size       4635035 / 17.68 TiB
  VG UUID               l2vDy7-n4OY-08Sc-GkOm-lqFV-SraR-6cZC0L

  --- Volume group ---
  VG Name               vg01
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               103.23 GiB
  PE Size               4.00 MiB
  Total PE              26428
  Alloc PE / Size       23040 / 90.00 GiB
  Free  PE / Size       3388 / 13.23 GiB
  VG UUID               Kg13xA-DazL-DQAT-0RGa-DVy4-9JWB-iNlKic

```

From this, we can see that the vg\_nova0 volume group has 17.68 TB of unallocated free space. We can use some of this space to setup a temporary filesystem to host an NFS volume.

Now we can create an LVM volume within the vg\_nova0 volume group, to host a filesystem which can serve an NFS volume to the client (physical server hosting original instance)

```
\# Create an LVM volume in the nova volume group with a size of 5TB:
[admin@jump-server ~]$ sudo lvcreate -L 5T -n vg_nova0_new-instance-tmp vg_nova0
  Logical volume "vg\_nova0\_new-instance-tmp" created.

\# Check newly created volume, and allocated size
[admin@jump-server ~]$ lsblk
NAME                                                             MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
sda                                                                8:0    0  32.8T  0 disk
└─sda1                                                             8:1    0  32.8T  0 part
...
  ├─vg_nova0_new-instance-tmp                                    253:11   0     5T  0 lvm
...

\# Create a new filesystem on the new lvm volume
[admin@jump-server ~]$ sudo mkfs -t ext3 /dev/vg_nova0/vg_nova0_new-instance-tmp
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
167772160 inodes, 1342177280 blocks
67108864 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=4294967296
40960 block groups
32768 blocks per group, 32768 fragments per group
4096 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
        4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
        102400000, 214990848, 512000000, 550731776, 644972544

Allocating group tables: done
Writing inode tables: done
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done

\# Create a new directory on the physical to use as an NFS mount
[admin@jump-server ~]$ sudo mkdir /migration/

\# Mount the new volume to the filesystem location
[admin@jump-server ~]$ sudo mount /dev/vg_nova0/vg_nova0_new-instance-tmp /migration
[admin@jump-server ~]$ df -hP
Filesystem                                        Size  Used Avail Use% Mounted on
...
/dev/mapper/vg_nova0-vg_nova0_new--instance--tmp  5.0T   61M  4.8T   1% /migration

\# Start the NFS server
[admin@jump-server ~]$ sudo service nfs start
Redirecting to /bin/systemctl start  nfs.service

\# Check NFS server is running
[admin@jump-server ~]$ sudo service nfs status
Redirecting to /bin/systemctl status  nfs.service
● nfs-server.service - NFS server and services
   Loaded: loaded (/usr/lib/systemd/system/nfs-server.service; disabled; vendor preset: disabled)
   Active: active (exited) since Tue 2018-01-16 12:33:27 AEDT; 46s ago
  Process: 32767 ExecStart=/usr/sbin/rpc.nfsd $RPCNFSDARGS (code=exited, status=0/SUCCESS)
  Process: 32765 ExecStartPre=/usr/sbin/exportfs -r (code=exited, status=0/SUCCESS)
 Main PID: 32767 (code=exited, status=0/SUCCESS)
   CGroup: /system.slice/nfs-server.service

Jan 16 12:33:27  jump-server.myorg.com systemd[1]: Starting NFS server and services...
Jan 16 12:33:27  jump-server.myorg.com systemd[1]: Started NFS server and services.

\# Export directory as NFS volume to server hosting original instance
[admin@jump-server ~]$ sudo exportfs original-server:/migration/

\# Check NFS mount points exposed/exported to other servers
[admin@jump-server ~]$ sudo exportfs
/migration     original-server.myorg.com

```

2\. Client Steps (Convert Original Disk and Transfer):
------------------------------------------------------

Now that we have exposed an NFS volume on the jump server to the physical server hosting the original instance, we can convert the raw image directly onto the jump server.

```
\# Check that we can see the NFS mount exported by the jump server
[admin@original-server ~]$ sudo showmount -e jump-server
Export list for jump-server:
/migration original-server.myorg.com

\# Mount the shared NFS volume from jump-server to a local file location. 
\# For ease, lets call this location /migration as well
[admin@original-server ~]$ sudo mount -vvvv -t nfs -o vers=3,rw jump-server.myorg.com:/migration /migration/
mount.nfs: timeout set for Tue Jan 16 13:58:36 2018
mount.nfs: trying text-based options 'vers=3,addr=10.1.51.214'
mount.nfs: prog 100003, trying vers=3, prot=6
mount.nfs: trying 10.1.51.214 prog 100003 vers 3 prot TCP port 2049
mount.nfs: prog 100005, trying vers=3, prot=17
mount.nfs: trying 10.1.51.214 prog 100005 vers 3 prot UDP port 20048

\# Check that the remote volume has been mounted
[admin@original-server ~]$ df -hP
Filesystem                                    Size  Used Avail Use% Mounted on
...
jump-server.myorg.com:/migration  5.0T   61M  4.8T   1% /migration

\# Hold on to the seat of your pants - you might need to be root for this
[admin@original-server migration]$ sudo su

\# Convert lvm disk image from raw to qcow2 and output directly onto NFS volume
[root@original-server migration]nohup qemu-img convert -p -f raw -O qcow2 /dev/vg_nova0/3f8df945-7cbd-46e0-8ad1-d51013cf706b_disk.local /migration/new-instance &

\# Stop instance in Openstack
nova shutoff new-instance

\# Backup existing ephemeral drive (qcow2 image of newly created instance)
sudo cp /var/lib/nova/instances/<instance id>/disk.local /var/lib/nova/instances/<instance id>/disk.local-bkp

\# Copy the converted qcow2 image onto the NFS volume hosting nova instances
sudo cp /migration/new-instance /var/lib/nova/instances/<instance id>/disk.local

\# Start the nova instance, and pray that the volume is picked up
nova start new-instance

\# If you can see the device, then try and mount it:
sudo mount /dev/vdb1 /mnt

```

That’s it! If you are able to do the final mount, then you’ve succeeded!

If not, it’s time to pour yourself a drink and succumb to the inevitable fact that we are fallible mortal beings.