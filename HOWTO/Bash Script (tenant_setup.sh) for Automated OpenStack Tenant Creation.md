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