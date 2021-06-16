Applies to SUSE OpenStack Cloud 8

14.1 Command-line client overview [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.1%20%20Command-line%20client%20overview&comment=14.1%20%20Command-line%20client%20overview%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.3) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.3)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

OpenStackClient project provides a unified command-line client, which enables you to access the project API through easy-to-use commands. Also, most OpenStack project provides a command-line client for each service. For example, the Compute service provides a `nova` command-line client.

You can run the commands from the command line, or include the commands within scripts to automate tasks. If you provide OpenStack credentials, such as your user name and password, you can run these commands on any computer.

Internally, each command uses cURL command-line tools, which embed API requests. OpenStack APIs are RESTful APIs, and use the HTTP protocol. They include methods, URIs, media types, and response codes.

OpenStack APIs are open-source Python clients, and can run on Linux or Mac OS X systems. On some client commands, you can specify a debug parameter to show the underlying API request for the command. This is a good way to become familiar with the OpenStack API calls.

As a cloud end user, you can use the OpenStack Dashboard to provision your own resources within the limits set by administrators. You can modify the examples provided in this section to create other types and sizes of server instances.

### 14.1.1 Unified command-line client [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.1.1%20%20Unified%20command-line%20client&comment=14.1.1%20%20Unified%20command-line%20client%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.3.7) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.3.7)

You can use the unified `openstack` command (**python-openstackclient**) for the most of OpenStack services. For more information, see [OpenStackClient document](http://docs.openstack.org/developer/python-openstackclient/).

### 14.1.2 Individual command-line clients [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.1.2%20%20Individual%20command-line%20clients&comment=14.1.2%20%20Individual%20command-line%20clients%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.3.8) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.3.8)

Unless the unified OpenStack Client (**python-openstackclient**) is used, the following table lists the command-line client for each OpenStack service with its package name and description.

###### Table 14.1: OpenStack services and clients [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%20Table%2526nbsp%253B14.1%253A%20%20OpenStack%20services%20and%20clients%20&comment=Table%2526nbsp%253B14.1%253A%20%20OpenStack%20services%20and%20clients%20%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.3.8.3) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.3.8.3)

Service

Client

Package

Description

Application Catalog service

murano

python-muranoclient

Creates and manages applications.

Bare Metal service

ironic

python-ironicclient

manages and provisions physical machines.

Block Storage service

cinder

python-cinderclient

Creates and manages volumes.

Clustering service

senlin

python-senlinclient

Creates and manages clustering services.

Compute service

nova

python-novaclient

Creates and manages images, instances, and flavors.

Container Infrastructure Management service

magnum

python-magnumclient

Creates and manages containers.

Data Processing service

sahara

python-saharaclient

Creates and manages Hadoop clusters on OpenStack.

Database service

trove

python-troveclient

Creates and manages databases.

Deployment service

fuel

python-fuelclient

Plans deployments.

DNS service

designate

python-designateclient

Creates and manages self service authoritative DNS.

Image service

glance

python-glanceclient

Creates and manages images.

Key Manager service

barbican

python-barbicanclient

Creates and manages keys.

Monitoring

monasca

python-monascaclient

Monitoring solution.

Networking service

neutron

python-neutronclient

Configures networks for guest servers.

Object Storage service

swift

python-swiftclient

Gathers statistics, lists items, updates metadata, and uploads, downloads, and deletes files stored by the Object Storage service. Gains access to an Object Storage installation for ad hoc processing.

Orchestration service

heat

python-heatclient

Launches stacks from templates, views details of running stacks including events and resources, and updates and deletes stacks.

Rating service

cloudkitty

python-cloudkittyclient

Rating service.

Shared File Systems service

manila

python-manilaclient

Creates and manages shared file systems.

Telemetry service

ceilometer

python-ceilometerclient

Creates and collects measurements across OpenStack.

Telemetry v3

gnocchi

python-gnocchiclient

Creates and collects measurements across OpenStack.

Workflow service

mistral

python-mistralclient

Workflow service for OpenStack cloud.

14.2 Install the OpenStack command-line clients [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.2%20%20Install%20the%20OpenStack%20command-line%20clients&comment=14.2%20%20Install%20the%20OpenStack%20command-line%20clients%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.4) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.4)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Install the prerequisite software and the Python package for each OpenStack client.

### 14.2.1 Install the prerequisite software [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.2.1%20%20Install%20the%20prerequisite%20software&comment=14.2.1%20%20Install%20the%20prerequisite%20software%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.4.3) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.4.3)

