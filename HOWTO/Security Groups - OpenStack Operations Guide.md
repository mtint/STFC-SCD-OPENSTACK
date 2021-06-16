[ ]()Security Groups
--------------------

A common new-user issue with OpenStack is failing to set an appropriate security group when launching an instance. As a result, the user is unable to contact the instance on the network.

[Security groups are sets of IP filter rules that are applied to an instance's networking. They are project specific, and project members can edit the default rules for their group and add new rules sets. All projects have a "default" security group, which is applied to instances that have no other security group defined. Unless changed, this security group denies all incoming traffic.]()

### [ ]()General Security Groups Configuration

The `nova.conf` option `allow_same_net_traffic` (which defaults to `true`) globally controls whether the rules apply to hosts that share a network. When set to `true`, hosts on the same subnet are not filtered and are allowed to pass all types of traffic between them. On a flat network, this allows all instances from all projects unfiltered communication. With VLAN networking, this allows access between instances within the same project. If `allow_same_net_traffic` is set to `false`, security groups are enforced for all connections. In this case, it is possible for projects to simulate `allow_same_net_traffic` by configuring their default security group to allow all traffic from their subnet.

![[Tip]](resources/BFBF620F8D90A3D218E3CB86AA150E79.png)Tip

As noted in the previous chapter, the number of rules per security group is controlled by the `quota_security_group_rules`, and the number of allowed security groups per project is controlled by the `quota_security_groups` quota.

### [ ]()End-User Configuration of Security Groups

Security groups for the current project can be found on the OpenStack dashboard under **Access & Security**. To see details of an existing group, select the **edit** action for that security group. Obviously, modifying existing groups can be done from this **edit** interface. There is a **Create Security Group** button on the main **Access & Security** page for creating new groups. We discuss the terms used in these fields when we explain the command-line equivalents.

From the command line, you can get a list of security groups for the project you're acting in using the `nova` command:

    $ nova secgroup-list
    +---------+-------------+
    | Name    | Description |
    +---------+-------------+
    | default | default     |
    | open    | all ports   |
    +---------+-------------+

To view the details of the "open" security group:

    $ nova secgroup-list-rules open
    +-------------+-----------+---------+-----------+--------------+
    | IP Protocol | From Port | To Port | IP Range  | Source Group |
    +-------------+-----------+---------+-----------+--------------+
    | icmp        | -1        | 255     | 0.0.0.0/0 |              |
    | tcp         | 1         | 65535   | 0.0.0.0/0 |              |
    | udp         | 1         | 65535   | 0.0.0.0/0 |              |
    +-------------+-----------+---------+-----------+--------------+

These rules are all "allow" type rules, as the default is deny. The first column is the IP protocol (one of icmp, tcp, or udp), and the second and third columns specify the affected port range. The fourth column specifies the IP range in CIDR format. This example shows the full port range for all protocols allowed from all IPs.

When adding a new security group, you should pick a descriptive but brief name. This name shows up in brief descriptions of the instances that use it where the longer description field often does not. Seeing that an instance is using security group `http` is much easier to understand than `bobs_group` or `secgrp1`.

As an example, let's create a security group that allows web traffic anywhere on the Internet. We'll call this group `global_http`, which is clear and reasonably concise, encapsulating what is allowed and from where. From the command line, do:

    $ nova secgroup-create \
           global_http "allow web traffic from the Internet"
    +-------------+-------------------------------------+
    | Name        | Description                         |
    +-------------+-------------------------------------+
    | global_http | allow web traffic from the Internet |
    +-------------+-------------------------------------+

This creates the empty security group. To make it do what we want, we need to add some rules:

    $ nova secgroup-add-rule <secgroup> <ip-proto> <from-port> <to-port> <cidr>
    $ nova secgroup-add-rule global_http tcp 80 80 0.0.0.0/0
    +-------------+-----------+---------+-----------+--------------+
    | IP Protocol | From Port | To Port | IP Range  | Source Group |
    +-------------+-----------+---------+-----------+--------------+
    | tcp         | 80        | 80      | 0.0.0.0/0 |              |
    +-------------+-----------+---------+-----------+--------------+

Note that the arguments are positional, and the `from-port` and `to-port` arguments specify the allowed local port range connections. These arguments are not indicating source and destination ports of the connection. More complex rule sets can be built up through multiple invocations of `nova secgroup-add-rule`. For example, if you want to pass both http and https traffic, do this:

    $ nova secgroup-add-rule global_http tcp 443 443 0.0.0.0/0
    +-------------+-----------+---------+-----------+--------------+
    | IP Protocol | From Port | To Port | IP Range  | Source Group |
    +-------------+-----------+---------+-----------+--------------+
    | tcp         | 443       | 443     | 0.0.0.0/0 |              |
    +-------------+-----------+---------+-----------+--------------+

Despite only outputting the newly added rule, this operation is additive:

    $ nova secgroup-list-rules global_http
    +-------------+-----------+---------+-----------+--------------+
    | IP Protocol | From Port | To Port | IP Range  | Source Group |
    +-------------+-----------+---------+-----------+--------------+
    | tcp         | 80        | 80      | 0.0.0.0/0 |              |
    | tcp         | 443       | 443     | 0.0.0.0/0 |              |
    +-------------+-----------+---------+-----------+--------------+

The inverse operation is called `secgroup-delete-rule`, using the same format. Whole security groups can be removed with `secgroup-delete`.

To create security group rules for a cluster of instances, you want to use SourceGroups.

SourceGroups are a special dynamic way of defining the CIDR of allowed sources. The user specifies a SourceGroup (security group name) and then all the users' other instances using the specified SourceGroup are selected dynamically. This dynamic selection alleviates the need for individual rules to allow each new member of the cluster.

The code is structured like this: `nova secgroup-add-group-rule <secgroup> <source-group> <ip-proto> <from-port> <to-port>`. An example usage is shown here:

    $ nova secgroup-add-group-rule cluster global-http tcp 22 22

The "cluster" rule allows SSH access from any other instance that uses the `global-http` group.