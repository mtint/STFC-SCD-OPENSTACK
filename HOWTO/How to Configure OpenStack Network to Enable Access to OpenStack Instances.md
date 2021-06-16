This tutorial will guide you on how you can configure OpenStack networking service in order to allow access from external networks to OpenStack instances.

#### Requirements

1. [Install OpenStack in RHEL and CentOS 7](https://www.tecmint.com/openstack-installation-guide-rhel-centos/)

### Step 1: Modify Network Interface Configuration Files

**1.** Before starting to create **OpenStack** networks from dashboard, first we need to create an **OVS** bridge and modify our physical network interface to bind as a port to OVS bridge.

Thus, login to your server terminal, navigate to network interfaces directory scripts and use the physical interface as an excerpt to setup OVS bridge interface by issuing the following commands:

    # cd /etc/sysconfig/network-scripts/
    # ls  
    # cp ifcfg-eno16777736 ifcfg-br-ex

[![Setup OVS Bridge Interface in OpenStack](resources/9463A8A4C9D5210070FF5B09895AC8B3.jpg)](https://www.tecmint.com/wp-content/uploads/2016/04/Setup-OVS-Bridge-Interface-in-OpenStack.jpg)Setup OVS Bridge Interface in OpenStack

**2.** Next, edit and modify the bridge interface **(br-ex)** using a text editor as illustrated below:

    # vi ifcfg-br-ex

Interface **br-ex** excerpt:

    TYPE="Ethernet"
    BOOTPROTO="none"
    DEFROUTE="yes"
    IPV4_FAILURE_FATAL="no"
    IPV6INIT="no"
    IPV6_AUTOCONF="no"
    IPV6_DEFROUTE="no"
    IPV6_FAILURE_FATAL="no"
    NAME="br-ex"
    UUID="1d239840-7e15-43d5-a7d8-d1af2740f6ef"
    DEVICE="br-ex"
    ONBOOT="yes"
    IPADDR="192.168.1.41"
    PREFIX="24"
    GATEWAY="192.168.1.1"
    DNS1="127.0.0.1"
    DNS2="192.168.1.1"
    DNS3="8.8.8.8"
    IPV6_PEERDNS="no"
    IPV6_PEERROUTES="no"
    IPV6_PRIVACY="no"

[![Configure Bridge Network Interface for OpenStack](resources/21FFE542BB2FAD36D9640B4AB8AB846C.jpg)](https://www.tecmint.com/wp-content/uploads/2016/04/Configure-Bridge-Network-Interface-for-OpenStack.jpg)Configure Bridge Network Interface for OpenStack

[![freestar](resources/326D6CBD977657E1205BD616D1F2FACA.svg)](https://freestar.com/?utm_medium=ad_container&utm_source=branding&utm_name=tecmint_incontent)

**3.** Do the same with the physical interface (**eno16777736**), but make sure it looks like this:

    # vi ifcfg-eno16777736

Interface **eno16777736** excerpt:

    TYPE="Ethernet"
    BOOTPROTO="none"
    DEFROUTE="yes"
    IPV4_FAILURE_FATAL="no"
    IPV6INIT="no"
    IPV6_AUTOCONF="no"
    IPV6_DEFROUTE="no"
    IPV6_FAILURE_FATAL="no"
    NAME="eno16777736"
    DEVICE="eno16777736"
    ONBOOT="yes"
    TYPE=”OVSPort”
    DEVICETYPE=”ovs”
    OVS_BRIDGE=”br-ex”

[![Configure Physical Network Interface for OpenStack](resources/5A0C596E45D4A37D48C942087BA6FE03.jpg)](https://www.tecmint.com/wp-content/uploads/2016/04/Configure-Physical-Network-Interface-for-OpenStack.jpg)Configure Physical Network Interface for OpenStack

**Important**: While editing interfaces cards make sure you replace the physical interface name, IPs and DNS servers accordingly.

**4.** Finally, after you’ve modified edited both network interfaces, restart network daemon to reflect changes and verify the new configurations using [ip command](https://www.tecmint.com/ip-command-examples/).

    # systemctl restart network.service
    # ip a

[![Verify Network Configuration](resources/A90F2EE391872B4EEDC2E8A519B7CC39.jpg)](https://www.tecmint.com/wp-content/uploads/2016/04/Verify-Network-Configuration.jpg)Verify Network Configuration

### Step 2: Create a New OpenStack Project (Tenant)

**5.** On this step we need to use **Openstack** dashboard in order to further configure our cloud environment.

Login to **Openstack** web panel (dashboard) with **admin** credentials and go to **Identity** -\> **Projects** -\> **Create Project** and create a new project as illustrated below.

[![Create New OpenStack Project](resources/F5B40AA4E57BFA5B9742EF5D727D9526.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Create-New-OpenStack-Project.png)Create New OpenStack Project[![Add OpenStack New Project Details](resources/03E7C1A1C14D1265FDDC899F49222BD6.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Add-OpenStack-New-Project-Details.png)Add OpenStack New Project Details

**6.** Next, navigate to **Identity** -\> **Users** -\> **Create User** and create a new user by filling all the fields with the required information.

Assure that this new user has the Role assigned as a `_member_` of the newly created tenant (project).

[![Create New User in OpenStack Project](resources/A6F44E4AA807944A5CD0FA6F84E588FD.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Create-New-User-in-OpenStack-Project.png)Create New User in OpenStack Project

### Step 3: Configure OpenStack Network

**7.** After the user has been created, log out **admin** from dashboard and log in with the **new user** in order to create two networks (internal network and external).

Navigate to **Project** -\> **Networks** -\> **Create Network** and setup the internal network as follows:

    Network Name: internal
    Admin State: UP
    Create Subnet: checked

    Subnet Name: internal-tecmint
    Network Address: 192.168.254.0/24
    IP Version: IPv4
    Gateway IP: 192.168.254.1

    DHCP: Enable

Use the below screenshots as a guide. Also, replace the **Network Name**, **Subnet Name** and **IP addresses** with your own custom settings.

[![Login as User to OpenStack Dashboard](resources/8B82142CC9726F0E77DB03F108C8F832.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Login-to-OpenStack-Dashboard-as-User.png)Login as User to OpenStack Dashboard[![Create Network for OpenStack](resources/DF1B46F474BC0BCF76EBAD99ABFEDB05.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Create-Network-for-OpenStack.png)Create Network for OpenStack[![Create Network Subnet for OpenStack](resources/0D3221F2CA7B5A3DB4F2943CEFFAD0F3.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Create-Network-Subnet-for-OpenStack.png)Create Network Subnet for OpenStack[![Enable DHCP for OpenStack](resources/3D7B56B5AB2E7B768351AA1B481E9738.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Enable-DHCP-for-OpenStack.png)Enable DHCP for OpenStack

**8.** Next, use the same steps as above to create the external network. Make sure the IP address space for external network is in the same network range as your uplink bridge interface IP address range in order to work properly without extra routes.

Therefore, if the **br-ex** interface has **192.168.1.1** as a default gateway for **192.168.1.0/24** network, the same network and gateway IPs should be configured for external network too.

    Network Name: external
    Admin State: UP
    Create Subnet: checked

    Subnet Name: external-tecmint
    Network Address: 192.168.1.0/24
    IP Version: IPv4
    Gateway IP: 192.168.1.1

    DHCP: Enable

[![Create External Network for OpenStack](resources/B0303479E35A94448813820ABA10B1EB.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Create-External-Network-for-OpenStack.png)Create External Network for OpenStack[![Create Subnet for External Network](resources/F4DF549F63794E7621B9F923A6F3A67E.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Create-Subnet-for-External-Network.png)Create Subnet for External Network[![Enable DHCP for External Network](resources/E2A28E172184B06185F73D43FA459AFB.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Enable-DHCP-for-External-Network.png)Enable DHCP for External Network

Again, replace the **Network Name**, **Subnet Name** and **IP addresses** according to your own custom configurations.

**9.** On the next step we need to log in **OpenStack** dashboard as **admin** and mark the external network as **External** in order to be able to communicate with the bridge interface.

Thus, login with **admin** credentials and move to **Admin** -\> **System**-\> **Networks**, click on the external network, check the **External Network** box and hit on **Save Changes** to apply the configuration.

[![Login as Admin in OpenStack Dashboard](resources/58DCB0DA4CBF304C5FE0B66328ACFF54.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Login-as-Admin-in-OpenStack-Dashboard.png)Login as Admin in OpenStack Dashboard[![Select External Network](resources/DAEDE1549AF7CAA3989B4622A8198F48.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Select-External-network.png)Select External Network[![Make Network as External Network](resources/4F24EEBC2D3B80604439DFE0997A19D1.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Make-Network-as-External-Network.png)Make Network as External Network[![External Network Settings Updated](resources/804B28E3BDFBEED36A770FFC9887865C.png)](https://www.tecmint.com/wp-content/uploads/2016/04/External-Network-Settings-Updated.png)External Network Settings Updated

When done, logout from **admin** user and log in with the custom **user** again to proceed to the next step.

**10.** Finally, we need to create a **router** for our two networks in order to move packets back and forth. Go to **Project** -\> **Network** -\> **Routers** and hit on **Create Router** button. Add the following settings for the router.

    Router Name: a descriptive router name
    Admin State: UP
    External Network: external 

[![Create Network Router in OpenStack](resources/3BD0AA8FD3E4EE9E220493C7585EB06E.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Create-Network-Router-in-OpenStack.png)Create Network Router in OpenStack

**11.** Once the **Router** has been created you should be able to see it in the dashboard. Click on the **router name**, go to **Interfaces tab** and hit on **Add Interface** button and a new prompt should appear.

Select the **internal subnet**, leave the **IP Address** field blank and hit on **Submit** button to apply changes and after a few seconds your interface should become **Active**.

[![Add New Network Interface in OpenStack](resources/29139DDCA55BE86F2BD09D8847C4BFBA.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Add-New-Network-Interface-in-OpenStack.png)Add New Network Interface in OpenStack[![Configure Network Interface](resources/CA9A242D5BA91D5FF0B3039CAF526930.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Configure-Network-Interface.png)Configure Network Interface

**12.** In order to verify OpenStack network settings, go to **Project** -\> **Network** -\> Network Topology and a network map will be presented as illustrated on the below screenshot.

[![Verify OpenStack Network Topology](resources/B17FF7A357A98EE15C80F9E179C21493.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Verify-OpenStack-Network-Topology.png)Verify OpenStack Network Topology

That’s all! Your **OpenStack network** is now functional and ready for virtual machines traffic. On the next topic we’ll discuss how to create and launch an OpenStack image instance.