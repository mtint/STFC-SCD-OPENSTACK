Resizing LVM volumes to reallocate space between partitions
===========================================================

<https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/>
----------------------------------------------------------------------

Table of Contents

------------------

* * [Aside: Encrypted Volumes](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#aside-encrypted-volumes)
  * [Repartitioning](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#repartitioning)
  * [LVM - Logical Volume Management](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#lvm-logical-volume-management)
  * [Resizing /home](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#resizing-home)
    * * [1\. Ensure root login is enabled (no not via SSH)](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#1-ensure-root-login-is-enabled-no-not-via-ssh)
      * [2\. Log out and log back in as root**This is important**](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#2-log-out-and-log-back-in-as-root-this-is-important)
      * [3\. Identify the home mount volume](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#3-identify-the-home-mount-volume)
      * [4\. Make sure no processes are using /home](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#4-make-sure-no-processes-are-using-home)
      * [5\. Unmount /home](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#5-unmount-home)
      * [6\. Check for file system errors:](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#6-check-for-file-system-errors)
      * [7\. Resize the file system](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#7-resize-the-file-system)
      * [8\. Reduce the Logical Volume](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#8-reduce-the-logical-volume)
      * [9\. Confirm that the disk was successfully resized](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#9-confirm-that-the-disk-was-successfully-resized)
      * [9.a Aside: Troubleshooting](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#9-a-aside-troubleshooting)
      * [10\. Mount the volume](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#10-mount-the-volume)
  * [Extending Volumes](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#extending-volumes)
    * * [1\. Check size available to resize](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#1-check-size-available-to-resize)
      * [2\. Extend the root volume](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#2-extend-the-root-volume)
      * [3\. Grow the root file system](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#3-grow-the-root-file-system)
      * [4\. DONE!!](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#4-done)
  * [Some Additional Confusion?](https://www.techblog.moebius.space/posts/resizing-linux-lvm-volumes/#some-additional-confusion)

I recently installed Debian 9.x for the first time, and the guided installation involves some best practice volume management configuration. I blindly accepted these defaults, and 2 weeks later I had a full root disk, with plenty of space left in home.

The automated install implicitly assumes the function or role the device will play. I can only assume this is the reason why it gave me such a paltry allocation for the root disk size in the first place, compared to the home directory.

Now i’m probably going against some well known best practices of installing software directly to /bin using my sudo superpowers, but this is my laptop - I am the only user, and so it seems ridiculous to allocate most of the space to /home.

This may be a leap, but most of our personal data these days resides somewhere remote to our local systems (the cloud!). So allocating such a high percentage to /home does not make sense. On the contrary, the number of tools used (especially by developers), have grown exponentially (warning: no evidence to back up this claim). So I’m going to make a bold statement and say that the following partitioning scheme works for me:

* / 60%
* /home 20%
* /var 10%
* /tmp 10%

Aside: Encrypted Volumes
------------------------

One thing that I like about the guided debian installation is that they provide an option for encrypting all your volumes via LVM. And this is also done well - All volumes fall under a root volume group which is encrypted on disk.

Repartitioning
--------------

Now if you’ve already partitioned your disks, and now you’ve come to the exact realisation that I have come to - I’m out of root disk space because I allocated 5% to it… We need to find a way to repartition existing volumes using lvm tools.

LVM - Logical Volume Management
-------------------------------

The basic commands for using LVM can be found in this [excellent article](https://www.tecmint.com/extend-and-reduce-lvms-in-linux/)

Resizing /home
--------------

If you are so unlucky to have to repartition home, you will need to do a few preparatory steps:

#### 1\. Ensure root login is enabled (no not via SSH)

```
su
vi /etc/gdm3/daemon.cfg

```

Add the following lines to the file to allow root:

```
[security]
AllowRoot=true

```

While logged in as root, modify the pam config file:

```
vi /etc/pam.d/gdm-password

```

Comment the following line:

```
auth required pam_succeed_if.so user != root quiet_success

```

#### 2\. Log out and log back in as root **This is important**

#### 3\. Identify the home mount volume

```
df -hP  | grep home
lvs

```

#### 4\. Make sure no processes are using /home

```
lsof <device which hosts /home mount>
\# eg. lsof /dev/mapper/debbie--vg-home

```

#### 5\. Unmount /home

```
umount -v <device which mounts /home>
\# eg. umount -v /dev/mapper/debbie--vg-home

```

#### 6\. Check for file system errors:

```
e2fsck -ff <device name>
\# eg. e2fsck -ff /dev/mapper/debbie--vg-home

```

#### 7\. Resize the file system

```
resize2fs <device name> <new size>
\# eg, resize2fs /dev/mapper/debbie--vg-home 3G

\# If this fails, then you can either attempt to force the resize:
resize2fs -f <device name> <new size>

\# Or, you can see if you can get resize2fs to minimise the drive as much as possible
resize2fs -M <device name>

```

#### 8\. Reduce the Logical Volume

```
lvreduce -L -<size you want to reduce the disk by> <device name>

\# Note: if you do not have any space left on / then this operation will fail. You need to free up at least some space ~1MB will do. 

```

#### 9\. Confirm that the disk was successfully resized

```
fdisk <device name> -l
lvs

```

#### 9.a Aside: Troubleshooting

* Note: Try not to use the G size type. Use either the M or K type, so that sizes are more accurate. If you accidentally reduce a logical volume to a lower amount than the physical volume, then fsck will report errors.
* In case this happens, increase the logical volume to a larger amount, then resize again to a more accurate file size using a lower file size type.

```
lvresize -L 4G /dev/mapper/debbie--vg-home 
lvresize -L  3072M /dev/mapper/debbie--vg-home
\# Check the disk has no errors
fsck /dev/mapper/debbie--vg-home
e2fsck -ff /dev/mapper/debbie--vg-home
\# Check the disk size is correct
fdisk /dev/mapper/debbie--vg-home -l

```

#### 10\. Mount the volume

```
\#\# Mount from fstab
mount -a
\#\# Or an explicit mount
mount /dev/mapper/debbie--vg-home /home

```

Extending Volumes
-----------------

Now, to use up all that space we freed up. Time to rescue root!

#### 1\. Check size available to resize

Check the specific size available to extend the volume group (which the root lvm is under). Major assumption is that the root and home lvm’s are both under the same volume group. If they are not, then some additional fancy steps must be performed (like adding the two volume groups to each other etc.) I think this website goes into that: <http://geekswing.com/geek/unix/extending-a-linux-disk-with-lvm-extending-root-partition/> However, if the LVM volumes share the volume group, then things are easy, as you just need to extend the specific LVM of root.

```
vgdisplay
\# Check the section under "Free PE / Size" section for the size available for extension

```

#### 2\. Extend the root volume

```
\# Get the root volume path
lvdisplay | grep "LV Path"

\# Extend the root volume
lvextend -l +<size to extend> <lv path>
\# eg. lvextend -l +2286 /dev/debbie-vg/root

```

#### 3\. Grow the root file system

```
resize2fs  <lv path>
\# eg. resize2fs /dev/debbie-vg/root

```

#### 4\. DONE!!

```
\# verify
fdisk -l
df -hP

```

Some Additional Confusion?
--------------------------

Q: So what is fdisk for?

A: fdisk is a disk partitioning utility. It is used to divide existing filesystems, not to create new ones. So if you are extending a volume which is partitioned, then the partition needs to be deleted and recreated, so that the full volume can be used.

Q: What is parted?

A: parted is another partitioning tool used for volumes \> 2TB, as it uses a different partitioning scheme based on GPT. See these articles:

* <https://unix.stackexchange.com/questions/104238/fdisk-vs-parted>
* <https://www.maketecheasier.com/differences-between-mbr-and-gpt/>