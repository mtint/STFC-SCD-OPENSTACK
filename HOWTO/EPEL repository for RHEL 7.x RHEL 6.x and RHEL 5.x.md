EPEL repository for RHEL 7 / RHEL 6/ RHEL 5 and Centos 7/ Centos 6/ Centos 5. EPEL repository (Extra Packages for Enterprise Linux) EPEL is a open source package building project which is owned and maintained by fedora. All the packages created by EPEL project is highly qualified and tested. Manual installation of packages in Linux it’s time taking process and we have to download all the packages and it’s dependencies one by one by using EPEL repo we can just install a packages using in yum command.

1. To resolve dependencies and install them automatically
2. Extra packages will be available trough EPEL which may not available with inbuilt subscriptions
3. Just install EPEL RPM it will automatically configures YUM for you
4. Required Internet access to install packages
5. It does not provide duplicate core packages

Requirements to install and configure EPEL repository
-----------------------------------------------------

* Internet access required to download EPEL RPM
* Internet access required to install packages through YUM
* wget and rpm commands should be available
* root user credential to install and enable EPEL repo

**Installation and Configuration process**

RHEL 7 64 bit EPEL repository is below. EPEL Repository RHEL 7 / Centos 7

**Note:** EPEL repository for RHEL 7 32bit is not available

    [root@TechTutorial ~]# cd /tmp/
    [root@TechTutorial tmp]# wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

    100%[===================================================================================================================================>] 14,432      56.0KB/s   in 0.3s

    2016-05-19 11:19:15 (56.0 KB/s) - ‘epel-release-7-7.noarch.rpm’ saved [14432/14432]

    [root@TechTutorial tmp]# rpm -ivh epel-release-7-7.noarch.rpm

**EPEL Repository RHEL 6 / Centos 6 64 Bit**

    [root@TechTutorial]# cd /tmp
    [root@TechTutorial tmp]# wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
    [root@TechTutorial tmp]# rpm -ivh epel-release-6-8.noarch.rpm

**EPEL Repository RHEL 6 /Centos 6 32 Bit**

    [root@TechTutorial]# cd /tmp
    [root@TechTutorial]# wget http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
    [root@TechTutorial]# rpm -ivh epel-release-6-8.noarch.rpm

**EPEL Repository RHEL 5/ Centos 5 32 bit**

    [root@TechTutorial ]# cd /tmp
    [root@TechTutorial tmp]# wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-5.noarch.rpm
    [root@TechTutorial tmp]# rpm -ivh epel-release-5-4.noarch.rpm

**RHEL 5/ Centos 5 64 bit**

    [root@TechTutorial ]# cd /tmp
    [root@TechTutorial tmp]# wget http://download.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm
    [root@TechTutorial tmp]# rpm -ivh epel-release-5-4.noarch.rpm

As soon as you installed an EPEL RPM it will create an YUM configuration file the content of config file will below as shown below, from that if you see enabled=1 it means your repository is enabled.

    [root@TechTutorial /etc/yum.repos.d]# cat epel.repo
    [epel]
    name=Extra Packages for Enterprise Linux 7 - $basearch
    #baseurl=http://download.fedoraproject.org/pub/epel/7/$basearch
    mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=$basearch
    failovermethod=priority
    enabled=1
    gpgcheck=1
    gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7

    [epel-debuginfo]
    name=Extra Packages for Enterprise Linux 7 - $basearch - Debug
    #baseurl=http://download.fedoraproject.org/pub/epel/7/$basearch/debug
    mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-debug-7&arch=$basearch
    failovermethod=priority
    enabled=0
    gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
    gpgcheck=1

    [epel-source]
    name=Extra Packages for Enterprise Linux 7 - $basearch - Source
    #baseurl=http://download.fedoraproject.org/pub/epel/7/SRPMS
    mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-source-7&arch=$basearch
    failovermethod=priority
    enabled=0
    gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
    gpgcheck=1

Verify the repository is working.?
----------------------------------

    [root@TechTutorial yum.repos.d]# yum repolist
    Loaded plugins: langpacks, product-id, subscription-manager
    This system is not registered to Red Hat Subscription Management. You can use subscription-manager to register.
    epel/x86_64/metalink                                                                                                                                 | 3.3 kB  00:00:00
    epel                                                                                                                                                 | 4.3 kB  00:00:00
    (1/3): epel/x86_64/group_gz                                                                                                                          | 170 kB  00:00:01
    (2/3): epel/x86_64/updateinfo                                                                                                                        | 555 kB  00:00:05
    (3/3): epel/x86_64/primary_db                                                                                                                        | 4.1 MB  00:00:10
    repo id                                                             repo name                                                                                         status
    epel/x86_64                                                         Extra Packages for Enterprise Linux 7 - x86_64                                                    10,087
    repolist: 10,087

as shown above EPEL repo is enabled and working fine. If you want to list all the packages of EPEL repository the use below command

    # yum list all

How do i Install Packages using EPEL repository
-----------------------------------------------

    [root@TechTutorial ~]# yum --enablerepo=epel install nagios

Above command will list out all the packages required to install Nagios, then it will ask you for the confirmation to install If you type Y then it will download packages and install.

That’s it your EPEL repository is ready to use enjoy.

Please do comment your feedback.

**Related Articles**

[25 basic Linux commands](https://arkit.co.in/linux/25-commonly-used-linux-commands/)

[Start using Systemctl command](https://arkit.co.in/linux/use-systemctl/)

[Systemctl command in more options](https://arkit.co.in/centos/systemctl-command/)

**Thanks for your wonderful Support and Encouragement **

* [Get Email](https://feedburner.google.com/fb/a/mailverify?uri=arkit) | [Download E-Books](https://arkit-in.tradepub.com/)
* [Facebook Page](https://www.facebook.com/Linuxarkit)
* [Youtube Channel](https://www.youtube.com/Techarkit?sub_confirmation=1)
* [Twitter](https://twitter.com/aravikumar48)
* [Exclusive Telegram Group](https://t.me/Linuxarkit)
* [Discuss On WhatsApp Group](https://github.com/techarkit/TechArkit-YouTube/blob/master/whatsapp_group.md)

More than 40000 Techies in our community do you want part of it Join Now