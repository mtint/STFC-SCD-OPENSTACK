## Install the OpenStack command-line clients

[](https://docs.openstack.org/mitaka/user-guide/common/cli_overview.html) [](https://docs.openstack.org/mitaka/user-guide/common/cli_discover_version_number_for_a_client.html) [](https://bugs.launchpad.net/openstack-manuals/+filebug?field.title=Install%20the%20OpenStack%20command-line%20clients%20in%20End%20User%20Guide&field.comment=%0A%0A%0AThis%20bug%20tracker%20is%20for%20errors%20with%20the%20documentation,%20use%20the%20following%20as%20a%20template%20and%20remove%20or%20add%20fields%20as%20you%20see%20fit.%20Convert%20%5B%20%5D%20into%20%5Bx%5D%20to%20check%20boxes:%0A%0A-%20%5B%20%5D%20This%20doc%20is%20inaccurate%20in%20this%20way:%20______%0A-%20%5B%20%5D%20This%20is%20a%20doc%20addition%20request.%0A-%20%5B%20%5D%20I%20have%20a%20fix%20to%20the%20document%20that%20I%20can%20paste%20below%20including%20example:%20input%20and%20output.%20%0A%0AIf%20you%20have%20a%20troubleshooting%20or%20support%20issue,%20use%20the%20following%20%20resources:%0A%0A%20-%20Ask%20OpenStack:%20http://ask.openstack.org%0A%20-%20The%20mailing%20list:%20http://lists.openstack.org%0A%20-%20IRC:%20'openstack'%20channel%20on%20Freenode%0A%0A-----------------------------------%0ARelease:%201.0.0%20on%202019-08-16%2016:57%0ASHA:%20a93ed3809b824edc455a8d848313d361fb93a4c7%0ASource:%20http://git.openstack.org/cgit/openstack/openstack-manuals/tree/doc/user-guide/source/common/cli_install_openstack_command_line_clients.rst%0AURL:%20https://docs.openstack.org/mitaka/user-guide/common/cli_install_openstack_command_line_clients.html&field.tags=user-guide "Found an error? Report a bug against this page")

UPDATED: 2019-08-16 16:57

##### [Contents](https://docs.openstack.org/mitaka/user-guide/index.html)

* * [Install the prerequisite software](https://docs.openstack.org/mitaka/user-guide/common/cli_install_openstack_command_line_clients.html#install-the-prerequisite-software)
  * [Install the OpenStack client](https://docs.openstack.org/mitaka/user-guide/common/cli_install_openstack_command_line_clients.html#install-the-openstack-client)
    * [Installing with pip](https://docs.openstack.org/mitaka/user-guide/common/cli_install_openstack_command_line_clients.html#installing-with-pip)
    * [Installing from packages](https://docs.openstack.org/mitaka/user-guide/common/cli_install_openstack_command_line_clients.html#installing-from-packages)
  * [Upgrade or remove clients](https://docs.openstack.org/mitaka/user-guide/common/cli_install_openstack_command_line_clients.html#upgrade-or-remove-clients)
  * [What’s next](https://docs.openstack.org/mitaka/user-guide/common/cli_install_openstack_command_line_clients.html#what-s-next)

Install the prerequisite software and the Python package for each OpenStack client.

## Install the prerequisite software[¶](https://docs.openstack.org/mitaka/user-guide/common/cli_install_openstack_command_line_clients.html#install-the-prerequisite-software "Permalink to this headline")

Most Linux distributions include packaged versions of the command-line clients that you can install directly, see [Installing\_from\_packages](https://docs.openstack.org/mitaka/user-guide/common/cli_install_openstack_command_line_clients.html#installing-from-packages).

If you need to install the source package for the command-line package, the following table lists the software needed to run the command-line clients, and provides installation instructions as needed.

PrerequisiteDescriptionPython 2.7 or laterCurrently, the clients do not support Python 3.setuptools package

Installed by default on Mac OS X.

Many Linux distributions provide packages to make setuptools easy to install. Search your package manager for setuptools to find an installation package. If you cannot find one, download the setuptools package directly from <https://pypi.python.org/pypi/setuptools>.

The recommended way to install setuptools on Microsoft Windows is to follow the documentation provided on the setuptools website (<https://pypi.python.org/pypi/setuptools>). Another option is to use the unofficial binary installer maintained by Christoph Gohlke ([http://www.lfd.uci.edu/~gohlke/pythonlibs/ \#setuptools](http://www.lfd.uci.edu/~gohlke/pythonlibs/#setuptools)).

pip package

To install the clients on a Linux, Mac OS X, or Microsoft Windows system, use pip. It is easy to use, ensures that you get the latest version of the clients from the [Python Package Index](https://pypi.python.org/), and lets you update or remove the packages later on.

Since the installation process compiles source files, this requires the related Python development package for your operating system and distribution.

Install pip through the package manager for your system:

**MacOS**

    \# easy_install pip

**Microsoft Windows**

Ensure that the C:\\Python27\\Scripts directory is defined in the PATH environment variable, and use the easy\_install command from the setuptools package:

    C:\\\>easy\_install pip

Another option is to use the unofficial binary installer provided by Christoph Gohlke ([http://www.lfd.uci.edu/~gohlke/pythonlibs/\#pip](http://www.lfd.uci.edu/~gohlke/pythonlibs/#pip)).

**Ubuntu or Debian**

    \# apt-get install python-dev python-pip

Note that extra dependencies may be required, per operating system, depending on the package being installed, such as is the case with Tempest.

**Red Hat Enterprise Linux, CentOS, or Fedora.**

A packaged version enables you to use yum to install the package:

    \# yum install python-devel python-pip

There are also packaged versions of the clients available in [RDO](https://www.rdoproject.org/) that enable yum to install the clients as described in [Installing\_from\_packages](https://docs.openstack.org/mitaka/user-guide/common/cli_install_openstack_command_line_clients.html#installing-from-packages).

**SUSE Linux Enterprise Server**

A packaged version available in the Open Build Service ([https://build.opensuse.org/package/show? package=python-pip&project=Cloud:OpenStack:Master](https://build.opensuse.org/package/show?package=python-pip&project=Cloud:OpenStack:Master)) enables you to use YaST or zypper to install the package.

First, add the Open Build Service repository:

    \# zypper addrepo -f obs://Cloud:OpenStack: \\
    Liberty/SLE_12 Liberty

Then install pip and use it to manage client installation:

    \# zypper install python-devel python-pip

There are also packaged versions of the clients available that enable zypper to install the clients as described in [Installing\_from\_packages](https://docs.openstack.org/mitaka/user-guide/common/cli_install_openstack_command_line_clients.html#installing-from-packages).

**openSUSE**

You can install pip and use it to manage client installation:

    \# zypper install python-devel python-pip

There are also packaged versions of the clients available that enable zypper to install the clients as described in [Installing\_from\_packages](https://docs.openstack.org/mitaka/user-guide/common/cli_install_openstack_command_line_clients.html#installing-from-packages).

## Install the OpenStack client[¶](https://docs.openstack.org/mitaka/user-guide/common/cli_install_openstack_command_line_clients.html#install-the-openstack-client "Permalink to this headline")

The following example shows the command for installing the OpenStack client with pip, which supports multiple services.

    \# pip install python-openstackclient

The following individual clients are deprecated in favor of a common client. Instead of installing and learning all these clients, we recommend installing and using the OpenStack client. You may need to install an individual project’s client because coverage is not yet sufficient in the OpenStack client. If you need to install an individual client’s project, replace the \<project\> name in this pipinstall command using the list below.

    \# pip install python-<project>client

* barbican - Key Manager Service API
* ceilometer - Telemetry API
* cinder - Block Storage API and extensions
* cloudkitty - Rating service API
* designate - DNS service API
* fuel - Deployment service API
* glance - Image service API
* gnocchi - Telemetry API v3
* heat - Orchestration API
* keystone - Identity service API and extensions
* magnum - Containers service API
* manila - Shared file systems API
* mistral - Workflow service API
* monasca - Monitoring API
* murano - Application catalog API
* neutron - Networking API
* nova - Compute API and extensions
* sahara - Data Processing API
* senlin - Clustering service API
* swift - Object Storage API
* trove - Database service API

While you can install the keystone client for interacting with version 2.0 of the service’s API, you should use the openstack client for all Identity interactions. Identity API v2 is deprecated in the Mitaka release.

### Installing with pip[¶](https://docs.openstack.org/mitaka/user-guide/common/cli_install_openstack_command_line_clients.html#installing-with-pip "Permalink to this headline")

Use pip to install the OpenStack clients on a Linux, Mac OS X, or Microsoft Windows system. It is easy to use and ensures that you get the latest version of the client from the [Python Package Index](https://pypi.python.org/pypi). Also, pip enables you to update or remove a package.

Install each client separately by using the following command:

* For Mac OS X or Linux:

      \# pip install python-PROJECTclient
* For Microsoft Windows:

      C:\\\>pip install python-PROJECTclient

### Installing from packages[¶](https://docs.openstack.org/mitaka/user-guide/common/cli_install_openstack_command_line_clients.html#installing-from-packages "Permalink to this headline")

RDO, openSUSE, SUSE Linux Enterprise, Debian, and Ubuntu have client packages that can be installed without pip.

* On Red Hat Enterprise Linux, CentOS, or Fedora, use yum to install the clients from the packaged versions available in [RDO](https://www.rdoproject.org/):

      \# yum install python-PROJECTclient
* For Ubuntu or Debian, use apt-get to install the clients from the packaged versions:

      \# apt-get install python-PROJECTclient
* For openSUSE, use zypper to install the clients from the distribution packages service:

      \# zypper install python-PROJECTclient
* For SUSE Linux Enterprise Server, use zypper to install the clients from the distribution packages in the Open Build Service. First, add the Open Build Service repository:

      \# zypper addrepo -f obs://Cloud:OpenStack:Liberty/SLE_12 Liberty

  Then you can install the packages:

      \# zypper install python-PROJECTclient

## Upgrade or remove clients[¶](https://docs.openstack.org/mitaka/user-guide/common/cli_install_openstack_command_line_clients.html#upgrade-or-remove-clients "Permalink to this headline")

To upgrade a client, add the *--upgrade* option to the **pip install** command:

    \# pip install --upgrade python-PROJECTclient

To remove the client, run the **pip uninstall** command:

    \# pip uninstall python-PROJECTclient

## What’s next[¶](https://docs.openstack.org/mitaka/user-guide/common/cli_install_openstack_command_line_clients.html#what-s-next "Permalink to this headline")

Before you can run client commands, you must create and source the PROJECT-openrc.sh file to set environment variables. See[*Set environment variables using the OpenStack RC file*](https://docs.openstack.org/mitaka/user-guide/common/cli_set_environment_variables_using_openstack_rc.html).