NFS Server Configuration in RHEL 7 Step by Step guide. NFS = Network File system which is used to share directories across the Unix/Linux Operating system. Which does not support directly cross platform.

* **Network File System (NFS)**: Is a nfs server client protocol used for sharing files and directories between Linux / Unix to Unix/Linux systems vise versa. It is a popular distributed filesystem protocol that enables users to mount remote directories on their server. NFS enables you to mount a remote share locally. NFS was developed by Sun Micro Systems in the year 1984
* RHEL7 provides the support for NFS versions 3, 4.0, and 4.1(latest version)
* NFS default port number is 2049
* NFS share we can mount Manually, Automatically using AutoFS and Half manual and half automatic

**NFS Server configuration in RHEL7**
-------------------------------------

**Features:**
-------------

1. Centralized Management of Files
2. Everyone can access same data
3. Secured with Firewalls and Kerberos
4. Reduce Storage Cost and Easy to use

Server Profile:
---------------

* **Packages:** nfs-utils\*
* **Daemon Name:** nfs-service
* **Port Number:** 2049
* **Config file path:** /etc/exports

NFS server side configuration

==============================

* Install nfs packages through yum command.

    # yum install nfs-utils
    # systemctl enable nfs-server
    # systemctl start nfs-server

**Enable Firewall ports to communicate with client**

    # firewall-cmd --permanent --add-service=nfs
    # firewall-cmd --permanent --add-service=mountd
    # firewall-cmd --permanent --add-service=rpc-bind

Above commands will enable the firewall ports from server to client

**Create and Configure NFS share**

    # mkdir /ravi
    # chown nfsnoboddy:root /ravi
    #chmod 770 /ravi
    # vim /etc/exports
    /ravi 192.168.4.0/24(rw)

Save & Exit (:wq)

    # exportfs -avr

That’s it from server side configuration. 

Now we may get one question in mind that do we need to write NFS SELinux context to NFS shares and Services, Not required since NFS services default use kernel\_t to run

**Client Side Configuration**

Login to client machine and try to ping to NFS server machine to confirm client is communicating with NFS server.

    # showmount -e NFS-SERVER-IP
    # showmount -r 192.168.4.20

To see the NFS shares, which are shared from NFS server

Manually mounting the NFS shares using mount command

    # mount -t nfs -o sync 192.168.4.20:/ravi /mnt/nfs
    # df -h

Now you should to see an mount point /mnt/nfs

That’s it very easy and simple way to configure nfs server

**Conclusion**

You learn that how to install and configure NFS server in Linux

Please do comment your feedback on the same

[File system Usage Monitoring Script](https://arkit.co.in/file-system-usage-monitoring-shell-script/)

[Reset root user password in RHEL 7](https://arkit.co.in/reset-root-user-password-rhel7/)

[Stale File Handle Error Resolution](https://arkit.co.in/nfs-stale-file-handle-error-resolution/)

[RHCSA video tutorial](https://www.youtube.com/Techarkit)

**Thanks for your wonderful Support and Encouragement **

* [Get Email](https://feedburner.google.com/fb/a/mailverify?uri=arkit) | [Download E-Books](https://arkit-in.tradepub.com/)
* [Facebook Page](https://www.facebook.com/Linuxarkit)
* [Youtube Channel](https://www.youtube.com/Techarkit?sub_confirmation=1)
* [Twitter](https://twitter.com/aravikumar48)
* [Exclusive Telegram Group](https://t.me/Linuxarkit)
* [Discuss On WhatsApp Group](https://github.com/techarkit/TechArkit-YouTube/blob/master/whatsapp_group.md)

More than 40000 Techies in our community do you want part of it Join Now