[Source](https://www.linuxtechi.com/create-delete-virtual-machine-command-line-openstack/ "Permalink to How to Create an Instance in OpenStack via Command Line")

As we all of know that Openstack is getting popular day by day. Most of the organizations are moving their IT infrastructure from traditional virtualization to the private cloud like OpenStack. Openstack is available in two versions:

* **Community OpenStack** – As the name suggests, it is an open source and community based private cloud. Community usually release new version of openstack in every 6 months
* **Enterprise OpenStack** – As the name suggests, it is commercial openstack, different vendors created their own openstack like Red hat has its own RHOSP ( Red Hat Openstack Platform), Mirantis Openstack, Canonical OpenStack, SUSE OpenStack Cloud and VIO (VMware Integrated OpenStack).

Being a cloud administrator we generally create and delete virtual machines from GUI (Horizon dashboard). But a Linux geek always prefer to use command line to do all day to day openstack operations task, so in this article I will demonstrate how to create and delete virtual machine from the command line.

#### [![Create-Delete-VMs-Command-Line-Openstack](https://www.linuxtechi.com/wp-content/uploads/2018/07/Create-Delete-VMs-Command-Line-Openstack.jpg?ezimgfmt=rs:478x344/rscb17/ng:webp/ngcb17)](https://www.linuxtechi.com/wp-content/uploads/2018/07/Create-Delete-VMs-Command-Line-Openstack.jpg)

#### Creating Virtual Machine from command Line

To create virtual machine from command line, first login to the controller node. Create a project credential file. In this tutorial I will be using non production project credential.

    ~]# source  keystone_linuxtechi_rc

First find the following details using openstack command, we would required these details during the creation of virtual machine.

* Flavor
* Image
* Network
* Security Group
* Key Name

**Get the flavor list using below openstack command,**

    [root@controller01 ~]# openstack flavor list
    +--------------------------------------+-----------+-------+------+-----------+-------+-----------+
    | ID                                   | Name      |   RAM | Disk | Ephemeral | VCPUs | Is Public |
    +--------------------------------------+-----------+-------+------+-----------+-------+-----------+
    | 1                                    | m1.tiny   |   512 |    1 |         0 |     1 | True      |
    | 1093ac5d-9383-4ffb-96d8-4fbf9e28fdbf | Size15    | 10240 |  100 |         0 |     4 | True      |
    | 1cf5a2ec-b111-403f-97dc-5670836a1d03 | Size3     |  2048 |   50 |         0 |     1 | True      |
    | 3                                    | m1.medium |  4096 |   40 |         0 |     2 | True      |
    | 4                                    | m1.large  |  8192 |   80 |         0 |     4 | True      |
    | 5                                    | m1.xlarge | 16384 |  160 |         0 |     8 | True      |
    | 5109b174-7348-4b21-9f6b-785adc842cf0 | Size7     |  4096 |  100 |         0 |     2 | True      |
    | 711b0acc-5a1a-4514-93d1-c11b8862cea1 | Size8     |  2096 |  100 |         0 |     2 | True      |
    | 71e8b1b8-43a6-4328-a749-f065da988e8f | Size12    |  4096 |   50 |         0 |     2 | True      |
    | 73ac76f9-026e-4038-b34a-bac542141351 | Size6     |  4096 |  100 |         0 |     2 | True      |
    | 79e6456e-6238-4502-b086-222e97e2989c | Size11    |  8192 |  100 |         0 |     2 | True      |
    | 85c9f8ef-e89d-4422-a8fc-88c29d0b8f97 | size10    |  6144 |   50 |         0 |     2 | True      |
    | a9912a54-e389-4da5-9be8-c22b033d59f3 | Size2     |  8192 |  150 |         0 |     2 | True      |
    | ae23d0a5-777b-4520-b2e5-d5776cb88a55 | Size14    |  7168 |  100 |         0 |     7 | True      |
    | ce236593-7324-4408-945b-863932e70df9 | m1.small  |  2048 |   25 |         0 |     1 | True      |
    | d7c2ff23-8f3d-424b-a42d-c3027ccd05d3 | Size4     |  4096 |   30 |         0 |     2 | True      |
    | e02efedd-f9d4-42df-9c89-096a8093291f | Size16    | 16384 |  200 |         0 |     4 | True      |
    | e323b927-411a-40a3-8d02-0dac446f6464 | Size13    |  8192 |  110 |         0 |     3 | True      |
    | f6125634-93e5-4531-b678-e91b4d75aed9 | Size5     |  4096 |  200 |         0 |     1 | True      |
    +--------------------------------------+-----------+-------+------+-----------+-------+-----------+
    [root@controller01 ~]#

**Get the image name and its id,**

    [root@controller01 ~]# openstack image list  | grep cirros
    | 02fc6c59-8dc2-4a88-90fa-b811077b6df9 | cirros   | active |
    [root@controller01 ~]#

**Get Private Virtual network details, which will be attached to the VM
**

    [root@controller01 ~]# openstack network list | grep -i nonprod
    | e0be93b8-728b-4d4d-a272-7d672b2560a6 | TnQ-NonProd-Internal | 02d5eec2-6ca1-4e73-b4a4-08a7a2d6a4e2 |
    [root@controller01 ~]#

**Find the Security Group **

    [root@controller01 ~]# openstack security group list | grep SG
    | 2266f789-3c4d-4751-8609-041c09625860 | LinuxTechi_SG | LinuxTechi SG | 49853ccef4864d6dbc62c024c10ca543 |
    [root@controller01 ~]#

