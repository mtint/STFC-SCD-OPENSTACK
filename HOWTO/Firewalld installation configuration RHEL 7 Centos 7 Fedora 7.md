We always say that Linux is more secure than other Operating Systems, in the way to provide port level security FirewallD is the best application. In Previous Linux versions we used iptables to provide port level security. Newer Linux versions firewalld is introduced with great features and enhancements. Actual background of iptables and firewalld works based on ipchains which are kernel inbuilt module. We are going to see firewalld installation configuration RHEL 7 port level security. IPtables are absolute.

**What is mean by port level security..?**
------------------------------------------

Now a days security plays major role in protecting the servers and its data from theft. A simple way to do packet filtering using firewalld inbuilt application. Allow / Deny incoming connections by writing firewall rules. In newer version of Linux such as RHEL 7 / Centos 7 and Fedora Firewall by default disables the port communication to clients except allowed.

1. Rich Language for specific firewall rules.
2. D-Bus API.
3. Timed firewall rules.
4. IPv4 and IPv6 NAT support.
5. Create difference Firewall zones.
6. Integration with Puppet.
7. Direct interface.
8. IP set support.
9. Simple log of denied packets.
10. Automatic loading of Linux kernel modules.
11. Lock down: White listing of applications that may modify the firewall.
12. Allow / Deny specified ports
13. Allow / Deny Specified Services (No need to remember service port number)

FirewallD is available in GUI and CLI as well, CLI tool is firewall-cmd. Using firewall we can allow particular port to particular network / IP Address, we can also deny particular port for particular network / IP address.

**Note:** Do not use default port numbers to increase the security

