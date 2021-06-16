NFS – Network File system is used to provide file sharing with in the Unix / Linux environments. kerberized NFS server also used for sharing the directories across the Unix / Linux Platforms. We assume that you already have an [kerberos server](https://arkit.co.in/linux/setup-linux-lab-yet-home-installing-configuring-ipa-server/) in place. 

Why we have to use kerberized NFS Server
----------------------------------------

* NFS Server without kerberos is not secure
* NFS share can be accessed by multiple users from NFS client because there is no user level authentication when not using kerberos
* Wihtout Kerberos NFS Server and client communication is not encrypted
* Kerberos will provide an token based authentication
* NFS with kerberos will use Keytab file to authenticate securely
* All the communication from client to server fully encrypted

**Prerequisites**

1. Kerberos Server for token issue authority
2. Keytab Files
3. Kerberos principles should be in place (if you want to use krb5p authentication method)
4. LDAP server for user authentication along with kerberos
5. NFS Server should be part of LDAP client and Kerberos Client
6. Both the machines NFS Server and NFS Client should be part of kerberos clients
7. DNS name resolution should be in working condition (In case of NO DNS name resolution, We will add hosts file entries) [Master DNS Setup Guide](https://arkit.co.in/linux/master-dns-configuration/)
8. NFS server and NFS client should be in sync with NTP server (Should be NTP clients)

Scenario 1: We can install DNS, Kerberos, KDC server, 365 Directory Service, Token issue authority and LDAP. We use this single server as a main server.

Scenario 2: We can install and configure One DNS server, One Kerberos Server and One LDAP Server separately. This Scenario required more hardware resource but performance will be good. 

why i am explaining above two scenario’s because we are going to see the kerberized NFS with single server all services included in one.

**Environment :**

**Server 1 :** DNS, Kerberos, 365 Directory Services and LDAP service

**Server 2 :** NFS Server

**Server 3 :** NFS Client

**Main Server Side in Kerberos Server Side**

We have to generate keytab files and add NFS principles in kerberos server. 

    # kadmin
    Authenticating as principal root/admin@ARKIT.CO.IN with password.
    Password for root/admin@ARKIT.CO.IN: kerberos
    kadmin: addprinc -randkey nfs/nfserv.arki.co.in
    kadmin: addprinc -randkey nfs/nfsclient.arki.co.in
    kadmin: ktadd nfs/nfserv.arki.co.in
    kadmin: ktadd nfs/nfsclient.arki.co.in
    kadmin: quit
    [root@TechTutorials ~]# cp /etc/krb5.keytab /var/www/html/keytabs/nfserv.keytab
    [root@TechTutorials ~]# cp /etc/kerb5.keytab /vat/www/html/keytabs/nfsclient.keytab

Keytab file should be available for download

**NFS Server Side Configuration**

    [root@nfserv.arkit.co.in ~]# yum install sssd* authconfig-gtk krb5-workstation
    [root@nfserv.arkit.co.in ~]# yum install nfs*

After installing above packages we have to run below command in GUI interface

    [root@nfserv.arkit.co.in]# system-config-authentication

[![Add server to Kerberos client kerberized NFS server](https://arkit.co.in/wp-content/uploads/2016/06/Add-server-to-Kerberos-client-kerberized-NFS-server-199x300.jpg)](https://arkit.co.in/wp-content/uploads/2016/06/Add-server-to-Kerberos-client-kerberized-NFS-server.jpg)

Provide the details

**User Account Database:** LDAP

**LDAP Search Base DN:** DC=arkit,DC=co.in

**LDAP Server:** ldap://ldap.arkit.co.in Or ldaps://arkit.co.in

**Use TLS encryption connections**

[![Ldap Certification Authentication](https://arkit.co.in/wp-content/uploads/2016/06/Ldap-Certification-Authentication-300x140.jpg)](https://arkit.co.in/wp-content/uploads/2016/06/Ldap-Certification-Authentication.jpg)

**Authentication Method:** **Kerberos Password**

**KDC’s :** ldap.arkit.co.in

    ## Download keytab file
    [root@nfserv.arkit.co.in ~]# wget -O /etc/krb5.keytab http://ldap.arkit.co.in/pub/keytabs/nfserv.keytab
    [root@nfserv.arkit.co.in ~]# vim /etc/sysconfig/nfs
    ## Default line number 13
    RPCNFSDARGS = "-V 4.2"

    :wq

    ## Enable and Start NFS Server and NFS Secure Server
    [root@nfserv.arkit.co.in ~]# systemctl enable nfs-secure.service
    [root@nfserv.arkit.co.in ~]# systemctl start nfs-secure.service
    [root@nfserv.arkit.co.in ~]# systemctl enable nfs-server.service
    [root@nfserv.arkit.co.in ~]# systemctl start nfs-server.service
    [root@nfserv.arkit.co.in ~]# systemctl enable nfs-secure-server.service
    [root@nfserv.arkit.co.in ~]# systemctl start nfs-secure-server.service

    ## Create Directory to share using NFS
    [root@nfserv.arkit.co.in ~]# mkdir /nfssecure

    ## Change Directory ownership
    [root@nfserv.arkit.co.in ~]# chown ldapuser1 /nfssecure

    ## Applu SELinux Policy to Directory
    [root@nfserv.arkit.co.in ~]# semanage fcontext -a -t public_content_rw_t "/nfssecure(/.*)?"
    [root@nfserv.arkit.co.in ~]# restorecon -R /nfs
    [root@nfserv.arkit.co.in ~]# setsebool -P nfs_export_all_rw on
    [root@nfserv.arkit.co.in ~]# setsebool -P nfs_export_all_ro on

Now Create NFS export and export it

    [root@nfserv.arkit.co.in ~]# vim /etc/exports

    /nfssecure *.arkit.co.in(rw,sec=krb5p)

    :wq

The security option accepts four different values: 
sec=sys (no Kerberos use)
sec=krb5 (Kerberos user authentication only)
sec=krb5i (Kerberos user authentication and integrity checking)
sec=krb5p (Kerberos user authentication, integrity checking and NFS traffic encryption)
If you want to use sec=sys, you also need to run 

    # setsebool -P nfsd_anon_write 1

Now restart NFS services to reflect the changes

    [root@nfserv.arkit.co.in ~]# systemctl restart nfs-server.service
    [root@nfserv.arkit.co.in ~]# systemctl restart nfs-secure-server.service
    [root@nfserv.arkit.co.in ~]# systemctl restart nfs-secure.service

Enable Firewall ports to communicate with NFS clients

    [root@nfserv.arkit.co.in ~]# firewall-cmd --permanent --add-service=nfs
    [root@nfserv.arkit.co.in ~]# firewall-cmd --permanent --add-service=mountd
    [root@nfserv.arkit.co.in ~]# firewallc-cmd --permanent --add-service=rpc-bind

In order to complete Kerberized NFS Server configuration, We are done in NFS Server we have to switch to NFS client

**NFS Client Side configuration**

Now start the NFS client side setup. We have to join NFS client also as LDAP and Kerberos Client

repeat first step from NFS server configuration

    ## Download keytab file
    [root@nfsclient.arkit.co.in ~]# wget -O /etc/krb5.keytab http://ldap.arkit.co.in/pub/keytabs/nfserv.keytab
    [root@nfsclient.arkit.co.in ~]# vim /etc/sysconfig/nfs
    ## Default line number 13
    RPCNFSDARGS = "-V 4.2"

    :wq

    [root@nfsclient.arkit.co.in ~]# yum install nfs-utils*
    [root@nfsclient.arkit.co.in ~]# systemctl enable nfs-secure.service
    [root@nfsclient.arkit.co.in ~]# systemctl start nfs-secure.service
    [root@nfsclient.arkit.co.in ~]# mkdir /mnt/nfsmount

Now edit fstab configuration file to mount NFS share permanently

    [root@nfsclient.arkit.co.in ~]# vim /etc/fstab
    nfserv.arkit.co.in:/nfssecure /mnt/nfsmount nfs defaults,sec=kerb5p,v4.2 0 0

    :wq

    [root@nfsclient.arkit.co.in ~]# mount -a

Now login as ldapuser1 and try to access the nfssecure share it will be accessible. You can also write data to that share path.

**Conclusion**

kerberized NFS server is highly secured and encrypted communication. NFS kerberized share can’t be accessible by other users who does not have permission to NFS share within the same client.

Thanks for the read please provide your valuable comments on the same

**Thanks for your wonderful Support and Encouragement **

* [Get Email](https://feedburner.google.com/fb/a/mailverify?uri=arkit) | [Download E-Books](https://arkit-in.tradepub.com/)
* [Facebook Page](https://www.facebook.com/Linuxarkit)
* [Youtube Channel](https://www.youtube.com/Techarkit?sub_confirmation=1)
* [Twitter](https://twitter.com/aravikumar48)
* [Exclusive Telegram Group](https://t.me/Linuxarkit)
* [Discuss On WhatsApp Group](https://github.com/techarkit/TechArkit-YouTube/blob/master/whatsapp_group.md)

More than 40000 Techies in our community do you want part of it Join Now