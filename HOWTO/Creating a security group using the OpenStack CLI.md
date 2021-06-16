You must use a security group that has the appropriate IP filter rules to enable access to grid nodes in your StorageGRID Webscale system.

About this task
---------------

You might be able to use an existing security group. The recommended security group allows all traffic on all ports for all protocols. This is because each grid node is protected by its own internal firewall. 

Note: If you prefer, you can also create a security group using the OpenStack Dashboard.

* Enter this command to list existing security groups:openstack security group list
* Enter this command to view details for a specific security group:openstack security group show name-or-id
* If you need to create a new group, enter these commands to create a wide open security group for use with grid nodes:

  openstack security group create group-name

  openstack security group rule create --proto tcp --src-ip 0.0.0.0/0 --dst-port 1:65525 group-name

  openstack security group rule create --proto udp --src-ip 0.0.0.0/0 --dst-port 1:65525 group-name

  openstack security group rule create --proto icmp --src-ip 0.0.0.0/0 group-name