[![Firewalld Installation and Configuration on RHEL 7 port level security](https://arkit.co.in/wp-content/uploads/2016/06/Firewalld-Installation-and-Configuration-on-RHEL-7-port-level-security-300x150.png)](https://arkit.co.in/wp-content/uploads/2016/06/Firewalld-Installation-and-Configuration-on-RHEL-7-port-level-security.png)

Firewalld Installation and Configuration on RHEL 7 port level security

In order to use firewalld as a default we have to disable iptables and ip6tables permanently to disable permanently do below steps, Stop services, Disable services and mask services. When you add mask to service if any other administrator tyring to start the services will not start until service need to be unmask.

**Step 1: Disable iptables & ip6tables services**

iptables are obsolete, instead of iptables we have to use firewalld in new versions of Linux such as RHEL 7 / Centos 7 and Fedora 24 

    [root@server ~]# systemctl disable iptables
    [root@server ~]# systemctl disable ip6tables

**Step 2: Stop Iptables & ip6tables services**

    [root@server ~]# systemctl stop ip6tables
    [root@server ~]# systemctl stop iptables

**Step 3: Mask Iptables & ip6tables services**

Disabling service and Stopping service will help us to keep services in stop state but later if you start services will start. If we add mask to service unfortunately if you try to start the service also service will not start until service need to be unmask

    [root@server ~]# systemctl mask ip6tables
    ln -s '/dev/null' '/etc/systemd/system/ip6tables.service'

    [root@server ~]# systemctl mask iptables
    ln -s '/dev/null' '/etc/systemd/system/iptables.service'

    [root@server ~]# systemctl status iptables
    iptables.service
     Loaded: masked (/dev/null)
     Active: inactive (dead)

    [root@server ~]# systemctl status ip6tables
    ip6tables.service
     Loaded: masked (/dev/null)
     Active: inactive (dead)

Firewalld Installation configuration RHEL 7 /Centos 7 and Fedora
----------------------------------------------------------------

Packages for firewall will be included in installation media itself no need to configure external repositories, if you want you can also configure [EPEL repository](https://arkit.co.in/linux/epel-repository/) OR Local repository

**Step 4: Install packages using yum command**

    [root@Server ~]# yum install -y firewalld firewall-config

Verify the status of firewall service using below command, If it is in stop status then Enable and Start

    [root@server ~]# systemctl status firewalld

    [root@server ~]# systemctl enable firewalld.service
    ln -s '/usr/lib/systemd/system/firewalld.service' '/etc/systemd/system/dbus-org.fedoraproject.FirewallD1.service'
    ln -s '/usr/lib/systemd/system/firewalld.service' '/etc/systemd/system/basic.target.wants/firewalld.service'

    [root@server ~]# systemctl start firewalld.service

**Step 5: Check your default zone and active zone**

    [root@server ~]# firewall-cmd --get-default-zone
    public

As per above output public is the default zone we can also set other zone as default. Using multiple zones we can mange firewall rules in very flexible way. As a Example when we change machine network we can just change default zone to other so that default zone rules will be applicable. Yet any point of time one zone should be in active. firewalld installation configuration rhel 7

**Step 6: Change Default Zone & verify active zone**

    [root@server ~]# firewall-cmd --set-default-zone=home
    success
    [root@server ~]# firewall-cmd --get-default-zone
    home
    [root@server ~]# firewall-cmd --get-active-zones
    public
     interfaces: eno16777736

Step 7: check firewall version
------------------------------

    [root@server ~]# firewall-cmd --version
    0.3.9

**Step 8: List out interfaces in zone**

check how many interfaces are associated with zone

    [root@server ~]# firewall-cmd --zone=public --list-interfaces
    eno16777736

**Step 9: Add new interface to Zone****
**

    [root@server ~]# firewall-cmd --add-interface=eth0 --zone=public
    success

**Step 10: Remove Interface from Zone**

    [root@server ~]# firewall-cmd --remove-interface=eth0 --zone=public
    success

**Step 11: List out currently loaded services on firewall**

    [root@server ~]# firewall-cmd --get-services
    RH-Satellite-6 amanda-client bacula bacula-client dhcp dhcpv6 dhcpv6-client dns

    [root@server ~]# firewall-cmd --permanent --get-services

**Step 12: To drop all incoming and out going packets**

    [root@server ~]# firewall-cmd --panic-on    [Disable incoming and out going packets]

    [root@server ~]# firewall-cmd --panic-off   [Enable incoming out going packets]

    [root@server ~]# firewall-cmd --query-panic  [check panic mode is enabled or disabled]

**Note:** Do not try above command in any production servers because it will disable all the communication

List all open ports, add/allow ports and remove/deny ports using firewalld in RHEL 7\. We can add / remove ports to default zone are specified zone. After every add / remove we have to reload firewalld services to take effect.

**Step 13: List all ports and Services & List all ports from specified zone **

    [root@server ~]# firewall-cmd --list-all  [List all open ports, services and all]
    public (default, active)
     interfaces: eno16777736
     sources:
     services: dhcpv6-client mysql ssh
     ports: 5666/tcp 3306/tcp 3260/tcp 5667/tcp
     masquerade: no
     forward-ports:
     icmp-blocks:
     rich rules:

    [root@server ~]# firewall-cmd --zone=public --list-ports  
    5666/tcp 3306/tcp 3260/tcp 5667/tcp

**Step 14: Add & Remove Ports to firewall rules**

    [root@server ~]# firewall-cmd --permanent --add-port=22/tcp  
    success

    [root@server ~]# firewall-cmd --permanent --zone=public --add-port=22/tcp 
    success

    [root@server ~]# firewall-cmd --zone=public --list-ports  
    5666/tcp 3306/tcp 3260/tcp 5667/tcp 22/tcp

    [root@server ~]# firewall-cmd --permanent --remove-port=22/tcp  
    success

Adding and Removing services to the firewall. By default when you add / remove service to firewall it will enable associated port in background

**Step 15: List, Add & Remove Services to firewall rules**

    [root@server ~]# firewall-cmd --list-services 
    dhcpv6-client mysql ssh

    [root@server ~]# firewall-cmd --list-services --zone=public 
    dhcpv6-client mysql ssh

    [root@server ~]# firewall-cmd --permanent --zone=public --add-service=http   
    success

    [root@server ~]# firewall-cmd --permanent --add-service=https  
    success

    [root@server ~]# firewall-cmd --list-services --zone=public 
    dhcpv6-client http https mysql ssh

Step 16: Firewalld configuring ports / services using XML file
--------------------------------------------------------------

Adding and removing services/ports using XML file default file path is **“/etc/firewalld/zones/public.xml”**

    [root@server ~]# cat /etc/firewalld/zones/public.xml
    <?xml version="1.0" encoding="utf-8"?>
    <zone>
     <short>Public</short>
     <description>Pulic Zone Rules</description>
     <service name="dhcpv6-client"/>
     <service name="http"/>
     <service name="ssh"/>
     <service name="https"/>
     <service name="mysql"/>
     <port protocol="tcp" port="5666"/>
     <port protocol="tcp" port="3306"/>
     <port protocol="tcp" port="3260"/>
     <port protocol="tcp" port="5667"/>
    </zone>

**Step 17: Adding port forwarding**

When we connect to 2080 port which request will be forwarded to 80 port.

    [root@server ~]# firewall-cmd --permanent --add-rich-rule "rule family=ipv4 source address=192.168.4.0/24 forward-port port=2080 protocol=tcp to-port=80"
    success
    [root@server ~]# firewall-cmd --reload
    success

**Conclusion**

Firewalld service will use ipchains to inject firewall rules. Firewall is used to enable port level security which will filter incoming and out going packets in newer versions of Linux such as RHEL 7 and Centos 7\. In Ubuntu Linux there is no firewalld is enabled.

Thanks for reading please do comment your feedback on the same.

That’t it about Firewalld.

**Related Posts**

[Multi User Samba installation and configuration](https://arkit.co.in/linux/samba-share-multi-user-access/)

[Enabling SSL certificate along with http](https://arkit.co.in/linux/secure-web-server/)

[Simple way to create samba server](https://arkit.co.in/linux/simple-way-create-manage-samba/)

SEO Keywords

firewalld installation configuration RHEL 7 and Centos 7 firewalld installation configuration RHEL 7 and Centos 7 firewalld installation configuration RHEL 7 and Centos 7firewalld installation configuration RHEL 7 and Centos 7

**Thanks for your wonderful Support and Encouragement **

* [Get Email](https://feedburner.google.com/fb/a/mailverify?uri=arkit) | [Download E-Books](https://arkit-in.tradepub.com/)
* [Facebook Page](https://www.facebook.com/Linuxarkit)
* [Youtube Channel](https://www.youtube.com/Techarkit?sub_confirmation=1)
* [Twitter](https://twitter.com/aravikumar48)
* [Exclusive Telegram Group](https://t.me/Linuxarkit)
* [Discuss On WhatsApp Group](https://github.com/techarkit/TechArkit-YouTube/blob/master/whatsapp_group.md)

More than 40000 Techies in our community do you want part of it Join Now