**Find the Key pair, in my case I have below ,**

    [root@controller01 ~]# openstack keypair list | grep -i linuxtechi
    | linuxtechi | e3:12:89:fd:97:75:75:be:8f:41:75:26:09:03:4d:9f |
    [root@controller01 ~]#

**Note:** Above details will be different for you based on your project and env.

Now we have all the details, let’s create a virtual machine using “**openstack server create**” command

Syntax :

    # openstack server create --flavor {flavor-name} --image {Image-Name-Or-Image-ID}  --nic net-id={Network-ID} --security-group {Security_Group_ID} –key-name {Keypair-Name} <VM_Name>

Example:

    [root@controller01 ~]# openstack server create --flavor m1.tiny --image cirros --nic net-id=e0be93b8-728b-4d4d-a272-7d672b2560a6 --security-group LinuxTechi_SG  --key-name linuxtechi pkumar_test_vm
    +--------------------------------------+-----------------------------------------------+
    | Field                                | Value                                         |
    +--------------------------------------+-----------------------------------------------+
    | OS-DCF:diskConfig                    | MANUAL                                        |
    | OS-EXT-AZ:availability_zone          |                                               |
    | OS-EXT-SRV-ATTR:host                 | None                                          |
    | OS-EXT-SRV-ATTR:hypervisor_hostname  | None                                          |
    | OS-EXT-SRV-ATTR:instance_name        | instance-000002b3                             |
    | OS-EXT-STS:power_state               | 0                                             |
    | OS-EXT-STS:task_state                | scheduling                                    |
    | OS-EXT-STS:vm_state                  | building                                      |
    | OS-SRV-USG:launched_at               | None                                          |
    | OS-SRV-USG:terminated_at             | None                                          |
    | accessIPv4                           |                                               |
    | accessIPv6                           |                                               |
    | addresses                            |                                               |
    | adminPass                            | uUf3Nrq5P5ei                                  |
    | config_drive                         |                                               |
    | created                              | 2018-07-07T07:56:15Z                          |
    | flavor                               | m1.tiny (1)                                   |
    | hostId                               |                                               |
    | id                                   | 056c0937-6222-4f49-8405-235b20d173dd          |
    | image                                | cirros (02fc6c59-8dc2-4a88-90fa-b811077b6df9) |
    | key_name                             | linuxtechi                                    |
    | name                                 | pkumar_test_vm                                |
    | os-extended-volumes:volumes_attached | []                                            |
    | progress                             | 0                                             |
    | project_id                           | 49853ccef4864d6dbc62c024c10ca543              |
    | properties                           |                                               |
    | security_groups                      | [{u'name': u'LinuxTechi_SG'}]                 |
    | status                               | BUILD                                         |
    | updated                              | 2018-07-07T07:56:15Z                          |
    | user_id                              | 322c33b03c424563b43642994cae0709              |
    +--------------------------------------+-----------------------------------------------+
    [root@controller01 ~]#

**Note :** To get more help on “**openstack server create**” command , use

    # openstack -h server create

Now Verify the test vm status using below commands,

    [root@controller01 ~]# openstack server list | grep pkumar
    | 056c0937-6222-4f49-8405-235b20d173dd | pkumar_test_vm | ACTIVE | TnQ-NonProd-Internal=192.168.15.62               |
    [root@controller01 ~]#

or

    [root@controller01 ~]# openstack server show pkumar_test_vm

#### Associating a Floating IP to VM

To Associate a floating IP to VM, first get the unused floating IP using beneath command,

    [root@controller01 ~]# openstack ip floating list | grep None | head -2
    | 071f08ac-cd10-4b89-aee4-856ead8e3ead | 169.144.107.154 | None | None                                 |
    | 1baf4232-9cb7-4a44-8684-c604fa50ff60 | 169.144.107.184 | None | None                                 |
    [root@controller01 ~]#

Now Associate the first IP to the server using following command,

    root@controller01 ~]# openstack ip floating add  169.144.107.154  pkumar_test_vm
    [root@controller01 ~]#

Use the beneath command to verify whether floating ip is assigned to the VM or not

    [root@controller01 ~]# openstack server list | grep pkumar_test_vm
    | 056c0937-6222-4f49-8405-235b20d173dd | pkumar_test_vm | ACTIVE  | TnQ-NonProd-Internal=192.168.15.62, 169.144.107.154 |
    [root@controller01 ~]#

Now you can access this VM from outside using the floating IP.

**Create a Virtual machine in Specific Availability zone and compute Host**

Let’s assume we want to create a test VM on compute-02 in NonProduction Availability Zone. To accomplish this pass “**–availability-zone”** parameter in openstack server create command,

Syntax would be something like below:

    # openstack server create --flavor {flavor-name} --image {Image-Name-Or-Image-ID}  --nic net-id={Network-ID} --security-group {Security_Group_ID} --key-name {Keypair-Name} --availability-zone {Availbility-Zone-Name}:{Compute-Host}    <VM_Name>

Example:

    [root@controller01 ~]# openstack server create --flavor m1.tiny --image cirros --nic net-id=e0be93b8-728b-4d4d-a272-7d672b2560a6 --security-group LinuxTechi_SG  --key-name linuxtechi --availability-zone NonProduction:compute-02  nonprod_test_vm

#### Deleting Virtual Machine from Command Line

Use “**openstack server delete**” command to delete the virtual machines, let’s assume we want to delete above created test vm.

    [root@controller01 ~]# openstack server delete  pkumar_test_vm
    [root@controller01 ~]#

This conclude our article, I hope you got basic idea on how to create and delete virtual machine from command line in openstack.

**Read Also :** **[How to Create Availability Zones in OpenStack from Command Line](https://www.linuxtechi.com/create-availability-zones-openstack-command-line/)**