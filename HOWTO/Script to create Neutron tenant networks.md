In my two node OpenStack setup (RDO on Fedora 20), I often have to create multiple Neutron tenant networks ([here](http://docs.openstack.org/admin-guide-cloud/content//ch_networking.html) you can read a more on what’s a tenant network) for various testing purposes.

To alleviate this manual process, a [trivial script](https://github.com/kashyapc/ostack-misc/blob/master/create-new-tenant-network.sh) that’ll create a new Neutron tenant network after you provide a few positional parameters in an existing OpenStack setup. This assumes there’s a working OpenStack setup with Neutron configured. I tested this on Neutron + OVS + GRE. This should work with any other Neutron plugins, as tenant networks is a Neutron concept (and not specific to plugins).

Usage:

    $ ./create-new-tenant-network.sh                \
                        TENANTNAME USERNAME         \
                        SUBNETSPACE ROUTERNAME      \ 
                        PRIVNETNAME PRIVSUBNETNAME  \

To create a new tenant network with 14.0.0.0/24 subnet:

    $ ./create-new-tenant-network.sh \
      demoten1 tuser1                \
      14.0.0.0 trouter1              \
      priv-net1 priv-subnet1

The script does the below, in that order:

1. Creates a Keystone tenant called *demoten1*.
2. Then, a Keystone user called *tuser1* and associates it to the
*demoten1*.
3. Creates a Keystone RC file for the user (tuser1) and sources it.
4. Creates a new private network called *priv-net1*.
5. Creates a new private subnet called *priv-subnet1* on *priv-net1*.
6. Creates a router called *trouter1*.
7. Associates the router (*trouter1* in this case) to an existing external network (the script assumes it’s called as *ext*) by setting it as its gateway.
8. Associates the private network interface (*priv-net1*) to the router (*trouter1*).
9. Adds Neutron security group rules for this test tenant (*demoten1*) for **ICMP** and **SSH**.

To test if it’s all working, try booting a new Nova guest in the tenant network, and it should aquire an IP address from 14.0.0.0/24 subnet.

Posting the relevant part of the script:

    [. . .]
    # Source the admin credentials
    source keystonerc_admin

    # Positional parameters
    tenantname=$1
    username=$2
    subnetspace=$3
    routername=$4
    privnetname=$5
    privsubnetname=$6

    # Create a tenant, user and associate a role/tenant to it.
    keystone tenant-create       \
             --name $tenantname

    keystone user-create         \
             --name $username    \
             --pass fedora

    keystone user-role-add       \
             --user $username    \
             --role user         \
             --tenant $tenantname

    # Create an RC file for this user and source the credentials
    cat >> keystonerc_$username<<EOF
    export OS_USERNAME=$username
    export OS_TENANT_NAME=$tenantname
    export OS_PASSWORD=fedora
    export OS_AUTH_URL=http://localhost:5000/v2.0/
    export PS1='[\u@\h \W(keystone_$username)]\$ '
    EOF

    # Source this user credentials
    source keystonerc_$username

    # Create new private network, subnet for this user tenant
    neutron net-create $privnetname

    neutron subnet-create $privnetname \
            $subnetspace/24            \
            --name $privsubnetname     \

    # Create a router
    neutron router-create $routername

    # Associate the router to the external network 
    # by setting its gateway.
    # NOTE: This assumes, the external network name is 'ext'
    EXT_NET=$(neutron net-list     \
    | grep ext | awk '{print $2;}')

    PRIV_NET=$(neutron subnet-list \
    | grep $privsubnetname | awk '{print $2;}')

    ROUTER_ID=$(neutron router-list \
    | grep $routername | awk '{print $2;}')

    neutron router-gateway-set  \
            $ROUTER_ID $EXT_NET \

    neutron router-interface-add \
            $ROUTER_ID $PRIV_NET \

    # Add Neutron security groups for this test tenant
    neutron security-group-rule-create   \
            --protocol icmp              \
            --direction ingress          \
            --remote-ip-prefix 0.0.0.0/0 \
            default

    neutron security-group-rule-create   \
            --protocol tcp               \
            --port-range-min 22          \
            --port-range-max 22          \
            --direction ingress          \
            --remote-ip-prefix 0.0.0.0/0 \
            default

NOTE: As shell script is executed in a sub-process (of the parent shell), you won’t notice the keystone sourcing of the newly created user. (You can notice it in the [stdout of the script in debug mode](https://github.com/kashyapc/ostack-misc/blob/master/temp/stdout-new-tenant-creation.txt).)

If it’s helpful for someone, here’s my [Neutron configurations & iptables rules](http://kashyapc.fedorapeople.org/virt/openstack/neutron-configs-GRE-OVS-two-node.txt) for a two node setup with Neutron + OVS + GRE: