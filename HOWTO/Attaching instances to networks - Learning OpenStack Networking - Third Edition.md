Using the OpenStack command-line client, instances can be attached to networks in a couple of ways. When an instance is first created, it can be attached to one or more networks using the openstack server create command. Running instances can be attached to additional networks using the openstack server add port command. Both methods are explained in the following sections.

Attaching instances to networks at creation
-------------------------------------------

Instances are created using the openstack server create command, as you can see here:

    openstack server create
    (--image <image> | --volume <volume>) --flavor <flavor>
    [--security-group <security-group>]
    [--key-name <key-name>]
    [--property <key=value>]
    [--file <dest-filename=source-filename>]
    [--user-data <user-data>]
    [--availability-zone <zone-name>]
    [--block-device-mapping <dev-name=mapping>]
    [--nic <net-id=net-uuid,v4-fixed-ip=ip-addr,v6-fixed-ip=ip-addr,port-id=port-uuid,auto,none>]
    [--network <network>] [--port <port>]
    [--hint <key=value>]
    [--config-drive <config-drive-volume> | True]
    [--min <count>] [--max <count>] [--wait]
    <server-name>   

Nova attaches instances to virtual bridges and switches on the compute node via their virtual interfaces, or VIFs. Each VIF has a corresponding Neutron port in the database.

When using the Open vSwitch mechanism driver and Open vSwitch firewall driver, each VIF plugs into the integration bridge on the respective compute node hosting the instance. The virtual switch port is configured with a local VLAN ID that corresponds to the network associated with the Neutron port and VIF. When the iptables\_hybrid firewall driver is used, the VIF is connected to a Linux bridge where iptables rules are applied.

When using the Linux bridge mechanism driver, each VIF connects to a Linux bridge that corresponds to the associated network. Every network has a corresponding bridge that is used to segregate traffic at Layer 2.

For a refresher on these concepts, refer to [*Chapter 4*](https://subscription.packtpub.com/book/cloud_and_networking/9781788392495/4), *Virtual Switching Infrastructure Using Linux Bridges,* and [*Chapter 5*](https://subscription.packtpub.com/book/cloud_and_networking/9781788392495/5), *Building a Virtual Switching Infrastructure Using Open vSwitch*.

Specifying a network
--------------------

The openstack server create command provides a --nic argument that specifies the network or port to be attached to the instance.

Users can specify a network identified by the network's ID by using the net-id key:

    --nic net-id=<Network ID> 

In the preceding example, Nova interfaces with the Neutron API to create a port using the network ID provided by the user. Neutron then returns details of the port back to Nova for use by the instance. Users can request a specific unused IPv4 or IPv6 address using the v4-fixed-ip and v6-fixed-ip keys, respectively, as shown here:

    --nic net-id=<Network ID>,v4-fixed-ip=<ipv4 address>
    --nic net-id=<Network ID>,v6-fixed-ip=<ipv6 address> 

Specifying a port
-----------------

Alternatively, users can specify a port that's been identified by the port's ID using the port-id key, as shown here:

    --nic port-id=<Port ID> 

In this example, Neutron associates the existing port with the instance and sets the port's device\_id attribute accordingly. A port can later be detached from an instance and associated with a new instance using this method. Possible options include auto, none, or the ID of an existing port. The default is auto.

Attaching multiple interfaces
-----------------------------

By passing the --nic argument multiple times, it is possible to attach multiple interfaces to an instance. The interfaces within the instance may then be enumerated as eth0, eth1, eth2, and so on, depending on the operating system.

Attaching multiple network interfaces to an instance is referred to as **multihoming**. When an instance is multihomed, neither Neutron nor the instance itself is aware of which network takes precedence over another. When attached networks and subnets have their own respective gateway addresses set, an instance's routing table can be populated with multiple default routes. This scenario can wreak havoc on the connectivity and routing behavior of an instance. his configuration is useful when connecting instances to multiple networks directly, however, care should be taken to avoid network issues in this type of design.

The following openstack server create command demonstrates the basic procedure of connecting an instance to multiple networks when creating the instance:

    openstack server create --flavor FLAVOR --image IMAGE \
    --nic net-id=NETWORK1 \
    --nic net-id=NETWORK2 \
    --nic net-id=NETWORK3 \
    <SERVER-NAME> 

Inside the instance, the first attached NIC corresponds to NETWORK1, the second NIC corresponds to NETWORK2, and so on. For many cloud-ready images, a single interface within the instance is brought online automatically using DHCP. Modification of the network interface file(s) or use of the dhclient command within the instance may be required to activate and configure additional network interfaces once the instance is active.

Attaching network interfaces to running instances
-------------------------------------------------

Using the openstack server add port or openstack server add fixed ip commands, you can attach an existing or new port to running instances.

The openstack server add port command can be used as follows:

    openstack server add port <server> <port>

The port argument specifies the port to be attached to the given server. The port must be one that is not currently associated with any other instance or resource. Otherwise, the operation will fail.

The openstack server add fixed ip command can be used as follows:

    openstack server add fixed ip
    [--fixed-ip-address <ip-address>]
    <server> <network> 

The network argument specifies the network to be attached to the given server. A new port that has a unique MAC address and an IP from the specified network will be created automatically.

The --fixed-ip-address argument can be used to specify a particular IP address in the given network rather than relying on an automatic assignment from Neutron.

Detaching network interfaces
----------------------------

To detach an interface from an instance, use the openstack server remove port or openstack server remove fixed ip commands, as shown here:

    openstack server remove port <server> <port>
    openstack server remove fixed ip <server> <ip-address> 

Interfaces detached from instances are removed completely from the Neutron port database.