[Source](http://www.tuxfixer.com/bash-script-for-automated-openstack-tenant-creation/ "Permalink to Bash Script for Automated OpenStack Tenant Creation – tuxfixer.com")

![openstack](http://tuxfixer.com/wp-content/uploads/2015/11/openstack-logo-rgb-150x150.png)
 During **OpenStack** deployment and testing you may need to quickly create: project tenants, tenant users, networks, routers, security groups, etc… just to check, if Cloud is working properly.

Instead of arduous clicking all this stuff in Horizon dashboard, you can use the below Bash script, which will quickly create:
 – **multiple project tenants**
 – **2 tenant users (admin, member)**
 – **tenant networks, sub-networks**
 – **routers**
 – **router gateways (to existing public network)**
 – **tenant ports in routers**
 – **security groups (Allow all TCP,UDP,ICMP ingress/egress)**
 – **cirros glance image (cirros-0.3.4-x86\_64-disk.img)**

Download script: [**tenant\_setup.sh**](http://tuxfixer.com/wp-content/uploads/2015/11/tenant_setup.txt)

 Usage:
 1. Download and save above text file as **tenant\_setup.sh** on your **controller\_node:/root** directory.

[![](http://ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=US&ASIN=1789951542&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=tuxfixer-20)](https://www.amazon.com/gp/product/1789951542/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1789951542&linkCode=as2&tag=tuxfixer-20&linkId=d5e4ba292002222b457d1aec71c15d62)[![](http://ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=B07XGF2G87&Format=_SL250_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=tuxfixer-20&language=en_US)](https://www.amazon.com/Hands-Machine-Learning-Scikit-Learn-TensorFlow-ebook/dp/B07XGF2G87/ref=as_li_ss_il?_encoding=UTF8&psc=1&refRID=Z3K3MQTN6VXJ3Y3EJM5C&linkCode=li3&tag=tuxfixer-20&linkId=71cd570cc038c8feba0085fc36eb876b&language=en_US)[![](http://ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=1839213191&Format=_SL250_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=tuxfixer-20&language=en_US)](https://www.amazon.com/gp/product/1839213191/ref=as_li_ss_il?ie=UTF8&linkCode=li3&tag=tuxfixer-20&linkId=23e1eec818e658db1d7123276a1b600d&language=en_US)

2\. Source your **controller\_node:/root/keystonerc\_admin** file to import admin keystone credentials needed by the script:

    [root@controller ~]# source /root/keystonerc_admin

3\. Edit **tenant\_setup.sh** file and customize parameter section according to your environment and your needs:

    # =========== parameters =============
    tenant_count=3   # number of tenants to create
    tenant_prefix=tuxfixer-tenant   # tenant prefix for new tenants 
    tenant_admin_prefix=tuxfixer-admin   # admin account name prefix
    tenant_user_prefix=tuxfixer-user   # regular user (member) account name prefix
    password=password   # password used for admin and member accounts
    keystone_ip=192.168.2.4   # ip of your controller node
    priv_net_prefix=priv_net   # tenant network name prefix
    priv_subnet_prefix=sub$priv_net_prefix  # tenant sub-network name prefix
    router_prefix=router   # router name prefix
    public_net=pub_net   # existing public (provider) network name to attach routers to
    sec_group=allow-all   # security group name prefix
    image_url=http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-x86_64-disk.img   # cirros image url
    # ====================================

4\. Run script:

    [root@controller ~(keystone_admin)]# /root/tenant_setup.sh

Example output for 1 tenant creation:

    [root@controller ~(keystone_admin)]# /root/tenant_setup.sh 
    +-------------+----------------------------------+
    |   Property  |              Value               |
    +-------------+----------------------------------+
    | description |   Tenant used by     |
    |   enabled   |               True               |
    |      id     | 1bee77abc7744d918691a399e54f6b9f |
    |     name    |         tuxfixer-tenant1         |
    +-------------+----------------------------------+
    +----------+----------------------------------+
    | Property |              Value               |
    +----------+----------------------------------+
    |  email   |                                  |
    | enabled  |               True               |
    |    id    | bd2d3e0098b6438d9b20390b181678a9 |
    |   name   |          tuxfixer-user1          |
    | username |          tuxfixer-user1          |
    +----------+----------------------------------+
    +----------+----------------------------------+
    | Property |              Value               |
    +----------+----------------------------------+
    |  email   |                                  |
    | enabled  |               True               |
    |    id    | 6a63dcd8857b407a89e6e57ca5ecb105 |
    |   name   |         tuxfixer-admin1          |
    | username |         tuxfixer-admin1          |
    +----------+----------------------------------+
    writing keystones
    1bee77abc7744d918691a399e54f6b9f
    Created a new network:
    +---------------------------+--------------------------------------+
    | Field                     | Value                                |
    +---------------------------+--------------------------------------+
    | admin_state_up            | True                                 |
    | id                        | b1a765e1-02a8-426b-9b73-bd88f13b4adf |
    | name                      | priv_net1                            |
    | provider:network_type     | vlan                                 |
    | provider:physical_network | physnet1                             |
    | provider:segmentation_id  | 1002                                 |
    | router:external           | False                                |
    | shared                    | False                                |
    | status                    | ACTIVE                               |
    | subnets                   |                                      |
    | tenant_id                 | 1bee77abc7744d918691a399e54f6b9f     |
    +---------------------------+--------------------------------------+
    Created a new subnet:
    +-------------------+--------------------------------------------------+
    | Field             | Value                                            |
    +-------------------+--------------------------------------------------+
    | allocation_pools  | {"start": "192.168.1.2", "end": "192.168.1.254"} |
    | cidr              | 192.168.1.0/24                                   |
    | dns_nameservers   |                                                  |
    | enable_dhcp       | True                                             |
    | gateway_ip        | 192.168.1.1                                      |
    | host_routes       |                                                  |
    | id                | 39fdfa36-f6bc-43b1-8bc5-941d797b5033             |
    | ip_version        | 4                                                |
    | ipv6_address_mode |                                                  |
    | ipv6_ra_mode      |                                                  |
    | name              | subpriv_net1                                     |
    | network_id        | b1a765e1-02a8-426b-9b73-bd88f13b4adf             |
    | tenant_id         | 1bee77abc7744d918691a399e54f6b9f                 |
    +-------------------+--------------------------------------------------+
    Created a new router:
    +-----------------------+--------------------------------------+
    | Field                 | Value                                |
    +-----------------------+--------------------------------------+
    | admin_state_up        | True                                 |
    | distributed           | False                                |
    | external_gateway_info |                                      |
    | ha                    | False                                |
    | id                    | 2c3dd75d-6ae3-475e-8ef1-e34a6b394fde |
    | name                  | router1                              |
    | routes                |                                      |
    | status                | ACTIVE                               |
    | tenant_id             | 1bee77abc7744d918691a399e54f6b9f     |
    +-----------------------+--------------------------------------+
    Set gateway for router router1
    Added interface 4fe3ae2e-cfa1-4922-a705-283f31d34b8a to router router1.
    Created a new security_group:
    +----------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
    | Field                | Value                                                                                                                                                                                                                                                                                                                         |
    +----------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
    | description          | Allow all TCP,UDP,ICMP ingres/egres                                                                                                                                                                                                                                                                                           |
    | id                   | b94a0dc0-438c-4f27-a34e-ee4590932dc0                                                                                                                                                                                                                                                                                          |
    | name                 | allow-all1                                                                                                                                                                                                                                                                                                                    |
    | security_group_rules | {"remote_group_id": null, "direction": "egress", "remote_ip_prefix": null, "protocol": null, "tenant_id": "1bee77abc7744d918691a399e54f6b9f", "port_range_max": null, "security_group_id": "b94a0dc0-438c-4f27-a34e-ee4590932dc0", "port_range_min": null, "ethertype": "IPv4", "id": "42f466d6-61ef-4008-8ce8-83699d1b504d"} |
    |                      | {"remote_group_id": null, "direction": "egress", "remote_ip_prefix": null, "protocol": null, "tenant_id": "1bee77abc7744d918691a399e54f6b9f", "port_range_max": null, "security_group_id": "b94a0dc0-438c-4f27-a34e-ee4590932dc0", "port_range_min": null, "ethertype": "IPv6", "id": "c424c6e5-7316-4c74-82c9-86dc5336fd67"} |
    | tenant_id            | 1bee77abc7744d918691a399e54f6b9f                                                                                                                                                                                                                                                                                              |
    +----------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
    Created a new security_group_rule:
    +-------------------+--------------------------------------+
    | Field             | Value                                |
    +-------------------+--------------------------------------+
    | direction         | ingress                              |
    | ethertype         | IPv4                                 |
    | id                | 399709ac-5a86-4970-943d-28ed5a58d17b |
    | port_range_max    |                                      |
    | port_range_min    |                                      |
    | protocol          | icmp                                 |
    | remote_group_id   |                                      |
    | remote_ip_prefix  |                                      |
    | security_group_id | b94a0dc0-438c-4f27-a34e-ee4590932dc0 |
    | tenant_id         | 1bee77abc7744d918691a399e54f6b9f     |
    +-------------------+--------------------------------------+
    Created a new security_group_rule:
    +-------------------+--------------------------------------+
    | Field             | Value                                |
    +-------------------+--------------------------------------+
    | direction         | egress                               |
    | ethertype         | IPv4                                 |
    | id                | 0e44c502-50ca-4ea1-a6c4-04cf3ef7b0af |
    | port_range_max    |                                      |
    | port_range_min    |                                      |
    | protocol          | icmp                                 |
    | remote_group_id   |                                      |
    | remote_ip_prefix  |                                      |
    | security_group_id | b94a0dc0-438c-4f27-a34e-ee4590932dc0 |
    | tenant_id         | 1bee77abc7744d918691a399e54f6b9f     |
    +-------------------+--------------------------------------+
    Created a new security_group_rule:
    +-------------------+--------------------------------------+
    | Field             | Value                                |
    +-------------------+--------------------------------------+
    | direction         | ingress                              |
    | ethertype         | IPv4                                 |
    | id                | 675a9a0e-f3cc-4c10-9f55-4d8b774e264d |
    | port_range_max    | 65535                                |
    | port_range_min    | 1                                    |
    | protocol          | tcp                                  |
    | remote_group_id   |                                      |
    | remote_ip_prefix  |                                      |
    | security_group_id | b94a0dc0-438c-4f27-a34e-ee4590932dc0 |
    | tenant_id         | 1bee77abc7744d918691a399e54f6b9f     |
    +-------------------+--------------------------------------+
    Created a new security_group_rule:
    +-------------------+--------------------------------------+
    | Field             | Value                                |
    +-------------------+--------------------------------------+
    | direction         | egress                               |
    | ethertype         | IPv4                                 |
    | id                | 3daa01f9-fe89-447a-8dda-1607267f7565 |
    | port_range_max    | 65535                                |
    | port_range_min    | 1                                    |
    | protocol          | tcp                                  |
    | remote_group_id   |                                      |
    | remote_ip_prefix  |                                      |
    | security_group_id | b94a0dc0-438c-4f27-a34e-ee4590932dc0 |
    | tenant_id         | 1bee77abc7744d918691a399e54f6b9f     |
    +-------------------+--------------------------------------+
    Created a new security_group_rule:
    +-------------------+--------------------------------------+
    | Field             | Value                                |
    +-------------------+--------------------------------------+
    | direction         | ingress                              |
    | ethertype         | IPv4                                 |
    | id                | ce72f706-4e7e-479f-90e4-a5fe14ad9ea7 |
    | port_range_max    | 65535                                |
    | port_range_min    | 1                                    |
    | protocol          | udp                                  |
    | remote_group_id   |                                      |
    | remote_ip_prefix  |                                      |
    | security_group_id | b94a0dc0-438c-4f27-a34e-ee4590932dc0 |
    | tenant_id         | 1bee77abc7744d918691a399e54f6b9f     |
    +-------------------+--------------------------------------+
    Created a new security_group_rule:
    +-------------------+--------------------------------------+
    | Field             | Value                                |
    +-------------------+--------------------------------------+
    | direction         | egress                               |
    | ethertype         | IPv4                                 |
    | id                | 95b069bf-4e0a-4c01-923a-f4a4e7f3cc09 |
    | port_range_max    | 65535                                |
    | port_range_min    | 1                                    |
    | protocol          | udp                                  |
    | remote_group_id   |                                      |
    | remote_ip_prefix  |                                      |
    | security_group_id | b94a0dc0-438c-4f27-a34e-ee4590932dc0 |
    | tenant_id         | 1bee77abc7744d918691a399e54f6b9f     |
    +-------------------+--------------------------------------+
    +------------------+--------------------------------------+
    | Property         | Value                                |
    +------------------+--------------------------------------+
    | checksum         | None                                 |
    | container_format | bare                                 |
    | created_at       | 2015-11-25T19:41:40                  |
    | deleted          | False                                |
    | deleted_at       | None                                 |
    | disk_format      | qcow2                                |
    | id               | 14052c39-cf88-4919-9eda-f74856429411 |
    | is_public        | True                                 |
    | min_disk         | 0                                    |
    | min_ram          | 0                                    |
    | name             | cirros                               |
    | owner            | cc0a80951d6f49628fdb64fc329a9c57     |
    | protected        | False                                |
    | size             | 13287936                             |
    | status           | queued                               |
    | updated_at       | 2015-11-25T19:41:40                  |
    | virtual_size     | None                                 |
    +------------------+--------------------------------------+
    +--------------------------------------+--------+-------------+------------------+----------+--------+
    | ID                                   | Name   | Disk Format | Container Format | Size     | Status |
    +--------------------------------------+--------+-------------+------------------+----------+--------+
    | 14052c39-cf88-4919-9eda-f74856429411 | cirros | qcow2       | bare             | 13287936 | saving |
    +--------------------------------------+--------+-------------+------------------+----------+--------+

[![](http://ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=US&ASIN=B077YHRZLT&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=tuxfixer-20)](https://www.amazon.com/gp/product/B077YHRZLT/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B077YHRZLT&linkCode=as2&tag=tuxfixer-20&linkId=4caa680c3f6088dcc499b61c0220cf6f)[![](http://ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=US&ASIN=1492056472&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=tuxfixer-20)](https://www.amazon.com/gp/product/1492056472/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1492056472&linkCode=as2&tag=tuxfixer-20&linkId=d64be631591286feac162b846d33723d)[![](http://ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=B086KQMFT5&Format=_SL250_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=tuxfixer-20&language=en_US)](https://www.amazon.com/Machine-Learning-Intelligence-Programming-Comprehensive-ebook/dp/B086KQMFT5/ref=as_li_ss_il?_encoding=UTF8&psc=1&refRID=Z3K3MQTN6VXJ3Y3EJM5C&linkCode=li3&tag=tuxfixer-20&linkId=a1cd5f2e8ec2931c16f231f6fb7f8cd4&language=en_US)

```bash
#!/bin/bash

# =========== parameters =============
tenant_count=1
tenant_prefix=tuxfixer-tenant
tenant_admin_prefix=tuxfixer-admin
tenant_user_prefix=tuxfixer-user
password=password
keystone_ip=192.168.2.4
priv_net_prefix=priv_net
priv_subnet_prefix=sub$priv_net_prefix
router_prefix=router
public_net=pub_net
sec_group=allow-all
image_url=http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-x86_64-disk.img
# ====================================

function create_tenant(){
        keystone tenant-create --name $tenant_prefix$1 --description "Tenant used by <admin name>"
        keystone user-create --name $tenant_user_prefix$1 --pass $password
        keystone user-create --name $tenant_admin_prefix$1 --pass $password
        keystone user-role-add --user $tenant_user_prefix$1 --role _member_ --tenant $tenant_prefix$1
        keystone user-role-add --user $tenant_admin_prefix$1 --role admin --tenant $tenant_prefix$1
        keystone_identity_file=/root/keystonerc_$tenant_admin_prefix$1
        echo "writing keystones"
        cat <<EOB>$keystone_identity_file
export OS_USERNAME=$tenant_admin_prefix$1
export OS_TENANT_NAME=$tenant_prefix$1
export OS_PASSWORD=$password
export OS_AUTH_URL=http://$keystone_ip:5000/v2.0/
export PS1='[\u@\h \W($tenant_admin_prefix$1@$tenant_prefix$1)]\$ '
EOB

        keystone_identity_file=/root/keystonerc_$tenant_user_prefix$1
        cat <<EOB>$keystone_identity_file
export OS_USERNAME=$tenant_user_prefix$1
export OS_TENANT_NAME=$tenant_prefix$1
export OS_PASSWORD=$password
export OS_AUTH_URL=http://$keystone_ip:5000/v2.0/
export PS1='[\u@\h \W($tenant_user_prefix$1@$tenant_prefix$1)]\$ '
EOB

}

function create_net_and_sec_groups(){

	tenant_id=$(keystone tenant-get $tenant_prefix$1 | grep id | cut -f3 -d '|' | tr -d ' ')
	echo $tenant_id
	neutron net-create --tenant-id $tenant_id $priv_net_prefix$1
	neutron subnet-create  --tenant-id $tenant_id --name $priv_subnet_prefix$1 $priv_net_prefix$1 192.168.$1.0/24
	neutron router-create  --tenant-id $tenant_id $router_prefix$1
        neutron router-gateway-set $router_prefix$1 $public_net
	neutron router-interface-add $router_prefix$1 $priv_subnet_prefix$1
	neutron security-group-create --tenant-id $tenant_id --description "Allow all TCP,UDP,ICMP ingres/egres" $sec_group$1
	neutron security-group-rule-create --tenant-id $tenant_id --protocol icmp --direction ingress $sec_group$1
	neutron security-group-rule-create --tenant-id $tenant_id --protocol icmp --direction egress $sec_group$1
	neutron security-group-rule-create --tenant-id $tenant_id --protocol tcp --port-range-min 1 --port-range-max 65535 --direction ingress $sec_group$1
	neutron security-group-rule-create --tenant-id $tenant_id --protocol tcp --port-range-min 1 --port-range-max 65535 --direction egress $sec_group$1
	neutron security-group-rule-create --tenant-id $tenant_id --protocol udp --port-range-min 1 --port-range-max 65535 --direction ingress $sec_group$1
	neutron security-group-rule-create --tenant-id $tenant_id --protocol udp --port-range-min 1 --port-range-max 65535 --direction egress $sec_group$1

}

function upload_image(){
	glance image-create --name="cirros" --disk-format=qcow2 --container-format=bare --is-public=true --copy-from=$image_url
	glance image-list
}

#main
for i in `seq 1 $tenant_count`; do
	create_tenant $i
	create_net_and_sec_groups $i
        upload_image 
done
```