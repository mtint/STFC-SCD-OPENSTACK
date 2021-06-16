**OpenStack** is a free and open-source software platform which provides **IAAS** (**infrastructure-as-a-service**) for public and private clouds.

**OpenStack** platform consists of several inter-related projects that control hardware, storage, networking resources of a datacenter, such as: Compute, Image Service, Block Storage, Identity Service, Networking, Object Storage, Telemetry, Orchestration and Database.

The administration of those components can be managed through the web-based interface or with the help of OpenStack command line.

[![Install OpenStack in CentOS 7](https://www.tecmint.com/wp-content/uploads/2016/04/Install-OpenStack-in-CentOS-7.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Install-OpenStack-in-CentOS-7.png)Install OpenStack in CentOS 7 and RHEL 7

This tutorial will guide you on how you can deploy your own private cloud infrastructure with **OpenStack** installed on a single node in **CentOS 7** or **RHEL 7** or **Fedora** distributions by using **rdo** repositories, although the deployment can be achieved on multiple nodes.

#### Requirements

1. [Minimal Installation of CentOS 7](https://www.tecmint.com/centos-7-installation/)
2. [Minimal Installation of RHEL 7](https://www.tecmint.com/redhat-enterprise-linux-7-installation/)

### Step 1: Initial System Configurations

**1.** Before you begin preparing the node in order to deploy your own virtual cloud infrastructure, first login with root account and assure that the system is up to date.

[![freestar](https://a.pub.network/core/imgs/fslogo-green.svg)](https://freestar.com/?utm_medium=ad_container&utm_source=branding&utm_name=tecmint_incontent)

**2.** Next, issue the `ss -tulpn` command to list all running services.

    # ss -tulpn

[![List All Running Linux Services](https://www.tecmint.com/wp-content/uploads/2016/04/List-All-Running-Services.png)](https://www.tecmint.com/wp-content/uploads/2016/04/List-All-Running-Services.png)List All Running Linux Services

**3.** Next, identify, [stop, disable and remove unneeded services](https://www.tecmint.com/remove-unwanted-services-in-centos-7/), mainly postfix, NetworkManager and firewalld. At the end the only daemon that would be running on your machine should be **sshd**.

    # systemctl stop postfix firewalld NetworkManager
    # systemctl disable postfix firewalld NetworkManager
    # systemctl mask NetworkManager
    # yum remove postfix NetworkManager NetworkManager-libnm

**4.** Completely disable Selinux policy on the machine by issuing the below commands. Also edit `/etc/selinux/config` file and set SELINUX line from **enforcing** to **disabled** as illustrated on the below screenshot.

    # setenforce 0
    # getenforce
    # vi /etc/selinux/config

[![Disable SELinux](https://www.tecmint.com/wp-content/uploads/2016/04/Disable-SELinux.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Disable-SELinux.png)Disable SELinux

**5.** On the next step using the **hostnamectl** command to [set your Linux system hostname](https://www.tecmint.com/set-hostname-permanently-in-linux/). Replace the **FQDN** variable accordingly.

    # hostnamectl set-hostname cloud.centos.lan

[![Set Linux System Hostname](https://www.tecmint.com/wp-content/uploads/2016/04/Set-Linux-System-Hostname.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Set-Linux-System-Hostname.png)Set Linux System Hostname

**6.** Finally, install `ntpdate` command in order to [synchronize time with a NTP server](https://www.tecmint.com/install-ntp-server-in-centos/) on your premises near your physical proximity.

    # yum install ntpdate 

### Step 2: Install OpenStack in CentOS and RHEL

**7.** **OpenStack** will be deployed on your Node with the help of **PackStack** package provided by **rdo** repository (**RPM Distribution of OpenStack**).

In order to enable **rdo** repositories on **RHEL 7** run the below command.

    # yum install https://www.rdoproject.org/repos/rdo-release.rpm 

On **CentOS 7**, the **Extras** repository includes the RPM that actives the OpenStack repository. **Extras** is already enabled, so you can easily install the RPM to setup the OpenStack repository:

    # yum install -y centos-release-openstack-mitaka
    # yum update -y

**8.** Now it’s time to install **PackStack** package. **Packstack** represents a utility which facilitates the deployment on multiple nodes for different components of **OpenStack** via **SSH** connections and **Puppet** modules.

Install Packstat package in Linux with the following command:

    # yum install  openstack-packstack

**9.** On the next step generate an answer file for **Packstack** with the default configurations which will be later edited with the required parameters in order to deploy a standalone installation of Openstack (single node).

The file will be named after the current day timestamp when generated (day, month and year).

    # packstack --gen-answer-file='date +"%d.%m.%y"'.conf
    # ls

[![Generate Packstack Answer Configuration File](https://www.tecmint.com/wp-content/uploads/2016/04/Generate-Packstack-Answer-Configuration-File.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Generate-Packstack-Answer-Configuration-File.png)Generate Packstack Answer Configuration File

**10.** Now edit the generated answer configuration file with a text editor.

    # vi 13.04.16.conf

and replace the following parameters to match the below values. In order to be safe replace the passwords fields accordingly.

    CONFIG_NTP_SERVERS=0.ro.pool.ntp.org

Please consult <http://www.pool.ntp.org/en/> server list in order to use a public NTP server near your physical location.

[![Add NTP Server in Packstack](https://www.tecmint.com/wp-content/uploads/2016/04/Add-NTP-Server-in-Packstack.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Add-NTP-Server-in-Packstack.png)Add NTP Server in Packstack

    CONFIG_PROVISION_DEMO=n

[![Add Provision in Packstack](https://www.tecmint.com/wp-content/uploads/2016/04/Add-Provision-in-Packstack.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Add-Provision-in-Packstack.png)Add Provision in Packstack

    CONFIG_KEYSTONE_ADMIN_PW=your_password  for Admin user

[![Add Admin Account in Packstack](https://www.tecmint.com/wp-content/uploads/2016/04/Add-Admin-Account-in-Packstack.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Add-Admin-Account-in-Packstack.png)Add Admin Account in Packstack

Access OpenStack dashboard via HTTP with SSL enabled.

    CONFIG_HORIZON_SSL=y

[![Enable HTTPS for OpenStack](https://www.tecmint.com/wp-content/uploads/2016/04/Enable-HTTPS-for-OpenStack.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Enable-HTTPS-for-OpenStack.png)Enable HTTPS for OpenStack

The root password for MySQL server.

    CONFIG_MARIADB_PW=mypassword1234

[![Set MySQL Root Password in OpenStack](https://www.tecmint.com/wp-content/uploads/2016/04/Set-MySQL-Root-Password-in-OpenStack.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Set-MySQL-Root-Password-in-OpenStack.png)Set MySQL Root Password in OpenStack

Setup a password for **nagiosadmin** user in order to access Nagios web panel.

    CONFIG_NAGIOS_PW=nagios1234

[![Set Nagios Admin Password](https://www.tecmint.com/wp-content/uploads/2016/04/Set-Nagios-Admin-Password.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Set-Nagios-Admin-Password.png)Set Nagios Admin Password

**11.** After you finished editing save and close the file. Also, open SSH server configuration file and uncomment **PermitRootLogin** line by removing the front hashtag as illustrated on the below screenshot.

    # vi /etc/ssh/sshd_config

[![Enable SSH Root Login](https://www.tecmint.com/wp-content/uploads/2016/04/Enable-SSH-Root-Login.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Enable-SSH-Root-Login.png)Enable SSH Root Login

Then restart SSH service to reflect changes.

    # systemctl restart sshd

### Step 3: Start Openstack Installation Using Packstack Answer File

**12.** Finally start **Openstack** installation process via the answer file edited above by running the below command syntax:

    # packstack --answer-file 13.04.16.conf

[![Openstack Installation in CentOS](https://www.tecmint.com/wp-content/uploads/2016/04/Openstack-Installation-in-CentOS.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Openstack-Installation-in-CentOS.png)Openstack Installation in Linux

**13.** Once the installation of OpenStack components is successfully completed, the installer will display a few lines with the local dashboard links for **OpenStack** and **Nagios** and the required credentials already configured above in order to login on both panels.

[![OpenStack Installation Completed](https://www.tecmint.com/wp-content/uploads/2016/04/OpenStack-Installation-Completed.png)](https://www.tecmint.com/wp-content/uploads/2016/04/OpenStack-Installation-Completed.png)OpenStack Installation Completed

The credentials are also stored under your home directory in `keystonerc_admin` file.

**14.** If for some reasons the installation process ends with an error regarding httpd service, open **/etc/httpd/conf.d/ssl.conf** file and make sure you comment the following line as illustrated below.

    #Listen 443 https

[![Disable HTTPS SSL Port](https://www.tecmint.com/wp-content/uploads/2016/04/Disable-HTTPS-SSL.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Disable-HTTPS-SSL.png)Disable HTTPS SSL Port

Then restart Apache daemon to apply changes.

    # systemctl restart httpd.service

**Note**: In case you still can’t browse Openstack web panel on port **443** restart the installation process from beginning with the same command issued for the initial deployment.

    # packstack --answer-file /root/13.04.16.conf

### Step 4: Remotely Access OpenStack Dashboard

**15.** In order to access **OpenStack** web panel from a remote host in your LAN navigate to your machine IP Address or FQDN/dashboard via HTTPS protocol.

Due to the fact that you’re using a **Self-Signed Certificate** issued by an untrusted **Certificate Authority** an error should be displayed on your browser.

Accept the error and login to the dashboard with the user **admin** and the **password** set on **CONFIG\_KEYSTONE\_ADMIN\_PW** parameter from answer file set above.

    https://192.168.1.40/dashboard 

[![OpenStack Login Dashboard](https://www.tecmint.com/wp-content/uploads/2016/04/OpenStack-Login-Dashboard.png)](https://www.tecmint.com/wp-content/uploads/2016/04/OpenStack-Login-Dashboard.png)OpenStack Login Dashboard[![Openstack Projects](https://www.tecmint.com/wp-content/uploads/2016/04/Openstack-Projects.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Openstack-Projects.png)Openstack Projects

**16.** Alternatively, if you opted to install **Nagios** component for **OpenStack**, you can browse **Nagios** web panel at the following URI and login with the credentials setup in answer file.

    https://192.168.1.40/nagios 

[![Nagios Login Dashboard](https://www.tecmint.com/wp-content/uploads/2016/04/Nagios-Login-Dashboard.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Nagios-Login-Dashboard.png)Nagios Login Dashboard[![Nagios Linux Monitoring Interface](https://www.tecmint.com/wp-content/uploads/2016/04/Nagios-Linux-Monitoring.png)](https://www.tecmint.com/wp-content/uploads/2016/04/Nagios-Linux-Monitoring.png)Nagios Linux Monitoring Interface

That’s all! Now you can start setup your own internal cloud environment. Now follow the next tutorial that will explain how to link the [server physical NIC to openstack bridge interface](https://www.tecmint.com/openstack-networking-guide/) and manage Openstack from web panel.