Solution In Progress  - Updated July 9 2016 at 10:07 AM - 

[ English ]()

Environment
-----------

* Red Hat Enterprise Linux OpenStack Platform

Issue
-----

* How do I boot an OpenStack instance and tell it to use a specific IP address?

Resolution
----------

* Use the `nova boot --nic` option to specify the net-id and v4-fixed-ip.

[Raw](https://access.redhat.com/solutions/1315963#)

    nova boot --nic net-id=9a926b9a-804a-496d-99bc-4e31bf2feeec,v4-fixed-ip=10.0.1.42 --key-name osp5-x230-keys --image rhel7 rhel7-test --flavor m1.small 

* In order to do this, you need to know the network in which you are booting your instance. You can get a list of networks with `nova net-list`.

[Raw](https://access.redhat.com/solutions/1315963#)

    [root@osp5 ~(keystone_admin)]# nova net-list
    +--------------------------------------+---------+------+
    | ID                                   | Label   | CIDR |
    +--------------------------------------+---------+------+
    | b08a8505-26bd-4cff-95e2-0e17aa23df73 | public  | -    |
    | 6594969b-446e-4403-9596-df49172ae796 | private | -    |
    | 9a926b9a-804a-496d-99bc-4e31bf2feeec | ext_net | -    |
    +--------------------------------------+---------+------+
    [root@osp5 ~(keystone_admin)]# 

* If you are using Red Hat OpenStack Platform 6, then the above will not work until Red Hat bug [1195067](https://bugzilla.redhat.com/show_bug.cgi?id=1195067) is fixed. However, you can use the following workaround to create a port with the desired IP address first and then boot the instance on that port.

[Raw](https://access.redhat.com/solutions/1315963#)

    $ neutron port-create --fixed-ip subnet_id=SUBNET_ID,ip_address=IP_ADDRESS NET_ID
    $ nova boot --image IMAGE --flavor FLAVOR --nic port-id=PORT_ID VM_NAME

* An example of running the workaround above is in the Diagnostic Steps below.

Diagnostic Steps
----------------

* Below is a full example with context of using the `nova boot --nic` option to specify an IP.

[Raw](https://access.redhat.com/solutions/1315963#)

    [root@osp5 ~(keystone_admin)]# nova boot --user-data ./myfile.txt --key-name osp5-x230-keys  --image rhel7 rhel7-test --flavor m1.small --nic net-id=9a926b9a-804a-496d-99bc-4e31bf2feeec,v4-fixed-ip=10.0.1.42
    +--------------------------------------+----------------------------------------------+
    | Property                             | Value                                        |
    +--------------------------------------+----------------------------------------------+
    | OS-DCF:diskConfig                    | MANUAL                                       |
    | OS-EXT-AZ:availability_zone          | nova                                         |
    | OS-EXT-SRV-ATTR:host                 | -                                            |
    | OS-EXT-SRV-ATTR:hypervisor_hostname  | -                                            |
    | OS-EXT-SRV-ATTR:instance_name        | instance-00000006                            |
    | OS-EXT-STS:power_state               | 0                                            |
    | OS-EXT-STS:task_state                | scheduling                                   |
    | OS-EXT-STS:vm_state                  | building                                     |
    | OS-SRV-USG:launched_at               | -                                            |
    | OS-SRV-USG:terminated_at             | -                                            |
    | accessIPv4                           |                                              |
    | accessIPv6                           |                                              |
    | adminPass                            | z4cw5PaBdudt                                 |
    | config_drive                         |                                              |
    | created                              | 2015-01-10T14:37:26Z                         |
    | flavor                               | m1.small (2)                                 |
    | hostId                               |                                              |
    | id                                   | 5cad0037-237f-4040-8b5a-d5aee5fa5243         |
    | image                                | rhel7 (8de8a734-e084-476c-b002-2709bc7ba29d) |
    | key_name                             | osp5-x230-keys                               |
    | metadata                             | {}                                           |
    | name                                 | rhel7-test                                   |
    | os-extended-volumes:volumes_attached | []                                           |
    | progress                             | 0                                            |
    | security_groups                      | default                                      |
    | status                               | BUILD                                        |
    | tenant_id                            | 06732e4c2afe457bba3dbeb90adb523a             |
    | updated                              | 2015-01-10T14:37:26Z                         |
    | user_id                              | dced8d6ff75e477aa25a5960628f7f9f             |
    +--------------------------------------+----------------------------------------------+
    [root@osp5 ~(keystone_admin)]#

* After that you can SSH to your instance using its assigned static IP address.

[Raw](https://access.redhat.com/solutions/1315963#)

    $ ssh cloud-user@10.0.1.42 
    Last login: Sat Jan 10 09:42:11 2015 from 10.0.1.1
    [cloud-user@mynode ~]$ ip a | grep eth0 
    2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
        inet 10.0.1.42/24 brd 10.0.1.255 scope global dynamic eth0
    [cloud-user@mynode ~]$ 

* This option will work even if you have a DHCP server in the network you boot the instance. When using this option your host will still use the network configuration files that were provided by the image, which is normally DHCP.

[Raw](https://access.redhat.com/solutions/1315963#)

    [cloud-user@mynode ~]$ cat /etc/sysconfig/network-scripts/ifcfg-eth0 
    DEVICE="eth0"
    BOOTPROTO="dhcp"
    ONBOOT="yes"
    TYPE="Ethernet"
    USERCTL="yes"
    PEERDNS="yes"
    IPV6INIT="no"
    PERSISTENT_DHCLIENT="1"
    [cloud-user@mynode ~]$ 

* Another example of how to boot your instance with a specific IP address is to assign that IP address to a port and then assign that port to the the booting instance. If the above doesn't work with Red Hat Enterprise Linux OpenStack Platform 6, because of the bug sited in the Resolution section above, then you can use the following example as a workaround.

[Raw](https://access.redhat.com/solutions/1315963#)

    [root@osp6p ~(keystone_admin)]# neutron port-create --fixed-ip subnet_id=8a1dce4f-be08-461d-93fc-06398d417c5d,ip_address=10.0.1.42 acd9ab2b-6d8c-40df-86f9-578a59c6ab54 
    Created a new port:
    +-----------------------+----------------------------------------------------------------------------------+
    | Field                 | Value                                                                            |
    +-----------------------+----------------------------------------------------------------------------------+
    | admin_state_up        | True                                                                             |
    | allowed_address_pairs |                                                                                  |
    | binding:host_id       |                                                                                  |
    | binding:profile       | {}                                                                               |
    | binding:vif_details   | {}                                                                               |
    | binding:vif_type      | unbound                                                                          |
    | binding:vnic_type     | normal                                                                           |
    | device_id             |                                                                                  |
    | device_owner          |                                                                                  |
    | fixed_ips             | {"subnet_id": "8a1dce4f-be08-461d-93fc-06398d417c5d", "ip_address": "10.0.1.42"} |
    | id                    | 5b6b29a0-adc9-4d93-96f1-7259b4ac2499                                             |
    | mac_address           | fa:16:3e:e8:d3:95                                                                |
    | name                  |                                                                                  |
    | network_id            | acd9ab2b-6d8c-40df-86f9-578a59c6ab54                                             |
    | security_groups       | c88e8ccf-b44c-49fc-9591-6d8fbc33a086                                             |
    | status                | DOWN                                                                             |
    | tenant_id             | c9a2ccf6af8e499b8d8095917bd490ca                                                 |
    +-----------------------+----------------------------------------------------------------------------------+
    [root@osp6p ~(keystone_admin)]# 

    [root@osp6p ~(keystone_admin)]# nova boot --nic port-id=5b6b29a0-adc9-4d93-96f1-7259b4ac2499 --key-name osp5-xhel7-test --flavor m1.small 
    +--------------------------------------+----------------------------------------------+
    | Property                             | Value                                        |
    +--------------------------------------+----------------------------------------------+
    | OS-DCF:diskConfig                    | MANUAL                                       |
    | OS-EXT-AZ:availability_zone          | nova                                         |
    | OS-EXT-SRV-ATTR:host                 | -                                            |
    | OS-EXT-SRV-ATTR:hypervisor_hostname  | -                                            |
    | OS-EXT-SRV-ATTR:instance_name        | instance-00000008                            |
    | OS-EXT-STS:power_state               | 0                                            |
    | OS-EXT-STS:task_state                | scheduling                                   |
    | OS-EXT-STS:vm_state                  | building                                     |
    | OS-SRV-USG:launched_at               | -                                            |
    | OS-SRV-USG:terminated_at             | -                                            |
    | accessIPv4                           |                                              |
    | accessIPv6                           |                                              |
    | adminPass                            | 7ASmdfVpjQtM                                 |
    | config_drive                         |                                              |
    | created                              | 2015-02-21T23:22:37Z                         |
    | flavor                               | m1.small (2)                                 |
    | hostId                               |                                              |
    | id                                   | c65d3a3e-ab39-42dd-91c8-553c01c519d0         |
    | image                                | rhel7 (a6749630-da40-483a-a6dc-bba558ea2d6f) |
    | key_name                             | osp5-x230-keys                               |
    | metadata                             | {}                                           |
    | name                                 | rhel7-test                                   |
    | os-extended-volumes:volumes_attached | []                                           |
    | progress                             | 0                                            |
    | security_groups                      | default                                      |
    | status                               | BUILD                                        |
    | tenant_id                            | c9a2ccf6af8e499b8d8095917bd490ca             |
    | updated                              | 2015-02-21T23:22:37Z                         |
    | user_id                              | 7a67b107268a48849114be8ceb38a731             |
    +--------------------------------------+----------------------------------------------+
    [root@osp6p ~(keystone_admin)]# 

* ** Product(s) **
* [Red Hat OpenStack Platform](https://access.redhat.com/products/red-hat-openstack-platform-index)

* ** Component **
* [nova](https://access.redhat.com/components/nova)

* ** Category **
* [Learn more](https://access.redhat.com/category/learn-more)

* ** Tags **
* [RHCI](https://access.redhat.com/taxonomy/tags/rhci)

This solution is part of Red Hat’s fast-track publication program, providing a huge library of solutions that Red Hat engineers have created while supporting our customers. To give you the knowledge you need the instant it becomes available, these articles may be presented in a raw and unedited form.