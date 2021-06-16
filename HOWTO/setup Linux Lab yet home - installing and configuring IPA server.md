After completion of [part-4 setup](http://arkit.co.in/linux/setting-up-linux-lab-red-hat-enterprise-linux-7-installation/) You can follow this steps to setup your own Linux lab at Home, using either vmware workstation or Oracle Virtual box Or KVM virtualization Or RHEV. In this method i have used Vmware work stations and Virtual box o setup Linux Lab at home. IPA is the best option to practice LDAP, Kerberos authentication for RHCE Lab.

run *\# yum update *once and take the snapshot of that VM

right click on VM –\> Snapshot –\> Take Snapshot

[![create snapshot of VM](http://arkit.co.in/wp-content/uploads/2016/03/create-snapshot-of-VM-300x128.jpg)](http://arkit.co.in/wp-content/uploads/2016/03/create-snapshot-of-VM.jpg)

provide the snapshot name and click on *Take Snapshot*

[![snapshot name](http://arkit.co.in/wp-content/uploads/2016/03/Snapshot-name-300x190.jpg)](http://arkit.co.in/wp-content/uploads/2016/03/Snapshot-name.jpg)

Setup Linux Lab at home – installing and configuring IPA server
---------------------------------------------------------------

setup Linux Lab at home – installing and configuring IPA server . In order to build the lab server we have to install and configure below server roles.

1. YUM Server
2. DNS Server
3. Web Server
4. NTP Server
5. LDAP Server
6. Kerberos Server
7. 389 Directory Server

before creating all the above mentioned servers, we have to assign static IP address and hostname to the server. in this case we will use nmcli utility to set static IP address.

    Adding New connection
    #nmcli connection add type ethernet con-name eth0 ifname ens01677
    Assign IP address
    #nmcli connection modify eht0 ipv4.address 192.168.4.13/24 ipv4.gateway 192.168.4.2 ipv4.dns 192.168.4.13 +ipv4.dns 8.8.8.8
    Set to Manual IP address method
    #nmcli connection modify eth0 ipv4.method manual
    Bring down the connection
    #nmcli connection down eth0
    Brind UP the connection
    #nmcli connection up eth0

### [To setup hostname refer this link](http://arkit.co.in/linux/how-to-setup-host-name-in-linux-version-7/)

YUM Server setup
================

Yellowdog updater, modified required to manage your RPM packages. YUM server will automatically resolve dependencies of rpm packages while installing them. Red Hat Enterprise Linux 7 will not provide YUM, without subscription. Always installing the packages without YUM is very difficult, so we will setup our local repository using installation media packages (RHEL 7 DVD).

Step 1: Mount DVD to temp directory
-----------------------------------

Mount your ISO file to your virtual machine, then mount to any directory using mount command as mentioned below. in this example i used /rpms for mounting.

    #mount /dev/sr0 /rpms

Step 2: Install FTP and CREATEREPO packages 
--------------------------------------------

while installing the createrepo package it may ask you for the dependencies to install, delrarpm and python-deltarpm.

    [root@arkit-server ~]# rpm -ivh /rpms/Packages/createrepo-0.9.9-23.el7.noarch.rpm

    [root@arkit-server ~]# rpm -ivh /rpms/Packages/deltarpm-3.6-3.el7.x86_64.rpm

    [root@arkit-server ~]# rpm -ivh /rpms/Packages/python-deltarpm-3.6-3.el7.x86_64.rpm

    [root@arkit-server ~]# rpm -ivh /rpms/Packages/createrepo-0.9.9-23.el7.noarch.rpm

    [root@arkit-server ~]# rpm -ivh /rpms/Packages/vsftpd-3.0.2-9.el7.x86_64.rpm

Step 3: Enable and Start the FTP service
----------------------------------------

FTP: File transfer protocol, it uses port number 20 and 21 to download and upload files.

    [root@arkit-server ~]# systemctl enable vsftpd.service

    [root@arkit-server ~]# systemctl start vsftpd.service;

    [root@arkit-server ~]# firewall-cmd --permanent --add-service=ftp
    success
    [root@arkit-server ~]# firewall-cmd --reload
    success
    [root@arkit-server ~]# systemctl restart vsftpd.service

verify that in /etc/vsftpd/vsftpd.conf file anonymous\_enable=YES string is enabled or not.

set the SELinux policy enabled.

    #getsebool -a |grep ftp
    #setsebool -P ftpd_full_access on

Step 4: Copy the packages to /var/ftp/pub/ and create repository
----------------------------------------------------------------

We have to share the YUM repository to our client machines via FTP.

create repository using installation DVD repomod.xml file.

    # createrepo -vg /var/ftp/pub/repodata/repomd.xml /var/ftp/pub/

create new yum configuration file and add the entries as mentioned below.

    [root@arkit-server ~]# cat /etc/yum.repos.d/ftp.repo
    [ARKIT-YUM]
    name=yumserver
    baseurl=ftp://192.168.4.13/pub/
    enabled=1
    gpgcheck=0

Now test the yum is working..

That’s about yum server setup.

DNS Server, NTP Server, LDAP Server, Kerberos Server and 389 Directory Server
=============================================================================

Instead of installing all DNS, LDAP, Kerberos and 389 director server, We can also install an IPA server which includes all of the above.

First enable the firewall rules to install

    [root@arkit-server ~]# firewall-cmd --permanent --add-service=http
    success
    [root@arkit-server ~]# firewall-cmd --permanent --add-service=https
    success
    [root@arkit-server ~]# firewall-cmd --permanent --add-service=ldap
    success
    [root@arkit-server ~]# firewall-cmd --permanent --add-service=ldaps
    success
    [root@arkit-server ~]# firewall-cmd --permanent --add-service=kerberos
    success
    [root@arkit-server ~]# firewall-cmd --permanent --add-service=dns
    success
    [root@arkit-server ~]# firewall-cmd --reload
    success

    [root@arkit-server ~]# yum install ipa-server bind nds-ldap bind-dyndb-ldap

    [root@arkit-server ~]# ipa-server-install --setup-dns
    The log file for this installation can be found in /var/log/ipaserver-install.log
    ==============================================================================
    This program will set up the IPA Server.
    This includes:
     * Configure a stand-alone CA (dogtag) for certificate management
     * Configure the Network Time Daemon (ntpd)
     * Create and configure an instance of Directory Server
     * Create and configure a Kerberos Key Distribution Center (KDC)
     * Configure Apache (httpd)
     * Configure DNS (bind)
    To accept the default shown in brackets, press the Enter key.
    Existing BIND configuration detected, overwrite? [no]: yes
    Enter the fully qualified domain name of the computer
    on which you're setting up server software. Using the form
    <hostname>.<domainname>
    Example: master.example.com.
    Server host name [arkit-server.lab.local]:
    Warning: skipping DNS resolution of host arkit-server.lab.local
    The domain name has been determined based on the host name.
    Please confirm the domain name [lab.local]:
    Enter the IP address to use, or press Enter to finish.
    Please provide the IP address to be used for this host name: 192.168.4.13
    Please provide the IP address to be used for this host name:
    Adding [192.168.4.13 arkit-server.lab.local] to your /etc/hosts file
    The kerberos protocol requires a Realm name to be defined.
    This is typically the domain name converted to uppercase.
    Enter the IP address to use, or press Enter to finish.
    Please provide the IP address to be used for this host name: 192.168.4.13
    Please provide the IP address to be used for this host name:
    Adding [192.168.4.13 arkit-server.lab.local] to your /etc/hosts file
    The kerberos protocol requires a Realm name to be defined.
    This is typically the domain name converted to uppercase.
    Please provide a realm name [LAB.LOCAL]:
    Certain directory server operations require an administrative user.
    This user is referred to as the Directory Manager and has full access
    to the Directory for system management tasks and will be added to the
    instance of directory server created for IPA.
    The password must be at least 8 characters long.
    Directer Password: PASSWORD
    Confirm Password: CONFIRM-PASSWORD
    The IPA server requires an administrative user, named 'admin'.
    This user is a regular system account used for IPA server administration.
    IPA admin password: PASSWORD
    Password (confirm): CONFIRM-PASSWORD
    Do you want to configure DNS forwarders? [yes]:
    Enter the IP address of DNS forwarder to use, or press Enter to finish.
    Enter IP address for a DNS forwarder: 8.8.8.8
    DNS forwarder 8.8.8.8 added
    Enter IP address for a DNS forwarder:
    Checking forwarders, please wait ...
    Do you want to configure the reverse zone? [yes]:
    Please specify the reverse zone name [4.168.192.in-addr.arpa.]:
    Using reverse zone(s) 4.168.192.in-addr.arpa.
    The IPA Master Server will be configured with:
    Hostname: arkit-server.lab.local
    IP address(es): 192.168.4.13
    Domain name: lab.local
    Realm name: LAB.LOCAL
    BIND DNS server will be configured to serve IPA domain with:
    Forwarders: 8.8.8.8
    Reverse zone(s): 4.168.192.in-addr.arpa.
    Continue to configure the system with these values? [no]: yes
    The following operations may take some minutes to complete.
    Please wait until the prompt is returned.
    Configuring NTP daemon (ntpd)
     [1/4]: stopping ntpd
     [2/4]: writing configuration
     [3/4]: configuring ntpd to start on boot
     [4/4]: starting ntpd
    Done configuring NTP daemon (ntpd).
    Configuring directory server (dirsrv): Estimated time 1 minute

[![firewall-cmd enable services](http://arkit.co.in/wp-content/uploads/2016/03/firewall-cmd-enable-services-300x199.jpg)](http://arkit.co.in/wp-content/uploads/2016/03/firewall-cmd-enable-services.jpg)

since we already enabled the fire ports we no need to enable now. setup Linux Lab yet home – installing and configuring IPA server

Now verify the kerberos and ldap user is able to login or not

    [root@arkit-server ~]# klist
    Ticket cache: KEYRING:persistent:0:0
    Default principal: admin@LAB.LOCAL
    Valid starting Expires Service principal
    03/06/2016 21:46:37 03/07/2016 21:46:31 krbtgt/LAB.LOCAL@LAB.LOCAL
    [root@arkit-server ~]# ipa user-find admin
    --------------
    1 user matched
    --------------
     User login: admin
     Last name: Administrator
     Home directory: /home/admin
     Login shell: /bin/bash
     UID: 823800000
     GID: 823800000
     Account disabled: False
     Password: True
     Kerberos keys available: True
    ----------------------------
    Number of entries returned 1
    ----------------------------
    [root@arkit-server ~]# ipactl status
    Directory Service: RUNNING
    krb5kdc Service: RUNNING
    kadmin Service: RUNNING
    named Service: RUNNING
    ipa_memcached Service: RUNNING
    httpd Service: RUNNING
    pki-tomcatd Service: RUNNING
    ipa-otpd Service: RUNNING
    ipa: INFO: The ipactl command was successful

Create one more user in ipa server to test from client

    [root@arkit-server ~]# ipa user-add
    First name: Ravi
    Last name: Kumar
    User login [rkumar]:
    -------------------
    Added user "rkumar"
    -------------------
     User login: rkumar
     First name: Ravi
     Last name: Kumar
     Full name: Ravi Kumar
     Display name: Ravi Kumar
     Initials: RK
     Home directory: /home/rkumar
     GECOS: Ravi Kumar
     Login shell: /bin/sh
     Kerberos principal: rkumar@LAB.LOCAL
     Email address: rkumar@lab.local
     UID: 823800001
     GID: 823800001
     Password: False
     Member of groups: ipausers
     Kerberos keys available: False
    [root@arkit-server ~]# ipa passwd rkumar
    New Password:
    Enter New Password again to verify:
    ---------------------------------------
    Changed password for "rkumar@LAB.LOCAL"
    ---------------------------------------

Client Side Configuration
=========================

Assign the hostname to client

add yum repo to client

    # scp /etc/yum.repos.d/ftp.repo root@ipaclient:/etc/yum.repos.d/

Add DNS server IP address to /etc/resolve.conf

    [root@ravikumar ~]# cat /etc/resolv.conf
    # Generated by NetworkManager
    search lab.local
    nameserver 192.168.4.10

    # yum install nss-pam-ldapd pam_krb5 ipa-client

    [root@ravikumar yum.repos.d]# ipa-client-install
    Discovery was successful!
    Client hostname: ipaclient.lab.local
    Realm: LAB.LOCAL
    DNS Domain: lab.local
    IPA Server: arkit-server.lab.local
    BaseDN: dc=lab,dc=local
    Continue to configure the system with these values? [no]: yes
    Synchronizing time with KDC...
    Attempting to sync time using ntpd. Will timeout after 15 seconds
    Attempting to sync time using ntpd. Will timeout after 15 seconds
    Unable to sync time with NTP server, assuming the time is in sync. Please check that 123 UDP port is opened.
    User authorized to enroll computers: admin
    Password for admin@LAB.LOCAL: 
    Successfully retrieved CA cert
     Subject: CN=Certificate Authority,O=LAB.LOCAL
     Issuer: CN=Certificate Authority,O=LAB.LOCAL
     Valid From: Sun Mar 06 16:03:04 2016 UTC
     Valid Until: Thu Mar 06 16:03:04 2036 UTC
    Enrolled in IPA realm LAB.LOCAL
    Created /etc/ipa/default.conf
    New SSSD config will be created
    Configured sudoers in /etc/nsswitch.conf
    Configured /etc/sssd/sssd.conf
    trying https://arkit-server.lab.local/ipa/json
    Forwarding 'ping' to json server 'https://arkit-server.lab.local/ipa/json'
    Forwarding 'ca_is_enabled' to json server 'https://arkit-server.lab.local/ipa/json'
    Systemwide CA database updated.
    Added CA certificates to the default NSS database.
    Hostname (ipaclient.lab.local) does not have A/AAAA record.
    Missing reverse record(s) for address(es): 192.168.4.12.
    Adding SSH public key from /etc/ssh/ssh_host_ecdsa_key.pub
    Forwarding 'host_mod' to json server 'https://arkit-server.lab.local/ipa/json'
    SSSD enabled
    Configured /etc/openldap/ldap.conf
    NTP enabled
    Configured /etc/ssh/ssh_config
    Configured /etc/ssh/sshd_config
    Configuring lab.local as NIS domain.
    Client configuration complete.

Now your client is added successfully to IPA server

Verify IPA Client with IPA Server Connection Status
---------------------------------------------------

    [root@ravikumar ~]# getent passwd rkumar
    rkumar:*:823800001:823800001:Ravi Kumar:/home/rkumar:/bin/sh
    [root@ravikumar ~]# 
    [root@ravikumar ~]# su - admin
    Last login: Sun Mar 6 22:50:42 IST 2016 on pts/0
    su: warning: cannot change directory to /home/admin: No such file or directory
    -bash-4.2$ id
    uid=823800000(admin) gid=823800000(admins) groups=823800000(admins) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
    -bash-4.2$ exit
    logout
    [root@ravikumar ~]# su - rkumar
    su: warning: cannot change directory to /home/rkumar: No such file or directory

when you login from client you will not get home directory

to get home directory add below line to mentioned file setup Linux Lab yet home – installing and configuring IPA server

    # vi /etc/pam.d/password-auth
    # session    required    pam_mkhomedir.so skel=/etc/skel/ umask=0022

login again you will get it.

We can also login to IPA server using web UI

[![ipa-server web gui](http://arkit.co.in/wp-content/uploads/2016/03/ipa-server-web-gui-300x276.jpg)](http://arkit.co.in/wp-content/uploads/2016/03/ipa-server-web-gui.jpg)

[![ipa-server web hosts](http://arkit.co.in/wp-content/uploads/2016/03/ipa-server-web-hosts-300x93.jpg)](http://arkit.co.in/wp-content/uploads/2016/03/ipa-server-web-hosts.jpg)

That’s about setting up an Linux Lab yet home using virtualization softwares such as vmware & virtualbox setup Linux Lab yet home – installing and configuring IPA server

Thanks for the read. setup Linux Lab yet home – installing and configuring IPA server

Please write your valuable feedback.

Related Articles
----------------

[How to Install GNOME desktop in RHEL 7](https://arkit.co.in/install-gnome-desktop-centos-7/)

[rsyslog server installation and configuration RHEL 7](https://arkit.co.in/rsyslog-server/)

[Linux Server Operating System](https://arkit.co.in/linux-server/)

**Thanks for your wonderful Support and Encouragement **

* [Get Email](https://feedburner.google.com/fb/a/mailverify?uri=arkit) | [Download E-Books](https://arkit-in.tradepub.com/)
* [Facebook Page](https://www.facebook.com/Linuxarkit)
* [Youtube Channel](https://www.youtube.com/Techarkit?sub_confirmation=1)
* [Twitter](https://twitter.com/aravikumar48)
* [Exclusive Telegram Group](https://t.me/Linuxarkit)
* [Discuss On WhatsApp Group](https://github.com/techarkit/TechArkit-YouTube/blob/master/whatsapp_group.md)

More than 40000 Techies in our community do you want part of it Join Now