Most Linux distributions include packaged versions of the command-line clients that you can install directly, see [Section 14.2.2.2, “Installing from packages”](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#installing-from-packages).

If you need to install the source package for the command-line package, the following table lists the software needed to run the command-line clients, and provides installation instructions as needed.

###### Table 14.2: OpenStack command-line clients prerequisites [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%20Table%2526nbsp%253B14.2%253A%20%20OpenStack%20command-line%20clients%20prerequisites%20&comment=Table%2526nbsp%253B14.2%253A%20%20OpenStack%20command-line%20clients%20prerequisites%20%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.4.3.4) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.4.3.4)

Prerequisite

Description

Python 2.7 or later

Supports Python 2.7, 3.4, and 3.5.

setuptools package

Installed by default on Mac OS X.

Many Linux distributions provide packages to make setuptools easy to install. Search your package manager for setuptools to find an installation package. If you cannot find one, download the setuptools package directly from <https://pypi.python.org/pypi/setuptools>.

The recommended way to install setuptools on Microsoft Windows is to follow the documentation provided on the setuptools website (<https://pypi.python.org/pypi/setuptools>).

Another option is to use the unofficial binary installer maintained by Christoph Gohlke ([http://www.lfd.uci.edu/~gohlke/pythonlibs/\#setuptools](http://www.lfd.uci.edu/~gohlke/pythonlibs/#setuptools)).

pip package

To install the clients on a Linux, Mac OS X, or Microsoft Windows system, use pip. It is easy to use, ensures that you get the latest version of the clients from the [Python Package Index](https://pypi.python.org/), and lets you update or remove the packages later on.

Since the installation process compiles source files, this requires the related Python development package for your operating system and distribution.

Install pip through the package manager for your system:

**MacOS**

    # easy_install pip

**Microsoft Windows**

Ensure that the `C:\Python27\Scripts` directory is defined in the `PATH` environment variable, and use the `easy_install` command from the setuptools package:

    C:\>easy_install pip

Another option is to use the unofficial binary installer provided by Christoph Gohlke ([http://www.lfd.uci.edu/~gohlke/pythonlibs/\#pip](http://www.lfd.uci.edu/~gohlke/pythonlibs/#pip)).

**Ubuntu or Debian**

    # apt install python-dev python-pip

Note that extra dependencies may be required, per operating system, depending on the package being installed, such as is the case with Tempest.

**Red Hat Enterprise Linux, CentOS, or Fedora**

A packaged version enables you to use yum to install the package:

    # yum install python-devel python-pip

There are also packaged versions of the clients available in [RDO](https://www.rdoproject.org/) that enable yum to install the clients as described in [Section 14.2.2.2, “Installing from packages”](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#installing-from-packages).

**SUSE Linux Enterprise Server**

A packaged version available in [the Open Build Service](https://build.opensuse.org/package/show?package=python-pip&project=Cloud:OpenStack:Master) enables you to use YaST or zypper to install the package.

First, add the Open Build Service repository:

    # zypper addrepo -f obs://Cloud:OpenStack:Mitaka/SLE_12_SP1 Mitaka

Then install pip and use it to manage client installation:

    # zypper install python-devel python-pip

There are also packaged versions of the clients available that enable zypper to install the clients as described in [Section 14.2.2.2, “Installing from packages”](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#installing-from-packages).

**openSUSE**

You can install pip and use it to manage client installation:

    # zypper install python-devel python-pip

There are also packaged versions of the clients available that enable zypper to install the clients as described in [Section 14.2.2.2, “Installing from packages”](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#installing-from-packages).

### 14.2.2 Install the OpenStack client [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.2.2%20%20Install%20the%20OpenStack%20client&comment=14.2.2%20%20Install%20the%20OpenStack%20client%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.4.4) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.4.4)

The following example shows the command for installing the OpenStack client with `pip`, which supports multiple services.

    # pip install python-openstackclient

The following individual clients are deprecated in favor of a common client. Instead of installing and learning all these clients, we recommend installing and using the OpenStack client. You may need to install an individual project's client because coverage is not yet sufficient in the OpenStack client. If you need to install an individual client's project, replace the `PROJECT` name in this `pip install` command using the list below.

    # pip install python-PROJECTclient

* `barbican` - Key Manager Service API
* `ceilometer` - Telemetry API
* `cinder` - Block Storage API and extensions
* `cloudkitty` - Rating service API
* `designate` - DNS service API
* `fuel` - Deployment service API
* `glance` - Image service API
* `gnocchi` - Telemetry API v3
* `heat` - Orchestration API
* `magnum` - Container Infrastructure Management service API
* `manila` - Shared file systems API
* `mistral` - Workflow service API
* `monasca` - Monitoring API
* `murano` - Application catalog API
* `neutron` - Networking API
* `nova` - Compute API and extensions
* `sahara` - Data Processing API
* `senlin` - Clustering service API
* `swift` - Object Storage API
* `trove` - Database service API

#### 14.2.2.1 Installing with pip [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.2.2.1%20%20Installing%20with%20pip&comment=14.2.2.1%20%20Installing%20with%20pip%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.4.4.7) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.4.4.7)

Use pip to install the OpenStack clients on a Linux, Mac OS X, or Microsoft Windows system. It is easy to use and ensures that you get the latest version of the client from the [Python Package Index](https://pypi.python.org/pypi). Also, pip enables you to update or remove a package.

Install each client separately by using the following command:

* For Mac OS X or Linux:

      # pip install python-PROJECTclient
* For Microsoft Windows:

      C:\>pip install python-PROJECTclient

#### 14.2.2.2 Installing from packages [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.2.2.2%20%20Installing%20from%20packages&comment=14.2.2.2%20%20Installing%20from%20packages%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523installing-from-packages) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#installing-from-packages)

RDO, openSUSE, SUSE Linux Enterprise, Debian, and Ubuntu have client packages that can be installed without `pip`.

* On Red Hat Enterprise Linux, CentOS, or Fedora, use `yum` to install the clients from the packaged versions available in [RDO](https://www.rdoproject.org/):

      # yum install python-PROJECTclient
* For Ubuntu or Debian, use `apt-get` to install the clients from the packaged versions:

      # apt-get install python-PROJECTclient
* For openSUSE, use `zypper` to install the clients from the distribution packages service:

      # zypper install python-PROJECTclient
* For SUSE Linux Enterprise Server, use `zypper` to install the clients from the distribution packages in the Open Build Service. First, add the Open Build Service repository:

      # zypper addrepo -f obs://Cloud:OpenStack:Mitaka/SLE_12_SP1 Mitaka

  Then you can install the packages:

      # zypper install python-PROJECTclient

### 14.2.3 Upgrade or remove clients [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.2.3%20%20Upgrade%20or%20remove%20clients&comment=14.2.3%20%20Upgrade%20or%20remove%20clients%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.4.5) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.4.5)

To upgrade a client, add the `--upgrade` option to the `pip install` command:

    # pip install --upgrade python-PROJECTclient

To remove the client, run the `pip uninstall` command:

    # pip uninstall python-PROJECTclient

### 14.2.4 What's next [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.2.4%20%20What's%20next&comment=14.2.4%20%20What's%20next%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.4.6) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.4.6)

Before you can run client commands, you must create and source the `PROJECT-openrc.sh` file to set environment variables. See [Section 14.4, “Set environment variables using the OpenStack RC file”](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#sec-rcfile).

14.3 Discover the version number for a client [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.3%20%20Discover%20the%20version%20number%20for%20a%20client&comment=14.3%20%20Discover%20the%20version%20number%20for%20a%20client%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.5) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.5)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Run the following command to discover the version number for a client:

    $ PROJECT --version

For example, to see the version number for the `openstack` client, run the following command:

    $ openstack --version
    openstack 3.2.0

14.4 Set environment variables using the OpenStack RC file [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.4%20%20Set%20environment%20variables%20using%20the%20OpenStack%20RC%20file&comment=14.4%20%20Set%20environment%20variables%20using%20the%20OpenStack%20RC%20file%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523sec-rcfile) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#sec-rcfile)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

To set the required environment variables for the OpenStack command-line clients, you must create an environment file called an OpenStack rc file, or `openrc.sh` file. If your OpenStack installation provides it, you can download the file from the OpenStack Dashboard as an administrative user or any other user. This project-specific environment file contains the credentials that all OpenStack services use.

When you source the file, environment variables are set for your current shell. The variables enable the OpenStack client commands to communicate with the OpenStack services that run in the cloud.

![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

Defining environment variables using an environment file is not a common practice on Microsoft Windows. Environment variables are usually defined in the Advanced › System Properties dialog box. One method for using these scripts as-is on Windows is to install [Git for Windows](https://git-for-windows.github.io/) and using Git Bash to source the environment variables and to run all CLI commands.

### 14.4.1 Download and source the OpenStack RC file [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.4.1%20%20Download%20and%20source%20the%20OpenStack%20RC%20file&comment=14.4.1%20%20Download%20and%20source%20the%20OpenStack%20RC%20file%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.6.5) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.6.5)

1. Log in to the dashboard and from the drop-down list select the project for which you want to download the OpenStack RC file.
2. On the Project tab, open the Compute tab and click Access & Security.
3. On the API Access tab, click Download OpenStack RC File and save the file. The filename will be of the form `PROJECT-openrc.sh` where `PROJECT` is the name of the project for which you downloaded the file.
4. Copy the `PROJECT-openrc.sh` file to the computer from which you want to run OpenStack commands.

  For example, copy the file to the computer from which you want to upload an image with a `glance` client command.
5. On any shell from which you want to run OpenStack commands, source the `PROJECT-openrc.sh` file for the respective project.

  In the following example, the `demo-openrc.sh` file is sourced for the demo project:

      $ . demo-openrc.sh
6. When you are prompted for an OpenStack password, enter the password for the user who downloaded the `PROJECT-openrc.sh` file.

### 14.4.2 Create and source the OpenStack RC file [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.4.2%20%20Create%20and%20source%20the%20OpenStack%20RC%20file&comment=14.4.2%20%20Create%20and%20source%20the%20OpenStack%20RC%20file%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.6.6) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.6.6)

Alternatively, you can create the `PROJECT-openrc.sh` file from scratch, if you cannot download the file from the dashboard.

1. In a text editor, create a file named `PROJECT-openrc.sh` and add the following authentication information:

      export OS_USERNAME=username
    export OS_PASSWORD=password
    export OS_TENANT_NAME=projectName
    export OS_AUTH_URL=https://identityHost:portNumber/v2.0
    # The following lines can be omitted
    export OS_TENANT_ID=tenantIDString
    export OS_REGION_NAME=regionName
    export OS_CACERT=/path/to/cacertFile

  ![Warning](resources/D5D1BCD25D68B7FA22FB93E6887BEBA1.png)

###### Warning

  Saving `OS_PASSWORD` in plain text may bring a security risk. You should protect the file or not save `OS_PASSWORD` into the file in the production environment.
2. On any shell from which you want to run OpenStack commands, source the `PROJECT-openrc.sh` file for the respective project. In this example, you source the `admin-openrc.sh` file for the admin project:

      $ . admin-openrc.sh

![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

You are not prompted for the password with this method. The password lives in clear text format in the `PROJECT-openrc.sh` file. Restrict the permissions on this file to avoid security problems. You can also remove the `OS_PASSWORD` variable from the file, and use the `--password` parameter with OpenStack client commands instead.

![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

You must set the `OS_CACERT` environment variable when using the https protocol in the `OS_AUTH_URL` environment setting because the verification process for the TLS (HTTPS) server certificate uses the one indicated in the environment. This certificate will be used when verifying the TLS (HTTPS) server certificate.

### 14.4.3 Override environment variable values [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.4.3%20%20Override%20environment%20variable%20values&comment=14.4.3%20%20Override%20environment%20variable%20values%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.6.7) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.6.7)

When you run OpenStack client commands, you can override some environment variable settings by using the options that are listed at the end of the `help` output of the various client commands. For example, you can override the `OS_PASSWORD` setting in the `PROJECT-openrc.sh` file by specifying a password on a `openstack` command, as follows:

    $ openstack --os-password PASSWORD server list

Where `PASSWORD` is your password.

A user specifies their username and password credentials to interact with OpenStack, using any client command. These credentials can be specified using various mechanisms, namely, the environment variable or command-line argument. It is not safe to specify the password using either of these methods.

For example, when you specify your password using the command-line client with the `--os-password` argument, anyone with access to your computer can view it in plain text with the `ps` field.

To avoid storing the password in plain text, you can prompt for the OpenStack password interactively.

14.5 Manage projects, users, and roles [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.5%20%20Manage%20projects%252C%20users%252C%20and%20roles&comment=14.5%20%20Manage%20projects%252C%20users%252C%20and%20roles%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.7) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.7)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

As an administrator, you manage projects, users, and roles. Projects are organizational units in the cloud to which you can assign users. Projects are also known as *projects* or *accounts*. Users can be members of one or more projects. Roles define which actions users can perform. You assign roles to user-project pairs.

You can define actions for OpenStack service roles in the `/etc/PROJECT/policy.json` files. For example, define actions for Compute service roles in the `/etc/nova/policy.json` file.

You can manage projects, users, and roles independently from each other.

During cloud set up, the operator defines at least one project, user, and role.

You can add, update, and delete projects and users, assign users to one or more projects, and change or remove the assignment. To enable or temporarily disable a project or user, update that project or user. You can also change quotas at the project level.

Before you can delete a user account, you must remove the user account from its primary project.

Before you can run client commands, you must download and source an OpenStack RC file. See [Download and source the OpenStack RC file](http://docs.openstack.org/user-guide/common/cli-set-environment-variables-using-openstack-rc.html#download-and-source-the-openstack-rc-file).

### 14.5.1 Projects [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.5.1%20%20Projects&comment=14.5.1%20%20Projects%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.7.9) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.7.9)

A project is a group of zero or more users. In Compute, a project owns virtual machines. In Object Storage, a project owns containers. Users can be associated with more than one project. Each project and user pairing can have a role associated with it.

#### 14.5.1.1 List projects [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.5.1.1%20%20List%20projects&comment=14.5.1.1%20%20List%20projects%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.7.9.3) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.7.9.3)

List all projects with their ID, name, and whether they are enabled or disabled:

    $ openstack project list
    +----------------------------------+--------------------+
    | ID                               | Name               |
    +----------------------------------+--------------------+
    | f7ac731cc11f40efbc03a9f9e1d1d21f | admin              |
    | c150ab41f0d9443f8874e32e725a4cc8 | alt_demo           |
    | a9debfe41a6d4d09a677da737b907d5e | demo               |
    | 9208739195a34c628c58c95d157917d7 | invisible_to_admin |
    | 3943a53dc92a49b2827fae94363851e1 | service            |
    | 80cab5e1f02045abad92a2864cfd76cb | test_project       |
    +----------------------------------+--------------------+

#### 14.5.1.2 Create a project [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.5.1.2%20%20Create%20a%20project&comment=14.5.1.2%20%20Create%20a%20project%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.7.9.4) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.7.9.4)

Create a project named `new-project`:

    $ openstack project create --description 'my new project' new-project \
      --domain default
    +-------------+----------------------------------+
    | Field       | Value                            |
    +-------------+----------------------------------+
    | description | my new project                   |
    | domain_id   | e601210181f54843b51b3edff41d4980 |
    | enabled     | True                             |
    | id          | 1a4a0618b306462c9830f876b0bd6af2 |
    | is_domain   | False                            |
    | name        | new-project                      |
    | parent_id   | e601210181f54843b51b3edff41d4980 |
    +-------------+----------------------------------+

#### 14.5.1.3 Update a project [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.5.1.3%20%20Update%20a%20project&comment=14.5.1.3%20%20Update%20a%20project%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.7.9.5) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.7.9.5)

Specify the project ID to update a project. You can update the name, description, and enabled status of a project.

* To temporarily disable a project:

      $ openstack project set PROJECT_ID --disable
* To enable a disabled project:

      $ openstack project set PROJECT_ID --enable
* To update the name of a project:

      $ openstack project set PROJECT_ID --name project-new
* To verify your changes, show information for the updated project:

      $ openstack project show PROJECT_ID
    +-------------+----------------------------------+
    | Field       | Value                            |
    +-------------+----------------------------------+
    | description | my new project                   |
    | enabled     | True                             |
    | id          | 0b0b995694234521bf93c792ed44247f |
    | name        | new-project                      |
    | properties  |                                  |
    +-------------+----------------------------------+

#### 14.5.1.4 Delete a project [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.5.1.4%20%20Delete%20a%20project&comment=14.5.1.4%20%20Delete%20a%20project%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.7.9.6) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.7.9.6)

Specify the project ID to delete a project:

    $ openstack project delete PROJECT_ID

### 14.5.2 Users [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.5.2%20%20Users&comment=14.5.2%20%20Users%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.7.10) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.7.10)

#### 14.5.2.1 List users [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.5.2.1%20%20List%20users&comment=14.5.2.1%20%20List%20users%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.7.10.2) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.7.10.2)

List all users:

    $ openstack user list
    +----------------------------------+----------+
    | ID                               | Name     |
    +----------------------------------+----------+
    | 352b37f5c89144d4ad0534139266d51f | admin    |
    | 86c0de739bcb4802b8dc786921355813 | demo     |
    | 32ec34aae8ea432e8af560a1cec0e881 | glance   |
    | 7047fcb7908e420cb36e13bbd72c972c | nova     |
    +----------------------------------+----------+

#### 14.5.2.2 Create a user [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.5.2.2%20%20Create%20a%20user&comment=14.5.2.2%20%20Create%20a%20user%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.7.10.3) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.7.10.3)

To create a user, you must specify a name. Optionally, you can specify a project ID, password, and email address. It is recommended that you include the project ID and password because the user cannot log in to the dashboard without this information.

Create the `new-user` user:

    $ openstack user create --project new-project --password PASSWORD new-user
    +------------+----------------------------------+
    | Field      | Value                            |
    +------------+----------------------------------+
    | email      | None                             |
    | enabled    | True                             |
    | id         | 6322872d9c7e445dbbb49c1f9ca28adc |
    | name       | new-user                         |
    | project_id | 0b0b995694234521bf93c792ed44247f |
    | username   | new-user                         |
    +------------+----------------------------------+

#### 14.5.2.3 Update a user [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.5.2.3%20%20Update%20a%20user&comment=14.5.2.3%20%20Update%20a%20user%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.7.10.4) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.7.10.4)

You can update the name, email address, and enabled status for a user.

* To temporarily disable a user account:

      $ openstack user set USER_NAME --disable

  If you disable a user account, the user cannot log in to the dashboard. However, data for the user account is maintained, so you can enable the user at any time.
* To enable a disabled user account:

      $ openstack user set USER_NAME --enable
* To change the name and description for a user account:

      $ openstack user set USER_NAME --name user-new --email new-user@example.com
    User has been updated.

#### 14.5.2.4 Delete a user [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.5.2.4%20%20Delete%20a%20user&comment=14.5.2.4%20%20Delete%20a%20user%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.7.10.5) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.7.10.5)

Delete a specified user account:

    $ openstack user delete USER_NAME

### 14.5.3 Roles and role assignments [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.5.3%20%20Roles%20and%20role%20assignments&comment=14.5.3%20%20Roles%20and%20role%20assignments%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.7.11) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.7.11)

#### 14.5.3.1 List available roles [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.5.3.1%20%20List%20available%20roles&comment=14.5.3.1%20%20List%20available%20roles%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.7.11.2) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.7.11.2)

List the available roles:

    $ openstack role list
    +----------------------------------+---------------+
    | ID                               | Name          |
    +----------------------------------+---------------+
    | 71ccc37d41c8491c975ae72676db687f | Member        |
    | 149f50a1fe684bfa88dae76a48d26ef7 | ResellerAdmin |
    | 9fe2ff9ee4384b1894a90878d3e92bab | _member_      |
    | 6ecf391421604da985db2f141e46a7c8 | admin         |
    | deb4fffd123c4d02a907c2c74559dccf | anotherrole   |
    +----------------------------------+---------------+

#### 14.5.3.2 Create a role [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.5.3.2%20%20Create%20a%20role&comment=14.5.3.2%20%20Create%20a%20role%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.7.11.3) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.7.11.3)

Users can be members of multiple projects. To assign users to multiple projects, define a role and assign that role to a user-project pair.

Create the `new-role` role:

    $ openstack role create new-role
    +-----------+----------------------------------+
    | Field     | Value                            |
    +-----------+----------------------------------+
    | domain_id | None                             |
    | id        | a34425c884c74c8881496dc2c2e84ffc |
    | name      | new-role                         |
    +-----------+----------------------------------+

#### 14.5.3.3 Assign a role [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.5.3.3%20%20Assign%20a%20role&comment=14.5.3.3%20%20Assign%20a%20role%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.7.11.4) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.7.11.4)

To assign a user to a project, you must assign the role to a user-project pair. To do this, you need the user, role, and project IDs.

1. List users and note the user ID you want to assign to the role:

      $ openstack user list
    +----------------------------------+----------+
    | ID                               | Name     |
    +----------------------------------+----------+
    | 6ab5800949644c3e8fb86aaeab8275c8 | admin    |
    | dfc484b9094f4390b9c51aba49a6df34 | demo     |
    | 55389ff02f5e40cf85a053cc1cacb20c | alt_demo |
    | bc52bcfd882f4d388485451c4a29f8e0 | nova     |
    | 255388ffa6e54ec991f584cb03085e77 | glance   |
    | 48b6e6dec364428da89ba67b654fac03 | cinder   |
    | c094dd5a8e1d4010832c249d39541316 | neutron  |
    | 6322872d9c7e445dbbb49c1f9ca28adc | new-user |
    +----------------------------------+----------+
2. List role IDs and note the role ID you want to assign:

      $ openstack role list
    +----------------------------------+---------------+
    | ID                               | Name          |
    +----------------------------------+---------------+
    | 71ccc37d41c8491c975ae72676db687f | Member        |
    | 149f50a1fe684bfa88dae76a48d26ef7 | ResellerAdmin |
    | 9fe2ff9ee4384b1894a90878d3e92bab | _member_      |
    | 6ecf391421604da985db2f141e46a7c8 | admin         |
    | deb4fffd123c4d02a907c2c74559dccf | anotherrole   |
    | bef1f95537914b1295da6aa038ef4de6 | new-role      |
    +----------------------------------+---------------+
3. List projects and note the project ID you want to assign to the role:

      $ openstack project list
    +----------------------------------+--------------------+
    | ID                               | Name               |
    +----------------------------------+--------------------+
    | 0b0b995694234521bf93c792ed44247f | new-project        |
    | 29c09e68e6f741afa952a837e29c700b | admin              |
    | 3a7ab11d3be74d3c9df3ede538840966 | invisible_to_admin |
    | 71a2c23bab884c609774c2db6fcee3d0 | service            |
    | 87e48a8394e34d13afc2646bc85a0d8c | alt_demo           |
    | fef7ae86615f4bf5a37c1196d09bcb95 | demo               |
    +----------------------------------+--------------------+
4. Assign a role to a user-project pair:

      $ openstack role add --user USER_NAME --project TENANT_ID ROLE_NAME

  For example, assign the `new-role` role to the `demo` and `test-project` pair:

      $ openstack role add --user demo --project test-project new-role
5. Verify the role assignment:

      $ openstack role list --user USER_NAME --project TENANT_ID
    Listing assignments using role list is deprecated as of the Newton release. Use role assignment list --user <user-name> --project <project-name> --names instead.
    +----------------------------------+-------------+---------+------+
    | ID                               | Name        | Project | User |
    +----------------------------------+-------------+---------+------+
    | a34425c884c74c8881496dc2c2e84ffc | new-role    | demo    | demo |
    | 04a7e3192c0745a2b1e3d2baf5a3ee0f | Member      | demo    | demo |
    | 62bcf3e27eef4f648eb72d1f9920f6e5 | anotherrole | demo    | demo |
    +----------------------------------+-------------+---------+------+

#### 14.5.3.4 View role details [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.5.3.4%20%20View%20role%20details&comment=14.5.3.4%20%20View%20role%20details%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.7.11.5) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.7.11.5)

View details for a specified role:

    $ openstack role show ROLE_NAME
    +-----------+----------------------------------+
    | Field     | Value                            |
    +-----------+----------------------------------+
    | domain_id | None                             |
    | id        | a34425c884c74c8881496dc2c2e84ffc |
    | name      | new-role                         |
    +-----------+----------------------------------+

#### 14.5.3.5 Remove a role [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.5.3.5%20%20Remove%20a%20role&comment=14.5.3.5%20%20Remove%20a%20role%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.7.11.6) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.7.11.6)

Remove a role from a user-project pair:

1. Run the `openstack role remove` command:

      $ openstack role remove --user USER_NAME --project TENANT_ID ROLE_NAME
2. Verify the role removal:

      $ openstack role list --user USER_NAME --project TENANT_ID

  If the role was removed, the command output omits the removed role.

14.6 Manage project security [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.6%20%20Manage%20project%20security&comment=14.6%20%20Manage%20project%20security%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523osadm-security-group) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#osadm-security-group)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Security groups are sets of IP filter rules that are applied to all project instances, which define networking access to the instance. Group rules are project specific; project members can edit the default rules for their group and add new rule sets.

All projects have a `default` security group which is applied to any instance that has no other defined security group. Unless you change the default, this security group denies all incoming traffic and allows only outgoing traffic to your instance.

You can use the `allow_same_net_traffic` option in the `/etc/nova/nova.conf` file to globally control whether the rules apply to hosts which share a network.

If set to:

* `True` (default), hosts on the same subnet are not filtered and are allowed to pass all types of traffic between them. On a flat network, this allows all instances from all projects unfiltered communication. With VLAN networking, this allows access between instances within the same project. You can also simulate this setting by configuring the default security group to allow all traffic from the subnet.
* `False`, security groups are enforced for all connections.

Additionally, the number of maximum rules per security group is controlled by the `security_group_rules` and the number of allowed security groups per project is controlled by the `security_groups` quota (see [Section 14.13, “Manage quotas”](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#manage-quotas)).

### 14.6.1 List and view current security groups [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.6.1%20%20List%20and%20view%20current%20security%20groups&comment=14.6.1%20%20List%20and%20view%20current%20security%20groups%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.8.8) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.8.8)

From the command-line you can get a list of security groups for the project, using the `openstack` and `nova` commands:

1. Ensure your system variables are set for the user and project for which you are checking security group rules. For example:

      export OS_USERNAME=demo00
    export OS_TENANT_NAME=tenant01
2. Output security groups, as follows:

      $ openstack security group list
    +--------------------------------------+---------+-------------+
    | Id                                   | Name    | Description |
    +--------------------------------------+---------+-------------+
    | 73580272-d8fa-4927-bd55-c85e43bc4877 | default | default     |
    | 6777138a-deb7-4f10-8236-6400e7aff5b0 | open    | all ports   |
    +--------------------------------------+---------+-------------+
3. View the details of a group, as follows:

      $ openstack security group rule list GROUPNAME

  For example:

      $ openstack security group rule list open
    +--------------------------------------+-------------+-----------+-----------------+-----------------------+
    | ID                                   | IP Protocol | IP Range  | Port Range      | Remote Security Group |
    +--------------------------------------+-------------+-----------+-----------------+-----------------------+
    | 353d0611-3f67-4848-8222-a92adbdb5d3a | udp         | 0.0.0.0/0 | 1:65535         | None                  |
    | 63536865-e5b6-4df1-bac5-ca6d97d8f54d | tcp         | 0.0.0.0/0 | 1:65535         | None                  |
    +--------------------------------------+-------------+-----------+-----------------+-----------------------+

  These rules are allow type rules as the default is deny. The first column is the IP protocol (one of icmp, tcp, or udp). The second and third columns specify the affected port range. The third column specifies the IP range in CIDR format. This example shows the full port range for all protocols allowed from all IPs.

### 14.6.2 Create a security group [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.6.2%20%20Create%20a%20security%20group&comment=14.6.2%20%20Create%20a%20security%20group%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.8.9) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.8.9)

When adding a new security group, you should pick a descriptive but brief name. This name shows up in brief descriptions of the instances that use it where the longer description field often does not. For example, seeing that an instance is using security group "http" is much easier to understand than "bobs\_group" or "secgrp1".

1. Ensure your system variables are set for the user and project for which you are creating security group rules.
2. Add the new security group, as follows:

      $ openstack security group create GroupName --description Description

  For example:

      $ openstack security group create global_http --description "Allows Web traffic anywhere on the Internet."
    +-----------------+--------------------------------------------------------------------------------------------------------------------------+
    | Field           | Value                                                                                                                    |
    +-----------------+--------------------------------------------------------------------------------------------------------------------------+
    | created_at      | 2016-11-03T13:50:53Z                                                                                                     |
    | description     | Allows Web traffic anywhere on the Internet.                                                                             |
    | headers         |                                                                                                                          |
    | id              | c0b92b20-4575-432a-b4a9-eaf2ad53f696                                                                                     |
    | name            | global_http                                                                                                              |
    | project_id      | 5669caad86a04256994cdf755df4d3c1                                                                                         |
    | project_id      | 5669caad86a04256994cdf755df4d3c1                                                                                         |
    | revision_number | 1                                                                                                                        |
    | rules           | created_at='2016-11-03T13:50:53Z', direction='egress', ethertype='IPv4', id="4d8cec94-e0ee-4c20-9f56-8fb67c21e4df",      |
    |                 | project_id='5669caad86a04256994cdf755df4d3c1', revision_number='1', updated_at='2016-11-03T13:50:53Z'                    |
    |                 | created_at='2016-11-03T13:50:53Z', direction='egress', ethertype='IPv6', id="31be2ad1-be14-4aef-9492-ecebede2cf12",      |
    |                 | project_id='5669caad86a04256994cdf755df4d3c1', revision_number='1', updated_at='2016-11-03T13:50:53Z'                    |
    | updated_at      | 2016-11-03T13:50:53Z                                                                                                     |
    +-----------------+--------------------------------------------------------------------------------------------------------------------------+
3. Add a new group rule, as follows:

      $ openstack security group rule create SEC_GROUP_NAME --protocol PROTOCOL --dst-port FROM_PORT:TO_PORT --remote-ip CIDR

  The arguments are positional, and the `from-port` and `to-port` arguments specify the local port range connections are allowed to access, not the source and destination ports of the connection. For example:

      $ openstack security group rule create global_http --protocol tcp --dst-port 80:80 --remote-ip 0.0.0.0/0
    +-------------------+--------------------------------------+
    | Field             | Value                                |
    +-------------------+--------------------------------------+
    | created_at        | 2016-11-06T14:02:00Z                 |
    | description       |                                      |
    | direction         | ingress                              |
    | ethertype         | IPv4                                 |
    | headers           |                                      |
    | id                | 2ba06233-d5c8-43eb-93a9-8eaa94bc9eb5 |
    | port_range_max    | 80                                   |
    | port_range_min    | 80                                   |
    | project_id        | 5669caad86a04256994cdf755df4d3c1     |
    | project_id        | 5669caad86a04256994cdf755df4d3c1     |
    | protocol          | tcp                                  |
    | remote_group_id   | None                                 |
    | remote_ip_prefix  | 0.0.0.0/0                            |
    | revision_number   | 1                                    |
    | security_group_id | c0b92b20-4575-432a-b4a9-eaf2ad53f696 |
    | updated_at        | 2016-11-06T14:02:00Z                 |
    +-------------------+--------------------------------------+

  You can create complex rule sets by creating additional rules. For example, if you want to pass both HTTP and HTTPS traffic, run:

      $ openstack security group rule create global_http --protocol tcp --dst-port 443:443 --remote-ip 0.0.0.0/0
    +-------------------+--------------------------------------+
    | Field             | Value                                |
    +-------------------+--------------------------------------+
    | created_at        | 2016-11-06T14:09:20Z                 |
    | description       |                                      |
    | direction         | ingress                              |
    | ethertype         | IPv4                                 |
    | headers           |                                      |
    | id                | 821c3ef6-9b21-426b-be5b-c8a94c2a839c |
    | port_range_max    | 443                                  |
    | port_range_min    | 443                                  |
    | project_id        | 5669caad86a04256994cdf755df4d3c1     |
    | project_id        | 5669caad86a04256994cdf755df4d3c1     |
    | protocol          | tcp                                  |
    | remote_group_id   | None                                 |
    | remote_ip_prefix  | 0.0.0.0/0                            |
    | revision_number   | 1                                    |
    | security_group_id | c0b92b20-4575-432a-b4a9-eaf2ad53f696 |
    | updated_at        | 2016-11-06T14:09:20Z                 |
    +-------------------+--------------------------------------+

  Despite only outputting the newly added rule, this operation is additive (both rules are created and enforced).
4. View all rules for the new security group, as follows:

      $ openstack security group rule list global_http
    +--------------------------------------+-------------+-----------+-----------------+-----------------------+
    | ID                                   | IP Protocol | IP Range  | Port Range      | Remote Security Group |
    +--------------------------------------+-------------+-----------+-----------------+-----------------------+
    | 353d0611-3f67-4848-8222-a92adbdb5d3a | tcp         | 0.0.0.0/0 | 80:80           | None                  |
    | 63536865-e5b6-4df1-bac5-ca6d97d8f54d | tcp         | 0.0.0.0/0 | 443:443         | None                  |
    +--------------------------------------+-------------+-----------+-----------------+-----------------------+

### 14.6.3 Delete a security group [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.6.3%20%20Delete%20a%20security%20group&comment=14.6.3%20%20Delete%20a%20security%20group%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.8.10) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.8.10)

1. Ensure your system variables are set for the user and project for which you are deleting a security group.
2. Delete the new security group, as follows:

      $ openstack security group delete GROUPNAME

  For example:

      $ openstack security group delete global_http

### 14.6.4 Create security group rules for a cluster of instances [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.6.4%20%20Create%20security%20group%20rules%20for%20a%20cluster%20of%20instances&comment=14.6.4%20%20Create%20security%20group%20rules%20for%20a%20cluster%20of%20instances%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.8.11) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.8.11)

Source Groups are a special, dynamic way of defining the CIDR of allowed sources. The user specifies a Source Group (Security Group name), and all the user's other Instances using the specified Source Group are selected dynamically. This alleviates the need for individual rules to allow each new member of the cluster.

1. Make sure to set the system variables for the user and project for which you are creating a security group rule.
2. Add a source group, as follows:

      $ openstack security group rule create secGroupName --remote-group source-group \
        --protocol ip-protocol --dst-port from-port:to-port

  For example:

      $ openstack security group rule create cluster --remote-group global_http \
        --protocol tcp --dst-port 22:22

  The `cluster` rule allows SSH access from any other instance that uses the `global_http` group.

14.7 Manage services [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.7%20%20Manage%20services&comment=14.7%20%20Manage%20services%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.9) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.9)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 14.7.1 Create and manage services and service users [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.7.1%20%20Create%20and%20manage%20services%20and%20service%20users&comment=14.7.1%20%20Create%20and%20manage%20services%20and%20service%20users%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.9.2) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.9.2)

The Identity service enables you to define services, as follows:

* Service catalog template. The Identity service acts as a service catalog of endpoints for other OpenStack services. The `/etc/keystone/default_catalog.templates` template file defines the endpoints for services. When the Identity service uses a template file back end, any changes that are made to the endpoints are cached. These changes do not persist when you restart the service or reboot the machine.
* An SQL back end for the catalog service. When the Identity service is online, you must add the services to the catalog. When you deploy a system for production, use the SQL back end.

The `auth_token` middleware supports the use of either a shared secret or users for each service.

To authenticate users against the Identity service, you must create a service user for each OpenStack service. For example, create a service user for the Compute, Block Storage, and Networking services.

To configure the OpenStack services with service users, create a project for all services and create users for each service. Assign the admin role to each service user and project pair. This role enables users to validate tokens and authenticate and authorize other user requests.

#### 14.7.1.1 Create a service [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.7.1.1%20%20Create%20a%20service&comment=14.7.1.1%20%20Create%20a%20service%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.9.2.7) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.9.2.7)

1. List the available services:

      $ openstack service list
    +----------------------------------+----------+------------+
    | ID                               | Name     | Type       |
    +----------------------------------+----------+------------+
    | 9816f1faaa7c4842b90fb4821cd09223 | cinder   | volume     |
    | 1250f64f31e34dcd9a93d35a075ddbe1 | cinderv2 | volumev2   |
    | da8cf9f8546b4a428c43d5e032fe4afc | ec2      | ec2        |
    | 5f105eeb55924b7290c8675ad7e294ae | glance   | image      |
    | dcaa566e912e4c0e900dc86804e3dde0 | keystone | identity   |
    | 4a715cfbc3664e9ebf388534ff2be76a | nova     | compute    |
    | 1aed4a6cf7274297ba4026cf5d5e96c5 | novav21  | computev21 |
    | bed063c790634c979778551f66c8ede9 | neutron  | network    |
    | 6feb2e0b98874d88bee221974770e372 |    s3    |    s3      |
    +----------------------------------+----------+------------+
2. To create a service, run this command:

      $ openstack service create --name SERVICE_NAME --description SERVICE_DESCRIPTION SERVICE_TYPE

The arguments are:

  * `service_name`: the unique name of the new service.
  * `service_type`: the service type, such as `identity`, `compute`, `network`, `image`, `object-store` or any other service identifier string.
  * `service_description`: the description of the service.

  For example, to create a `swift` service of type `object-store`, run this command:

      $ openstack service create --name swift --description "object store service" object-store
    +-------------+----------------------------------+
    | Field       | Value                            |
    +-------------+----------------------------------+
    | description | object store service             |
    | enabled     | True                             |
    | id          | 84c23f4b942c44c38b9c42c5e517cd9a |
    | name        | swift                            |
    | type        | object-store                     |
    +-------------+----------------------------------+
3. To get details for a service, run this command:

      $ openstack service show SERVICE_TYPE|SERVICE_NAME|SERVICE_ID

  For example:

      $ openstack service show object-store
    +-------------+----------------------------------+
    | Field       | Value                            |
    +-------------+----------------------------------+
    | description | object store service             |
    | enabled     | True                             |
    | id          | 84c23f4b942c44c38b9c42c5e517cd9a |
    | name        | swift                            |
    | type        | object-store                     |
    +-------------+----------------------------------+

#### 14.7.1.2 Create service users [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.7.1.2%20%20Create%20service%20users&comment=14.7.1.2%20%20Create%20service%20users%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.9.2.8) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.9.2.8)

1. Create a project for the service users. Typically, this project is named `service`, but choose any name you like:

      $ openstack project create service --domain default
    +-------------+----------------------------------+
    | Field       | Value                            |
    +-------------+----------------------------------+
    | description | None                             |
    | domain_id   | e601210181f54843b51b3edff41d4980 |
    | enabled     | True                             |
    | id          | 3e9f3f5399624b2db548d7f871bd5322 |
    | is_domain   | False                            |
    | name        | service                          |
    | parent_id   | e601210181f54843b51b3edff41d4980 |
    +-------------+----------------------------------+
2. Create service users for the relevant services for your deployment.
3. Assign the admin role to the user-project pair.

      $ openstack role add --project service --user SERVICE_USER_NAME admin
    +-------+----------------------------------+
    | Field | Value                            |
    +-------+----------------------------------+
    | id    | 233109e756c1465292f31e7662b429b1 |
    | name  | admin                            |
    +-------+----------------------------------+

#### 14.7.1.3 Delete a service [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.7.1.3%20%20Delete%20a%20service&comment=14.7.1.3%20%20Delete%20a%20service%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.9.2.9) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.9.2.9)

To delete a specified service, specify its ID.

    $ openstack service delete SERVICE_TYPE|SERVICE_NAME|SERVICE_ID

For example:

    $ openstack service delete object-store

### 14.7.2 Manage Compute services [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.7.2%20%20Manage%20Compute%20services&comment=14.7.2%20%20Manage%20Compute%20services%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.9.3) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.9.3)

You can enable and disable Compute services. The following examples disable and enable the `nova-compute` service.

1. List the Compute services:

      $ openstack compute service list
    +----+--------------+------------+----------+---------+-------+--------------+
    | ID | Binary       | Host       | Zone     | Status  | State | Updated At   |
    +----+--------------+------------+----------+---------+-------+--------------+
    |  4 | nova-        | controller | internal | enabled | up    | 2016-12-20T0 |
    |    | consoleauth  |            |          |         |       | 0:44:48.0000 |
    |    |              |            |          |         |       | 00           |
    |  5 | nova-        | controller | internal | enabled | up    | 2016-12-20T0 |
    |    | scheduler    |            |          |         |       | 0:44:48.0000 |
    |    |              |            |          |         |       | 00           |
    |  6 | nova-        | controller | internal | enabled | up    | 2016-12-20T0 |
    |    | conductor    |            |          |         |       | 0:44:54.0000 |
    |    |              |            |          |         |       | 00           |
    |  9 | nova-compute | compute    | nova     | enabled | up    | 2016-10-21T0 |
    |    |              |            |          |         |       | 2:35:03.0000 |
    |    |              |            |          |         |       | 00           |
    +----+--------------+------------+----------+---------+-------+--------------+
2. Disable a nova service:

      $ openstack compute service set --disable --disable-reason trial log nova nova-compute
    +----------+--------------+----------+-------------------+
    | Host     | Binary       | Status   | Disabled Reason   |
    +----------+--------------+----------+-------------------+
    | compute  | nova-compute | disabled | trial log         |
    +----------+--------------+----------+-------------------+
3. Check the service list:

      $ openstack compute service list
    +----+--------------+------------+----------+---------+-------+--------------+
    | ID | Binary       | Host       | Zone     | Status  | State | Updated At   |
    +----+--------------+------------+----------+---------+-------+--------------+
    |  4 | nova-        | controller | internal | enabled | up    | 2016-12-20T0 |
    |    | consoleauth  |            |          |         |       | 0:44:48.0000 |
    |    |              |            |          |         |       | 00           |
    |  5 | nova-        | controller | internal | enabled | up    | 2016-12-20T0 |
    |    | scheduler    |            |          |         |       | 0:44:48.0000 |
    |    |              |            |          |         |       | 00           |
    |  6 | nova-        | controller | internal | enabled | up    | 2016-12-20T0 |
    |    | conductor    |            |          |         |       | 0:44:54.0000 |
    |    |              |            |          |         |       | 00           |
    |  9 | nova-compute | compute    | nova     | disabled| up    | 2016-10-21T0 |
    |    |              |            |          |         |       | 2:35:03.0000 |
    |    |              |            |          |         |       | 00           |
    +----+--------------+------------+----------+---------+-------+--------------+
4. Enable the service:

      $ openstack compute service set --enable nova nova-compute
    +----------+--------------+---------+
    | Host     | Binary       | Status  |
    +----------+--------------+---------+
    | compute  | nova-compute | enabled |
    +----------+--------------+---------+

14.8 Manage images [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.8%20%20Manage%20images&comment=14.8%20%20Manage%20images%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.10) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.10)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

The cloud operator assigns roles to users. Roles determine who can upload and manage images. The operator might restrict image upload and management to only cloud administrators or operators.

You can upload images through the `glance` client or the Image service API. You can use the `nova` client for the image management. The latter provides mechanisms to list and delete images, set and delete image metadata, and create images of a running instance or snapshot and backup types.

After you upload an image, you cannot change it.

For details about image creation, see the [Virtual Machine Image Guide](http://docs.openstack.org/image-guide/).

### 14.8.1 List or get details for images (glance) [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.8.1%20%20List%20or%20get%20details%20for%20images%20(glance)&comment=14.8.1%20%20List%20or%20get%20details%20for%20images%20(glance)%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.10.6) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.10.6)

To get a list of images and to get further details about a single image, use `openstack image list` and `openstack image show` commands.

    $ openstack image list
    +--------------------------------------+---------------------------------+--------+
    | ID                                   | Name                            | Status |
    +--------------------------------------+---------------------------------+--------+
    | dfc1dfb0-d7bf-4fff-8994-319dd6f703d7 | cirros-0.3.2-x86_64-uec         | active |
    | a3867e29-c7a1-44b0-9e7f-10db587cad20 | cirros-0.3.2-x86_64-uec-kernel  | active |
    | 4b916fba-6775-4092-92df-f41df7246a6b | cirros-0.3.2-x86_64-uec-ramdisk | active |
    | d07831df-edc3-4817-9881-89141f9134c3 | myCirrosImage                   | active |
    +--------------------------------------+---------------------------------+--------+

    $ openstack image show myCirrosImage
    +------------------+------------------------------------------------------+
    | Field            | Value                                                |
    +------------------+------------------------------------------------------+
    | checksum         | ee1eca47dc88f4879d8a229cc70a07c6                     |
    | container_format | ami                                                  |
    | created_at       | 2016-08-11T15:07:26Z                                 |
    | disk_format      | ami                                                  |
    | file             | /v2/images/d07831df-edc3-4817-9881-89141f9134c3/file |
    | id               | d07831df-edc3-4817-9881-89141f9134c3                 |
    | min_disk         | 0                                                    |
    | min_ram          | 0                                                    |
    | name             | myCirrosImage                                        |
    | owner            | d88310717a8e4ebcae84ed075f82c51e                     |
    | protected        | False                                                |
    | schema           | /v2/schemas/image                                    |
    | size             | 13287936                                             |
    | status           | active                                               |
    | tags             |                                                      |
    | updated_at       | 2016-08-11T15:20:02Z                                 |
    | virtual_size     | None                                                 |
    | visibility       | private                                              |
    +------------------+------------------------------------------------------+

When viewing a list of images, you can also use `grep` to filter the list, as follows:

    $ openstack image list | grep 'cirros'
    | dfc1dfb0-d7bf-4fff-8994-319dd6f703d7 | cirros-0.3.2-x86_64-uec         | active |
    | a3867e29-c7a1-44b0-9e7f-10db587cad20 | cirros-0.3.2-x86_64-uec-kernel  | active |
    | 4b916fba-6775-4092-92df-f41df7246a6b | cirros-0.3.2-x86_64-uec-ramdisk | active |

![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

To store location metadata for images, which enables direct file access for a client, update the `/etc/glance/glance-api.conf` file with the following statements:

* `show_multiple_locations = True`
* `filesystem_store_metadata_file = filePath`

  where filePath points to a JSON file that defines the mount point for OpenStack images on your system and a unique ID. For example:

    [{
        "id": "2d9bb53f-70ea-4066-a68b-67960eaae673",
        "mountpoint": "/var/lib/glance/images/"
    }]

After you restart the Image service, you can use the following syntax to view the image's location information:

    $ openstack --os-image-api-version 2 image show imageID

For example, using the image ID shown above, you would issue the command as follows:

    $ openstack --os-image-api-version 2 image show 2d9bb53f-70ea-4066-a68b-67960eaae673

### 14.8.2 Create or update an image (glance) [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.8.2%20%20Create%20or%20update%20an%20image%20(glance)&comment=14.8.2%20%20Create%20or%20update%20an%20image%20(glance)%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.10.7) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.10.7)

To create an image, use `openstack image create`:

    $ openstack image create imageName

To update an image by name or ID, use `openstack image set`:

    $ openstack image set imageName

The following list explains the optional arguments that you can use with the `create` and `set` commands to modify image properties. For more information, refer to the [OpenStack Image command reference](http://docs.openstack.org/developer/python-openstackclient/command-objects/image.html).

The following example shows the command that you would use to upload a CentOS 6.3 image in qcow2 format and configure it for public access:

    $ openstack image create --disk-format qcow2 --container-format bare \
      --public --file ./centos63.qcow2 centos63-image

The following example shows how to update an existing image with a properties that describe the disk bus, the CD-ROM bus, and the VIF model:

![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

When you use OpenStack with VMware vCenter Server, you need to specify the `vmware_disktype` and `vmware_adaptertype` properties with `openstack image create`. Also, we recommend that you set the `hypervisor_type="vmware"` property. For more information, see [Images with VMware vSphere](http://docs.openstack.org/newton/config-reference/compute/hypervisor-vmware.html#images-with-vmware-vsphere) in the OpenStack Configuration Reference.

    $ openstack image set \
        --property hw_disk_bus=scsi \
        --property hw_cdrom_bus=ide \
        --property hw_vif_model=e1000 \
        f16-x86_64-openstack-sda

Currently the libvirt virtualization tool determines the disk, CD-ROM, and VIF device models based on the configured hypervisor type (`libvirt_type` in `/etc/nova/nova.conf` file). For the sake of optimal performance, libvirt defaults to using virtio for both disk and VIF (NIC) models. The disadvantage of this approach is that it is not possible to run operating systems that lack virtio drivers, for example, BSD, Solaris, and older versions of Linux and Windows.

The valid model values depend on the `libvirt_type` setting, as shown in the following tables.

###### Table 14.3: Disk and CD-ROM bus model values [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%20Table%2526nbsp%253B14.3%253A%20%20Disk%20and%20CD-ROM%20bus%20model%20values%20&comment=Table%2526nbsp%253B14.3%253A%20%20Disk%20and%20CD-ROM%20bus%20model%20values%20%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523disk-and-cd-rom-bus-model-values-table) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#disk-and-cd-rom-bus-model-values-table)

libvirt\_type setting

Supported model values

qemu or kvm

* ide
* scsi
* virtio

xen

* ide
* xen

###### Table 14.4: VIF model values [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%20Table%2526nbsp%253B14.4%253A%20%20VIF%20model%20values%20&comment=Table%2526nbsp%253B14.4%253A%20%20VIF%20model%20values%20%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523vif-model-values-table) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#vif-model-values-table)

libvirt\_type setting

Supported model values

qemu or kvm

* e1000
* ne2k\_pci
* pcnet
* rtl8139
* virtio

xen

* e1000
* netfront
* ne2k\_pci
* pcnet
* rtl8139

vmware

* VirtualE1000
* VirtualPCNet32
* VirtualVmxnet

![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

By default, hardware properties are retrieved from the image properties. However, if this information is not available, the `libosinfo` database provides an alternative source for these values.

If the guest operating system is not in the database, or if the use of `libosinfo` is disabled, the default system values are used.

Users can set the operating system ID or a `short-id` in image properties. For example:

    $ openstack image set --property short-id=fedora23 \
      name-of-my-fedora-image

Alternatively, users can set `id` to a URL:

    $ openstack image set \
      --property id=http://fedoraproject.org/fedora/23 \
      ID-of-my-fedora-image

#### 14.8.2.1 Create an image from ISO image [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.8.2.1%20%20Create%20an%20image%20from%20ISO%20image&comment=14.8.2.1%20%20Create%20an%20image%20from%20ISO%20image%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.10.7.17) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.10.7.17)

You can upload ISO images to the Image service (glance). You can subsequently boot an ISO image using Compute.

In the Image service, run the following command:

    $ openstack image create ISO_IMAGE --file IMAGE.iso \
      --disk-format iso --container-format bare

Optionally, to confirm the upload in Image service, run:

    $ openstack image list

### 14.8.3 Troubleshoot image creation [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.8.3%20%20Troubleshoot%20image%20creation&comment=14.8.3%20%20Troubleshoot%20image%20creation%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.10.8) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.10.8)

If you encounter problems in creating an image in the Image service or Compute, the following information may help you troubleshoot the creation process.

* Ensure that the version of qemu you are using is version 0.14 or later. Earlier versions of qemu result in an `unknown option -s` error message in the `/var/log/nova/nova-compute.log` file.
* Examine the `/var/log/nova/nova-api.log` and `/var/log/nova/nova-compute.log` log files for error messages.

14.9 Manage volumes [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.9%20%20Manage%20volumes&comment=14.9%20%20Manage%20volumes%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.11) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.11)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

A volume is a detachable block storage device, similar to a USB hard drive. You can attach a volume to only one instance. Use the `openstack` client commands to create and manage volumes.

### 14.9.1 Migrate a volume [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.9.1%20%20Migrate%20a%20volume&comment=14.9.1%20%20Migrate%20a%20volume%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.11.3) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.11.3)

As an administrator, you can migrate a volume with its data from one location to another in a manner that is transparent to users and workloads. You can migrate only detached volumes with no snapshots.

Possible use cases for data migration include:

* Bring down a physical storage device for maintenance without disrupting workloads.
* Modify the properties of a volume.
* Free up space in a thinly-provisioned back end.

Migrate a volume with the `cinder migrate` command, as shown in the following example:

    $ cinder migrate --force-host-copy <True|False>
                     --lock-volume <True|False>
                     <volume> <host>

In this example, `--force-host-copy True` forces the generic host-based migration mechanism and bypasses any driver optimizations. `--lock-volume` applies to the available volume. To determine whether the termination of volume migration caused by other commands. `True` locks the volume state and does not allow the migration to be aborted.

![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

If the volume has snapshots, the specified host destination cannot accept the volume. If the user is not an administrator, the migration fails.

### 14.9.2 Create a volume [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.9.2%20%20Create%20a%20volume&comment=14.9.2%20%20Create%20a%20volume%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.11.4) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.11.4)

This example creates a `my-new-volume` volume based on an image.

1. List images, and note the ID of the image that you want to use for your volume:

      $ openstack image list
    +--------------------------------------+---------------------------------+
    | ID                                   | Name                            |
    +--------------------------------------+---------------------------------+
    | 8bf4dc2a-bf78-4dd1-aefa-f3347cf638c8 | cirros-0.3.4-x86_64-uec         |
    | 9ff9bb2e-3a1d-4d98-acb5-b1d3225aca6c | cirros-0.3.4-x86_64-uec-kernel  |
    | 4b227119-68a1-4b28-8505-f94c6ea4c6dc | cirros-0.3.4-x86_64-uec-ramdisk |
    +--------------------------------------+---------------------------------+
2. List the availability zones, and note the ID of the availability zone in which you want to create your volume:

      $ openstack availability zone list
    +------+-----------+
    | Name |   Status  |
    +------+-----------+
    | nova | available |
    +------+-----------+
3. Create a volume with 8 gibibytes (GiB) of space, and specify the availability zone and image:

      $ openstack volume create --image 8bf4dc2a-bf78-4dd1-aefa-f3347cf638c8 \
      --size 8 --availability-zone nova my-new-volume

    +------------------------------+--------------------------------------+
    | Property                     | Value                                |
    +------------------------------+--------------------------------------+
    | attachments                  | []                                   |
    | availability_zone            | nova                                 |
    | bootable                     | false                                |
    | consistencygroup_id          | None                                 |
    | created_at                   | 2016-09-23T07:52:42.000000           |
    | description                  | None                                 |
    | encrypted                    | False                                |
    | id                           | bab4b0e0-ce3d-4d57-bf57-3c51319f5202 |
    | metadata                     | {}                                   |
    | multiattach                  | False                                |
    | name                         | my-new-volume                        |
    | os-vol-tenant-attr:tenant_id | 3f670abbe9b34ca5b81db6e7b540b8d8     |
    | replication_status           | disabled                             |
    | size                         | 8                                    |
    | snapshot_id                  | None                                 |
    | source_volid                 | None                                 |
    | status                       | creating                             |
    | updated_at                   | None                                 |
    | user_id                      | fe19e3a9f63f4a14bd4697789247bbc5     |
    | volume_type                  | lvmdriver-1                          |
    +------------------------------+--------------------------------------+
4. To verify that your volume was created successfully, list the available volumes:

      $ openstack volume list
    +--------------------------------------+---------------+-----------+------+-------------+
    | ID                                   | DisplayName   |  Status   | Size | Attached to |
    +--------------------------------------+---------------+-----------+------+-------------+
    | bab4b0e0-ce3d-4d57-bf57-3c51319f5202 | my-new-volume | available | 8    |             |
    +--------------------------------------+---------------+-----------+------+-------------+

  If your volume was created successfully, its status is `available`. If its status is `error`, you might have exceeded your quota.

### 14.9.3 Create a volume from specified volume type [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.9.3%20%20Create%20a%20volume%20from%20specified%20volume%20type&comment=14.9.3%20%20Create%20a%20volume%20from%20specified%20volume%20type%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.11.5) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.11.5)

Cinder supports these three ways to specify `volume type` during volume creation.

1. volume\_type
2. cinder\_img\_volume\_type (via glance image metadata)
3. default\_volume\_type (via cinder.conf)

#### 14.9.3.1 volume\_type [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.9.3.1%20%20volume_type&comment=14.9.3.1%20%20volume_type%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.11.5.4) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.11.5.4)

User can specify `volume type` when creating a volume.

    $ openstack volume create -h -f {json,shell,table,value,yaml}
                             -c COLUMN --max-width <integer>
                             --noindent --prefix PREFIX --size <size>
                             --type <volume-type> --image <image>
                             --snapshot <snapshot> --source <volume>
                             --description <description> --user <user>
                             --project <project>
                             --availability-zone <availability-zone>
                             --property <key=value>
                             <name>

#### 14.9.3.2 cinder\_img\_volume\_type [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.9.3.2%20%20cinder_img_volume_type&comment=14.9.3.2%20%20cinder_img_volume_type%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.11.5.5) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.11.5.5)

If glance image has `cinder_img_volume_type` property, Cinder uses this parameter to specify `volume type` when creating a volume.

Choose glance image which has `cinder_img_volume_type` property and create a volume from the image.

    $ openstack image list
    +----------------------------------+---------------------------------+--------+
    | ID                               | Name                            | Status |
    +----------------------------------+---------------------------------+--------+
    | 376bd633-c9c9-4c5d-a588-342f4f66 | cirros-0.3.4-x86_64-uec         | active |
    | d086                             |                                 |        |
    | 2c20fce7-2e68-45ee-ba8d-         | cirros-0.3.4-x86_64-uec-ramdisk | active |
    | beba27a91ab5                     |                                 |        |
    | a5752de4-9faf-4c47-acbc-         | cirros-0.3.4-x86_64-uec-kernel  | active |
    | 78a5efa7cc6e                     |                                 |        |
    +----------------------------------+---------------------------------+--------+

    $ openstack image show 376bd633-c9c9-4c5d-a588-342f4f66d086
    +------------------+-----------------------------------------------------------+
    | Field            | Value                                                     |
    +------------------+-----------------------------------------------------------+
    | checksum         | eb9139e4942121f22bbc2afc0400b2a4                          |
    | container_format | ami                                                       |
    | created_at       | 2016-10-13T03:28:55Z                                      |
    | disk_format      | ami                                                       |
    | file             | /v2/images/376bd633-c9c9-4c5d-a588-342f4f66d086/file      |
    | id               | 376bd633-c9c9-4c5d-a588-342f4f66d086                      |
    | min_disk         | 0                                                         |
    | min_ram          | 0                                                         |
    | name             | cirros-0.3.4-x86_64-uec                                   |
    | owner            | 88ba456e3a884c318394737765e0ef4d                          |
    | properties       | kernel_id='a5752de4-9faf-4c47-acbc-78a5efa7cc6e',         |
    |                  | ramdisk_id='2c20fce7-2e68-45ee-ba8d-beba27a91ab5'         |
    | protected        | False                                                     |
    | schema           | /v2/schemas/image                                         |
    | size             | 25165824                                                  |
    | status           | active                                                    |
    | tags             |                                                           |
    | updated_at       | 2016-10-13T03:28:55Z                                      |
    | virtual_size     | None                                                      |
    | visibility       | public                                                    |
    +------------------+-----------------------------------------------------------+

    $ openstack volume create --image 376bd633-c9c9-4c5d-a588-342f4f66d086 \
      --size 1 --availability-zone nova test
    +---------------------+--------------------------------------+
    | Field               | Value                                |
    +---------------------+--------------------------------------+
    | attachments         | []                                   |
    | availability_zone   | nova                                 |
    | bootable            | false                                |
    | consistencygroup_id | None                                 |
    | created_at          | 2016-10-13T06:29:53.688599           |
    | description         | None                                 |
    | encrypted           | False                                |
    | id                  | e6e6a72d-cda7-442c-830f-f306ea6a03d5 |
    | multiattach         | False                                |
    | name                | test                                 |
    | properties          |                                      |
    | replication_status  | disabled                             |
    | size                | 1                                    |
    | snapshot_id         | None                                 |
    | source_volid        | None                                 |
    | status              | creating                             |
    | type                | lvmdriver-1                          |
    | updated_at          | None                                 |
    | user_id             | 33fdc37314914796883706b33e587d51     |
    +---------------------+--------------------------------------+

#### 14.9.3.3 default\_volume\_type [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.9.3.3%20%20default_volume_type&comment=14.9.3.3%20%20default_volume_type%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.11.5.6) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.11.5.6)

If above parameters are not set, Cinder uses default\_volume\_type which is defined in cinder.conf during volume creation.

Example cinder.conf file configuration.

    [default]
    default_volume_type = lvmdriver-1

### 14.9.4 Attach a volume to an instance [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.9.4%20%20Attach%20a%20volume%20to%20an%20instance&comment=14.9.4%20%20Attach%20a%20volume%20to%20an%20instance%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.11.6) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.11.6)

1. Attach your volume to a server, specifying the server ID and the volume ID:

      $ openstack server add volume 84c6e57d-a6b1-44b6-81eb-fcb36afd31b5 \
      573e024d-5235-49ce-8332-be1576d323f8 --device /dev/vdb
2. Show information for your volume:

      $ openstack volume show 573e024d-5235-49ce-8332-be1576d323f8

  The output shows that the volume is attached to the server with ID `84c6e57d-a6b1-44b6-81eb-fcb36afd31b5`, is in the nova availability zone, and is bootable.

      +------------------------------+-----------------------------------------------+
    | Field                        | Value                                         |
    +------------------------------+-----------------------------------------------+
    | attachments                  | [{u'device': u'/dev/vdb',                     |
    |                              |        u'server_id': u'84c6e57d-a             |
    |                              |           u'id': u'573e024d-...               |
    |                              |        u'volume_id': u'573e024d...            |
    | availability_zone            | nova                                          |
    | bootable                     | true                                          |
    | consistencygroup_id          | None                                          |
    | created_at                   | 2016-10-13T06:08:07.000000                    |
    | description                  | None                                          |
    | encrypted                    | False                                         |
    | id                           | 573e024d-5235-49ce-8332-be1576d323f8          |
    | multiattach                  | False                                         |
    | name                         | my-new-volume                                 |
    | os-vol-tenant-attr:tenant_id | 7ef070d3fee24bdfae054c17ad742e28              |
    | properties                   |                                               |
    | replication_status           | disabled                                      |
    | size                         | 8                                             |
    | snapshot_id                  | None                                          |
    | source_volid                 | None                                          |
    | status                       | in-use                                        |
    | type                         | lvmdriver-1                                   |
    | updated_at                   | 2016-10-13T06:08:11.000000                    |
    | user_id                      | 33fdc37314914796883706b33e587d51              |
    | volume_image_metadata        |{u'kernel_id': u'df430cc2...,                  |
    |                              |        u'image_id': u'397e713c...,            |
    |                              |        u'ramdisk_id': u'3cf852bd...,          |
    |                              |u'image_name': u'cirros-0.3.2-x86_64-uec'}     |
    +------------------------------+-----------------------------------------------+

### 14.9.5 Resize a volume [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.9.5%20%20Resize%20a%20volume&comment=14.9.5%20%20Resize%20a%20volume%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523resize-a-volume) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#resize-a-volume)

1. To resize your volume, you must first detach it from the server. To detach the volume from your server, pass the server ID and volume ID to the following command:

      $ openstack server remove volume 84c6e57d-a6b1-44b6-81eb-fcb36afd31b5 573e024d-5235-49ce-8332-be1576d323f8

  This command does not provide any output.
2. List volumes:

      $ openstack volume list
    +----------------+-----------------+-----------+------+-------------+
    |       ID       |   Display Name  |  Status   | Size | Attached to |
    +----------------+-----------------+-----------+------+-------------+
    | 573e024d-52... |  my-new-volume  | available |  8   |             |
    | bd7cf584-45... | my-bootable-vol | available |  8   |             |
    +----------------+-----------------+-----------+------+-------------+

  Note that the volume is now available.
3. Resize the volume by passing the volume ID and the new size (a value greater than the old one) as parameters:

      $ openstack volume set 573e024d-5235-49ce-8332-be1576d323f8 --size 10

  This command does not provide any output.

  ![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

  When extending an LVM volume with a snapshot, the volume will be deactivated. The reactivation is automatic unless `auto_activation_volume_list` is defined in `lvm.conf`. See `lvm.conf` for more information.

### 14.9.6 Delete a volume [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.9.6%20%20Delete%20a%20volume&comment=14.9.6%20%20Delete%20a%20volume%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.11.8) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.11.8)

1. To delete your volume, you must first detach it from the server. To detach the volume from your server and check for the list of existing volumes, see steps 1 and 2 in [Section 14.9.5, “Resize a volume”](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#resize-a-volume).

  Delete the volume using either the volume name or ID:

      $ openstack volume delete my-new-volume

  This command does not provide any output.
2. List the volumes again, and note that the status of your volume is `deleting`:

      $ openstack volume list
    +----------------+-----------------+-----------+------+-------------+
    |       ID       |   Display Name  |  Status   | Size | Attached to |
    +----------------+-----------------+-----------+------+-------------+
    | 573e024d-52... |  my-new-volume  |  deleting |  8   |             |
    | bd7cf584-45... | my-bootable-vol | available |  8   |             |
    +----------------+-----------------+-----------+------+-------------+

  When the volume is fully deleted, it disappears from the list of volumes:

      $ openstack volume list
    +----------------+-----------------+-----------+------+-------------+
    |       ID       |   Display Name  |  Status   | Size | Attached to |
    +----------------+-----------------+-----------+------+-------------+
    | bd7cf584-45... | my-bootable-vol | available |  8   |             |
    +----------------+-----------------+-----------+------+-------------+

### 14.9.7 Transfer a volume [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.9.7%20%20Transfer%20a%20volume&comment=14.9.7%20%20Transfer%20a%20volume%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.11.9) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.11.9)

You can transfer a volume from one owner to another by using the `openstack volume transfer request create` command. The volume donor, or original owner, creates a transfer request and sends the created transfer ID and authorization key to the volume recipient. The volume recipient, or new owner, accepts the transfer by using the ID and key.

![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

The procedure for volume transfer is intended for tenants (both the volume donor and recipient) within the same cloud.

Use cases include:

* Create a custom bootable volume or a volume with a large data set and transfer it to a customer.
* For bulk import of data to the cloud, the data ingress system creates a new Block Storage volume, copies data from the physical device, and transfers device ownership to the end user.

#### 14.9.7.1 Create a volume transfer request [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.9.7.1%20%20Create%20a%20volume%20transfer%20request&comment=14.9.7.1%20%20Create%20a%20volume%20transfer%20request%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.11.9.6) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.11.9.6)

1. While logged in as the volume donor, list the available volumes:

      $ openstack volume list
    +-----------------+-----------------+-----------+------+-------------+
    |       ID        |   Display Name  |  Status   | Size | Attached to |
    +-----------------+-----------------+-----------+------+-------------+
    | 72bfce9f-cac... |       None      |   error   |  1   |             |
    | a1cdace0-08e... |       None      | available |  1   |             |
    +-----------------+-----------------+-----------+------+-------------+
2. As the volume donor, request a volume transfer authorization code for a specific volume:

        $ openstack volume transfer request create <volume>

    <volume>
       Name or ID of volume to transfer.

  The volume must be in an `available` state or the request will be denied. If the transfer request is valid in the database (that is, it has not expired or been deleted), the volume is placed in an `awaiting-transfer` state. For example:

      $ openstack volume transfer request create a1cdace0-08e4-4dc7-b9dc-457e9bcfe25f

  The output shows the volume transfer ID in the `id` row and the authorization key.

      +------------+--------------------------------------+
    | Field      | Value                                |
    +------------+--------------------------------------+
    | auth_key   | 0a59e53630f051e2                     |
    | created_at | 2016-11-03T11:49:40.346181           |
    | id         | 34e29364-142b-4c7b-8d98-88f765bf176f |
    | name       | None                                 |
    | volume_id  | a1cdace0-08e4-4dc7-b9dc-457e9bcfe25f |
    +------------+--------------------------------------+

  ![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

  Optionally, you can specify a name for the transfer by using the `--name transferName` parameter.

  ![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

  While the `auth_key` property is visible in the output of `openstack volume transfer request create VOLUME_ID`, it will not be available in subsequent `openstack volume transfer request show TRANSFER_ID` command.
3. Send the volume transfer ID and authorization key to the new owner (for example, by email).
4. View pending transfers:

      $ openstack volume transfer request list
    +--------------------------------------+--------------------------------------+------+
    |               ID                     |             Volume                   | Name |
    +--------------------------------------+--------------------------------------+------+
    | 6e4e9aa4-bed5-4f94-8f76-df43232f44dc | a1cdace0-08e4-4dc7-b9dc-457e9bcfe25f | None |
    +--------------------------------------+--------------------------------------+------+
5. After the volume recipient, or new owner, accepts the transfer, you can see that the transfer is no longer available:

      $ openstack volume transfer request list
    +----+-----------+------+
    | ID | Volume ID | Name |
    +----+-----------+------+
    +----+-----------+------+

#### 14.9.7.2 Accept a volume transfer request [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.9.7.2%20%20Accept%20a%20volume%20transfer%20request&comment=14.9.7.2%20%20Accept%20a%20volume%20transfer%20request%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.11.9.7) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.11.9.7)

1. As the volume recipient, you must first obtain the transfer ID and authorization key from the original owner.
2. Accept the request:

      $ openstack volume transfer request accept transferID authKey

  For example:

      $ openstack volume transfer request accept 6e4e9aa4-bed5-4f94-8f76-df43232f44dc b2c8e585cbc68a80
    +-----------+--------------------------------------+
    |  Property |                Value                 |
    +-----------+--------------------------------------+
    |     id    | 6e4e9aa4-bed5-4f94-8f76-df43232f44dc |
    |    name   |                 None                 |
    | volume_id | a1cdace0-08e4-4dc7-b9dc-457e9bcfe25f |
    +-----------+--------------------------------------+

  ![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

  If you do not have a sufficient quota for the transfer, the transfer is refused.

#### 14.9.7.3 Delete a volume transfer [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.9.7.3%20%20Delete%20a%20volume%20transfer&comment=14.9.7.3%20%20Delete%20a%20volume%20transfer%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.11.9.8) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.11.9.8)

1. List available volumes and their statuses:

      $ openstack volume list
    +-----------------+-----------------+-----------------+------+-------------+
    |       ID        |   Display Name  |      Status     | Size | Attached to |
    +-----------------+-----------------+-----------------+------+-------------+
    | 72bfce9f-cac... |       None      |      error      |  1   |             |
    | a1cdace0-08e... |       None      |awaiting-transfer|  1   |             |
    +-----------------+-----------------+-----------------+------+-------------+
2. Find the matching transfer ID:

      $ openstack volume transfer request list
    +--------------------------------------+--------------------------------------+------+
    |               ID                     |             VolumeID                 | Name |
    +--------------------------------------+--------------------------------------+------+
    | a6da6888-7cdf-4291-9c08-8c1f22426b8a | a1cdace0-08e4-4dc7-b9dc-457e9bcfe25f | None |
    +--------------------------------------+--------------------------------------+------+
3. Delete the volume:

      $ openstack volume transfer request delete <transfer>

\<transfer\>

  Name or ID of transfer to delete.

  For example:

      $ openstack volume transfer request delete a6da6888-7cdf-4291-9c08-8c1f22426b8a
4. Verify that transfer list is now empty and that the volume is again available for transfer:

      $ openstack volume transfer request list
    +----+-----------+------+
    | ID | Volume ID | Name |
    +----+-----------+------+
    +----+-----------+------+

      $ openstack volume list
    +-----------------+-----------+--------------+------+-------------+----------+-------------+
    |       ID        |   Status  | Display Name | Size | Volume Type | Bootable | Attached to |
    +-----------------+-----------+--------------+------+-------------+----------+-------------+
    | 72bfce9f-ca...  |   error   |     None     |  1   |     None    |  false   |             |
    | a1cdace0-08...  | available |     None     |  1   |     None    |  false   |             |
    +-----------------+-----------+--------------+------+-------------+----------+-------------+

### 14.9.8 Manage and unmanage a snapshot [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.9.8%20%20Manage%20and%20unmanage%20a%20snapshot&comment=14.9.8%20%20Manage%20and%20unmanage%20a%20snapshot%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.11.10) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.11.10)

A snapshot is a point in time version of a volume. As an administrator, you can manage and unmanage snapshots.

#### 14.9.8.1 Manage a snapshot [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.9.8.1%20%20Manage%20a%20snapshot&comment=14.9.8.1%20%20Manage%20a%20snapshot%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.11.10.3) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.11.10.3)

Manage a snapshot with the `openstack snapshot set` command:

    $ openstack snapshot set \
      [--name <name>] \
      [--description <description>] \
      [--property <key=value> [...] ] \
      [--state <state>] \
      <snapshot>

The arguments to be passed are:

`--name`

New snapshot name

`--description`

New snapshot description

`--property`

Property to add or modify for this snapshot (repeat option to set multiple properties)

`--state`

New snapshot state. (“available”, “error”, “creating”, “deleting”, or “error\_deleting”) (admin only) (This option simply changes the state of the snapshot in the database with no regard to actual status, exercise caution when using)

`<snapshot>`

Snapshot to modify (name or ID)

    $ openstack snapshot set my-snapshot-id

#### 14.9.8.2 Unmanage a snapshot [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.9.8.2%20%20Unmanage%20a%20snapshot&comment=14.9.8.2%20%20Unmanage%20a%20snapshot%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.11.10.4) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.11.10.4)

Unmanage a snapshot with the `cinder snapshot-unmanage` command:

    $ cinder snapshot-unmanage SNAPSHOT

The arguments to be passed are:

SNAPSHOT

Name or ID of the snapshot to unmanage.

The following example unmanages the `my-snapshot-id` image:

    $ cinder snapshot-unmanage my-snapshot-id

14.10 Manage shares [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.10%20%20Manage%20shares&comment=14.10%20%20Manage%20shares%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.12) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.12)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

A share is provided by file storage. You can give access to a share to instances. To create and manage shares, use `manila` client commands.

### 14.10.1 Migrate a share [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.10.1%20%20Migrate%20a%20share&comment=14.10.1%20%20Migrate%20a%20share%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.12.3) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.12.3)

As an administrator, you can migrate a share with its data from one location to another in a manner that is transparent to users and workloads.

Possible use cases for data migration include:

* Bring down a physical storage device for maintenance without disrupting workloads.
* Modify the properties of a share.
* Free up space in a thinly-provisioned back end.

Migrate a share with the `manila migrate` command, as shown in the following example:

    $ manila migrate shareID destinationHost --force-host-copy True|False

In this example, `--force-host-copy True` forces the generic host-based migration mechanism and bypasses any driver optimizations. `destinationHost` is in this format `host#pool` which includes destination host and pool.

![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

If the user is not an administrator, the migration fails.

14.11 Manage flavors [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.11%20%20Manage%20flavors&comment=14.11%20%20Manage%20flavors%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523osadm-manage-flavors-cmd) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#osadm-manage-flavors-cmd)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

In OpenStack, flavors define the compute, memory, and storage capacity of nova computing instances. To put it simply, a flavor is an available hardware configuration for a server. It defines the `size` of a virtual server that can be launched.

![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

Flavors can also determine on which compute host a flavor can be used to launch an instance. For information about customizing flavors, refer to [Section 5.4.3, “Flavors”](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/bk02ch05.html#compute-flavors).

A flavor consists of the following parameters:

Flavor ID

Unique ID (integer or UUID) for the new flavor. If specifying 'auto', a UUID will be automatically generated.

Name

Name for the new flavor.

VCPUs

Number of virtual CPUs to use.

Memory MB

Amount of RAM to use (in megabytes).

Root Disk GB

Amount of disk space (in gigabytes) to use for the root (/) partition.

Ephemeral Disk GB

Amount of disk space (in gigabytes) to use for the ephemeral partition. If unspecified, the value is `0` by default. Ephemeral disks offer machine local disk storage linked to the lifecycle of a VM instance. When a VM is terminated, all data on the ephemeral disk is lost. Ephemeral disks are not included in any snapshots.

Swap

Amount of swap space (in megabytes) to use. If unspecified, the value is `0` by default.

RXTX Factor

Optional property that allows servers with a different bandwidth be created with the RXTX Factor. The default value is `1.0`. That is, the new bandwidth is the same as that of the attached network. The RXTX Factor is available only for Xen or NSX based systems.

Is Public

Boolean value defines whether the flavor is available to all users. Defaults to `True`.

Extra Specs

Key and value pairs that define on which compute nodes a flavor can run. These pairs must match corresponding pairs on the compute nodes. It can be used to implement special resources, such as flavors that run on only compute nodes with GPU hardware.

As of Newton, there are no default flavors. The following table lists the default flavors for Mitaka and earlier.

Flavor

VCPUs

Disk (in GB)

RAM (in MB)

m1.tiny

1

1

512

m1.small

1

20

2048

m1.medium

2

40

4096

m1.large

4

80

8192

m1.xlarge

8

160

16384

You can create and manage flavors with the `openstack flavor` commands provided by the `python-openstackclient` package.

### 14.11.1 Create a flavor [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.11.1%20%20Create%20a%20flavor&comment=14.11.1%20%20Create%20a%20flavor%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.13.9) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.13.9)

1. List flavors to show the ID and name, the amount of memory, the amount of disk space for the root partition and for the ephemeral partition, the swap, and the number of virtual CPUs for each flavor:

      $ openstack flavor list
2. To create a flavor, specify a name, ID, RAM size, disk size, and the number of VCPUs for the flavor, as follows:

      $ openstack flavor create FLAVOR_NAME --id FLAVOR_ID --ram RAM_IN_MB --disk ROOT_DISK_IN_GB --vcpus NUMBER_OF_VCPUS

  ![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

  Unique ID (integer or UUID) for the new flavor. If specifying 'auto', a UUID will be automatically generated.

  Here is an example with additional optional parameters filled in that creates a public `extra tiny` flavor that automatically gets an ID assigned, with 256 MB memory, no disk space, and one VCPU. The rxtx-factor indicates the slice of bandwidth that the instances with this flavor can use (through the Virtual Interface (vif) creation in the hypervisor):

      $ openstack flavor create --public m1.extra_tiny --id auto --ram 256 --disk 0 --vcpus 1 --rxtx-factor 1
3. If an individual user or group of users needs a custom flavor that you do not want other projects to have access to, you can change the flavor's access to make it a private flavor. See [Private Flavors in the OpenStack Operations Guide](http://docs.openstack.org/ops-guide/ops-user-facing-operations.html#private-flavors).

  For a list of optional parameters, run this command:

      $ openstack help flavor create
4. After you create a flavor, assign it to a project by specifying the flavor name or ID and the project ID:

      $ nova flavor-access-add FLAVOR TENANT_ID
5. In addition, you can set or unset `extra_spec` for the existing flavor. The `extra_spec` metadata keys can influence the instance directly when it is launched. If a flavor sets the `extra_spec key/value quota:vif_outbound_peak=65536`, the instance's outbound peak bandwidth I/O should be LTE 512 Mbps. There are several aspects that can work for an instance including `CPU limits`, `Disk tuning`, `Bandwidth I/O`, `Watchdog behavior`, and `Random-number generator`. For information about supporting metadata keys, see [Section 5.4.3, “Flavors”](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/bk02ch05.html#compute-flavors).

  For a list of optional parameters, run this command:

      $ nova help flavor-key

### 14.11.2 Delete a flavor [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.11.2%20%20Delete%20a%20flavor&comment=14.11.2%20%20Delete%20a%20flavor%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.13.10) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.13.10)

Delete a specified flavor, as follows:

    $ openstack flavor delete FLAVOR_ID

14.12 Manage the OpenStack environment [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.12%20%20Manage%20the%20OpenStack%20environment&comment=14.12%20%20Manage%20the%20OpenStack%20environment%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.14) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.14)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

This section includes tasks specific to the OpenStack environment.

### 14.12.1 Select hosts where instances are launched [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.12.1%20%20Select%20hosts%20where%20instances%20are%20launched&comment=14.12.1%20%20Select%20hosts%20where%20instances%20are%20launched%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.14.3) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.14.3)

With the appropriate permissions, you can select which host instances are launched on and which roles can boot instances on this host.

1. To select the host where instances are launched, use the `--availability-zone ZONE:HOST:NODE` parameter on the `openstack server create` command.

  For example:

      $ openstack server create --image IMAGE --flavor m1.tiny \
      --key-name KEY --availability-zone ZONE:HOST:NODE \
      --nic net-id=UUID SERVER

  ![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

  HOST is an optional parameter. In such cases, use the `--availability-zone ZONE::NODE`.
2. To specify which roles can launch an instance on a specified host, enable the `create:forced_host` option in the `policy.json` file. By default, this option is enabled for only the admin role. If you see `Forbidden (HTTP 403)` in return, then you are not using admin credentials.
3. To view the list of valid zones, use the `openstack availability zone list` command.

      $ openstack availability zone list
    +-----------+-------------+
    | Zone Name | Zone Status |
    +-----------+-------------+
    | zone1     | available   |
    | zone2     | available   |
    +-----------+-------------+
4. To view the list of valid compute hosts, use the `openstack host list` command.

      $ openstack host list
    +----------------+-------------+----------+
    | Host Name      | Service     | Zone     |
    +----------------+-------------+----------+
    | compute01      | compute     | nova     |
    | compute02      | compute     | nova     |
    +----------------+-------------+----------+
5. To view the list of valid compute nodes, use the `openstack hypervisor list` command.

      $ openstack hypervisor list
    +----+---------------------+
    | ID | Hypervisor Hostname |
    +----+---------------------+
    |  1 | server2             |
    |  2 | server3             |
    |  3 | server4             |
    +----+---------------------+

### 14.12.2 Consider NUMA topology when booting instances [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.12.2%20%20Consider%20NUMA%20topology%20when%20booting%20instances&comment=14.12.2%20%20Consider%20NUMA%20topology%20when%20booting%20instances%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.14.4) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.14.4)

NUMA topology can exist on both the physical hardware of the host, and the virtual hardware of the instance. OpenStack Compute uses libvirt to tune instances to take advantage of NUMA topologies. The libvirt driver boot process looks at the NUMA topology field of both the instance and the host it is being booted on, and uses that information to generate an appropriate configuration.

If the host is NUMA capable, but the instance has not requested a NUMA topology, Compute attempts to pack the instance into a single cell. If this fails, though, Compute will not continue to try.

If the host is NUMA capable, and the instance has requested a specific NUMA topology, Compute will try to pin the vCPUs of different NUMA cells on the instance to the corresponding NUMA cells on the host. It will also expose the NUMA topology of the instance to the guest OS.

If you want Compute to pin a particular vCPU as part of this process, set the `vcpu_pin_set` parameter in the `nova.conf` configuration file. For more information about the `vcpu_pin_set` parameter, see the Configuration Reference Guide.

### 14.12.3 Evacuate instances [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.12.3%20%20Evacuate%20instances&comment=14.12.3%20%20Evacuate%20instances%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.14.5) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.14.5)

If a hardware malfunction or other error causes a cloud compute node to fail, you can evacuate instances to make them available again. You can optionally include the target host on the `nova evacuate` command. If you omit the host, the scheduler chooses the target host.

To preserve user data on the server disk, configure shared storage on the target host. When you evacuate the instance, Compute detects whether shared storage is available on the target host. Also, you must validate that the current VM host is not operational. Otherwise, the evacuation fails.

1. To find a host for the evacuated instance, list all hosts:

      $ openstack host list
2. Evacuate the instance. You can use the `--password PWD` option to pass the instance password to the command. If you do not specify a password, the command generates and prints one after it finishes successfully. The following command evacuates a server from a failed host to HOST\_B.

      $ nova evacuate EVACUATED_SERVER_NAME HOST_B

  The command rebuilds the instance from the original image or volume and returns a password. The command preserves the original configuration, which includes the instance ID, name, uid, IP address, and so on.

      +-----------+--------------+
    | Property  |    Value     |
    +-----------+--------------+
    | adminPass | kRAJpErnT4xZ |
    +-----------+--------------+
3. To preserve the user disk data on the evacuated server, deploy Compute with a shared file system. To configure your system, see [Section 5.4.9, “Configure migrations”](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/bk02ch05.html#section-configuring-compute-migrations). The following example does not change the password.

      $ nova evacuate EVACUATED_SERVER_NAME HOST_B --on-shared-storage

### 14.12.4 Migrate a single instance to another compute host [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.12.4%20%20Migrate%20a%20single%20instance%20to%20another%20compute%20host&comment=14.12.4%20%20Migrate%20a%20single%20instance%20to%20another%20compute%20host%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.14.6) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.14.6)

When you want to move an instance from one compute host to another, you can use the `openstack server migrate` command. The scheduler chooses the destination compute host based on its settings. This process does not assume that the instance has shared storage available on the target host. If you are using SSH tunneling, you must ensure that each node is configured with SSH key authentication so that the Compute service can use SSH to move disks to other nodes. For more information, see [Section 14.12.5, “Configure SSH between compute nodes”](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#clinovamigratecfgssh).

1. To list the VMs you want to migrate, run:

      $ openstack server list
2. Use the `openstack server migrate` command.

      $ openstack server migrate --live TARGET_HOST VM_INSTANCE
3. To migrate an instance and watch the status, use this example script:

      #!/bin/bash

    # Provide usage
    usage() {
    echo "Usage: $0 VM_ID"
    exit 1
    }

    [[ $# -eq 0 ]] && usage

    # Migrate the VM to an alternate hypervisor
    echo -n "Migrating instance to alternate host"
    VM_ID=$1
    nova migrate $VM_ID
    VM_OUTPUT=`nova show $VM_ID`
    VM_STATUS=`echo "$VM_OUTPUT" | grep status | awk '{print $4}'`
    while [[ "$VM_STATUS" != "VERIFY_RESIZE" ]]; do
    echo -n "."
    sleep 2
    VM_OUTPUT=`nova show $VM_ID`
    VM_STATUS=`echo "$VM_OUTPUT" | grep status | awk '{print $4}'`
    done
    nova resize-confirm $VM_ID
    echo " instance migrated and resized."
    echo;

    # Show the details for the VM
    echo "Updated instance details:"
    nova show $VM_ID

    # Pause to allow users to examine VM details
    read -p "Pausing, press <enter> to exit."

![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

If you see this error, it means you are either trying the command with the wrong credentials, such as a non-admin user, or the `policy.json` file prevents migration for your user:

`ERROR (Forbidden): Policy doesn't allow compute_extension:admin_actions:migrate to be performed. (HTTP 403)`

![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

If you see an error similar to this message, SSH tunneling was not set up between the compute nodes:

`ProcessExecutionError: Unexpected error while running command.`

`Stderr: u Host key verification failed.\r\n`

The instance is booted from a new host, but preserves its configuration including its ID, name, any metadata, IP address, and other properties.

### 14.12.5 Configure SSH between compute nodes [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.12.5%20%20Configure%20SSH%20between%20compute%20nodes&comment=14.12.5%20%20Configure%20SSH%20between%20compute%20nodes%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523clinovamigratecfgssh) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#clinovamigratecfgssh)

If you are resizing or migrating an instance between hypervisors, you might encounter an SSH (Permission denied) error. Ensure that each node is configured with SSH key authentication so that the Compute service can use SSH to move disks to other nodes.

To share a key pair between compute nodes, complete the following steps:

1. On the first node, obtain a key pair (public key and private key). Use the root key that is in the `/root/.ssh/id_rsa` and `/root/.ssh/id_ras.pub` directories or generate a new key pair.
2. Run `setenforce 0` to put SELinux into permissive mode.
3. Enable login abilities for the nova user:

      # usermod -s /bin/bash nova

  Switch to the nova account.

      # su nova
4. As root, create the folder that is needed by SSH and place the private key that you obtained in step 1 into this folder:

      mkdir -p /var/lib/nova/.ssh
    cp <private key>  /var/lib/nova/.ssh/id_rsa
    echo 'StrictHostKeyChecking no' >> /var/lib/nova/.ssh/config
    chmod 600 /var/lib/nova/.ssh/id_rsa /var/lib/nova/.ssh/authorized_keys
5. Repeat steps 2-4 on each node.

  ![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

  The nodes must share the same key pair, so do not generate a new key pair for any subsequent nodes.
6. From the first node, where you created the SSH key, run:

      ssh-copy-id -i <pub key> nova@remote-host

  This command installs your public key in a remote machine's `authorized_keys` folder.
7. Ensure that the nova user can now log in to each node without using a password:

      # su nova
    $ ssh *computeNodeAddress*
    $ exit
8. As root on each node, restart both libvirt and the Compute services:

      # systemctl restart libvirtd.service
    # systemctl restart openstack-nova-compute.service

### 14.12.6 Manage IP addresses [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.12.6%20%20Manage%20IP%20addresses&comment=14.12.6%20%20Manage%20IP%20addresses%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.14.8) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.14.8)

Each instance has a private, fixed IP address that is assigned when the instance is launched. In addition, an instance can have a public or floating IP address. Private IP addresses are used for communication between instances, and public IP addresses are used for communication with networks outside the cloud, including the Internet.

* By default, both administrative and end users can associate floating IP addresses with projects and instances. You can change user permissions for managing IP addresses by updating the `/etc/nova/policy.json` file. For basic floating-IP procedures, refer to the [Allocate a floating address to an instance](http://docs.openstack.org/user-guide/configure-access-and-security-for-instances.html#allocate-a-floating-ip-address-to-an-instance) section in the OpenStack End User Guide.
* For details on creating public networks using OpenStack Networking (`neutron`), refer to [Section 9.9, “Advanced features through API extensions”](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/networking.html#networking-adv-features). No floating IP addresses are created by default in OpenStack Networking.

As an administrator using legacy networking (`nova-network`), you can use the following bulk commands to list, create, and delete ranges of floating IP addresses. These addresses can then be associated with instances by end users.

#### 14.12.6.1 List addresses for all projects [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.12.6.1%20%20List%20addresses%20for%20all%20projects&comment=14.12.6.1%20%20List%20addresses%20for%20all%20projects%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.14.8.5) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.14.8.5)

To list all floating IP addresses for all projects, run:

    $ openstack floating ip list
    +------------+---------------+---------------+--------+-----------+
    | project_id | address       | instance_uuid | pool   | interface |
    +------------+---------------+---------------+--------+-----------+
    | None       | 172.24.4.225  | None          | public | eth0      |
    | None       | 172.24.4.226  | None          | public | eth0      |
    | None       | 172.24.4.227  | None          | public | eth0      |
    | None       | 172.24.4.228  | None          | public | eth0      |
    | None       | 172.24.4.229  | None          | public | eth0      |
    | None       | 172.24.4.230  | None          | public | eth0      |
    | None       | 172.24.4.231  | None          | public | eth0      |
    | None       | 172.24.4.232  | None          | public | eth0      |
    | None       | 172.24.4.233  | None          | public | eth0      |
    | None       | 172.24.4.234  | None          | public | eth0      |
    | None       | 172.24.4.235  | None          | public | eth0      |
    | None       | 172.24.4.236  | None          | public | eth0      |
    | None       | 172.24.4.237  | None          | public | eth0      |
    | None       | 172.24.4.238  | None          | public | eth0      |
    | None       | 192.168.253.1 | None          | test   | eth0      |
    | None       | 192.168.253.2 | None          | test   | eth0      |
    | None       | 192.168.253.3 | None          | test   | eth0      |
    | None       | 192.168.253.4 | None          | test   | eth0      |
    | None       | 192.168.253.5 | None          | test   | eth0      |
    | None       | 192.168.253.6 | None          | test   | eth0      |
    +------------+---------------+---------------+--------+-----------+

#### 14.12.6.2 Bulk create floating IP addresses [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.12.6.2%20%20Bulk%20create%20floating%20IP%20addresses&comment=14.12.6.2%20%20Bulk%20create%20floating%20IP%20addresses%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.14.8.6) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.14.8.6)

To create a range of floating IP addresses, run:

    $ nova floating-ip-bulk-create [--pool POOL_NAME] [--interface INTERFACE] RANGE_TO_CREATE

For example:

    $ nova floating-ip-bulk-create --pool test 192.168.1.56/29

By default, `floating-ip-bulk-create` uses the `public` pool and `eth0` interface values.

![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

You should use a range of free IP addresses that is valid for your network. If you are not sure, at least try to avoid the DHCP address range:

* Pick a small range (/29 gives an 8 address range, 6 of which will be usable).
* Use `nmap` to check a range's availability. For example, 192.168.1.56/29 represents a small range of addresses (192.168.1.56-63, with 57-62 usable), and you could run the command `nmap -sn 192.168.1.56/29` to check whether the entire range is currently unused.

#### 14.12.6.3 Bulk delete floating IP addresses [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.12.6.3%20%20Bulk%20delete%20floating%20IP%20addresses&comment=14.12.6.3%20%20Bulk%20delete%20floating%20IP%20addresses%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.14.8.7) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.14.8.7)

To delete a range of floating IP addresses, run:

    $ openstack floating ip delete RANGE_TO_DELETE

For example:

    $ openstack floating ip delete 192.168.1.56/29

### 14.12.7 Launch and manage stacks using the CLI [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.12.7%20%20Launch%20and%20manage%20stacks%20using%20the%20CLI&comment=14.12.7%20%20Launch%20and%20manage%20stacks%20using%20the%20CLI%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.14.9) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.14.9)

The Orchestration service provides a template-based orchestration engine. Administrators can use the orchestration engine to create and manage OpenStack cloud infrastructure resources. For example, an administrator can define storage, networking, instances, and applications to use as a repeatable running environment.

Templates are used to create stacks, which are collections of resources. For example, a stack might include instances, floating IPs, volumes, security groups, or users. The Orchestration service offers access to all OpenStack core services through a single modular template, with additional orchestration capabilities such as auto-scaling and basic high availability.

For information about:

* basic creation and deletion of Orchestration stacks, refer to the [OpenStack End User Guide](http://docs.openstack.org/user-guide/dashboard-stacks.html)
* **openstack** CLI, see the [OpenStack Command-Line Interface Reference](http://docs.openstack.org/cli-reference/openstack.html)

![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

The `heat` CLI is deprecated in favor of `python-openstackclient`. For a Python library, continue using `python-heatclient`.

As an administrator, you can also carry out stack functions on behalf of your users. For example, to resume, suspend, or delete a stack, run:

    $ openstack stack resume STACK
    $ openstack stack suspend STACK
    $ openstack stack delete STACK

14.13 Manage quotas [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.13%20%20Manage%20quotas&comment=14.13%20%20Manage%20quotas%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523manage-quotas) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#manage-quotas)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

To prevent system capacities from being exhausted without notification, you can set up quotas. Quotas are operational limits. For example, the number of gigabytes allowed for each project can be controlled so that cloud resources are optimized. Quotas can be enforced at both the project and the project-user level.

Using the command-line interface, you can manage quotas for the OpenStack Compute service, the OpenStack Block Storage service, and the OpenStack Networking service.

The cloud operator typically changes default values because a project requires more than ten volumes or 1 TB on a compute node.

![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

To view all projects, run:

    $ openstack project list
    +----------------------------------+----------+
    | ID                               | Name     |
    +----------------------------------+----------+
    | e66d97ac1b704897853412fc8450f7b9 | admin    |
    | bf4a37b885fe46bd86e999e50adad1d3 | services |
    | 21bd1c7c95234fd28f589b60903606fa | tenant01 |
    | f599c5cd1cba4125ae3d7caed08e288c | tenant02 |
    +----------------------------------+----------+

To display all current users for a project, run:

    $ openstack user list --project PROJECT_NAME
    +----------------------------------+--------+
    | ID                               | Name   |
    +----------------------------------+--------+
    | ea30aa434ab24a139b0e85125ec8a217 | demo00 |
    | 4f8113c1d838467cad0c2f337b3dfded | demo01 |
    +----------------------------------+--------+

Use `openstack quota show PROJECT_NAME` to list all quotas for a project.

Use `openstack quota set PROJECT_NAME--parameters` to set quota values.

### 14.13.1 Manage Compute service quotas [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.13.1%20%20Manage%20Compute%20service%20quotas&comment=14.13.1%20%20Manage%20Compute%20service%20quotas%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.15.8) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.15.8)

As an administrative user, you can use the `nova quota-*` commands, which are provided by the `python-novaclient` package, to update the Compute service quotas for a specific project or project user, as well as update the quota defaults for a new project.

**Compute quota descriptions**

Quota name

Description

cores

Number of instance cores (VCPUs) allowed per project.

fixed-ips

Number of fixed IP addresses allowed per project. This number must be equal to or greater than the number of allowed instances.

floating-ips

Number of floating IP addresses allowed per project.

injected-file-content-bytes

Number of content bytes allowed per injected file.

injected-file-path-bytes

Length of injected file path.

injected-files

Number of injected files allowed per project.

instances

Number of instances allowed per project.

key-pairs

Number of key pairs allowed per user.

metadata-items

Number of metadata items allowed per instance.

ram

Megabytes of instance ram allowed per project.

security-groups

Number of security groups per project.

security-group-rules

Number of rules per security group.

server-groups

Number of server groups per project.

server-group-members

Number of servers per server group.

#### 14.13.1.1 View and update Compute quotas for a project [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.13.1.1%20%20View%20and%20update%20Compute%20quotas%20for%20a%20project&comment=14.13.1.1%20%20View%20and%20update%20Compute%20quotas%20for%20a%20project%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.15.8.5) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.15.8.5)

##### 14.13.1.1.1 To view and update default quota values [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.13.1.1.1%20%20To%20view%20and%20update%20default%20quota%20values&comment=14.13.1.1.1%20%20To%20view%20and%20update%20default%20quota%20values%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.15.8.5.2) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.15.8.5.2)

1. List all default quotas for all projects:

      $ openstack quota show --default

    +-----------------------------+-------+
    | Quota                       | Limit |
    +-----------------------------+-------+
    | instances                   | 10    |
    | cores                       | 20    |
    | ram                         | 51200 |
    | floating_ips                | 10    |
    | fixed_ips                   | -1    |
    | metadata_items              | 128   |
    | injected_files              | 5     |
    | injected_file_content_bytes | 10240 |
    | injected_file_path_bytes    | 255   |
    | key_pairs                   | 100   |
    | security_groups             | 10    |
    | security_group_rules        | 20    |
    | server_groups               | 10    |
    | server_group_members        | 10    |
    +-----------------------------+-------+
2. Update a default value for a new project, for example:

      $ nova quota-class-update --instances 15 default

##### 14.13.1.1.2 To view quota values for an existing project [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.13.1.1.2%20%20To%20view%20quota%20values%20for%20an%20existing%20project&comment=14.13.1.1.2%20%20To%20view%20quota%20values%20for%20an%20existing%20project%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.15.8.5.3) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.15.8.5.3)

* List the currently set quota values for a project:

      $ openstack quota show TENANT_NAME

    +-----------------------------+-------+
    | Quota                       | Limit |
    +-----------------------------+-------+
    | instances                   | 10    |
    | cores                       | 20    |
    | ram                         | 51200 |
    | floating_ips                | 10    |
    | fixed_ips                   | -1    |
    | metadata_items              | 128   |
    | injected_files              | 5     |
    | injected_file_content_bytes | 10240 |
    | injected_file_path_bytes    | 255   |
    | key_pairs                   | 100   |
    | security_groups             | 10    |
    | security_group_rules        | 20    |
    | server_groups               | 10    |
    | server_group_members        | 10    |
    +-----------------------------+-------+

##### 14.13.1.1.3 To update quota values for an existing project [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.13.1.1.3%20%20To%20update%20quota%20values%20for%20an%20existing%20project&comment=14.13.1.1.3%20%20To%20update%20quota%20values%20for%20an%20existing%20project%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.15.8.5.4) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.15.8.5.4)

1. Obtain the project ID.

      $ tenant=$(openstack project show -f value -c id TENANT_NAME)
2. Update a particular quota value.

      $ nova quota-update --QUOTA_NAME QUOTA_VALUE TENANT_ID

  For example:

      $ nova quota-update --floating-ips 20 TENANT_NAME
    $ openstack quota show TENANT_NAME
    +-----------------------------+-------+
    | Quota                       | Limit |
    +-----------------------------+-------+
    | instances                   | 10    |
    | cores                       | 20    |
    | ram                         | 51200 |
    | floating_ips                | 20    |
    | fixed_ips                   | -1    |
    | metadata_items              | 128   |
    | injected_files              | 5     |
    | injected_file_content_bytes | 10240 |
    | injected_file_path_bytes    | 255   |
    | key_pairs                   | 100   |
    | security_groups             | 10    |
    | security_group_rules        | 20    |
    | server_groups               | 10    |
    | server_group_members        | 10    |
    +-----------------------------+-------+

  ![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

  To view a list of options for the `nova quota-update` command, run:

      $ nova help quota-update

#### 14.13.1.2 View and update Compute quotas for a project user [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.13.1.2%20%20View%20and%20update%20Compute%20quotas%20for%20a%20project%20user&comment=14.13.1.2%20%20View%20and%20update%20Compute%20quotas%20for%20a%20project%20user%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.15.8.6) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.15.8.6)

##### 14.13.1.2.1 To view quota values for a project user [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.13.1.2.1%20%20To%20view%20quota%20values%20for%20a%20project%20user&comment=14.13.1.2.1%20%20To%20view%20quota%20values%20for%20a%20project%20user%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.15.8.6.2) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.15.8.6.2)

1. Place the user ID in a usable variable.

      $ tenantUser=$(openstack user show -f value -c id USER_NAME)
2. Place the user's project ID in a usable variable, as follows:

      $ tenant=$(openstack project show -f value -c id TENANT_NAME)
3. List the currently set quota values for a project user.

      $ nova quota-show --user $tenantUser --tenant $tenant

  For example:

      $ nova quota-show --user $tenantUser --tenant $tenant
    +-----------------------------+-------+
    | Quota                       | Limit |
    +-----------------------------+-------+
    | instances                   | 10    |
    | cores                       | 20    |
    | ram                         | 51200 |
    | floating_ips                | 20    |
    | fixed_ips                   | -1    |
    | metadata_items              | 128   |
    | injected_files              | 5     |
    | injected_file_content_bytes | 10240 |
    | injected_file_path_bytes    | 255   |
    | key_pairs                   | 100   |
    | security_groups             | 10    |
    | security_group_rules        | 20    |
    | server_groups               | 10    |
    | server_group_members        | 10    |
    +-----------------------------+-------+

##### 14.13.1.2.2 To update quota values for a project user [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.13.1.2.2%20%20To%20update%20quota%20values%20for%20a%20project%20user&comment=14.13.1.2.2%20%20To%20update%20quota%20values%20for%20a%20project%20user%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.15.8.6.3) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.15.8.6.3)

1. Place the user ID in a usable variable.

      $ tenantUser=$(openstack user show -f value -c id USER_NAME)
2. Place the user's project ID in a usable variable, as follows:

      $ tenant=$(openstack project show -f value -c id TENANT_NAME)
3. Update a particular quota value, as follows:

      $ nova quota-update  --user $tenantUser --QUOTA_NAME QUOTA_VALUE $tenant

  For example:

      $ nova quota-update --user $tenantUser --floating-ips 12 $tenant
    $ nova quota-show --user $tenantUser --tenant $tenant
    +-----------------------------+-------+
    | Quota                       | Limit |
    +-----------------------------+-------+
    | instances                   | 10    |
    | cores                       | 20    |
    | ram                         | 51200 |
    | floating_ips                | 12    |
    | fixed_ips                   | -1    |
    | metadata_items              | 128   |
    | injected_files              | 5     |
    | injected_file_content_bytes | 10240 |
    | injected_file_path_bytes    | 255   |
    | key_pairs                   | 100   |
    | security_groups             | 10    |
    | security_group_rules        | 20    |
    | server_groups               | 10    |
    | server_group_members        | 10    |
    +-----------------------------+-------+

  ![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

  To view a list of options for the `nova quota-update` command, run:

      $ nova help quota-update

##### 14.13.1.2.3 To display the current quota usage for a project user [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.13.1.2.3%20%20To%20display%20the%20current%20quota%20usage%20for%20a%20project%20user&comment=14.13.1.2.3%20%20To%20display%20the%20current%20quota%20usage%20for%20a%20project%20user%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.15.8.6.4) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.15.8.6.4)

Use `nova absolute-limits` to get a list of the current quota values and the current quota usage:

    $ nova absolute-limits --tenant TENANT_NAME
    +--------------------+------+-------+
    | Name               | Used | Max   |
    +--------------------+------+-------+
    | Cores              | 0    | 20    |
    | FloatingIps        | 0    | 10    |
    | ImageMeta          | -    | 128   |
    | Instances          | 0    | 10    |
    | Keypairs           | -    | 100   |
    | Personality        | -    | 5     |
    | Personality Size   | -    | 10240 |
    | RAM                | 0    | 51200 |
    | SecurityGroupRules | -    | 20    |
    | SecurityGroups     | 0    | 10    |
    | Server Meta        | -    | 128   |
    | ServerGroupMembers | -    | 10    |
    | ServerGroups       | 0    | 10    |
    +--------------------+------+-------+

### 14.13.2 Manage Block Storage service quotas [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.13.2%20%20Manage%20Block%20Storage%20service%20quotas&comment=14.13.2%20%20Manage%20Block%20Storage%20service%20quotas%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.15.9) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.15.9)

As an administrative user, you can update the OpenStack Block Storage service quotas for a project. You can also update the quota defaults for a new project.

**Block Storage quotas**

Property name

Defines the number of

gigabytes

Volume gigabytes allowed for each project.

snapshots

Volume snapshots allowed for each project.

volumes

Volumes allowed for each project.

#### 14.13.2.1 View Block Storage quotas [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.13.2.1%20%20View%20Block%20Storage%20quotas&comment=14.13.2.1%20%20View%20Block%20Storage%20quotas%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.15.9.5) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.15.9.5)

Administrative users can view Block Storage service quotas.

1. Obtain the project ID.

  For example:

      $ project_id=$(openstack project show -f value -c id PROJECT_NAME)
2. List the default quotas for a project:

      $ cinder quota-defaults PROJECT_ID

  For example:

      $ cinder quota-defaults $project_id
    +-----------+-------+
    |  Property | Value |
    +-----------+-------+
    | gigabytes |  1000 |
    | snapshots |   10  |
    |  volumes  |   10  |
    +-----------+-------+
3. View Block Storage service quotas for a project:

      $ cinder quota-show PROJECT_ID

  For example:

      $ cinder quota-show $project_id
    +-----------+-------+
    |  Property | Value |
    +-----------+-------+
    | gigabytes |  1000 |
    | snapshots |   10  |
    |  volumes  |   10  |
    +-----------+-------+
4. Show the current usage of a per-project quota:

      $ cinder quota-usage PROJECT_ID

  For example:

      $ cinder quota-usage $project_id
    +-----------+--------+----------+-------+
    |    Type   | In_use | Reserved | Limit |
    +-----------+--------+----------+-------+
    | gigabytes |   0    |    0     |  1000 |
    | snapshots |   0    |    0     |   10  |
    |  volumes  |   0    |    0     |   15  |
    +-----------+--------+----------+-------+

#### 14.13.2.2 Edit and update Block Storage service quotas [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.13.2.2%20%20Edit%20and%20update%20Block%20Storage%20service%20quotas&comment=14.13.2.2%20%20Edit%20and%20update%20Block%20Storage%20service%20quotas%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.15.9.6) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.15.9.6)

Administrative users can edit and update Block Storage service quotas.

1. To update a default value for a new project, update the property in the cinder.quota section of the `/etc/cinder/cinder.conf` file. For more information, see the [Block Storage service](http://docs.openstack.org/newton/config-reference/block-storage.html) in OpenStack Configuration Reference.
2. To update Block Storage service quotas for an existing project

      $ cinder quota-update --QUOTA_NAME QUOTA_VALUE PROJECT_ID

  Replace `QUOTA_NAME` with the quota that is to be updated, `QUOTA_VALUE` with the required new value, and `PROJECT_ID` with the required project ID.

  For example:

      $ cinder quota-update --volumes 15 $project_id
    $ cinder quota-show $project_id
    +-----------+-------+
    |  Property | Value |
    +-----------+-------+
    | gigabytes |  1000 |
    | snapshots |   10  |
    |  volumes  |   15  |
    +-----------+-------+
3. To clear per-project quota limits:

      $ cinder quota-delete PROJECT_ID

### 14.13.3 Manage Networking service quotas [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.13.3%20%20Manage%20Networking%20service%20quotas&comment=14.13.3%20%20Manage%20Networking%20service%20quotas%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.15.10) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.15.10)

A quota limits the number of available resources. A default quota might be enforced for all projects. When you try to create more resources than the quota allows, an error occurs:

    $ openstack network create test_net
     Quota exceeded for resources: ['network']

Per-project quota configuration is also supported by the quota extension API. See [Section 14.13.3.2, “Configure per-project quotas”](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#cfg-quotas-per-tenant) for details.

#### 14.13.3.1 Basic quota configuration [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.13.3.1%20%20Basic%20quota%20configuration&comment=14.13.3.1%20%20Basic%20quota%20configuration%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.15.10.5) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.15.10.5)

In the Networking default quota mechanism, all projects have the same quota values, such as the number of resources that a project can create.

The quota value is defined in the OpenStack Networking `/etc/neutron/neutron.conf` configuration file. This example shows the default quota values:

    [quotas]
    # number of networks allowed per tenant, and minus means unlimited
    quota_network = 10

    # number of subnets allowed per tenant, and minus means unlimited
    quota_subnet = 10

    # number of ports allowed per tenant, and minus means unlimited
    quota_port = 50

    # default driver to use for quota checks
    quota_driver = neutron.quota.ConfDriver

OpenStack Networking also supports quotas for L3 resources: router and floating IP. Add these lines to the `quotas` section in the `/etc/neutron/neutron.conf` file:

    [quotas]
    # number of routers allowed per tenant, and minus means unlimited
    quota_router = 10

    # number of floating IPs allowed per tenant, and minus means unlimited
    quota_floatingip = 50

OpenStack Networking also supports quotas for security group resources: number of security groups and the number of rules for each security group. Add these lines to the `quotas` section in the `/etc/neutron/neutron.conf` file:

    [quotas]
    # number of security groups per tenant, and minus means unlimited
    quota_security_group = 10

    # number of security rules allowed per tenant, and minus means unlimited
    quota_security_group_rule = 100

#### 14.13.3.2 Configure per-project quotas [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.13.3.2%20%20Configure%20per-project%20quotas&comment=14.13.3.2%20%20Configure%20per-project%20quotas%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523cfg-quotas-per-tenant) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#cfg-quotas-per-tenant)

OpenStack Networking also supports per-project quota limit by quota extension API.

Use these commands to manage per-project quotas:

neutron quota-delete

Delete defined quotas for a specified project

neutron quota-list

Lists defined quotas for all projects

neutron quota-show

Shows quotas for a specified project

neutron quota-default-show

Show default quotas for a specified tenant

neutron quota-update

Updates quotas for a specified project

Only users with the `admin` role can change a quota value. By default, the default set of quotas are enforced for all projects, so no `quota-create` command exists.

1. Configure Networking to show per-project quotas

  Set the `quota_driver` option in the `/etc/neutron/neutron.conf` file.

      quota_driver = neutron.db.quota_db.DbQuotaDriver

  When you set this option, the output for Networking commands shows `quotas`.
2. List Networking extensions.

  To list the Networking extensions, run this command:

      $ openstack extension list --network

  The command shows the `quotas` extension, which provides per-project quota management support.

  ![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

  Many of the extensions shown below are supported in the Mitaka release and later.

      +------------------------+------------------------+--------------------------+
    | Name                   | Alias                  | Description              |
    +------------------------+------------------------+--------------------------+
    | ...                    | ...                    | ...                      |
    | Quota management       | quotas                 | Expose functions for     |
    | support                |                        | quotas management per    |
    |                        |                        | tenant                   |
    | ...                    | ...                    | ...                      |
    +------------------------+------------------------+--------------------------+
3. Show information for the quotas extension.

  To show information for the `quotas` extension, run this command:

      $ neutron ext-show quotas
    +-------------+------------------------------------------------------------+
    | Field       | Value                                                      |
    +-------------+------------------------------------------------------------+
    | alias       | quotas                                                     |
    | description | Expose functions for quotas management per tenant          |
    | links       |                                                            |
    | name        | Quota management support                                   |
    | namespace   | http://docs.openstack.org/network/ext/quotas-sets/api/v2.0 |
    | updated     | 2012-07-29T10:00:00-00:00                                  |
    +-------------+------------------------------------------------------------+

  ![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

  Only some plug-ins support per-project quotas. Specifically, Open vSwitch, Linux Bridge, and VMware NSX support them, but new versions of other plug-ins might bring additional functionality. See the documentation for each plug-in.
4. List projects who have per-project quota support.

  The `neutron quota-list` command lists projects for which the per-project quota is enabled. The command does not list projects with default quota support. You must be an administrative user to run this command:

      $ neutron quota-list
    +------------+---------+------+--------+--------+----------------------------------+
    | floatingip | network | port | router | subnet | tenant_id                        |
    +------------+---------+------+--------+--------+----------------------------------+
    |         20 |       5 |   20 |     10 |      5 | 6f88036c45344d9999a1f971e4882723 |
    |         25 |      10 |   30 |     10 |     10 | bff5c9455ee24231b5bc713c1b96d422 |
    +------------+---------+------+--------+--------+----------------------------------+
5. Show per-project quota values.

  The `neutron quota-show` command reports the current set of quota limits for the specified project. Non-administrative users can run this command without the `--tenant_id` parameter. If per-project quota limits are not enabled for the project, the command shows the default set of quotas.

  ![Note](resources/14A86C695F3700CE0AE33CAEC4B5E2E8.png)

###### Note

  Additional quotas added in the Mitaka release include `security_group`, `security_group_rule`, `subnet`, and `subnetpool`.

      $ neutron quota-show --tenant_id 6f88036c45344d9999a1f971e4882723
    +---------------------+-------+
    | Field               | Value |
    +---------------------+-------+
    | floatingip          | 50    |
    | network             | 10    |
    | port                | 50    |
    | rbac_policy         | 10    |
    | router              | 10    |
    | security_group      | 10    |
    | security_group_rule | 100   |
    | subnet              | 10    |
    | subnetpool          | -1    |
    +---------------------+-------+

  The following command shows the command output for a non-administrative user.

      $ neutron quota-show
    +---------------------+-------+
    | Field               | Value |
    +---------------------+-------+
    | floatingip          | 50    |
    | network             | 10    |
    | port                | 50    |
    | rbac_policy         | 10    |
    | router              | 10    |
    | security_group      | 10    |
    | security_group_rule | 100   |
    | subnet              | 10    |
    | subnetpool          | -1    |
    +---------------------+-------+
6. Update quota values for a specified project.

  Use the `neutron quota-update` command to update a quota for a specified project.

      $ neutron quota-update --tenant_id 6f88036c45344d9999a1f971e4882723 --network 5
    +---------------------+-------+
    | Field               | Value |
    +---------------------+-------+
    | floatingip          | 50    |
    | network             | 5     |
    | port                | 50    |
    | rbac_policy         | 10    |
    | router              | 10    |
    | security_group      | 10    |
    | security_group_rule | 100   |
    | subnet              | 10    |
    | subnetpool          | -1    |
    +---------------------+-------+

  You can update quotas for multiple resources through one command.

      $ neutron quota-update --tenant_id 6f88036c45344d9999a1f971e4882723 --subnet 5 --port 20
    +---------------------+-------+
    | Field               | Value |
    +---------------------+-------+
    | floatingip          | 50    |
    | network             | 5     |
    | port                | 20    |
    | rbac_policy         | 10    |
    | router              | 10    |
    | security_group      | 10    |
    | security_group_rule | 100   |
    | subnet              | 5     |
    | subnetpool          | -1    |
    +---------------------+-------+

  To update the limits for an L3 resource such as, router or floating IP, you must define new values for the quotas after the `--` directive.

  This example updates the limit of the number of floating IPs for the specified project.

      $ neutron quota-update --tenant_id 6f88036c45344d9999a1f971e4882723 --floatingip 20
    +---------------------+-------+
    | Field               | Value |
    +---------------------+-------+
    | floatingip          | 20    |
    | network             | 5     |
    | port                | 20    |
    | rbac_policy         | 10    |
    | router              | 10    |
    | security_group      | 10    |
    | security_group_rule | 100   |
    | subnet              | 5     |
    | subnetpool          | -1    |
    +---------------------+-------+

  You can update the limits of multiple resources by including L2 resources and L3 resource through one command:

      $ neutron quota-update --tenant_id 6f88036c45344d9999a1f971e4882723 \
      --network 3 --subnet 3 --port 3 --floatingip 3 --router 3
    +---------------------+-------+
    | Field               | Value |
    +---------------------+-------+
    | floatingip          | 3     |
    | network             | 3     |
    | port                | 3     |
    | rbac_policy         | 10    |
    | router              | 3     |
    | security_group      | 10    |
    | security_group_rule | 100   |
    | subnet              | 3     |
    | subnetpool          | -1    |
    +---------------------+-------+
7. Delete per-project quota values.

  To clear per-project quota limits, use the `neutron quota-delete` command.

      $ neutron quota-delete --tenant_id 6f88036c45344d9999a1f971e4882723
     Deleted quota: 6f88036c45344d9999a1f971e4882723

  After you run this command, you can see that quota values for the project are reset to the default values.

      $ neutron quota-show --tenant_id 6f88036c45344d9999a1f971e4882723
    +---------------------+-------+
    | Field               | Value |
    +---------------------+-------+
    | floatingip          | 50    |
    | network             | 10    |
    | port                | 50    |
    | rbac_policy         | 10    |
    | router              | 10    |
    | security_group      | 10    |
    | security_group_rule | 100   |
    | subnet              | 10     |
    | subnetpool          | -1    |
    +---------------------+-------+

14.14 Analyze log files [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.14%20%20Analyze%20log%20files&comment=14.14%20%20Analyze%20log%20files%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.16) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.16)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Use the swift command-line client for Object Storage to analyze log files.

The swift client is simple to use, scalable, and flexible.

Use the swift client `-o` or `-output` option to get short answers to questions about logs.

You can use the `-o` or `--output` option with a single object download to redirect the command output to a specific file or to STDOUT (`-`). The ability to redirect the output to STDOUT enables you to pipe (`|`) data without saving it to disk first.

### 14.14.1 Upload and analyze log files [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.14.1%20%20Upload%20and%20analyze%20log%20files&comment=14.14.1%20%20Upload%20and%20analyze%20log%20files%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.16.6) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.16.6)

1. This example assumes that `logtest` directory contains the following log files.

      2010-11-16-21_access.log
    2010-11-16-22_access.log
    2010-11-15-21_access.log
    2010-11-15-22_access.log

  Each file uses the following line format.

      Nov 15 21:53:52 lucid64 proxy-server - 127.0.0.1 15/Nov/2010/22/53/52 DELETE /v1/AUTH_cd4f57824deb4248a533f2c28bf156d3/2eefc05599d44df38a7f18b0b42ffedd HTTP/1.0 204 - \
     - test%3Atester%2CAUTH_tkcdab3c6296e249d7b7e2454ee57266ff - - - txaba5984c-aac7-460e-b04b-afc43f0c6571 - 0.0432
2. Change into the `logtest` directory:

      $ cd logtest
3. Upload the log files into the `logtest` container:

      $ swift -A http://swift-auth.com:11000/v1.0 -U test:tester -K testing upload logtest *.log

      2010-11-16-21_access.log
    2010-11-16-22_access.log
    2010-11-15-21_access.log
    2010-11-15-22_access.log
4. Get statistics for the account:

      $ swift -A http://swift-auth.com:11000/v1.0 -U test:tester -K testing \
    -q stat

      Account: AUTH_cd4f57824deb4248a533f2c28bf156d3
    Containers: 1
    Objects: 4
    Bytes: 5888268
5. Get statistics for the `logtest` container:

      $ swift -A http://swift-auth.com:11000/v1.0 -U test:tester -K testing \
    stat logtest

      Account: AUTH_cd4f57824deb4248a533f2c28bf156d3
    Container: logtest
    Objects: 4
    Bytes: 5864468
    Read ACL:
    Write ACL:
6. List all objects in the logtest container:

      $ swift -A http:///swift-auth.com:11000/v1.0 -U test:tester -K testing \
    list logtest

      2010-11-15-21_access.log
    2010-11-15-22_access.log
    2010-11-16-21_access.log
    2010-11-16-22_access.log

### 14.14.2 Download and analyze an object [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.14.2%20%20Download%20and%20analyze%20an%20object&comment=14.14.2%20%20Download%20and%20analyze%20an%20object%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.16.7) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.16.7)

This example uses the `-o` option and a hyphen (`-`) to get information about an object.

Use the `swift download` command to download the object. On this command, stream the output to `awk` to break down requests by return code and the date `2200 on November 16th, 2010`.

Using the log line format, find the request type in column 9 and the return code in column 12.

After `awk` processes the output, it pipes it to `sort` and `uniq -c` to sum up the number of occurrences for each request type and return code combination.

1. Download an object:

      $ swift -A http://swift-auth.com:11000/v1.0 -U test:tester -K testing \
         download -o - logtest 2010-11-16-22_access.log | awk '{ print \
         $9""$12}' | sort | uniq -c

      805 DELETE-204
    12 DELETE-404
    2 DELETE-409
    723 GET-200
    142 GET-204
    74 GET-206
    80 GET-304
    34 GET-401
    5 GET-403
    18 GET-404
    166 GET-412
    2 GET-416
    50 HEAD-200
    17 HEAD-204
    20 HEAD-401
    8 HEAD-404
    30 POST-202
    25 POST-204
    22 POST-400
    6 POST-404
    842 PUT-201
    2 PUT-202
    32 PUT-400
    4 PUT-403
    4 PUT-404
    2 PUT-411
    6 PUT-412
    6 PUT-413
    2 PUT-422
    8 PUT-499
2. Discover how many PUT requests are in each log file.

  Use a bash for loop with awk and swift with the `-o` or `--output` option and a hyphen (`-`) to discover how many PUT requests are in each log file.

  Run the `swift list` command to list objects in the logtest container. Then, for each item in the list, run the `swift download -o -` command. Pipe the output into grep to filter the PUT requests. Finally, pipe into `wc -l` to count the lines.

      $ for f in `swift -A http://swift-auth.com:11000/v1.0 -U test:tester \
     -K testing list logtest` ; \
            do  echo -ne "PUTS - " ; swift -A \
            http://swift-auth.com:11000/v1.0 -U test:tester \
            -K testing download -o -  logtest $f | grep PUT | wc -l ; \
        done

      2010-11-15-21_access.log - PUTS - 402
    2010-11-15-22_access.log - PUTS - 1091
    2010-11-16-21_access.log - PUTS - 892
    2010-11-16-22_access.log - PUTS - 910
3. List the object names that begin with a specified string.
4. Run the `swift list -p 2010-11-15` command to list objects in the logtest container that begin with the `2010-11-15` string.
5. For each item in the list, run the `swift download -o -` command.
6. Pipe the output to `grep` and `wc`. Use the `echo` command to display the object name.

      $ for f in `swift -A http://swift-auth.com:11000/v1.0 -U test:tester \
     -K testing list -p 2010-11-15 logtest` ; \
            do  echo -ne "$f - PUTS - " ; swift -A \
            http://127.0.0.1:11000/v1.0 -U test:tester \
            -K testing download -o - logtest $f | grep PUT | wc -l ; \
          done

      2010-11-15-21_access.log - PUTS - 402
    2010-11-15-22_access.log - PUTS - 910

14.15 Manage Block Storage scheduling [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.15%20%20Manage%20Block%20Storage%20scheduling&comment=14.15%20%20Manage%20Block%20Storage%20scheduling%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.17) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.17)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

As an administrative user, you have some control over which volume back end your volumes reside on. You can specify affinity or anti-affinity between two volumes. Affinity between volumes means that they are stored on the same back end, whereas anti-affinity means that they are stored on different back ends.

For information on how to set up multiple back ends for Cinder, refer to [Section 7.2.4, “Configure multiple-storage back ends”](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/bk02ch07.html#multi-backend).

### 14.15.1 Example Usages [Report Documentation Bug](https://bugzilla.suse.com/enter_bug.cgi?&product=SUSE%20OpenStack%20Cloud%208&component=Documentation&short_desc=%5Bdoc%5D%2014.15.1%20%20Example%20Usages&comment=14.15.1%20%20Example%20Usages%253A%0A%0Ahttps%253A%252F%252Fdocumentation.suse.com%252Fsoc%252F8%252Fhtml%252Fsuse-openstack-cloud-crowbar-all%252Fosadm-os-cli.html%2523id-1.4.16.17.4) [\#](https://documentation.suse.com/soc/8/html/suse-openstack-cloud-crowbar-all/osadm-os-cli.html#id-1.4.16.17.4)

1. Create a new volume on the same back end as Volume\_A:

      $ openstack volume create --hint same_host=Volume_A-UUID \
      --size SIZE VOLUME_NAME
2. Create a new volume on a different back end than Volume\_A:

      $ openstack volume create --hint different_host=Volume_A-UUID \
      --size SIZE VOLUME_NAME
3. Create a new volume on the same back end as Volume\_A and Volume\_B:

      $ openstack volume create --hint same_host=Volume_A-UUID \
      --hint same_host=Volume_B-UUID --size SIZE VOLUME_NAME

  Or:

      $ openstack volume create --hint same_host="[Volume_A-UUID, \
      Volume_B-UUID]" --size SIZE VOLUME_NAME
4. Create a new volume on a different back end than both Volume\_A and Volume\_B:

      $ openstack volume create --hint different_host=Volume_A-UUID \
      --hint different_host=Volume_B-UUID --size SIZE VOLUME_NAME

  Or:

      $ openstack volume create --hint different_host="[Volume_A-UUID, \
      Volume_B-UUID]" --size SIZE VOLUME_NAME