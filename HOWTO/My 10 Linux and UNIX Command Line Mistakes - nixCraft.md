*Anyone who has never made a mistake has never tried anything new. — Albert Einstein*.
 Here are a few mistakes that I made while working at UNIX prompt. Some mistakes caused me a good amount of downtime. Most of these mistakes are from my early days as a UNIX sysadmin. This page lists my top ten Linux or Unix command line mistakes.

A list of my 10 UNIX command line mistakes
------------------------------------------

![](data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUyNiIgd2lkdGg9IjU5OSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=)![My 10 Linux or UNIX Command Line Mistakes](resources/69626443B36A3EEC057ADB3820FB2EBE.jpg)
 They say, “Failure is the key to success; each mistake teaches us something.” I hope you will learn something from my 10 Linux or Unix command line mistakes as well as the comments posted below by my readers.

userdel Command
---------------

The file /etc/deluser.conf was configured to remove the home directory (it was done by previous sys admin and it was my first day at work) and mail spool of the user to be removed. I just wanted to remove the user account and I end up deleting everything (note -r was activated via deluser.conf):
`userdel foo`

Rebooted Solaris Box
--------------------

On Linux [killall command](https://www.cyberciti.biz/tips/kill-frozen-crashed-unix-linux-desktop.html) kill processes by name (killall httpd). On Solaris it kill all active processes. As root I killed all process, this was our main Oracle db box:
`killall process-name`

Destroyed named.conf 
---------------------

I wanted to append a [new zone](https://bash.cyberciti.biz/domain/create-bind9-domain-zone-configuration-file/) to /var/named/chroot/etc/named.conf file., but end up running:
`./mkzone example.com > /var/named/chroot/etc/named.conf`

Destroyed Working Backups with Tar and Rsync (personal backups)
---------------------------------------------------------------

I had only one backup copy of my QT project and I just wanted to get a directory called functions. I end up deleting entire backup (note -c switch instead of -x):

```
cd /mnt/bacupusbharddisk
tar -zcvf project.tar.gz functions
```

 I had no backup. Similarly I end up running rsync command and deleted all new files by overwriting files from backup set (now I have switched to [rsnapshot](https://www.cyberciti.biz/faq/linux-rsnapshot-backup-howto/))
`rsync -av -delete /dest /src`
 Again, I had no backup.

Deleted Apache DocumentRoot
---------------------------

I had [sym links](https://www.cyberciti.biz/faq/unix-creating-symbolic-link-ln-command/) for my web server docroot (/home/httpd/http was symlinked to /www). I forgot about symlink issue. To save disk space, I ran rm -rf on http directory. Luckily, I had full working backup set.

Accidentally Changed Hostname and Triggered False Alarm 
--------------------------------------------------------

Accidentally changed the current hostname (I wanted [to see current hostname settings](https://www.cyberciti.biz/faq/find-my-linux-machine-name/)) for one of our cluster node. Within minutes I received an alert message on both mobile and email.
`hostname foo.example.com`

Public Network Interface Shutdown
---------------------------------

I wanted to shutdown VPN interface eth0, but ended up shutting down eth1 while I was logged in via SSH:
`ifconfig eth1 down`

Firewall Lockdown
-----------------

I made changes to sshd\_config and changed the ssh port number from 22 to 1022, but failed to update firewall rules. After a quick kernel upgrade, I had rebooted the box. I had to call remote data center tech to reset firewall settings. (now I use [firewall reset script](https://www.cyberciti.biz/faq/linux-iptables-firewall-flushout-configuration-every-5minutes/) to avoid lockdowns).

Typing UNIX Commands on Wrong Box
---------------------------------

I wanted to shutdown my local Fedora desktop system, but I issued halt on remote server (I was logged into remote box via SSH):

```
halt
service httpd stop
```

Wrong CNAME DNS Entry
---------------------

Created a wrong DNS CNAME entry in example.com zone file. The end result – a few visitors went to /dev/null:
`echo 'foo 86400 IN CNAME lb0.example.com' >> example.com && rndc reload`

Failed To Update Postfix RBL Configuration
------------------------------------------

In 2006 [ORDB went](https://www.cyberciti.biz/tips/ordborg-rbl-anti-spam-service-going-offline.html) out of operation. But, I failed to update my Postfix RBL settings. One day ORDB was re-activated and it was returning every IP address queried as being on its blacklist. The end result was a disaster.

Conclusion
----------

All men make mistakes, but only wise men learn from their mistakes — *Winston Churchill*.
 From all those mistakes I have learn that:

1. You must keep a good set of backups. Test your backups regularly too.
2. The clear choice for preserving all data of UNIX file systems is dump, which is only tool that guaranties recovery under all conditions. (see [Torture-testing Backup and Archive Programs](http://www.coredumps.de/doc/dump/zwicky/testdump.doc.html) paper).
3. Never use rsync with single backup directory. Create a snapshots using rsync or [rsnapshots](https://www.cyberciti.biz/faq/linux-rsnapshot-backup-howto/).
4. Use CVS/git to store configuration files.
5. Wait and read command line twice before hitting the dam [Enter] key.
6. Use your well tested perl / shell scripts and open source configuration management software such as puppet, Ansible, Cfengine or Chef to configure all servers. This also applies to day today jobs such as creating the users and more.

Mistakes are the inevitable, so have you made any mistakes that have caused some sort of downtime? Please add them into the comments section below.

 🐧 Get the latest tutorials on Linux, Open Source & DevOps via **[RSS feed](https://www.cyberciti.biz/atom/atom.xml)** or **[Weekly email newsletter.](https://newsletter.cyberciti.biz/subscription?f=1ojtmiv8892KQzyMsTF4YPr1pPSAhX2rq7Qfe5DiHMgXwKo892di4MTWyOdd976343rcNR6LhdG1f7k9H8929kMNMdWu3g)**

 🐧 692 comments so far... [add one](https://www.cyberciti.biz/tips/my-10-unix-command-line-mistakes.html#respond) **↓**

CategoryList of Unix and Linux commandsDisk space analyzers[df](https://www.cyberciti.biz/faq/df-command-examples-in-linux-unix/) • [ncdu](https://www.cyberciti.biz/open-source/install-ncdu-on-linux-unix-ncurses-disk-usage/) • [pydf](https://www.cyberciti.biz/tips/unix-linux-bsd-pydf-command-in-colours.html)File Management[cat](https://www.cyberciti.biz/faq/linux-unix-appleosx-bsd-cat-command-examples/) • [cp](https://www.cyberciti.biz/faq/cp-copy-command-in-unix-examples/) • [mkdir](https://www.cyberciti.biz/faq/linux-make-directory-command/) • [tree](https://www.cyberciti.biz/faq/linux-show-directory-structure-command-line/)Firewall[Alpine Awall](https://www.cyberciti.biz/faq/how-to-set-up-a-firewall-with-awall-on-alpine-linux/) • [CentOS 8](https://www.cyberciti.biz/faq/how-to-set-up-a-firewall-using-firewalld-on-centos-8/) • [OpenSUSE](https://www.cyberciti.biz/faq/set-up-a-firewall-using-firewalld-on-opensuse-linux/) • [RHEL 8 ](https://www.cyberciti.biz/faq/configure-set-up-a-firewall-using-firewalld-on-rhel-8/) • [Ubuntu 16.04](https://www.cyberciti.biz/faq/howto-configure-setup-firewall-with-ufw-on-ubuntu-linux/) • [Ubuntu 18.04](https://www.cyberciti.biz/faq/how-to-setup-a-ufw-firewall-on-ubuntu-18-04-lts-server/) • [Ubuntu 20.04](https://www.cyberciti.biz/faq/how-to-configure-firewall-with-ufw-on-ubuntu-20-04-lts/)Network Utilities[NetHogs](https://www.cyberciti.biz/faq/linux-find-out-what-process-is-using-bandwidth/) • [dig](https://www.cyberciti.biz/faq/linux-unix-dig-command-examples-usage-syntax/) • [host](https://www.cyberciti.biz/faq/linux-unix-host-command-examples-usage-syntax/) • [ip](https://www.cyberciti.biz/faq/linux-ip-command-examples-usage-syntax/) • [nmap](https://www.cyberciti.biz/security/nmap-command-examples-tutorials/)OpenVPN[CentOS 7](https://www.cyberciti.biz/faq/centos-7-0-set-up-openvpn-server-in-5-minutes/) • [CentOS 8](https://www.cyberciti.biz/faq/centos-8-set-up-openvpn-server-in-5-minutes/) • [Debian 10](https://www.cyberciti.biz/faq/debian-10-set-up-openvpn-server-in-5-minutes/) • [Debian 8/9](https://www.cyberciti.biz/faq/install-configure-openvpn-server-on-debian-9-linux/) • [Ubuntu 18.04](https://www.cyberciti.biz/faq/ubuntu-18-04-lts-set-up-openvpn-server-in-5-minutes/) • [Ubuntu 20.04](https://www.cyberciti.biz/faq/ubuntu-20-04-lts-set-up-openvpn-server-in-5-minutes/)Package Manager[apk](https://www.cyberciti.biz/faq/10-alpine-linux-apk-command-examples/) • [apt](https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/)Processes Management[bg](https://www.cyberciti.biz/faq/unix-linux-bg-command-examples-usage-syntax/) • [chroot](https://www.cyberciti.biz/faq/unix-linux-chroot-command-examples-usage-syntax/) • [cron](https://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses/) • [disown](https://www.cyberciti.biz/faq/unix-linux-disown-command-examples-usage-syntax/) • [fg](https://www.cyberciti.biz/faq/unix-linux-fg-command-examples-usage-syntax/) • [jobs](https://www.cyberciti.biz/faq/unix-linux-jobs-command-examples-usage-syntax/) • [killall](https://www.cyberciti.biz/faq/unix-linux-killall-command-examples-usage-syntax/) • [kill](https://www.cyberciti.biz/faq/unix-kill-command-examples/) • [pidof](https://www.cyberciti.biz/faq/linux-pidof-command-examples-find-pid-of-program/) • [pstree](https://www.cyberciti.biz/faq/unix-linux-pstree-command-examples-shows-running-processestree/) • [pwdx](https://www.cyberciti.biz/faq/unix-linux-pwdx-command-examples-usage-syntax/) • [time](https://www.cyberciti.biz/faq/unix-linux-time-command-examples-usage-syntax/)Searching[grep](https://www.cyberciti.biz/faq/howto-use-grep-command-in-linux-unix/) • [whereis](https://www.cyberciti.biz/faq/unix-linux-whereis-command-examples-to-locate-binary/) • [which](https://www.cyberciti.biz/faq/unix-linux-which-command-examples-syntax-to-locate-programs/)User Information[groups](https://www.cyberciti.biz/faq/unix-linux-groups-command-examples-syntax-usage/) • [id](https://www.cyberciti.biz/faq/unix-linux-id-command-examples-usage-syntax/) • [lastcomm](https://www.cyberciti.biz/faq/linux-unix-lastcomm-command-examples-usage-syntax/) • [last](https://www.cyberciti.biz/faq/linux-unix-last-command-examples/) • [lid/libuser-lid](https://www.cyberciti.biz/faq/linux-lid-command-examples-syntax-usage/) • [logname](https://www.cyberciti.biz/faq/unix-linux-logname-command-examples-syntax-usage/) • [members](https://www.cyberciti.biz/faq/linux-members-command-examples-usage-syntax/) • [users](https://www.cyberciti.biz/faq/unix-linux-users-command-examples-syntax-usage/) • [whoami](https://www.cyberciti.biz/faq/unix-linux-whoami-command-examples-syntax-usage/) • [who](https://www.cyberciti.biz/faq/unix-linux-w-command-examples-syntax-usage-2/) • [w](https://www.cyberciti.biz/faq/unix-linux-w-command-examples-syntax-usage-2/)WireGuard VPN[Alpine](https://www.cyberciti.biz/faq/how-to-set-up-wireguard-vpn-server-on-alpine-linux/) • [CentOS 8](https://www.cyberciti.biz/faq/centos-8-set-up-wireguard-vpn-server/) • [Debian 10](https://www.cyberciti.biz/faq/debian-10-set-up-wireguard-vpn-server/) • [Firewall](https://www.cyberciti.biz/faq/how-to-set-up-wireguard-firewall-rules-in-linux/) • [Ubuntu 20.04](https://www.cyberciti.biz/faq/ubuntu-20-04-set-up-wireguard-vpn-server/)