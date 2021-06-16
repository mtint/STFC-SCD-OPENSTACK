*You can support us by downloading this article as PDF from the Link below.*[Download the guide as PDF](https://computingforgeeks.com/creating-openstack-network-and-subnets/#ex1)

In this part of Openstack deep dive series, we’ll look at Creating Openstack Network and Subnet using Openstack command line interface. Last we looked at:

### [Adding ssh key pair to Openstack using cli](https://computingforgeeks.com/adding-keypairs-to-openstack-using-cli/)

### [How to add flavors to openstack using cli](https://computingforgeeks.com/add-flavors-to-openstack-using-cli/)

### [Adding images to Openstack Glance](https://computingforgeeks.com/adding-images-openstack-glance/)

Here, I’ll show you how to create provider networks, one with VLAN, and another one without VLAN. This guide is based on [Openstack Ocata](https://www.openstack.org/software/ocata/) release and [ OpenStack Neutron ](https://wiki.openstack.org/wiki/Neutron)network service.

**Assumption**: You have a running Openstack setup, how to setup Openstack from scratch will be covered on another tutorial.

### What is Provider network?

Before launching an instance on Openstack, you must create the necessary virtual network infrastructure. An instance uses a provider (**external**) network that connects to the physical network infrastructure via** layer-2 (bridging/switching).** This network includes a **DHCP server** that provides IP addresses to instances.

Below is a diagram showing you an overview of a provider network ( source: Opentack website):

[![openstack provider networks 1](data:image/svg+xml,%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22630%22%20height=%22558%22%3E%3C/svg%3E)](https://computingforgeeks.com/wp-content/uploads/2017/08/openstack-provider-networks-1.png)

#### Creating Provider Network (on Controller node)

How to create provider network on controller node (without VLAN) :

    openstack network create  --share --external \
      --provider-physical-network provider \
      --provider-network-type flat provider

How to create provider network on controller node (with VLAN ) :

    openstack network create --share --external \
    --provider-physical-network provider \
    --provider-network-type vlan \
    --provider-segment 203 provider

Explanation of options used:

    --share:  allows all projects to use the virtual network.
    --external: defines the virtual network to be external, for internal network, use --internal.
    --provider-physical-network provider : connect the flat virtual network to the flat (native/untagged) physical network
    --provider-network-type: specifies network type, flat or vlan
    --provider-segment: defines vlan id

Replace **203** with your VLAN ID. This VLAN id will be used on compute nodes.

Confirm that indeed the network was created successfully using command:

    $ openstack network list

You should get output similar to one below:

[![Creating Openstack Network and Subnets on Openstack CLI](data:image/svg+xml,%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22956%22%20height=%22291%22%3E%3C/svg%3E)](https://computingforgeeks.com/wp-content/uploads/2017/08/openstack-network-list-1.png)

Your ml2\_conf.ini file should have a line:

    [ml2_type_flat]
    flat_networks = provider

#### Creating IPv4 subnet on the provider network:

Now that you have provider network added, next step is defining subnet for the network.

    openstack subnet create --subnet-range 192.168.10.0/24 \
    --gateway 192.168.10.1 --network provider \
    --allocation-pool start=192.168.10.10,end=192.168.10.200 \
    --dns-nameserver 8.8.4.4 provider-v4

If you have public ip pool, replace 192.168.10.0 with it.

#### Create a IPv6 subnet on the provider network (Optional)

If you would like IPv6 address assigned to instances launched, create IPv6 subnet like below:

    openstack subnet create --subnet-range fd00:203:0:113::/64 \
    --gateway fd00:203:0:113::1 --ip-version 6 \
    --ipv6-address-mode slaac --network provider \
    --dns-nameserver 2001:4860:4860::8844 provider-v6

Confirm settings:

    [root@openstack-controller-01 ~(keystone)]$ openstack subnet list

With these settings, you should be ready to configure compute nodes.

### Configuring compute nodes:

On you compute nodes, you should tag interface with VLAN ID configured on provider network. In my case, this is vlan 203\. My vlan interface has below configuration:

    [root@openstack-compute-02 ~]# cat /etc/sysconfig/network-scripts/ifcfg-p55p2.203 
    DEVICE=p55p2.203
    VLAN=yes
    ONBOOT=yes
    MTU=1500
    DEFROUTE=no
    NM_CONTROLLED=no
    IPV6INIT=no

Note that base system used is CentOS 7.3\. Configuration will vary for Ubuntu Base OS.

On compute nodes, the file `linuxbridge_agent.ini`: should have mapping like below:

    physical_interface_mappings = provider:p55p2

Once Linux bridge has been configured on compute nodes, a bridge will be created. See below

[![openstack list compute show bridge](data:image/svg+xml,%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22956%22%20height=%22396%22%3E%3C/svg%3E)](https://computingforgeeks.com/wp-content/uploads/2017/08/openstack-list-compute-show-bridge.png)

From the output above, you can see bridge called** brqa54af9d4-d2** whose interface is **p55p2.203**. p55p2.203 is a sub-interface associated with physical interface **p55p2**

You are ready to create a new instance on provider network created previously:

    openstack server create --flavor m1.tiny --image CoreOS-x86_64 \
     --nic net-id=a54af9d4-d297-45b6-a98c-79d84add5f2e --security-group default \
     --key-name josphat coreos-test-vm

For how to add images to openstack, add ssh keys and flavors refer to these links:

### [Adding ssh key pair to Openstack using cli](https://computingforgeeks.com/adding-keypairs-to-openstack-using-cli/)

### [How to add flavors to openstack using cli](https://computingforgeeks.com/add-flavors-to-openstack-using-cli/)

### [Adding images to Openstack Glance](https://computingforgeeks.com/adding-images-openstack-glance/)

That’s all. Please follow us on twitter and facebook to receive daily updates.