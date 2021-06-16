**Swap Space** ( swap file system) in Linux is used when the amount of RAM (Physical Memory) is Full. If system needs more memory resources and the RAM (Physical Memory) full, inactive pages in memory are moved to Swap Space.

[![How swap file system works](https://arkit.co.in/wp-content/uploads/2016/07/How-swap-file-system-works-300x107.png)](https://arkit.co.in/wp-content/uploads/2016/07/How-swap-file-system-works.png)

Picture 1\. How swap file system works best example

Swap space is a portion of a hard disk drive that is used for virtual memory. Swap space is usually a dedicated partition that is created during the installation of the OS. Such a partition is also referred to as a swap partition.
 Swap Space can also be a Special File will be used as swap file system.

**Deep explanation about swap file system**
-------------------------------------------

As shown in Picture 1, We have RAM ([Random Access Memory](https://arkit.co.in/computer-hardware/wokring-with-memory/) / Physical memory) which is full with opened applications. User is trying to open an new application without closing opened applications, in that mean time inactive application which is not used from long time will moved to Hard disk where Swap Space is created. By moving inactive application to Swap space making a free room for new applications. This process will complete within fraction of seconds. 

When you re-open / Click on the application which is loaded into the Swap space will be loaded back to RAM immediately, this time other inactive application will be moved to swap space. In this way swap space is more useful to load big application with less RAM.

[![swap space arkit swap file system](https://arkit.co.in/wp-content/uploads/2016/07/swap-space-arkit-300x125.jpg)](https://arkit.co.in/wp-content/uploads/2016/07/swap-space-arkit.jpg)

Picture 2\. swap space

How much swap space we have to create, this is an basic question but always unclear in mind. Basically we always take **RAM*2=Swap Space****. Example **2GB RAM*****2=4GB Swap space**. But this method always not works in bigger environment. As a example if we have ~~RAM 250GB\*2=500GB~~ Swap this is always a wrong. If you have RAM 250GB also you can create a swap space Max 10GB – 16GB is good practice.

You can create/add swap File System two ways

Method 1: Creating New Swap File with dd command
------------------------------------------------

Determine the size of the new swap file in MB and multiply by 1024 to determine the number of blocks. For example, the block size of a 5MB swap file is 5120.

    [root@desktop ~]# dd if=/dev/zero of=/swapfile bs=1024 count=5120
    5120+0 records in
    5120+0 records out
    5242880 bytes (5.2 MB) copied, 0.032123 s, 163 MB/s

* **dd**= it is used for convert and copy a file
* **if**=device in from which disk block are read
* **of**=device or file to which disk block are read
* **bs**=block size
* **count**=Number of block to copy a file

Change the permissions of the created swap file

    [root@desktop ~]# chmod 0600 /swapfile

now create swap file system with mkswap command

    [root@desktop ~]# mkswap /swapfile
    Setting up swapspace version 1, size = 5116 KiB
    no label, UUID=b0f6b01b-9b03-46d6-8bdb-0891c4d0422f

To enable the swap file immediately but its not automatically enabled

    [root@desktop ~]# swapon /swapfile

To enable it at boot time, edit /etc/fstab to include the following entry

    [root@desktop ~]# vi /etc/fstab
    ### ARKIT.CO.IN  #####
    /dev/mapper/rhel-root / xfs defaults 0 0
    UUID=faf86acf-99bb-47c4-ae0a-698006a97eca /boot xfs defaults 0 0
    /dev/mapper/rhel-swap swap swap defaults 0 0
    /swapfile             swap swap defaults 0 0
    ~
    :wq

Now enable the swap file system

    [root@desktop ~]# swapon -a

verify it is enable?
--------------------

checking the swap file system status

    [root@desktop ~]# swapon -s
    Filename Type Size Used Priority
    /dev/dm-0 partition 2097148 0 -1
    /swapfile file 5116 0 -2

#### (or)

you can check swap file system status with below command also

    [root@desktop ~]# cat /proc/swaps

To check how much swap space available on your system.

    [root@desktop ~]# free -m
     total used free shared buff/cache available
    Mem: 1826 481 817 9 528 1156
    Swap: 2052 0 2052

How to disable/deactivate swap file system?
-------------------------------------------

To disable the swap file system on /swapfile and check the status of swap file system.

    [root@desktop ~]# swapoff /swapfile
    [root@desktop ~]# swapon -s
    Filename Type Size Used Priority
    /dev/dm-0 partition 2097148 0 -1

Now check swap space available on your system.

    [root@desktop ~]# free -m
     total used free shared buff/cache available
    Mem: 1826 481 816 9 528 1156
    Swap: 2047 0 2047

when reboot your system it will activate automatically.

Method 2: creating swap file system using partition
---------------------------------------------------

List out the storage devices available in your system

    [root@desktop ~]# fdisk -l

    Disk /dev/sdb: 21.5 GB, 21474836480 bytes, 41943040 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disk label type: dos
    Disk identifier: 0x0009b5e1

    Device Boot Start End Blocks Id System
    /dev/sdb1 * 2048 1026047 512000 83 Linux
    /dev/sdb2 1026048 41943039 20458496 8e Linux LVM

Checking for free partition on device use with parted command

    [root@desktop ~]# parted /dev/sda print free
    Model: VMware, VMware Virtual S (scsi)
    Disk /dev/sda: 21.5GB
    Sector size (logical/physical): 512B/512B
    Partition Table: msdos
    Disk Flags:

    Number Start End Size Type File system Flags
     32.3kB 1049kB 1016kB Free Space
     1 1049kB 525MB 524MB primary xfs boot
     2 525MB 21.5GB 20.9GB primary lvm

create new partition and make swap file system
----------------------------------------------

    [root@server ~]# fdisk /dev/sdb
    Welcome to fdisk (util-linux 2.23.2).

    Changes will remain in memory only, until you decide to write them.
    Be careful before using the write command.

    Command (m for help): n
    Partition type:
     p primary (1 primary, 0 extended, 3 free)
     e extended
    Select (default p): 
    Using default response p
    Partition number (2-4, default 2): 
    First sector (10487808-20971519, default 10487808): 
    Using default value 10487808
    Last sector, +sectors or +size{K,M,G} (10487808-20971519, default 20971519): +250M
    Partition 2 of type Linux and of size 250 MiB is set

    Command (m for help): wq
    The partition table has been altered!

    [root@server ~]# fdisk /dev/sdb
    Welcome to fdisk (util-linux 2.23.2).

    Changes will remain in memory only, until you decide to write them.
    Be careful before using the write command.

    Command (m for help): p

    Disk /dev/sdb: 10.7 GB, 10737418240 bytes, 20971520 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disk label type: dos
    Disk identifier: 0x5d500a95

    Device Boot Start End Blocks Id System
    /dev/sdb1 2048 10487807 5242880 83 Linux
    /dev/sdb2 10487808 10999807 256000 83 Linux

    Command (m for help): t
    Partition number (1,2, default 2): 
    Hex code (type L to list all codes): 82
    Changed type of partition 'Linux' to 'Linux swap / Solaris'

    Command (m for help): p

    Disk /dev/sdb: 10.7 GB, 10737418240 bytes, 20971520 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disk label type: dos
    Disk identifier: 0x5d500a95

    Device Boot Start End Blocks Id System
    /dev/sdb1 2048 10487807 5242880 83 Linux
    /dev/sdb2 10487808 10999807 256000 82 Linux swap / Solaris

    Command (m for help): wq
    The partition table has been altered!

#### Now we made an partition with 250MB and convert its type to Linux Swap

    [root@server ~]# partprobe /dev/sdb
    [root@server ~]# fdisk -l /dev/sdb

    Device Boot Start End Blocks Id System
    /dev/sdb1 2048 10487807 5242880 83 Linux
    /dev/sdb2 10487808 10999807 256000 82 Linux swap / Solaris

    [root@server ~]# mkswap /dev/sdb2
    Setting up swapspace version 1, size = 255996 KiB
    no label, UUID=262d1527-b3bf-415a-99a0-754a7d5dd119

    [root@server ~]# free -m
     total used free shared buff/cache available
    Mem: 1826 594 670 9 561 1052
    Swap: 2047 0 2047

    [root@server ~]# swapon /dev/sdb2 
    [root@server ~]# free -m
     total used free shared buff/cache available
    Mem: 1826 594 670 9 561 1051
    Swap: 2297 0 2297

That’s it about Swap file system in Linux.

We required your support to generate more and more articles / documents like this. In order to support us please share this via social network below.

Please do comment your feedback on this.

**Don’t Miss:** [ls command with 25 examples](https://arkit.co.in/linux/ls-command-with-25-practical-examples-rhel7/)

**Thanks for your wonderful Support and Encouragement **

* [Get Email](https://feedburner.google.com/fb/a/mailverify?uri=arkit) | [Download E-Books](https://arkit-in.tradepub.com/)
* [Facebook Page](https://www.facebook.com/Linuxarkit)
* [Youtube Channel](https://www.youtube.com/Techarkit?sub_confirmation=1)
* [Twitter](https://twitter.com/aravikumar48)
* [Exclusive Telegram Group](https://t.me/Linuxarkit)
* [Discuss On WhatsApp Group](https://github.com/techarkit/TechArkit-YouTube/blob/master/whatsapp_group.md)

More than 40000 Techies in our community do you want part of it Join Now