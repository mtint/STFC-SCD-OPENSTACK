**[OpenStack](https://www.openstack.org/)** is a set of free and open-source tools for building and managing cloud computing platforms for public and private clouds.

**[OpenStack](https://www.itzgeek.com/tag/openstack)** is mostly deployed as IaaS (infrastructure-as-a-service), where you can make resources like **[compute (VM)](https://www.openstack.org/software/releases/ocata/components/nova)**, **[Networking](https://www.openstack.org/software/releases/ocata/components/neutron)**, **[Storage](https://www.openstack.org/software/releases/ocata/components/cinder)**, and **[others](https://docs.openstack.org/install-guide/get-started-with-openstack.html)** available to the end customer.

Though OpenStack’s core function is to provide IaaS platform, it is used as DBaaS (database-as-a-service), building Hadoop clusters, Container orchestration and much more.

In this article, we will perform Single Node OpenStack Installation on **[CentOS 7](https://www.itzgeek.com/tag/centos-7)** using **[rdo repositories](https://www.rdoproject.org/documentation/repositories/)**.

In single node OpenStack installation, all of its basic functionalities such as compute, network, storage, and dashboard are installed on the same machine. This method of installation is the best for proof of concept (POC).

If you are planning to perform Multi-Node OpenStack Installation on CentOS 7, then watch this space for our upcoming tutorial.

Environment
-----------

Hostname: server.itzgeek.local
 IP Address: 192.168.1.110

### Prerequisites

### Hardware

Make sure your system has at least 16GB of RAM and a processor with VT support. Check the VT support using the below command.

    egrep --color 'vmx|svm' /proc/cpuinfo | wc -l

**Output: (should not be zero)
**

    2

### Update System

Make sure your machine has the **[latest version of CentOS 7 / RHEL 7](https://www.itzgeek.com/how-tos/linux/centos-how-tos/how-to-update-centos-7-07-17-2-to-centos-7-3.html)** on the machine.

    yum -y update

### Setup RDO repositories

To begin, you need to setup RDO repositories for installing OpenStack on your system.

    yum install -y https://rdoproject.org/repos/rdo-release.rpm

**On RHEL 7**, you would need to enable Optional, Extras, and RH common channels. Run the following command.

    subscription-manager repos --enable=rhel-7-server-optional-rpms \
    --enable=rhel-7-server-extras-rpms --enable=rhel-7-server-rh-common-rpms

### Network

As a mandatory requirement, you would need to configure static IP address on your system in order have external network access to the servers and instances.

**READ**: **[READ: How to configure static IP address on CentOS 7 / RHEL 7](https://www.itzgeek.com/how-tos/linux/centos-how-tos/how-to-configure-static-ip-address-in-centos-7-rhel-7-fedora-26.html)**

Also, disable firewall and NetworkManager.

ADVERTISEMENT

    systemctl disable firewalld
    systemctl stop firewalld
    systemctl disable NetworkManager
    systemctl stop NetworkManager
    systemctl enable network
    systemctl start network

Install Packstack Installer
---------------------------

Let us first install the Packstack Installer that provides an easy way to install OpenStack on the system. Use **[YUM command](https://www.itzgeek.com/how-tos/linux/centos-how-tos/linux-basics-30-yum-command-examples-for-linux-package-manager.html)** to install it.

    yum install -y openstack-packstack

Install OpenStack (Pike)
------------------------

Running the Packstack installer with default options would setup Demo project and other stuff which are not necessary for our setup.

Generate OpenStack answer file.

    packstack --gen-answer-file=/root/answer.txt

Edit the answer file.

    vi answer.txt

Here, we will install the OpenStack without demo project. Also, we will create an OVS bridge called “br-ex” for external connectivity to instances (VM) through a logical segment called “extnet”.

**Make sure the physical interface (ens33) you mention in this file matches the network adapter available on your system.**

    # Skip the provision of Demo project
    CONFIG_PROVISION_DEMO=n

    # Change Admin Password - Used to Login to OpenStack Dashboard
    CONFIG_KEYSTONE_ADMIN_PW=xxx

    # Config OpenStack Dashboard over SSL
    CONFIG_HORIZON_SSL=y

    # Map physical network bridge to the logical name. <Logical Name:Bridge Name>
    CONFIG_NEUTRON_OVS_BRIDGE_MAPPINGS=extnet:br-ex

    # Create bridge for external connectivity. <Bridge Name: NW card name>
    CONFIG_NEUTRON_OVS_BRIDGE_IFACES=br-ex:ens33

**extnet **: Logical name for our external physical connection.
**br-ex **: Bridge adapter
**eth0 or ens33** : Network Interface name

Run the PackStack installer with the answer file we just modified according to our requirement.

    packstack --answer-file=/root/answer.txt

The installation of OpenStack will take quite a bit long time.Take a break.

![Single Node OpenStack Installation on CentOS 7 - OpenStack Installation](https://www.itzgeek.com/wp-content/uploads/2017/12/Single-Node-OpenStack-Installation-on-CentOS-7-OpenStack-Installation.png)Single Node OpenStack Installation on CentOS 7 – OpenStack Installation

On completion, you should get a message something like this.

[![](https://www.itzgeek.com/wp-content/uploads/2017/12/Single-Node-OpenStack-Installation-on-CentOS-7-Completion-of-OpenStack-Installation-1024x311.png)](https://www.itzgeek.com/wp-content/uploads/2017/12/Single-Node-OpenStack-Installation-on-CentOS-7-Completion-of-OpenStack-Installation.png)Single Node OpenStack Installation on CentOS 7 – Completion of OpenStack Installation

Access OpenStack Dashboard
--------------------------

To access OpenStack Dashboard, open up a browser and visit URL

https://ip.add.re.ss/dashboard

**OR**

https://fqdn/dashboard

Since we have used the self signed certificate for OpenStack dashboard, you would get below page saying the page is not secure.

[![Single Node OpenStack Installation on CentOS 7 - OpenStack INsecure connection](https://www.itzgeek.com/wp-content/uploads/2017/12/Single-Node-OpenStack-Installation-on-CentOS-7-OpenStack-INsecure-connection-1024x556.png)](https://www.itzgeek.com/wp-content/uploads/2017/12/Single-Node-OpenStack-Installation-on-CentOS-7-OpenStack-INsecure-connection.png)Single Node OpenStack Installation on CentOS 7 – OpenStack INsecure connection

Add an exception for OpenStack dashboard in Firefox so that we can access the dashboard.

[![Single Node OpenStack Installation on CentOS 7 - Add SSL Exception](https://www.itzgeek.com/wp-content/uploads/2017/12/Single-Node-OpenStack-Installation-on-CentOS-7-Add-SSL-Exception-1024x558.png)](https://www.itzgeek.com/wp-content/uploads/2017/12/Single-Node-OpenStack-Installation-on-CentOS-7-Add-SSL-Exception.png)Single Node OpenStack Installation on CentOS 7 – Add SSL Exception

**Login as user: admin with the password you set on CONFIG\_KEYSTONE\_ADMIN\_PW parameter from the answer file.**

ADVERTISEMENT

 [![Single Node OpenStack Installation on CentOS 7 - OpenStack Login Page](https://www.itzgeek.com/wp-content/uploads/2017/12/Single-Node-OpenStack-Installation-on-CentOS-7-OpenStack-Login-Page-1024x557.png)](https://www.itzgeek.com/wp-content/uploads/2017/12/Single-Node-OpenStack-Installation-on-CentOS-7-OpenStack-Login-Page.png)Single Node OpenStack Installation on CentOS 7 – OpenStack Login Page

**OpenStack Dashboard will look like below: – Projects
**

[![Single Node OpenStack Installation on CentOS 7 - OpenStack Projects](https://www.itzgeek.com/wp-content/uploads/2017/12/Single-Node-OpenStack-Installation-on-CentOS-7-OpenStack-Projects-1024x557.png)](https://www.itzgeek.com/wp-content/uploads/2017/12/Single-Node-OpenStack-Installation-on-CentOS-7-OpenStack-Projects.png)Single Node OpenStack Installation on CentOS 7 – OpenStack Projects

That’s All. In our next article, we will setup OpenStack Networking to connect VM instances from an external network and Launch VM instances using OpenStack Dashboard.