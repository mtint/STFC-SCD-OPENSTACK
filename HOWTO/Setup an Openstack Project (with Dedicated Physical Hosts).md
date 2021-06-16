Setup an Openstack Project (with Dedicated Physical Hosts)
==========================================================

Table of Contents
-----------------

* * [1\. Opening it up to the Masses](https://www.techblog.moebius.space/posts/setting-up-a-new-openstack-project/#1-opening-it-up-to-the-masses)
  * [1.1 Setup a Project](https://www.techblog.moebius.space/posts/setting-up-a-new-openstack-project/#1-1-setup-a-project)
  * [2\. Setup Flavours (Compute Types)](https://www.techblog.moebius.space/posts/setting-up-a-new-openstack-project/#2-setup-flavours-compute-types)
    * [2.1 Create Flavors](https://www.techblog.moebius.space/posts/setting-up-a-new-openstack-project/#2-1-create-flavors)
  * [3\. (Optional) Setup Quotas](https://www.techblog.moebius.space/posts/setting-up-a-new-openstack-project/#3-optional-setup-quotas)
  * [4\. Setup a New Network](https://www.techblog.moebius.space/posts/setting-up-a-new-openstack-project/#4-setup-a-new-network)
    * [4.1 Create a Virtual Network](https://www.techblog.moebius.space/posts/setting-up-a-new-openstack-project/#4-1-create-a-virtual-network)
    * [4.2 Create a Subnet](https://www.techblog.moebius.space/posts/setting-up-a-new-openstack-project/#4-2-create-a-subnet)
    * [4.3 Add a DHCP Network Agent to the Network](https://www.techblog.moebius.space/posts/setting-up-a-new-openstack-project/#4-3-add-a-dhcp-network-agent-to-the-network)
    * [4.4 Create a Network Router](https://www.techblog.moebius.space/posts/setting-up-a-new-openstack-project/#4-4-create-a-network-router)
  * [5\. Setup a Host Aggregate](https://www.techblog.moebius.space/posts/setting-up-a-new-openstack-project/#5-setup-a-host-aggregate)
    * [5.1 Create a Host Aggregate](https://www.techblog.moebius.space/posts/setting-up-a-new-openstack-project/#5-1-create-a-host-aggregate)
    * [5.2 Set Metadata for the Host Aggregate](https://www.techblog.moebius.space/posts/setting-up-a-new-openstack-project/#5-2-set-metadata-for-the-host-aggregate)
    * [5.3 Add Hosts to Host Aggregate](https://www.techblog.moebius.space/posts/setting-up-a-new-openstack-project/#5-3-add-hosts-to-host-aggregate)
  * [6\. Restrict Flavors to HostAggregate](https://www.techblog.moebius.space/posts/setting-up-a-new-openstack-project/#6-restrict-flavors-to-hostaggregate)
  * [7\. Create a Nova Instance](https://www.techblog.moebius.space/posts/setting-up-a-new-openstack-project/#7-create-a-nova-instance)
  * [8\. (Optional) Debugging](https://www.techblog.moebius.space/posts/setting-up-a-new-openstack-project/#8-optional-debugging)

1\. Opening it up to the Masses
-------------------------------

If you are using [Red Hat Openstack](https://www.openstack.org/), then you have already made the decision to empower your employees with the ability to manage and operate their own virtualization compute and storage environments.

But before you can give any old John Smith this superpower, you need to manage and restrict the level of access he has, as well as logically separating your infrastructure into isolated projects.

According to Openstack:

> A project is a group of zero or more users. In Compute, a project owns virtual machines. In Object Storage, a project owns containers. Users can be associated with more than one project. Each project and user pairing can have a role associated with it. [(Source)](https://docs.openstack.org/keystone/pike/admin/cli-manage-projects-users-and-roles.html)

1.1 Setup a Project
-------------------

Creating a project is a simple process:

```
\# Create a new Openstack Project
openstack project create mynewproject

```

2\. Setup Flavours (Compute Types)
----------------------------------

> In OpenStack, a flavor defines the compute, memory, and storage capacity of a virtual server, also known as an instance. As an administrative user, you can create, edit, and delete flavors. [(Source)](https://docs.openstack.org/horizon/latest/admin/manage-flavors.html)

Flavors are also quite flexible - you can restrict them to only be usable in a specific project, or multiple. This might be useful if:

* You want to restrict the physical hypervisors that can be used by this project (which can be done with Availability Zones, Host Aggregates and Flavor Metadata)

In order for this to work however, you have to disable all public flavors. A public flavor can be accessible by project. You can restrict a flavor in Horizon (Openstack Web UI) by:

* Logging to the dashboard and select the project for which you are the admin from the dropdown list of projects in the top right hand corner.
* In the `Admin` tab, open the `Compute` tab and click the `Flavors` category.
* Next to the flavor you want to modify, click on the drop down menu, and select `Modify Access`.
* Choose the projects you want to make this flavor available in, and press ‘+’

### 2.1 Create Flavors

To create new flavors, you must specify the RAM (in MB), Root Disk Storage (in GB), and the number of vcores.

```
\# Create a flavor called myproject-02-16-02, with 16GB RAM, 20GB Root Disk, 2 vcores and 2TB Ephemeral Drive
nova flavor-create myproject.02-016-02 auto 15849 20 2 --ephemeral 2553 --swap 0 --is-public false
\# Set Flavor Metadata
nova flavor-key myproject.02-016-02 set MyWeirdProject=true

```

3\. (Optional) Setup Quotas
---------------------------

Quotas can be used to limit the amount of services that users are offered at the:

* Project level
* User level

For the Project level, the following quotas can be set:

```
openstack quota set
    \# Compute settings
    [--cores <num-cores>]
    [--fixed-ips <num-fixed-ips>]
    [--floating-ips <num-floating-ips>]
    [--injected-file-size <injected-file-bytes>]
    [--injected-files <num-injected-files>]
    [--instances <num-instances>]
    [--key-pairs <num-key-pairs>]
    [--properties <num-properties>]
    [--ram <ram-mb>]
    [--server-groups <num-server-groups>]
    [--server-group-members <num-server-group-members>]

    \# Block Storage settings
    [--backups <new-backups>]
    [--backup-gigabytes <new-backup-gigabytes>]
    [--gigabytes <new-gigabytes>]
    [--per-volume-gigabytes <new-per-volume-gigabytes>]
    [--snapshots <new-snapshots>]
    [--volumes <new-volumes>]
    [--volume-type <volume-type>]

    \# Network settings
    [--floating-ips <num-floatingips>]
    [--secgroup-rules <num-security-group-rules>]
    [--secgroups <num-security-groups>]
    [--networks <num-networks>]
    [--subnets <num-subnets>]
    [--ports <num-ports>]
    [--routers <num-routers>]
    [--rbac-policies <num-rbac-policies>]
    [--vips <num-vips>]
    [--subnetpools <num-subnetpools>]
    [--members <num-members>]
    [--health-monitors <num-health-monitors>]

    <project>

```

[(Source)](https://docs.openstack.org/cinder/latest/cli/cli-set-quotas.html)

You can also achieve the same via Horizon, by:

* Logging into the dashboard and selecting the project in which you are the admin from the drop down list in the top right hand corner.
* Select `Identity` from the top menu, and then `Projects`
* Select the drop down list next to the projectyou want to modify, and select `Modify Quotas`.

This can be useful if you have some resources which are in short supply:

* For example, if you have only been allocated a small external subnet range, then you can ensure that each project is only allocated a fraction of the number of subnets available, to allocate to floating IP’s
* Or, if your platform is likely to use flavors which are more memory intensive, than compute intensive - you can limit the RAM allocated to the project.

4\. Setup a New Network
-----------------------

Each project hosts one or more networks in which to route instance traffic. Each network can can either be restricted for use within a project, or shared between projects. The default is for it to be isolated.

When creating a new instance within your project, users will have to select the network in which to deploy the instance. If you have already setup public networks, then these will be available for use. Otherwise, you can use Openstack’s networking service - neutron to create a new network:

Before creating the project, network we assume that your environment used the following networking setup:

1. [Openstack VLAN Provider Network](https://developer.rackspace.com/blog/neutron-networking-vlan-provider-networks/). Additional information on the alternate [Flat Provider Network Option](https://developer.rackspace.com/blog/neutron-networking-vlan-provider-networks/).

In our case we have a physical flat network defined called physnet, which is specified in linuxbridge\_agent.ini as:

```
[linux_bridge]
physical_interface_mappings = physnet:eth1

```

Which means that our project network will use the physical network to create a network bridge on the host via eth1 to establish the new virtual network (and subnets).

1. We assume that there is a DHCP server available on the physical network in order to provide IP’s to each virtual network.

Anyway, onto the network creation!

### 4.1 Create a Virtual Network

```
neutron net-create --tenant-id 5fb154c230c34f6c865256f994fb6d7a myprojectnet
Created a new network:
+---------------------------+--------------------------------------+
| Field                     | Value                                |
+---------------------------+--------------------------------------+
| admin_state_up            | True                                 |
| id                        | d20ebbb3-adb5-422a-83f5-1324eed1ba5b |
| name                      | myprojectnet                            |
| provider:network_type     | vlan                                 |
| provider:physical_network | physnet                              |
| provider:segmentation_id  | 3015                                 |
| router:external           | False                                |
| shared                    | False                                |
| status                    | ACTIVE                               |
| subnets                   |                                      |
| tenant_id                 | 5fb154c230c34f6c865256f994fb6d7a     |
+---------------------------+--------------------------------------+

```

As you can see, by default the CLI selects the provider:network\_type to be vlan. You can select other options with the `--provider:network_type` option. If you were creating a physical network for example, you would use the `flat` network option.

### 4.2 Create a Subnet

The next step is to create a subnet for the network:

```
neutron subnet-create --tenant-id 5fb154c230c34f6c865256f994fb6d7a --name myprojectsubnet --gateway 10.1.3.1 --allocation-pool start=10.1.3.2,end=10.1.3.254 --dns-nameserver 10.1.1.10 --dns-nameserver 10.1.1.11 --enable-dhcp myprojectnet 10.1.3.0/24
Created a new subnet:
+-------------------+--------------------------------------------+
| Field             | Value                                      |
+-------------------+--------------------------------------------+
| allocation_pools  | {"start": "10.1.3.2", "end": "10.1.3.254"} |
| cidr              | 10.1.3.0/24                                |
| dns_nameservers   | 10.1.1.10                                  |
|                   | 10.1.1.11                                  |
| enable_dhcp       | True                                       |
| gateway_ip        | 10.1.3.1                                   |
| host_routes       |                                            |
| id                | ed55919d-0a2e-40e6-8057-6e52b7751cf8       |
| ip_version        | 4                                          |
| ipv6_address_mode |                                            |
| ipv6_ra_mode      |                                            |
| name              | myprojectsubnet                               |
| network_id        | d20ebbb3-adb5-422a-83f5-1324eed1ba5b       |
| tenant_id         | 5fb154c230c34f6c865256f994fb6d7a           |
+-------------------+--------------------------------------------+

```

### 4.3 Add a DHCP Network Agent to the Network

As previously mentioned, the network requires a DHCP agent in order to allocate network addresses for virtual networks. You can roll your own and configure a DHCP agent to use this. However, in the version of Openstack we’re using (severely outdated Platform 6), the Controller runs its own DHCP server. You can learn more about the DHCP implementation [here](https://docs.openstack.org/dragonflow/latest/distributed_dhcp.html).

```
\# Find all DHCP Agents
neutron dhcp-agent-list-hosting-net 0b43acae-7b0a-4cd8-be06-622d3d232570
+--------------------------------------+--------------------------------+----------------+-------+
| id                                   | host                           | admin_state_up | alive |
+--------------------------------------+--------------------------------+----------------+-------+
| 8cc319b7-3a89-4d61-862b-48ea37a37c8f | mycontroller.myorg.com | True           | :-)   |
+--------------------------------------+--------------------------------+----------------+-------+

\# Add the DHCP Agent to the Network
\#\# neutron dhcp-agent-network-add \<DHCP Agent ID\> \<Network ID\>
neutron dhcp-agent-network-add 8cc319b7-3a89-4d61-862b-48ea37a37c8f d20ebbb3-adb5-422a-83f5-1324eed1ba5b
Added network d20ebbb3-adb5-422a-83f5-1324eed1ba5b to DHCP agent

```

### 4.4 Create a Network Router

So far, your instance will only be able to communicate with other devices in the same network (i.e within the subnets associated to the network).

If you want the instance to be able to communicate to an external network, or the internet, then you need to create a router within your network, and add both the internal and external interfaces for it to route.

```
neutron router-create --tenant-id 5fb154c230c34f6c865256f994fb6d7a myprojectrouter
Created a new router:
+-----------------------+--------------------------------------+
| Field                 | Value                                |
+-----------------------+--------------------------------------+
| admin_state_up        | True                                 |
| distributed           | False                                |
| external_gateway_info |                                      |
| ha                    | False                                |
| id                    | 7399410c-c199-4806-8160-53f4896962fb |
| name                  | myprojectrouter                         |
| routes                |                                      |
| status                | ACTIVE                               |
| tenant_id             | 5fb154c230c34f6c865256f994fb6d7a     |
+-----------------------+--------------------------------------+

```

5\. Setup a Host Aggregate
--------------------------

Openstack has the roughly equivalent concepts of Host Aggregates and Availability Zones. If you’ve played around with any Cloud Provider - you would have probably encountered something called Availability Zones. Unfortunately, this is NOT the same concept in Openstack.

The twin concepts are explained really well [here](https://blog.russellbryant.net/2013/05/21/availability-zones-and-host-aggregates-in-openstack-compute-nova/). But I will summarize:

* Host Aggeragtes are a way to group common metadata among physical hosts.
* Host Aggregates are only available to be viewed and modified by admins
* A host aggregate can be exposed to normal users via ‘Availability Zones’. They will not be able to create or modify existing Availability Zones.
* An availability zone is not created on it’s own. It is basically just the Host Aggregate displayed to end users.
* When creating a Host Aggregate, an Availability Zone may be specified, which means the Host Aggregate will be exposed to end users.

In our case, we can use Host Aggregate metadata to group the physical hosts we want to restrict project usage to and control what flavors are deployed onto them.

### 5.1 Create a Host Aggregate

```
\# Create a host aggregate named myaggregate, and expose it to end users as myaz
\#\# Note: Specifying the availability zone is optional. If left out, the host aggregate will not be exposed to end users
nova aggregate-create myaggregate myaz

```

### 5.2 Set Metadata for the Host Aggregate

Setting up metadata on the Host Aggregate allows us to restrict the flavors that are able to be deployed onto the aggregate (amongst other things).

You will remember that we had already setup metadata on each of the flavors that we created for this project in 2.1\. The metadata was:

`MyWeirdProject=true`

By setting the same metadata on the Host Aggregates causes Openstack to automatically provision these flavors onto this Host Aggregate.

Note however that this will be negated if hosts are allocated to multiple Host Aggeregates (which is possible), or if the same metadata exists for multiple Host Aggregates.

```
nova aggregate-set-metadata myaggregate MyWeirdProject=true

\# If you made a mistake, you can delete metadata with the same command by specifying only the key
\# For example: 
\#\# nova aggregate-set-metadata myaggregate MyWeirdProject

```

### 5.3 Add Hosts to Host Aggregate

Next, we select the hosts (physical) that we want to add to the Host Aggregate that we want the project to use.

```
nova aggregate-add-host myaggregate myhost1
nova aggregate-add-host myaggregate myhost2
nova aggregate-add-host myaggregate myhost3
nova aggregate-add-host myaggregate myhost4

```

6\. Restrict Flavors to HostAggregate
-------------------------------------

Now that we have ensured that only flavors that we have created for the project can be deployed to hosts on the project, the final step is to ensure that users do not have access to any other flavors which will allow them to deploy on hosts outside of our project.

This requires ensuring that:

* We revoke access to our project for all other flavors
* Ensure that all of the project flavors are only available in our project.

The final step to ensure that users can only use the hosts in your project is to restrict the flavors that they can spin up.

You can manually do this:

```
\# 1\. Remove access to our project for all flavors
nova flavor-access-remove flavor1 myproject
nova flavor-access-remove flavor2 myproject

\# 2\. Provide access to our project for our project flavors (created in step 2.1)
nova 

```

But since I was lazy I quickly wrote a bash script to do this:

```
./flavors.sh
flavors.sh [-h] <tenant-id> <flavor name regex> -- program to restrict flavor access to a tenant
 where:
        tenant id                the tenant to restrict flavor access to
        flavor name regex        a regex matching the flavor name(s) to use in the tenant

cat flavors.sh
if [ "$1" == "" ] || [ "$2" == "" ];
then
    echo -e $usage;
    exit 1;
else
    \# Remove access to the flavor from all tenants/projects
    for f in $(nova flavor-list --all | cut -d'|' -f2 | tr -d ' ' | grep -e "^[0-9a-z]\\{8\\}"); do
        \#nova flavor-access-remove $f $1
        echo "Removing access for flavor: " $f " from tenant " $1;
    done;

    \# Provide access to the flavor from the specified tenant
    for f in $(nova flavor-list --all | grep $2 | cut -d'|' -f2 | tr -d ' ' | grep -e "^[0-9a-z]\\{8\\}"); do
        \#nova flavor-access-add $f $1
        echo "Providing access for flavor: " $f " to " $1;
    done;
fi

```

7\. Create a Nova Instance
--------------------------

In order to test the networking and project, you can spin up a new instance, and tru to associate a floating IP to it.

```
\# Create new instance, on the myprojectnet network
nova boot --flavor myproject-02-16-02 --image my-centos-image --nic net-id=d20ebbb3-adb5-422a-83f5-1324eed1ba5b myinstance1

\# Associate floating IP to new instance
nova add-floating-ip myinstance1 10.47.124.65

```

If all goes well, your instance should have been provisioned on one of the hosts you selected in your Host Aggregate. Additionally, your users should have been restricted to only view and deploy the flavors you set metadata for - meaning instances will only ever be deployed to the hosts you want within the project.

Happy Days!

8\. (Optional) Debugging
------------------------

If you spin up an instance in the new project, and notice that the internal network traffic is not able to reach the external network, try checking the router interface port. If everything is working, the binding:vif should not be Unbound or binding\_failed.

```
neutron port-show 2c3a17ba-9931-428b-b5e1-70b1b9adbe7a
+-----------------------+---------------------------------------------------------------------------------+
| Field                 | Value                                                                           |
+-----------------------+---------------------------------------------------------------------------------+
| admin_state_up        | True                                                                            |
| allowed_address_pairs |                                                                                 |
| binding:host_id       |                                                                                 |
| binding:profile       | {}                                                                              |
| binding:vif_details   | {}                                                                              |
| binding:vif_type      | unbound                                                                         |
| binding:vnic_type     | normal                                                                          |
| device_id             | 7399410c-c199-4806-8160-53f4896962fb                                            |
| device_owner          | network:router_interface                                                        |
| extra_dhcp_opts       |                                                                                 |
| fixed_ips             | {"subnet\_id": "ed55919d-0a2e-40e6-8057-6e52b7751cf8", "ip\_address": "10.1.3.5"} |
| id                    | 2c3a17ba-9931-428b-b5e1-70b1b9adbe7a                                            |
| mac_address           | fa:16:3e:d9:66:c0                                                               |
| name                  |                                                                                 |
| network_id            | d20ebbb3-adb5-422a-83f5-1324eed1ba5b                                            |
| security_groups       | 31d830b9-84f0-4b00-a8db-582312c0a618                                            |
| status                | DOWN                                                                            |
| tenant_id             | 0ec689dd410c4b7780117e8601717e47                                                |
+-----------------------+---------------------------------------------------------------------------------+

```

You can see that the binding:type is unbound above, meaning the L3 agent has not been able to register the router for external connectivity. I plan to write more about the L3 agent soon - so keep an eye out :)