SELinux security feature of the Linux kernel. To manage the security enhanced Linux behavior of a system to keep it secure in case of a network service compromise.

SELinux is an additional layer of system security. It protects user data from your system services that have been compromised. Linux administrators are known with the standard user/group/other(u/g/o) permissions security model.

[![SELinux](resources/1D0E0AB18F61D1724C49726ACF8D6ED8.png)](https://arkit.co.in/wp-content/uploads/2016/07/SELinux.png)

Picture 1\. SELinux

As a example if you see above Picture 1 Whenever outside client request for a data to access from Linux Server, SELinux will verify requested data port is allowed from SELinux, It will verify process SELinux context is enabled and File security context enabled. Three layer security system. This security will work only when SELinux is in enforcing mode.

SELinux is a set of security rules that determine which process can access which directories, files and ports. Every file, process, port and directory has a special label called a SELinux context.

SELinux label context are user, role, type and sensitivity. The type context names end with “**\_t**“

#### To display or set SELinux contexts with option “Z”:

    [root@server ~]# ls -lZ
    -rw-------. root root system_u:object_r:admin_home_t:s0 anaconda-ks.cfg
    drwxr-xr-x. root root unconfined_u:object_r:admin_home_t:s0 Desktop
    drwxr-xr-x. root root unconfined_u:object_r:admin_home_t:s0 Documents
    drwxr-xr-x. root root unconfined_u:object_r:admin_home_t:s0 Downloads

    [root@server ~]# ls -ldZ /etc/
    drwxr-xr-x. root root system_u:object_r:etc_t:s0 /etc/

    [root@server ~]# ls -ldZ /var/
    drwxr-xr-x. root root system_u:object_r:var_t:s0 /var/

    [root@server ~]# ls -ldZ /
    dr-xr-xr-x. root root system_u:object_r:root_t:s0 /

    [root@server ~]# ls -ldZ /var/log/
    drwxr-xr-x. root root system_u:object_r:var_log_t:s0 /var/log/

S**ELinux Modes:**
==================

SELinux modes are three types :-

1. Enforcing Mode
2. Permissive Mode
3. Disabled Mode

**Enforcing Mode**: Default mode which will enforce and enabled the SELinux security on your system. In this mode SELinux logs and protects.

**Permissive Mode:** This mode can be used to temporarily allow access to content that SELinux is restricting. No reboot required to go from enforcing to permissive vice versa. This mode is useful for troubleshooting SELinux security issues. When SELinux is in permissive mode it will not deny the access it will only log.

**Disabled Mode:** Completely disables SELinux your system. Your system reboot is required to disable SELinux entirely or to get disabled mode to enforcing. Until unless you reboot your machine after disable it will not effect.

For the first time when you change SELinux from disable mode to enforcing mode SELinux will relabel all the files and processes from context rules

**Change SELinux modes**

To check SELinux security status

    [root@server ~]# sestatus
    SELinux status: disabled

    [root@server ~]# getenforce 
    Disabled

Enable / Disable SELinux Security mode. Edit configuration file and change **SELINUX=’enforcing/disabled’** 

    [root@server ~]# vim /etc/selinux/config 
    SELINUX=enforcing
    SELINUXTYPE=targeted

Enforced mode 

    [root@server ~]# sestatus 
    SELinux status: enabled
    SELinuxfs mount: /sys/fs/selinux
    SELinux root directory: /etc/selinux
    Loaded policy name: targeted
    Current mode: enforcing
    Mode from config file: enforcing
    Policy MLS status: enabled
    Policy deny_unknown status: allowed
    Max kernel policy version: 28

    [root@server ~]# getenforce 
    Enforcing

To keep in permissive mode

    [root@server ~]# setenforce 0
    [root@server ~]# getenforce 
    Permissive

What is the default context for newly created files / Directories
-----------------------------------------------------------------

When we create an file / directory under / (slash) it will assign default\_t context.

But if we create an file / directory under /etc/, /var/, /var/www/html/ it will apply different SELinux security context let see the examples below

    [root@server ~]# mkdir /var/test
    [root@server ~]# ls -ldZ /var/test/
    drwxr-xr-x. root root unconfined_u:object_r:var_t:s0 /var/test/

    [root@server ~]# mkdir /etc/test
    [root@server ~]# ls -ldZ /etc/test
    drwxr-xr-x. root root unconfined_u:object_r:etc_t:s0 /etc/test

    [root@server ~]# mkdir /test
    [root@server ~]# ls -ldZ /test
    drwxr-xr-x. root root unconfined_u:object_r:default_t:s0 /test

**How to assign SELinux Security Context**
------------------------------------------

To assign a security context to file

    [root@server ~]# semanage fcontext -a -t samba_share_t "/test(/.*)?"

    [root@server ~]# ls -ldZ /test/
    drwxr-xr-x. root root unconfined_u:object_r:default_t:s0 /test/

    [root@server ~]# restorecon -vRF /test/
    restorecon reset /test context unconfined_u:object_r:default_t:s0->system_u:object_r:samba_share_t:s0

    [root@server ~]# ls -ldZ /test/
    drwxr-xr-x. root root system_u:object_r:samba_share_t:s0 /test/

To enable port

    [root@server ~]# semanage port -l |grep http_port
    http_port_t tcp 80, 81, 443, 488, 8008, 8009, 8443, 9000
    pegasus_http_port_t tcp 5988

    [root@server ~]# semanage port -a -t http_port_t -p tcp 15000

    [root@server ~]# semanage port -l |grep http_port
    http_port_t tcp 15000, 80, 81, 443, 488, 8008, 8009, 8443, 9000
    pegasus_http_port_t tcp 5988

Too See SELinux Boolean values. Enable / Disable sebool parameters

    [root@server ~]# getsebool -a |grep ftp
    ftp_home_dir --> off
    ftpd_anon_write --> off
    ftpd_connect_all_unreserved --> off
    ftpd_connect_db --> off
    ftpd_full_access --> off
    ftpd_use_cifs --> off
    ftpd_use_fusefs --> off
    ftpd_use_nfs --> off
    ftpd_use_passive_mode --> off
    httpd_can_connect_ftp --> off
    httpd_enable_ftp_server --> off
    sftpd_anon_write --> off
    sftpd_enable_homedirs --> off
    sftpd_full_access --> off
    sftpd_write_ssh_home --> off
    tftp_anon_write --> off
    tftp_home_dir --> off

    [root@server ~]# setsebool -P ftpd_anon_write on

    [root@server ~]# getsebool -a |grep ftpd_anon_write
    ftpd_anon_write --> on
    sftpd_anon_write --> off

**Conclusion**

SELinux security context is highly improved in the newer version of Linux RHEL 7 / Centos 7 / Fedora 24\. 

That’s it.

Please do comment your feedback on the same

**Related Articles:** [Firewald](https://arkit.co.in/linux/firewalld-installation-configuration-rhel-7/) [Kerberized NFS](https://arkit.co.in/linux/kerberized-nfs-server-linux/)

**Book download: **[Download Security Intelligence](http://arkit-it.tradepub.com/free/w_wile212/?p=w_wile212)

**Thanks for your wonderful Support and Encouragement **

* [Get Email](https://feedburner.google.com/fb/a/mailverify?uri=arkit) | [Download E-Books](https://arkit-in.tradepub.com/)
* [Facebook Page](https://www.facebook.com/Linuxarkit)
* [Youtube Channel](https://www.youtube.com/Techarkit?sub_confirmation=1)
* [Twitter](https://twitter.com/aravikumar48)
* [Exclusive Telegram Group](https://t.me/Linuxarkit)
* [Discuss On WhatsApp Group](https://github.com/techarkit/TechArkit-YouTube/blob/master/whatsapp_group.md)

More than 40000 Techies in our community do you want part of it Join Now