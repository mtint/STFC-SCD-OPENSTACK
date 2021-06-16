### The Quickest Way of Automating Windows Guest Initialization

[Download the Installer](https://cloudbase.it/cloudbase-init/#download)

Features
--------

* Supports HTTP and ConfigDriveV2 metadata sources
* Provides out the box: user creation, password injection, static networking configuration, hostname, SSH public keys and userdata scripts (Powershell, Cmd or Bash)
* It’s highly modular and can be easily extended to provide support for a lot of features and metadata sources.
* Works on any hypervisor (Hyper-V, KVM, Xen, etc)
* It’s platform independent, meaning that we plan to add other OSs, e.g.: FreeBSD
* Written in Python
* [Open source](https://github.com/stackforge/cloudbase-init), Apache 2 licensed

> ### Supported Services
> 
> OpenStackAmazon EC2OpenNebulaUbuntu MAAS

> ### Supported Windows Versions
> 
> Windows Server 2008Windows Server 2008 R2Windows Server 2012 R2Windows Server 2016Windows Server 2019Windows 7, 8, 8.1, 10

Overview
--------

**Cloud-Init** is the OpenStack automated initialization of a new instance which is a task that needs to be split between the cloud infrastructure and the guest OS. OpenStack™ provides the required metadata via HTTP or via ConfigDrive and Cloud-Init takes care of configuring the instance on Linux.

However, what would happen if you needed to do the same thing, but on Windows® guests?

**Cloudbase-Init™** is the Windows equivalent of the Cloud-Init project used on most OpenStack Linux images. When deployed as a service on Windows, Cloudbase-Init takes care of all the guest initialization actions: disk volume expansion, user creation, password generation, custom PowerShell, CMD and Bash scripts execution, Heat templates, PowerShell remoting setup and much more.

Even though there were limited options for guest initialization until recently, now you can rest assured. Cloudbase-Init is the Windows equivalent of Cloud-Init: an open source project that brings together all the features handled on Linux, to Windows!

### Enterprise support

Contact us and explore different commercial support options for your on premise, hybrid cloud or datacenter.

[Contact us](http://cloudbase.it/about/#contact)

Download
--------

**Stable**

[Cloudbase-Init x64](https://cloudbase.it/downloads/CloudbaseInitSetup_Stable_x64.msi)[Cloudbase-Init x86](https://cloudbase.it/downloads/CloudbaseInitSetup_Stable_x86.msi)

**Continuous Builds (Beta)**

[Cloudbase-Init x64](https://cloudbase.it/downloads/CloudbaseInitSetup_x64.msi)[Cloudbase-Init x86](https://cloudbase.it/downloads/CloudbaseInitSetup_x86.msi)

Installation
------------

The installer takes care of everything, including installing a dedicated Python environment, generating a configuration file and creating a Windows service that runs at boot time. Configuration settings like the username, group membership and the network adapter to be configured can be specified during setup or later by editing the configuration file (cloudbase-init.conf).

[![cbsl-init-099-01](https://cloudbase.it/wp-content/uploads/2015/07/cbsl-init-099-01-387x387.png)](https://cloudbase.it/cloudbase-init/cbsl-init-099-01/)[![cbsl-init-099-02](https://cloudbase.it/wp-content/uploads/2015/07/cbsl-init-099-02-300x300.png)](https://cloudbase.it/cloudbase-init/cbsl-init-099-02/)[![cbsl-init-099-03](https://cloudbase.it/wp-content/uploads/2015/07/cbsl-init-099-03-300x300.png)](https://cloudbase.it/cloudbase-init/cbsl-init-099-03/)[![cbsl-init-099-04](https://cloudbase.it/wp-content/uploads/2015/07/cbsl-init-099-04-300x300.png)](https://cloudbase.it/cloudbase-init/cbsl-init-099-04/)[![cbsl-init-099-05](https://cloudbase.it/wp-content/uploads/2015/07/cbsl-init-099-05-300x300.png)](https://cloudbase.it/cloudbase-init/cbsl-init-099-05/)[![cbsl-init-099-06](https://cloudbase.it/wp-content/uploads/2015/07/cbsl-init-099-06-300x300.png)](https://cloudbase.it/cloudbase-init/cbsl-init-099-06/)[![cbsl-init-099-07](https://cloudbase.it/wp-content/uploads/2015/07/cbsl-init-099-07-300x300.png)](https://cloudbase.it/cloudbase-init/cbsl-init-099-07/)[![cbsl-init-099-08](https://cloudbase.it/wp-content/uploads/2015/07/cbsl-init-099-08-300x300.png)](https://cloudbase.it/cloudbase-init/cbsl-init-099-08/)

Unattended setup
----------------

The setup can be done in silent mode as well, which means that it can be easily integrated in a Puppet, Chef or Windows GPO deployment strategy.

Here’s the basic syntax, with an additional optional log file to verify that everything worked fine:

1

msiexec /i CloudbaseInitSetup.msi /qn /l\*v log.txt

You can also pass parameters, for example to specify the serial port to be used for logging:

1

msiexec /i CloudbaseInitSetup.msi /qn /l\*v log.txt LOGGINGSERIALPORTNAME="COM1"

Links
-----

Source: <https://github.com/stackforge/cloudbase-init>

Documentation: <http://cloudbase-init.readthedocs.org/en/latest/>

Got a question? Visit <http://ask.cloudbase.it/questions/>