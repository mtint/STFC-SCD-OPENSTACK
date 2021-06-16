In previous article we discussed about creating and configuring SMB / [CIFS share with single user support ](http://arkit.co.in/linux/simple-way-create-manage-samba/)which CIFS share can’t be accessed by multiple users. In this article we are going to discuss about samba share multi user access which means SMB / CIFS share can be accessed by multiple users with in the server OR from client.

Creating SMB / CIFS share means it should be accessible from UNIX and Windows platforms. Samba Share user access must be identified with valid users and groups by checking their passwords then controls by comparing their access rights to the permissions on files and directories.

**SMB / CIFS share features**

* Active File sharing
* Faster data transfer in low band width network
* Secure Data Transfer with user credential
* Node Fault tolerance
* Scalable

**Samba Server Profile**

* **Packages required: **samba\*
* **Port Number:** 445
* **Daemon Name:** smb
* **config File Location:** /etc/samba/smb.conf

Let’s see how to create samba share multi user access
=====================================================

    [root@ArkIT ~]# yum install samba*

Now Enable and Start SMB service. Enabling service which will automatically start the smb service immediate after server reboot.

    # systemctl enable smb.service
    # systemctl start smb.service

Make an directory to share using SMB / CIFS

    # mkdir /arkit-multiuser

By default SELinux is enabled. SELinux will not allow to share directory with other network client without proper SELinux security policies

    # semanage fcontext -a -t samba_share_t "/arkit-multiuser(/.*)?"
    # restorecon -vRF /arkit-multiuser/
    # ls -ldZ /arkit-multiuser/
    drwxr-xr-x. root root system_u:object_r:samba_share_t:s0 /arkit-multiuser/

SELinux context for SMB / CIFS share is samba\_share\_t

Enabling the firewall ports to communicate with clients

    # firewall-cmd --permanent --add-service=samba
    success
    # firewall-cmd --reload
    success

**Adding normal users and converting them as Samba users**

    # useradd ravi
    # useradd ramana
    # useradd srikanth
    # smbpasswd -a ravi
    New SMB password:
    Retype new SMB password:
    Added user ravi.
    # smbpasswd -a ramana
    New SMB password:
    Retype new SMB password:
    Added user ramana.
    # smbpasswd -a srikanth
    New SMB password:
    Retype new SMB password:
    Added user srikanth.

To verify Samba user 

    # pdbedit -L -v

Creating common group and add user to group provide access

    # groupadd IT
    # usermod -aG IT ravi
    # usermod -aG IT ramana

Configuring the Samba share with multi user support. Edit the configuration file and add the configuration yet end of config file

    [root@server ~]#vim /etc/samba/smb.conf

    [multiuser]
     comment = Information Technology Team
     path = /arkit-multiuser
     write list = @IT
     hosts allow = 192.168.4.

Save and Exit 

That’s about server side configuration

**Now client side configuration**

    [root@server ~]# yum install cifs-utils

Now create an file in /root with username and password and restrict access to other user

    [root@server ~]# vim /root/access
    [root@server ~]# chmod 600 /root/access
    [root@server ~]# ls -l /root/access
    -rw-------. 1 root root 30 May 29 18:24 /root/access
    [root@server ~]# cat /root/access
    username=ravi
    password=redhat

Open /etc/fstab file and mount the samba share permanently 

    [root@Client ~]#vim /etc/fstab
    //192.168.4.20/multiuser /mnt/coss cifs credentials=/root/access,defaults,multiuser,sec=ntlmssp 0 0

Save & Exit

    # mount -a

now let login to other user and check the CIFS share visibility and access

    # cifscreds add 192.168.4.20

Check using df command

That’s it. 

**Conclusion**

samba share multi user access SMB / CIFS has been created. Now you learned that creating and configuring samba multi user access

Please do comment your feedback

Related Articles
----------------

[Linux Tutorial](https://arkit.co.in/linux-online-training-course/)

[CIFS Share Single USer](https://arkit.co.in/simple-way-create-manage-samba/)

[Video tutorial](https://www.youtube.com/Techarkit?sub_confirmation=1)

**Thanks for your wonderful Support and Encouragement **

* [Get Email](https://feedburner.google.com/fb/a/mailverify?uri=arkit) | [Download E-Books](https://arkit-in.tradepub.com/)
* [Facebook Page](https://www.facebook.com/Linuxarkit)
* [Youtube Channel](https://www.youtube.com/Techarkit?sub_confirmation=1)
* [Twitter](https://twitter.com/aravikumar48)
* [Exclusive Telegram Group](https://t.me/Linuxarkit)
* [Discuss On WhatsApp Group](https://github.com/techarkit/TechArkit-YouTube/blob/master/whatsapp_group.md)

More than 40000 Techies in our community do you want part of it Join Now