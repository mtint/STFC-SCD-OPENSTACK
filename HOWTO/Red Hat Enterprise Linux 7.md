Saturday, 29 September 2018
---------------------------

### [nmcli examples RHEL 7](https://rhel7forfreshers.blogspot.com/2018/09/nmcli-examples-rhel-7.html)

**[Youtube Channel Videos](https://www.youtube.com/channel/UCTokWGbaUuvKl9a6NUgTrUg)**

**
****Example 1\. Listing available Wi-Fi APs**

$ nmcli device wifi list

 This command shows how to list available Wi-Fi networks (APs). You can also use --fields option for displaying different columns. nmcli -f all dev wifi list will show all of them.

**Example 2\. Showing general information and properties for a Wi-Fi interface**

$ nmcli -p -f general,wifi-properties device show wlan0
 ====================================
 Device details (wlan0)
 ====================================
 GENERAL.DEVICE: wlan0
 GENERAL.TYPE: wifi
 GENERAL.VENDOR: Intel Corporation
 GENERAL.PRODUCT: PRO/Wireless 5100 AGN [Shiloh] Network Connection
 GENERAL.DRIVER: iwlwifi
 GENERAL.DRIVER-VERSION: 3.8.13-100.fc17.x86\_64
 GENERAL.FIRMWARE-VERSION: 8.83.5.1 build 33692
 GENERAL.HWADDR: 00:1E:65:37:A1:D3
 GENERAL.MTU: 1500
 GENERAL.STATE: 100 (connected)
 GENERAL.REASON: 0 (No reason given)
 GENERAL.UDI: /sys/devices/pci0000:00/0000:00:1c.1/net/wlan0
 GENERAL.IP-IFACE: wlan0
 GENERAL.IS-SOFTWARE: no
 GENERAL.NM-MANAGED: yes
 GENERAL.AUTOCONNECT: yes
 GENERAL.FIRMWARE-MISSING: no
 GENERAL.CONNECTION: My Alfa WiFi
 GENERAL.CON-UUID: 85194f4c-d496-4eec-bae0-d880b4cbcf26
 GENERAL.CON-PATH: /org/freedesktop/NetworkManager/ActiveConnection/
 10
 ---------------------------------------------------------------------------
 WIFI-PROPERTIES.WEP: yes
 WIFI-PROPERTIES.WPA: yes
 WIFI-PROPERTIES.WPA2: yes
 WIFI-PROPERTIES.TKIP: yes
 WIFI-PROPERTIES.CCMP: yes
 WIFI-PROPERTIES.AP: no
 WIFI-PROPERTIES.ADHOC: yes
 ---------------------------------------------------------------------------

 This command shows information about a Wi-Fi device.

**Example 3\. Listing NetworkManager polkit permissions**

$ nmcli general permissions
 PERMISSION VALUE
 org.freedesktop.NetworkManager.enable-disable-network yes
 org.freedesktop.NetworkManager.enable-disable-wifi yes
 org.freedesktop.NetworkManager.enable-disable-wwan yes
 org.freedesktop.NetworkManager.enable-disable-wimax yes
 org.freedesktop.NetworkManager.sleep-wake no
 org.freedesktop.NetworkManager.network-control yes
 org.freedesktop.NetworkManager.wifi.share.protected yes
 org.freedesktop.NetworkManager.wifi.share.open yes
 org.freedesktop.NetworkManager.settings.modify.system yes
 org.freedesktop.NetworkManager.settings.modify.own yes
 org.freedesktop.NetworkManager.settings.modify.hostname auth
 org.freedesktop.NetworkManager.settings.modify.global-dns auth
 org.freedesktop.NetworkManager.reload auth

 This command shows configured polkit permissions for various NetworkManager operations. These permissions or actions (using polkit language) are configured by a system administrator and are not meant to be changed by users. The usual place for the polkit configuration is /usr/share/polkit-/actions/org.freedesktop.NetworkManager.policy. pkaction command can display description for polkit actions. pkaction --action-id org.freedesktop.NetworkManager.network-control --verbose

**Example 4\. Listing NetworkManager log level and domains**

$ nmcli general logging
This command shows current NetworkManager logging status.

**Example 5\. Changing NetworkManager logging**

$ nmcli g log level DEBUG domains CORE,ETHER,IP

$ nmcli g log level INFO domains DEFAULT

 The first command makes NetworkManager log in DEBUG level, and only for CORE, ETHER and IP domains. The second command restores the default logging state. Please refer to the NetworkManager.conf(5) manual page for available logging levels and domains.

**Example 6\. Adding a bonding master and two slave connection profiles**

$ nmcli con add type bond ifname mybond0 mode active-backup

$ nmcli con add type ethernet ifname eth1 master mybond0

$ nmcli con add type ethernet ifname eth2 master mybond0

 This example demonstrates adding a bond master connection and two slaves. The first command adds a master bond connection, naming the bonding interface mybond0 and using active-backup mode. The next two commands add slaves connections, both enslaved to mybond0\. The first slave will be bound to eth1 interface, the second to eth2.

**Example 7\. Adding a team master and two slave connection profiles**

$ nmcli con add type team con-name Team1 ifname Team1 config team1-master-json.conf

$ nmcli con add type ethernet con-name Team1-slave1 ifname em1 master Team1

$ nmcli con add type ethernet con-name Team1-slave2 ifname em2 master Team1

 This example demonstrates adding a team master connection profile and two slaves. It is very similar to the bonding example. The first command adds a master team profile, naming the team interface and the profile Team1\. The team configuration for the master is read from team1-master-json.conf file. Later, you can change the configuration with modify command (nmcli con modify Team1 team.config team1-master-another-json.conf). The last two commands add slaves profiles, both enslaved to Team1\. The first slave will be bound to em1 interface, the second to em2\. The slaves don't specify config and thus teamd will use its default configuration. You will activate the whole setup by activating both slaves:

$ nmcli con up Team1-slave1

$ nmcli con up Team1-slave2

 By default, the created profiles are marked for auto-activation. But if another connection has been activated on the device, the new profile won't activate automatically and you need to activate it manually.

**Example 8\. Adding a bridge and two slave profiles**

$ nmcli con add type bridge con-name TowerBridge ifname TowerBridge

$ nmcli con add type ethernet con-name br-slave-1 ifname ens3 master TowerBridge

$ nmcli con add type ethernet con-name br-slave-2 ifname ens4 master TowerBridge

$ nmcli con modify TowerBridge bridge.stp no

 This example demonstrates adding a bridge master connection and two slaves. The
 first command adds a master bridge connection, naming the bridge interface and
 the profile as TowerBridge. The next two commands add slaves profiles, both will
 be enslaved to TowerBridge. The first slave will be tied to ens3 interface, the
 second to ens4\. The last command will disable 802.1D STP for the TowerBridge
 profile.

**Example 9\. Adding an ethernet connection profile with manual IP configuration**

$ nmcli con add con-name my-con-em1 ifname em1 type ethernet \\ip4 192.168.100.100/24 gw4 192.168.100.1 ip4 1.2.3.4 ip6 abbe::cafe

$ nmcli con mod my-con-em1 ipv4.dns "8.8.8.8 8.8.4.4"

$ nmcli con mod my-con-em1 +ipv4.dns 1.2.3.4

$ nmcli con mod my-con-em1 ipv6.dns "2001:4860:4860::8888 2001:4860:4860::8844"

$ nmcli -p con show my-con-em1

 The first command adds an Ethernet connection profile named my-con-em1 that is bound to interface name em1\. The profile is configured with static IP addresses. Three addresses are added, two IPv4 addresses and one IPv6\. The first IP 192.168.100.100 has a prefix of 24 (netmask equivalent of 255.255.255.0). Gateway entry will become the default route if this profile is activated on em1 interface (and there is no connection with higher priority). The next two addresses do not specify a prefix, so a default prefix will be used, i.e. 32 for IPv4 and 128 for IPv6\. The second, third and fourth commands modify DNS parameters of the new connection profile. The last con show command displays the profile so that all parameters can be reviewed.

**Example 10\. Convenient field values retrieval for scripting**

$ nmcli -g ip4.address connection show my-con-eth0
 192.168.1.12/24

$ nmcli -g ip4.address,ip4.dns connection show my-con-eth0
 192.168.1.12/24
 192.168.1.1

$ nmcli -g ip4 connection show my-con-eth0
 IP4:192.168.1.12/24:192.168.1.1::192.168.1.1::

 This example shows retrieval of ip4 connection field values via the --get-values option. Multiple comma separated fields can be provided: they will be printed one per line. If a whole section is provided instead of a single field, the name of the section will be printed followed by all the related field values on the same line. See also --terse, --mode, --fields and --escape options in nmcli(1) manual page for more customized output.

**Example 11\. Escaping colon characters in tabular mode**

$ nmcli -t -f general -e yes -m tab dev show eth0

This example shows escaping colon characters in tabular mode. It may be useful for script processing, because ':' is used as a field separator.

**Example 12\. nmcli usage in a NetworkManager dispatcher script to make Ethernet and Wi-Fi mutually exclusive**
\#!/bin/bash
export LC\_ALL=C

enable\_disable\_wifi ()
 {
result=$(nmcli dev | grep "ethernet" | grep -w "connected")
 if [ -n "$result" ]; then
 nmcli radio wifi off
 else 
 nmcli radio wifi on
 fi
 }

if [ "$2" = "up" ]; then
 enable\_disable\_wifi
fi

if [ "$2" = "down" ]; then
 enable\_disable\_wifi
fi

 This dispatcher script makes Wi-Fi mutually exclusive with wired networking. When a wired interface is connected, Wi-Fi will be set to airplane mode (rfkilled). When the wired interface is disconnected, Wi-Fi will be turned back on. Name this script e.g. 70-wifi-wired-exclusive.sh and put it into /etc/NetworkManager/dispatcher.d/ directory. See NetworkManager(8) manual page for more information about NetworkManager dispatcher scripts.

 Example sessions of interactive connection editor

**Example 13\. Adding an ethernet connection profile in interactive editor (a)**
$ nmcli connection edit type ethernet

**Example: 192.168.1.5/24, 10.0.0.11/24**

nmcli ipv4.addresses\> set 192.168.1.100/24
 Do you also want to set 'ipv4.method' to 'manual'? [yes]: yes

nmcli ipv4.addresses\>

nmcli ipv4.addresses\> print addresses: 192.168.1.100/24

nmcli ipv4.addresses\> back
nmcli ipv4\> b
nmcli\> set ipv4.gateway 192.168.1.1
nmcli\> verify
Verify connection: OK
nmcli\> print
 ================================================
 Connection details
 ================================================
 connection.id: ethernet-4
 connection.uuid: de89cdeb-a3e1-4d53-8fa0-c22546c775f4
 connection.interface-name: --
 connection.type: 802-3-ethernet
 connection.autoconnect: yes
 connection.autoconnect-priority: 0
 connection.timestamp: 0
 connection.read-only: no
 connection.permissions:
 connection.zone: --
 connection.master: --
 connection.slave-type: --
 connection.secondaries:
 connection.gateway-ping-timeout: 0
 ---------------------------------------------------------------------------
 802-3-ethernet.port: --
 802-3-ethernet.speed: 0
 802-3-ethernet.duplex: --
 802-3-ethernet.auto-negotiate: yes
 802-3-ethernet.mac-address: --
 802-3-ethernet.cloned-mac-address: --
 802-3-ethernet.mac-address-blacklist:
 802-3-ethernet.mtu: 1492
 802-3-ethernet.s390-subchannels:
 802-3-ethernet.s390-nettype: --
 802-3-ethernet.s390-options:
 ---------------------------------------------------------------------------
 ipv4.method: manual
 ipv4.dns:
 ipv4.dns-search:
 ipv4.addresses: 192.168.1.100/24
 ipv4.gateway: 192.168.1.1
 ipv4.routes:
 ipv4.route-metric: -1
 ipv4.ignore-auto-routes: no
 ipv4.ignore-auto-dns: no
 ipv4.dhcp-client-id: --
 ipv4.dhcp-send-hostname: yes
 ipv4.dhcp-hostname: --
 ipv4.never-default: no
 ipv4.may-fail: yes
 ---------------------------------------------------------------------------
 ipv6.method: auto
 ipv6.dns:
 ipv6.dns-search:
 ipv6.addresses:
 ipv6.routes:
 ipv6.route-metric: -1
 ipv6.ignore-auto-routes: no
 ipv6.ignore-auto-dns: no
 ipv6.never-default: no
 ipv6.may-fail: yes
 ipv6.ip6-privacy: -1 (unknown)
 ipv6.dhcp-hostname: --
 ---------------------------------------------------------------------------
nmcli\> set ipv4.dns 8.8.8.8 8.8.4.4
nmcli\> print
 ==================================================
 Connection details
 ==================================================
 connection.id: ethernet-4
 connection.uuid: de89cdeb-a3e1-4d53-8fa0-c22546c775f4
 connection.interface-name: --
 connection.type: 802-3-ethernet
 connection.autoconnect: yes
 connection.autoconnect-priority: 0
 connection.timestamp: 0
 connection.read-only: no
 connection.permissions:
 connection.zone: --
 connection.master: --
 connection.slave-type: --
 connection.secondaries:
 connection.gateway-ping-timeout: 0
 ---------------------------------------------------------------------------
 802-3-ethernet.port: --
 802-3-ethernet.speed: 0
 802-3-ethernet.duplex: --
 802-3-ethernet.auto-negotiate: yes
 802-3-ethernet.mac-address: --
 802-3-ethernet.cloned-mac-address: --
 802-3-ethernet.mac-address-blacklist:
 802-3-ethernet.mtu: 1492
 802-3-ethernet.s390-subchannels:
 802-3-ethernet.s390-nettype: --
 802-3-ethernet.s390-options:
 ---------------------------------------------------------------------------
 ipv4.method: manual
 ipv4.dns: 8.8.8.8,8.8.4.4
 ipv4.dns-search:
 ipv4.addresses: 192.168.1.100/24
 ipv4.gateway: 192.168.1.1
 ipv4.routes:
 ipv4.route-metric: -1
 ipv4.ignore-auto-routes: no
 ipv4.ignore-auto-dns: no
 ipv4.dhcp-client-id: --
 ipv4.dhcp-send-hostname: yes
 ipv4.dhcp-hostname: --
 ipv4.never-default: no
 ipv4.may-fail: yes
 ---------------------------------------------------------------------------
 ipv6.method: auto
 ipv6.dns:
 ipv6.dns-search:
 ipv6.addresses:
 ipv6.gateway: --
 ipv6.routes:
 ipv6.route-metric: -1
 ipv6.ignore-auto-routes: no
 ipv6.ignore-auto-dns: no
 ipv6.never-default: no
 ipv6.may-fail: yes
 ipv6.ip6-privacy: -1 (unknown)
 ipv6.dhcp-hostname: --
 ---------------------------------------------------------------------------
nmcli\> verify
Verify connection: OK
nmcli\> save
Connection 'ethernet-4' (de89cdeb-a3e1-4d53-8fa0-c22546c775f4) successfully saved.
nmcli\> quit

 at [05:11:00](https://rhel7forfreshers.blogspot.com/2018/09/nmcli-examples-rhel-7.html)

Sunday, 19 August 2018
----------------------

### [CDH Installation using Cloudera Manager Command History](https://rhel7forfreshers.blogspot.com/2018/08/cdh-installation-using-cloudera-manager.html)

 CDH Installation using Cloudera Manager Command History

1\. Disable Transparent Huge Page (Add the Following Lines to /etc/rc.local file)
--In RHEL 6
[root@cdh-master ~]\# echo never \> /sys/kernel/mm/redhat\_transparent\_hugepage/enabled
[root@cdh-master ~]\# echo never \> /sys/kernel/mm/redhat\_transparent\_hugepage/defrag

--In RHEL 7
vi /etc/default/grub
GRUB\_CMDLINE\_LINUX="transparent\_hugepage=never"
grub2-mkconfig -o /boot/grub2/grub.cfg
shutdown -r now

2\. Change Virtual Machine Swappinnes
Open a file /etc/sysctl.conf and add the line vm.swappiness=10
Verify the same by listing contents of file /proc/sys/vm/swappiness

3\. Disable Firewall
systemctl stop firewalld/iptables/ip6tables
systemctl disable firewalld/iptables/ip6tables

service stop iptables
service stop ip6tables

chkconfig iptables off
chkconfig ip6tables off

4\. Disable SELinux 
Edit file /etc/selinux/config

SELINUX=disabled

Note: Reboot is required to take effect

5\. Assign Host Name
edit config file /etc/sysconfig/network
HOSTNAME=cdh-master.local

Update in /etc/hosts as well

192.168.1.5 cdh-master.local master
192.168.1.6 cdh-node1.local node1
192.168.1.7 cdh-node2.local node2
192.168.1.8 cdh-node3.local node3

6\. Install and Start NTP Service
yum -y install ntp
service ntpd start
chkconfig ntpd on

in RHEL 7
systemctl start ntpd
systemctl enable ntpd

Edit /etc/ntp.conf file and add NTP server address
ntpdate -u \<NTP Server IP/Name\>
ntpdate -q 0.rhel.pool.ntp.org

7\. Create Users and Groups
groupadd hadoop
useradd -g hadoop hduser

8\. Create SSH Key file and create passwordless connection between master and clients

\# ssh-keygen -t rsa

\# ssh-copy-id 192.168.1.6
root@192.168.1.6's password:
Now try logging into the machine, with "ssh '192.168.1.6'", and check in:

 .ssh/authorized\_keys

to make sure we haven't added extra keys that you weren't expecting.

Download Repo Tarball package
mkdir -p /var/www/html/cm/5.14.0/
cd /var/www/html/cm/5.14.0/
wget http://archive.cloudera.com/cm5/repo-as-tarball/5.14.0/cm5.14.0-centos7.tar.gz
tar -xvf cm5.14.0-centos7.tar.gz
yum install cloudera-manager-agent.x86\_64 cloudera-manager-server cloudera-manager-daemons.x86\_64 oracle-j2sdk1.7.x86\_64 enterprise-debuginfo.x86\_64

9\. Setting JAVA\_HOME Path

\# cat /etc/default/cloudera-scm-server

export JAVA\_HOME=/usr/java/jdk1.7.0\_67-cloudera/

10\. Install Custom Database MySQL

\# yum install -y mysql-server mysql-connector-java
\# chkconfig mysqld on
\# service mysqld start

-- run the Script to secure MySQL Access
/usr/bin/mysql\_secure\_installation

\# mysql -u root -pmysql
mysql\> create user 'temp'@'%' identified by 'temp' ;
Query OK, 0 rows affected (0.00 sec)

mysql\> grant all privileges on \*.\* to 'temp'@'%' with grant option ;
Query OK, 0 rows affected (0.00 sec)

--Initialize MySQL Database
[root@cdh-master ~]\# /usr/share/cmf/schema/scm\_prepare\_database.sh mysql -h localhost -u temp -ptemp --scm-host cdh-master.local scm temp temp

--After initialization verify database and its tables
mysql\> show databases;
+--------------------+
| Database |
+--------------------+
| information\_schema |
| mysql |
| scm |
+--------------------+
3 rows in set (0.00 sec)

mysql\> use scm;
Database changed
mysql\> show tables;
Empty set (0.00 sec)

mysql\> show tables;
+--------------------------------+
| Tables\_in\_scm |
+--------------------------------+
| AUDITS |
| CLIENT\_CONFIGS |
| CLIENT\_CONFIGS\_TO\_HOSTS |
| CLUSTERS |
| CLUSTERS\_AUD |
| CLUSTER\_ACTIVATED\_RELEASES |
| CLUSTER\_ACTIVATED\_RELEASES\_AUD |
| CLUSTER\_MANAGED\_RELEASES |
| CLUSTER\_UNDISTRIBUTED\_RELEASES |
| CM\_PEERS |
| CM\_VERSION |
| COMMANDS |
| COMMANDS\_DETAIL |
| COMMAND\_SCHEDULES |
| CONFIGS |
| CONFIGS\_AUD |
| CONFIG\_CONTAINERS |
| CREDENTIALS |
| DIAGNOSTICS\_EVENTS |
| EXTERNAL\_ACCOUNTS |
| EXTERNAL\_ACCOUNTS\_AUD |
| GLOBAL\_SETTINGS |
| HOSTS |
| HOSTS\_AUD |
| HOST\_TEMPLATES |
| HOST\_TEMPLATE\_TO\_ROLE\_CONF\_GRP |
| METRICS |
| PARCELS |
| PARCEL\_COMPONENTS |
| PROCESSES |
| PROCESSES\_DETAIL |
| PROCESS\_ACTIVE\_RELEASES |
| RELEASES |
| RELEASES\_AUD |
| REVISIONS |
| ROLES |
| ROLES\_AUD |
| ROLE\_CONFIG\_GROUPS |
| ROLE\_CONFIG\_GROUPS\_AUD |
| ROLE\_STALENESS\_STATUS |
| SCHEMA\_VERSION |
| SERVICES |
| SERVICES\_AUD |
| SNAPSHOT\_POLICIES |
| USERS |
| USER\_ROLES |
| USER\_SETTINGS |
+--------------------------------+
47 rows in set (0.00 sec)

vi /etc/cloudera-scm-agent/config.ini
server\_host=cdh-master.local

11\. Install Required Packages on Agents

\# yum install cloudera-manager-agent.x86\_64 cloudera-manager-daemons.x86\_64 oracle-j2sdk1.7.x86\_64 enterprise-debuginfo.x86\_64

-- Add CM Server Address in Agent configuration File
\# cat /etc/cloudera-scm-agent/config.ini
\# Hostname of the CM server.
server\_host=cdh-master.local

-- Start Agent Service on Node1
\# service cloudera-scm-agent start
\# chkconfig cloudera-scm-agent on
12\. Switch on CM Server Services and access Cloudera Manager

\# service cloudera-scm-server start
\# chkconfig cloudera-scm-server on

http://192.168.1.5:7180/cmf/login
admin
admin

Accept License Agreement
Click Continue
Click coniture
Select Hosts and Click Continue
Cluster Installation Page launches 

[root@cdh-master html]\# mkdir -p /var/www/html/parcels/cm/cdh5.14.0
[root@cdh-master html]\# ls
cm parcels
\# cd /var/www/html/parcels/cm/cdh5.14.0/
\# wget https://archive.cloudera.com/cdh5/parcels/5.14.0/CDH-5.14.0-1.cdh5.14.0.p0.24-el7.parcel
\# wget https://archive.cloudera.com/cdh5/parcels/5.14.0/manifest.json

\# mkdir -p /var/www/html/parcels/impala
\# cd /var/www/html/parcels/impala
\# wget https://archive.cloudera.com/impala/parcels/latest/IMPALA-2.1.0-1.impala2.0.0.p0.1995-el7.parcel
\# wget https://archive.cloudera.com/impala/parcels/latest/manifest.json

\# mkdir -p /var/www/html/parcels/kudu
\# mkdir -p /var/www/html/parcels/kudu
\# wget https://archive.cloudera.com/kudu/parcels/latest/KUDU-1.4.0-1.cdh5.12.2.p0.8-el7.parcel
\# wget https://archive.cloudera.com/kudu/parcels/latest/manifest.json

\# cd /var/www/html/parcels/accumulo/
\# wget https://archive.cloudera.com/accumulo/parcels/1.4/ACCUMULO-1.4.4-1.cdh4.5.0.p0.65-el7.parcel
\# wget https://archive.cloudera.com/accumulo/parcels/1.4/manifest.json

\# cd /var/www/html/parcels/kafka/
\# wget https://archive.cloudera.com/kafka/parcels/latest/KAFKA-3.1.0-1.3.1.0.p0.35-el7.parcel
\# wget https://archive.cloudera.com/kafka/parcels/latest/manifest.json

\# cd /var/www/html/parcels/spark/
\# wget https://archive.cloudera.com/spark/parcels/latest/SPARK-0.9.0-1.cdh4.6.0.p0.98-el7.parcel
\# wget https://archive.cloudera.com/spark/parcels/latest/manifest.json

\# cd /var/www/html/parcels/search/
\# wget https://archive.cloudera.com/search/parcels/latest/SOLR-1.3.0-1.cdh4.5.0.p0.9-el7.parcel
\# wget https://archive.cloudera.com/search/parcels/latest/manifest.json

\# cd /var/www/html/parcels/sqoop/
\# wget https://archive.cloudera.com/sqoop-connectors/parcels/latest/SQOOP\_NETEZZA\_CONNECTOR-1.5.1c5-el7.parcel
\# wget https://archive.cloudera.com/sqoop-connectors/parcels/latest/manifest.json

/var/www/html/
├── cm
│ ├── 5 -\> 5.14.0
│ ├── 5.14 -\> 5.14.0
│ ├── 5.14.0
│ │ ├── generated\_index.html
│ │ ├── mirrors
│ │ ├── repodata
│ │ │ ├── filelists.xml.gz
│ │ │ ├── filelists.xml.gz.asc
│ │ │ ├── generated\_index.html
│ │ │ ├── other.xml.gz
│ │ │ ├── other.xml.gz.asc
│ │ │ ├── primary.xml.gz
│ │ │ ├── primary.xml.gz.asc
│ │ │ ├── repomd.xml
│ │ │ └── repomd.xml.asc
│ │ └── RPMS
│ │ ├── generated\_index.html
│ │ ├── noarch
│ │ │ └── generated\_index.html
│ │ └── x86\_64
│ │ ├── cloudera-manager-agent-5.14.0-1.cm5140.p0.25.el7.x86\_64.rpm
│ │ ├── cloudera-manager-daemons-5.14.0-1.cm5140.p0.25.el7.x86\_64.rpm
│ │ ├── cloudera-manager-server-5.14.0-1.cm5140.p0.25.el7.x86\_64.rpm
│ │ ├── cloudera-manager-server-db-2-5.14.0-1.cm5140.p0.25.el7.x86\_64.rpm
│ │ ├── enterprise-debuginfo-5.14.0-1.cm5140.p0.25.el7.x86\_64.rpm
│ │ ├── generated\_index.html
│ │ ├── jdk-6u31-linux-amd64.rpm
│ │ └── oracle-j2sdk1.7-1.7.0+update67-1.x86\_64.rpm
│ ├── cloudera-cm.repo
│ ├── generated\_index.html
│ └── RPM-GPG-KEY-cloudera
└── parcels
 ├── accumulo
 │ ├── ACCUMULO-1.4.4-1.cdh4.5.0.p0.65-el7.parcel
 │ └── manifest.json
 ├── cm
 │ └── cdh5.14.0
 │ ├── CDH-5.14.0-1.cdh5.14.0.p0.24-el7.parcel
 │ └── manifest.json
 ├── impala
 │ ├── IMPALA-2.1.0-1.impala2.0.0.p0.1995-el7.parcel
 │ └── manifest.json
 ├── kafka
 │ ├── KAFKA-3.1.0-1.3.1.0.p0.35-el7.parcel
 │ └── manifest.json
 ├── kudu
 │ ├── KUDU-1.4.0-1.cdh5.12.2.p0.8-el7.parcel
 │ └── manifest.json
 ├── search
 │ ├── manifest.json
 │ ├── manifest.json.1
 │ └── SOLR-1.3.0-1.cdh4.5.0.p0.9-el7.parcel
 ├── spark
 │ ├── manifest.json
 │ └── SPARK-0.9.0-1.cdh4.6.0.p0.98-el7.parcel
 └── sqoop
 ├── manifest.json
 ├── SQOOP\_NETEZZA\_CONNECTOR-1.5.1c5-el7.parcel
 └── SQOOP\_TERADATA\_CONNECTOR-1.7c5-el7.parcel

18 directories, 42 files

Click **continue**

in Node1
\# yum install mysql-server mysql-connector-java -y
\# service mysqld start

\# mysql -u root -pmysql
mysql\> create user 'temp'@'%' identified by 'temp' ;
Query OK, 0 rows affected (0.00 sec)

[root@cdh-master parcel]\# mysql -u aravi -p
Enter password:
Welcome to the MariaDB monitor. Commands end with ; or \\g.
Your MariaDB connection id is 383
Server version: 5.5.56-MariaDB MariaDB Server

Copyright (c) 2000, 2017, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\\h' for help. Type '\\c' to clear the current input statement.

MariaDB [(none)]\> create database hive;
Query OK, 1 row affected (0.00 sec)

MariaDB [(none)]\> create database hue;
Query OK, 1 row affected (0.00 sec)

MariaDB [(none)]\> create database actm;
Query OK, 1 row affected (0.00 sec)

MariaDB [(none)]\> create database rptm;
Query OK, 1 row affected (0.00 sec)

MariaDB [(none)]\> create database oozie;
Query OK, 1 row affected (0.00 sec)

MariaDB [(none)]\> exit
Bye

### Each Node Side Configuration

Nodes command history
 1 exit
 2 vi /etc/hosts
 3 ssh-keygen -t rsa
 4 clear
 5 ssh-copy-id root@master
 6 clear
 7 ssh-copy-id root@node1
 8 ssh-copy-id root@node2
 9 clear
 10 vi /etc/selinux/config
 11 systemctl stop firewalld
 12 systemctl disable firewalld
 13 systemctl disable iptables
 14 systemctl disable ip6tables
 15 clear
 16 vi /etc/default/grub
 17 clear
 18 yum -y install ntp
 19 systemctl start ntpd
 20 systemctl enable ntpd
 21 clear
 22 reboot
 23 vi /etc/yum.repos.d/cloudera.repo
 24 yum install cloudera-manager-agent.x86\_64 cloudera-manager-daemons.x86\_64 oracle-j2sdk1.7.x86\_64 enterprise-debuginfo.x86\_64
 25 clear
 26 vi /etc/default/cloudera-scm-agent
 27 vi /etc/cloudera-scm-agent/config.ini
 28 service cloudera-scm-agent start
 29 chkconfig cloudera-scm-agent on
 30 clear
 31 echo never \> /sys/kernel/mm/transparent\_hugepage/enabled
 32 echo never \> /sys/kernel/mm/transparent\_hugepage/defrag
 33 vi /etc/sysctl.conf

 at [09:38:00](https://rhel7forfreshers.blogspot.com/2018/08/cdh-installation-using-cloudera-manager.html)

Thursday, 10 May 2018
---------------------

### [100 Linux Commands Video Tutorial Every Administrator Should Learn](https://rhel7forfreshers.blogspot.com/2018/05/100-linux-commands-video-tutorial-every.html)

**[For All the Videos](https://www.youtube.com/channel/UCHnizxsO2VXYmO9I2YwRTzQ?sub_confirmation=1)**

 arch - print machine hardware name (same as uname -m)
 arp - manipulate the system ARP cache
 at, batch, atq, atrm - queue, examine or delete jobs for later execution
 gawk - pattern scanning and processing language
 bc - An arbitrary precision calculator language
 blkid - locate/print block device attributes
 cal - display a calendar
 cat - concatenate files and print on the standard output
 bash, :, ., [, alias, bg, bind, break, builtin, caller, cd, command, compgen,
 chage - change user password expiry information
 chattr - change file attributes on a Linux file system
 chgrp - change group ownership
 chmod - change file mode bits
 chown - change file owner and group
 cp - copy files and directories
 cpio - copy files to and from archives
 crontab - maintains crontab files for individual users
 curl - transfer a URL
 cut - remove sections from each line of files
 date - print or set the system date and time
 dd - convert and copy a file
 df - report file system disk space usage
 diff - compare files line by line
 dig - DNS lookup utility
 du - estimate file space usage
 expr - evaluate expressions
 fdisk - manipulate disk partition table
 find - search for files in a directory hierarchy
 firewall-cmd - firewalld command line client
 free - Display amount of free and used memory in the system
 grep, egrep, fgrep - print lines matching a pattern
 head - output the first part of files
 bash, :, ., [, alias, bg, bind, break, builtin, caller, cd, command, compgen,
 hostname - show or set the system's host name
 id - print real and effective user and group IDs
 ifconfig - configure a network interface
 ip - show / manipulate routing, devices, policy routing and tunnels
 kill - terminate a process
 last, lastb - show listing of last logged in users
 less - opposite of more
 ln - make links between files
 ls - list directory contents
 lsof - list open files
 lspci - list all PCI devices
 man - an interface to the on-line reference manuals
 mkdir - make directories
 mount - mount a filesystem
 mv - move (rename) files
 netstat - Print network connections, routing tables, interface statistics, mas‐
 nice - run a program with modified scheduling priority
 nslookup - query Internet name servers interactively
 passwd - update user's authentication tokens
 pam\_tally2 - The login counter (tallying) module
 paste - merge lines of files
 ping - send ICMP ECHO\_REQUEST to network hosts
 perl - The Perl 5 language interpreter
 pgrep, pkill - look up or signal processes based on name and other attributes
 ps - report a snapshot of the current processes.
 pwd - print name of current/working directory
 halt, poweroff, reboot - Halt, power-off or reboot the machine
 rm - remove files or directories
 rpm - RPM Package Manager
 rsync - a fast, versatile, remote (and local) file-copying tool
 sed - stream editor for filtering and transforming text
 sort - sort lines of text files
 ss - another utility to investigate sockets
 sysctl - configure kernel parameters at runtime
 tail - output the last part of files
 tar - manual page for tar 1.26
 top - display Linux processes
 touch - change file timestamps
 tr - translate or delete characters
 uname - print system information
 uniq - report or omit repeated lines
 uptime - Tell how long the system has been running.
 useradd - create a new user or update default new user information
 vim - Vi IMproved, a programmers text editor
 vmstat - Report virtual memory statistics
 w - Show who is logged on and what they are doing.
 watch - execute a program periodically, showing output fullscreen
 wc - print newline, word, and byte counts for each file
 Wget - The non-interactive network downloader.
 yum - Yellowdog Updater Modified

 at [10:05:00](https://rhel7forfreshers.blogspot.com/2018/05/100-linux-commands-video-tutorial-every.html)

### [Arithmetic Operators | Shell Scripting Beginners Tutorial-34](https://rhel7forfreshers.blogspot.com/2018/05/arithmetic-operators-shell-scripting.html)

 at [08:49:00](https://rhel7forfreshers.blogspot.com/2018/05/arithmetic-operators-shell-scripting.html)

Friday, 18 August 2017
----------------------

### [Installing and Configuring Linux LVM with Multipath simple Steps ](https://rhel7forfreshers.blogspot.com/2017/08/installing-and-configuring-linux-lvm.html)

Configuring Multipath Linux LVM Steps.
--------------------------------------

\#To Install Multipath supportable RPM's
yum install -y device-mapper-multipath\*

\#Generate Sample Multipath Configuration
mpathconf --enable --user\_friendly\_names y

\#Start Multipathd Services
systemctl start multipathd.service

\#To Check Netapp SAN LUN Disks and Paths
sanlun lun show -p

\# Configure Multipath Alias
vim /etc/multipath.conf

\#check the Status of Configured Alias reflected 
multipath -v2

\# List Created Disk Paths
ls -al /dev/mapper/

\#Create Linux LVm Partition
fdisk /dev/mapper/DATA-DISK

\#Add Mapping to Partition
kpartx -a /dev/mapper/DATA-DISK

\#Create Physical Volume
pvcreate /dev/mapper/DATA-DISKp1

\#Create Volume Group
vgcreate ATE-PROD /dev/mpath/DATA-DISKp1 /dev/mpath/DATA-DISKp1

\#Create LV with 100% Free Space
lvcreate -n U03 -l 100%FREE DATAVG

\#File System Creation in Newly Created LVM
mkfs -t ext3 /dev/DATAVG/U03

\#Mount Permanently using fstab Entry
vi /etc/fstab

/dev/DATAVG/U03 /u03 ext3 defaults 1 2

 at [00:50:00](https://rhel7forfreshers.blogspot.com/2017/08/installing-and-configuring-linux-lvm.html)

Monday, 31 July 2017
--------------------

### [Java Update Guide Centos 7 / RHEL 7](https://rhel7forfreshers.blogspot.com/2017/07/java-update-guide-centos-7-rhel-7.html)

Java is a programming language and computing platform first released by Sun Microsystems in 1995\. There are lots of applications and websites that will not work unless you have Java installed, and more are created every day. Java is fast, secure, and reliable. From laptops to data centers, game consoles to scientific supercomputers, cell phones to the Internet, Java is everywhere!

\# java -version
java version "1.7.0\_141"
OpenJDK Runtime Environment (rhel-2.6.10.1.el7\_3-x86\_64 u141-b02)
OpenJDK 64-Bit Server VM (build 24.141-b02, mixed mode)

32 Bit Java Download Link
\# wget --no-cookies --no-check-certificate --header "Cookie: gpw\_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-i586.tar.gz"

64 Java Download Linux
\# wget --no-cookies --no-check-certificate --header "Cookie: gpw\_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz"

\# du -sh jdk-8u144-linux-x64.tar.gz
177M jdk-8u144-linux-x64.tar.gz
\# tar -xvf jdk-8u144-linux-x64.tar.gz

[root@Arkit-Serv java]\# update-alternatives --install /usr/bin/java java /opt/java/jdk1.8.0\_144/bin/java 100
[root@Arkit-Serv java]\# update-alternatives --config java

There are 3 programs which provide 'java'.

 Selection Command
-----------------------------------------------
\*+ 1 java-1.7.0-openjdk.x86\_64 (/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.141-2.6.10.1.el7\_3.x86\_64/jre/bin/java)
 2 /usr/java/jdk1.8.0\_144/jre/bin/java
 3 /opt/java/jdk1.8.0\_144/bin/java

Enter to keep the current selection[+], or type selection number: 3

[root@Arkit-Serv java]\# export JAVA\_HOME=/opt/java/jdk1.8.0\_144/
[root@Arkit-Serv java]\# export JRE\_HOME=/opt/java/jdk1.8.0\_144/jre
[root@Arkit-Serv java]\# export PATH=$PATH:/opt/java/jdk1.8.0\_144/bin:/opt/java/jdk1.8.0\_144/jre/bin

\# java -version
java version "1.8.0\_144"
Java(TM) SE Runtime Environment (build 1.8.0\_144-b01)
Java HotSpot(TM) 64-Bit Server VM (build 25.144-b01, mixed mode)

That's it Java Updated.

 at [01:35:00](https://rhel7forfreshers.blogspot.com/2017/07/java-update-guide-centos-7-rhel-7.html)

Monday, 24 July 2017
--------------------

### [Free Python Programming E-Books Download](https://rhel7forfreshers.blogspot.com/2017/07/free-python-programming-e-books-download.html)

Download and Learn 3 Python Programming Books Completely Free

1. Drive Into Python – Written by Mark Pilgrim [Download Now](https://arkit-in.tradepub.com/free/w_dive01/)
2. Learning Python – Written by Fabrizio Romano [Download Now](https://arkit-in.tradepub.com/free/w_pacb45/)
3. Python Cook Book – Written by Sebastian [Download Now](https://arkit-in.tradepub.com/free/w_webd07/)

Of course you have to fill Details and Click Download you will get to your Email Directly.

Just Spending one Minute of time instead of paying a few dollars of money

Best of Luck Learn Python Programming Freely with your own learning curve

[![](https://4.bp.blogspot.com/-_kM7xdIs-V8/WXX42hCGPaI/AAAAAAAAA5w/M9gmSC4ExuMt2cMiL4jVH0WsTArXzIPswCLcBGAs/s320/3%252BPython%252BProgramming%252BBooks.png)](https://4.bp.blogspot.com/-_kM7xdIs-V8/WXX42hCGPaI/AAAAAAAAA5w/M9gmSC4ExuMt2cMiL4jVH0WsTArXzIPswCLcBGAs/s1600/3%252BPython%252BProgramming%252BBooks.png)

 at [06:40:00](https://rhel7forfreshers.blogspot.com/2017/07/free-python-programming-e-books-download.html)

Thursday, 20 July 2017
----------------------

### [Failed To Load SELINUX policy. Freezing error after reboot on Centos 7/RHEL7?](https://rhel7forfreshers.blogspot.com/2017/07/failed-to-load-selinux-policy-freezing.html)

system[1]: Failed to load SELinux policy. Freezing error after reboot on Centos 7/RHEL7?

 Most of the time you will get this error "while resetting the root password". That means you are not correctly reset the root password (or) mismatch words in the "touch /.autorelabel" command.

"touch /.autorelabel" --\> create an hidden file under the slash which means SELinux will automatically relabel the SELinux policy when server is booting

[![](https://4.bp.blogspot.com/-u3ah6Y6c6MA/WXGWY8sVyLI/AAAAAAAAA5c/1QhSiPb1cFcYb1_gKr0RthUQtxuVD4C2wCLcBGAs/s320/Capture2.PNG)](https://4.bp.blogspot.com/-u3ah6Y6c6MA/WXGWY8sVyLI/AAAAAAAAA5c/1QhSiPb1cFcYb1_gKr0RthUQtxuVD4C2wCLcBGAs/s1600/Capture2.PNG)SELinux Load Error

1) Reboot your machine

2) Loading boot menu then press key to stop the boot menu, edit(press 'e') kernel line.

[![](https://2.bp.blogspot.com/-1_NtvNcpBI4/WXGWYjjxe2I/AAAAAAAAA5Y/ouG60vO0b18D3NRhXJXueYxxVmVqqku1wCLcBGAs/s320/Capture3.PNG)](https://2.bp.blogspot.com/-1_NtvNcpBI4/WXGWYjjxe2I/AAAAAAAAA5Y/ouG60vO0b18D3NRhXJXueYxxVmVqqku1wCLcBGAs/s1600/Capture3.PNG)Change String SELInux

3) Goto "linux16" word and append the word "selinux=0".

4) reboot the server.

That't it.

 at [22:54:00](https://rhel7forfreshers.blogspot.com/2017/07/failed-to-load-selinux-policy-freezing.html)

### [Installing nagios core got error - Resolution](https://rhel7forfreshers.blogspot.com/2017/07/installing-nagios-core-got-error.html)

 While installing nagios core got error make all command on RHEL7/centos 7: 

while installing nagios core on RHEL7 got the issue that is "(cd angularjs && unzip -u angular-1.3.9.zip),/bin/sh: unzip: command not found". The error occur after enter the command make all . On my server have already installed gcc so the error was coming from some other dependency requirement.

[root@serverx nagios-4.1.1]\# make all
gcc -Wall -I.. -g -O2 -DHAVE\_CONFIG\_H -DNSCORE -o nagiostats nagiostats.c -lm ../lib/libnagios.a
make[1]: Leaving directory `/tmp/nagios-4.1.1/base'
cd ./cgi && make
make[1]: Entering directory `/tmp/nagios-4.1.1/cgi'
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/tmp/nagios-4.1.1/cgi'
cd ./html && make
make[1]: Entering directory `/tmp/nagios-4.1.1/html'
(cd angularjs && unzip -u angular-1.3.9.zip)
/bin/sh: unzip: command not found
make[1]: \* [all] Error 127
make[1]: Leaving directory `/tmp/nagios-4.1.1/html'
make: \* [all] Error 2
[root@serverx nagios-4.1.1]\#

Observed the above error i.e "unzip command not fund", Installed the unzip package by following below command

\# yum install -y unzip

After installed the unzip package, rerun the configure command issue has been resolved.

That's it.

 at [09:34:00](https://rhel7forfreshers.blogspot.com/2017/07/installing-nagios-core-got-error.html)

Saturday, 25 February 2017
--------------------------

### [RHEL7 installation Kickstart File](https://rhel7forfreshers.blogspot.com/2017/02/rhel7-installation-kickstart-file.html)

I have made Kickstart (Auto Answer File) Using Kcikstart configuration generator tool with LVM partitioning included

[root@ArkIT ~]\#cat ks.cfg 
\#platform=x86, AMD64, or Intel EM64T
\#version=DEVEL
\# Install OS instead of upgrade
install
\# Keyboard layouts
keyboard 'us'\# Reboot after installation
reboot
\# Root password
rootpw --iscrypted $1$tS7oWXXF$X.HS5njtcfPpxHgW9pFtX.
\# System timezone
timezone Africa/Abidjan
\# Use network installation
url --url="http://192.168.4.27/rhel7"
\# System language
lang en\_US
\# Firewall configuration
firewall --disabled
\# Network information
network --bootproto=dhcp --device=eth0
\# System authorization information
auth --useshadow --passalgo=sha512
\# Use graphical install
graphical
\# Run the Setup Agent on first boot
firstboot --enable
\# SELinux configuration
selinux --disabled

\# System bootloader configuration
bootloader --location=mbr
\# Clear the Master Boot Record
zerombr
\# Partition clearing information
clearpart --all --initlabel
volgroup rhel --pesize=4096 PV0
part PV0 --fstype=lvmpv --ondisk=sda --size=50000
part /boot --fstype=xfs --size=500
logvol / --vgname=rhel --name=root --fstype=xfs --size=10000
logvol /var --vgname=rhel --name=var --fstype=xfs --size=8000
logvol swap --vgname=rhel --name=swap --fstype=swap --size=8000
logvol /home --vgname=rhel --name=home --fstype=xfs --size=7000
logvol /usr --vgname=rhel --name=usr --fstype=xfs --size=7000

%packages
@base
@core
@desktop-debugging
@dial-up
@fonts
@gnome-desktop
@guest-agents
@guest-desktop-agents
@input-methods
@internet-browser
@mariadb
@multimedia
@print-client
@x11
kexec-tools

%end

%post
useradd ravi
echo password | passwd ravi
%end

 at [02:10:00](https://rhel7forfreshers.blogspot.com/2017/02/rhel7-installation-kickstart-file.html)

Thursday, 19 January 2017
-------------------------

### [A Major Difference Between RHEL 6 vs RHEL 7 Here you go](https://rhel7forfreshers.blogspot.com/2017/01/a-major-difference-between-rhel-6-vs.html)

RHEL 7 vs RHEL 6 
-----------------

Red Hat Enterprise Linux 7 is an Light weight and minimized Operating system. RHEL 7 changes are huge effect to enterprise.

Let's see what changed in RHEL 7 as per administration prospective.

* First one is Anaconda Installer Completely new.
* Grub version updated from 0.97 to Grub 2 fast booting
* Procedure of bypassing root password at booting process completely different than RHEL 6/5
* There is no SysV Initd in RHEL 7 it's an new Systemd
* Run Levels are changed to Targets.
* Default file system in RHEL 7 is XFS. XFS file system supports 550TB of each partition size in 64-bit.
* Directories /bin /sbin /lib and /lib64 are moved under /usr/
* Network Interface Names are changed from eth0 to ens.xxx
* New concept to create multiple profiles top of one Ethernet card, No need of changing IP addresses and settings every time when you connect different networks, simply activate different profile.
* GNOME version changed from 2 to 3
* No classic registration system, completely changed to Red Hat subscription Manager
* Default database is MariaDB instead of MySQL
* Cluster Manager has been changed to Pacemaker and Corosync
* Ifconfig command is deprecated, replaced with ip command
* User Identification Numbers (UID's) changed from 500 to 1000, which means when you create new normal user in RHEL 7 will get UID from 1000 to 65534
* locate command is changed to mlocate
* yum commands are changed little bit

Feature NameRHEL 6 RHEL 7Default File SystemExt4XFSKernel Version2.6.xx3.10.xxRelease NameSantiagoMaipoGnome VersionGNOME 2GNOME 3.8KDE Version4.64.1Release Date10-Nov-1010-Jun-14NFS VersionNFS 4NFS 4.1\. NFS V2 is deprecated in RHEL 7Samba Version3.64.4Default DatabaseMariaDBMySQLCluster Resource ManagerRgmanagerPacemakerNetwork GroupingTeam Driver will support multiple types of Teaming methods called Active-Backup, Load-balancing and BroadcaseBonding can be done as Active-Backup, XOR, IEEE and Loac BalancingKDUMPRHEL 7 can be supported up to 3TBKdump does't support with large RAM SizeBoot LoaderGrub 2 
 /boot/grub2/grub.cfgGrub 0.97
 /boot/grub/grub.confFile System Checkxfs\_replair 
 - Inode blockmap checks
 -Inode allocation map checks
 -Inode size check
 -Directory check
 -Path Name check
 -Link count check
 -Freemap check
 -Super block checke2fsck
 -Inode check. Block and size check
 --Directory Structure check
 -Directory Link Check
 -reference count check
 -Group Summary CheckProcess IDSystemd (1)Initd (1)Port SecurityFirewalld instead of iptables. Iptables can also support with RHEL 7, but we can't use both of them at the same time. Firewall will not allow any port until and unless you enabled it.iptables by default service port is enabled when service is switched on.Boot Time40 Sec20 SecFile System SizeEXT4 16TB with XFS 100TBXFS 500TB with EXT4 16TBProcessor Architecture32Bit and 64BitOnly 64Bit.Network Configuration ToolsteupnmtuiHostname Config File/etc/sysconfig/network/etc/hostname No need to edit hostname file to write permanent hostname simply use hostnamectl commandInterface Nameeth0ens33xxxManaging Servicesservice sshd start
 service sshd restart
 chkconfig sshd onsystemctl start sshd.service
 systemctl restart sshd.service
 systemctl enable sshd.serviceSystem Logs/var/log//var/log
 journalctlRun Levelsrunlevel 0 - Power Off
 runlevel 1 - Single User Mode
 runlevel 2 - Multi User without Networking
 runlevel 3 - Multi User CLI
 runlevel 4 - Not USed
 runlevel 5 - GUI Mode
 runlevel 6 - RestartThere is no run levels in RHEL 6\. Run levels are called as targets
 Poweroff.target
 rescue.target
 multi-user.target
 graphical.target
 reboot.targetUID InformationNormal User UID will start from 500 to 65534
 System Users UID will start from 1 to 499Normal User UID start from 1000 - 65534
 System Users UID will start from 1 to 999

 Because Services are increased compare to RHEL 6By Pass Root Password Promptappend 1 or s or init=/bin/bash to Kernel command lineAppend rd.break or init=/bin/bash to kernel command lineRebooting and Poweroffpoweroff - init 0
 reboot - init 6systemctl poweroff
 systemctl rebootYUM Commandsyum groupinstall
 yum groupinfoyum group install
 yum group info

Thanks, please provide your valuable feedback on the same. 

 at [21:18:00](https://rhel7forfreshers.blogspot.com/2017/01/a-major-difference-between-rhel-6-vs.html)