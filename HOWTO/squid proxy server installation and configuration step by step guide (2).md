squid proxy server is used to filter web traffic and reducing and fine tuning internet bandwidth.

Squid was originally developed as the Harvest object cache, part of the Harvest project at the University of Colorado Boulder. Further work on the program was completed at the University of California, San Diego and funded via two grants from the National Science Foundation. Duane Wessels forked the “last pre-commercial version of Harvest” and renamed it to Squid to avoid confusion with the commercial fork called Cached 2.0, which became NetCache. Squid version 1.0.0 was released in July 1996.

Squid is now developed almost exclusively through volunteer efforts.

Squid Proxy Server
------------------

* **Packages :** squid\*
* **Service Name:** squid
* **Default port :** 3128
* **Config File :** /etc/squid/squid.conf
* **Log file Path:** /var/log/squid
* **Environment :** RHEL 7, Centos 7 and RHEL 6

**Installation Required packages**

    # yum install squid*

Enable and start the Service
----------------------------

    # systemctl enable squid
    # systemctl start squid

**Allow firewall port of squid**

    [root@server ~]# firewall-cmd --permanent --add-port=3128/tcp
    success
    [root@server ~]# firewall-cmd --reload
    success

Default port of squid proxy is 3128 that’s why we have to allow port 3128.

Access Control List 
--------------------

Open the configuration file and write the ACL as per requirement in ACL we can do so many things

1. Restricting un-wanted (BAD) URL’s
2. Restrict access to internet based on time period
3. Control Downloads
4. Restrict file type downloads
5. Allow Networks to enable Internet access
6. Download speed control

    [root@server ~]# vim /etc/squid/squid.conf

To allow Network we have to write below ACL lines

    acl localnet src 192.168.4.0/24 
    http_access allow localnet

To allow ports using ACL

    acl Safe_ports port 80 # http
    acl Safe_ports port 21 # ftp
    acl Safe_ports port 443 # https
    acl Safe_ports port 70 # gopher
    acl Safe_ports port 210 # wais
    acl Safe_ports port 1025-65535 # unregistered ports
    acl Safe_ports port 280 # http-mgmt
    acl Safe_ports port 488 # gss-http
    acl Safe_ports port 591 # filemaker
    acl Safe_ports port 777 # multiling http

    http_access deny !Safe_ports

Block bad sites

    acl badsites url_regex "/etc/squid/badsites"
    http_access deny badsites

write the bad sites in the file

    # cat /etc/squid/badsites
    .facebook.com
    .twitter.com
    .youtube.com
    .linkedin
    .msn.com
    .myspace.com
    .flickr.com
    .google

Block File downloads

    acl blockfiles urlpath_regex "/etc/squid/blockfiles.acl"
    http_access deny blockfiles

Block file type downloads, below is the example file to deny mp3, mp4, flv avi, 3gp, mpg and mpeg.

    # cat /etc/squid/blockfiles.acl
    \.torrent$
    \.mp3.*$
    \.mp4.*$
    \.3gp.*$
    \.[Aa][Vv][Ii]$
    \.[Mm][Pp][Gg]$
    \.[Mm][Pp][Ee][Gg]$
    \.[Mm][Pp]3$
    \.[Ff][Ll][Vv].*$

Time based access, which deny internet access from morning 10 Hours to 19 Hours

    acl work_hours time 10:00-19:00 
    http_access deny work_hours

restricting download speed ACL

    acl speedcontrol src 192.168.4.0/24
    delay_pools 1
    delay_class 1 2
    delay_parameters 1 524288/524288 52428/52428
    delay_access 1 allow speedcontrol

Go to Client Side
-----------------

Change the proxy address in your browser then try to access the website
** IE Settings** \> **Internet options** \> **Connections** \> **Lan Settings** \>

[![download](http://arkit.co.in/wp-content/uploads/2016/04/download-300x277.png)](http://arkit.co.in/wp-content/uploads/2016/04/download.png)

provide IP address and port number

Now see the logs watch the squid logs
 /var/log/squid/ log file directory

The logs are a valuable source of information about Squid workloads and performance. The logs record not only access information, but also system configuration errors and resource consumption (eg, memory, disk space). There are several log file maintained by Squid. Some have to be explicitly activated during compile time, others can safely be deactivated during.

* **/var/log/squid/access.log :** Most log file analysis program are based on the entries in access.log. You can use this file to find out who is using squid server and what they are doing etc
* **/var/log/squid/cache.log :** The cache.log file contains the debug and error messages that Squid generates. If you start your Squid using the default RunCache script, or start it with the -s command line option, a copy of certain messages will go into your syslog facilities. It is a matter of personal preferences to use a separate file for the squid log data.
* **/var/log/squid/store.log : **The store.log file covers the objects currently kept on disk or removed ones. As a kind of transaction log it is ususally used for debugging purposes. A definitive statement, whether an object resides on your disks is only possible after analysing the complete log file. The release (deletion) of an object may be logged at a later time than the swap out (save to disk).

HOW DO I VIEW SQUID LOG FILES / LOGS?
-------------------------------------

You can use standard UNIX / Linux command such as grep / tail to view log files. You must login as root or sudo command to view log files.

Display log files in real time

**Use tail command as follows:**

    ~]# tail -f /var/log/squid/access.log

    OR

    ~]$ sudo tail -f /var/log/squid/access.log

**Search log files**
Use grep command as follows: 

    ~]#grep 'string-to-search' /var/log/squid/access.log

[That’s about](https://www.youtube.com/channel/UCTokWGbaUuvKl9a6NUgTrUg?sub_confirmation=1) squid proxy server installation and configuration

Related Articles
----------------

* [Installation and configuration of FTP server in RHEL7](https://arkit.co.in/installation-and-configuration-ftp/)
* [Collect system information using shell script in second](https://arkit.co.in/gather-contact-information-of-each-host-and-service-in-nagios/)
* [Time server installation and configuration](https://arkit.co.in/configure-ntp/)
* [Audit Linux Machine Extremely helpfull](https://arkit.co.in/generating-linux-audit-reports/)
* [Network File system shares configuration NFS](https://arkit.co.in/kerberized-nfs-server-linux/)
* [Maria DB installation alternate to MySQL](https://arkit.co.in/install-mariadb-10-2-rhel-7/)
* [Firewalld Installation and Configuration RHEL7](https://arkit.co.in/firewalld-installation-configuration-rhel-7/)
* [Analyse server performance RHEL7](https://arkit.co.in/linux-machine-performance-monitoring-vmstat/)

**Search Strings**

squid proxy server installation and configuration

squid proxy in rhel7

restricted internet access using proxy

control internet download speed

URL Filtering using Linux proxy server

**Thanks for your wonderful Support and Encouragement **

* [Get Email](https://feedburner.google.com/fb/a/mailverify?uri=arkit) | [Download E-Books](https://arkit-in.tradepub.com/)
* [Facebook Page](https://www.facebook.com/Linuxarkit)
* [Youtube Channel](https://www.youtube.com/Techarkit?sub_confirmation=1)
* [Twitter](https://twitter.com/aravikumar48)
* [Exclusive Telegram Group](https://t.me/Linuxarkit)
* [Discuss On WhatsApp Group](https://github.com/techarkit/TechArkit-YouTube/blob/master/whatsapp_group.md)

More than 40000 Techies in our community do you want part of it Join Now