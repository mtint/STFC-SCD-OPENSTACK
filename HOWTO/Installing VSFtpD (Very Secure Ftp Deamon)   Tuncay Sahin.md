This tutorial shows the installation of vsftpd (**V**ery**S**ecure**FtpD**eamon) on Linux to act as a FTP server. It supports some features as SSL and locking users to their home directories.

These instructions are intended specifically for installing the vsfptd on CentOS/Rhel.

> yum install vsftpd

Start and set the vsftpd service to start at boot

> systemctl start vsftpd
>  systemctl enable vsftpd

Configure VSFtpD
================

Edit the configuration file:

> vi /etc/vsftpd/vsftpd.conf

Modify the following directives:

> \#Disallow anonymous login
>  anonymous\_enable=NO
>  \#Allow local users to login
>  local\_enable=YES
>  \#Isolate users to their home folder. Local users will be denied access to any other part of the server
>  chroot\_local\_user=YES

If you want to disable FTP Upload and just allow Download:

> write\_enable=NO

Restart the service and verify its status
-----------------------------------------

> systemctl restart vsftpd
>  systemctl status vsftpd

Add a ftp user
==============

By default root-user is not allowed to login to ftp server for security purposes. So let’s create a new user.
 Users that are not allowed to login via ftp are listed in this file: /etc/vsftpd/ftpusers

adduser ftp\_user
 passwd ftp\_user

Modify homedir for ftp user
---------------------------

You can modify the homedir of the ftp user, for example to the document-root folder of a website:

> usermod -d /path/to/website/ ftp\_user

Add the ftp user to, for example, the Apache group to get necessary permissions on the document-root of the website.

> usermod -a -G apache ftp\_user

Verify group membership of the ftp user

> id ftp\_user

Access
======

Be sure firewall exemptions are made to allow ftp access (port 21) to the server.

In case of IPtables:

> iptables -A INPUT -p tcp –dport 22 -j ACCEPT
>  iptables -A OUTPUT -p tcp –sport 20 -j ACCEPT

in case of FirewallD:

firewall-cmd –permanent –add-port=21/tcp
 firewall-cmd –reload

If the user cannot change to his homedir, update SELinux configuration:

> setsebool -P ftp\_home\_dir on

Warning: FTP data is insecure; traffic is not encrypted, and all transmissions are clear text (including usernames, passwords, commands, and data). Consider securing your FTP connection with SSL/TLS.