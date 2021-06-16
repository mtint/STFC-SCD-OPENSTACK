![30 YUM Command Examples](https://www.itzgeek.com/wp-content/uploads/2017/12/30-YUM-Command-Examples.png)

**[Yellowdog Updater](http://yum.baseurl.org/)**, Modified (yum) is an open source package-management utility in Redhat based operating system. Yum takes care of automatic installation of dependent packages during package installation, removal, and updates.

Yum uses **[Redhat Package Manager](https://www.itzgeek.com/tag/rpm)** (RPM) and can install software packages from yum repositories (collections of RPM packages), which can be accessed locally or over a network connection.

**READ**: **[How to create Local/Network YUM repository on CentOS 7 / RHEL 7]()**

Here, we will take a look at YUM commands examples for managing packages on Linux (**[CentOS](https://www.itzgeek.com/category/how-tos/linux/centos-how-tos) **/ **[RHEL](https://www.itzgeek.com/category/how-tos/linux/centos-how-tos)** / **[Fedora](https://www.itzgeek.com/category/how-tos/linux/fedora-how-tos)**)

### 1\. Install a Package with YUM

To install a RPM package, you can use the following command. You can mention multiple package names separated by a space.

    # yum install vsftpd

    Loaded plugins: fastestmirror
    Loading mirror speeds from cached hostfile
     * base: centos.excellmedia.net
     * extras: centos.excellmedia.net
     * updates: centos.excellmedia.net
    Resolving Dependencies
    --> Running transaction check
    ---> Package vsftpd.x86_64 0:3.0.2-22.el7 will be installed
    --> Finished Dependency Resolution

    Dependencies Resolved

    ==================================================================================================
     Package              Arch                 Version                       Repository          Size
    ==================================================================================================
    Installing:
     vsftpd               x86_64               3.0.2-22.el7                  base               169 k

    Transaction Summary
    ==================================================================================================
    Install  1 Package

    Total download size: 169 k
    Installed size: 348 k
    Is this ok [y/d/N]: y
    Downloading packages:
    vsftpd-3.0.2-22.el7.x86_64.rpm                                             | 169 kB  00:00:00
    Running transaction check
    Running transaction test
    Transaction test succeeded
    Running transaction
      Installing : vsftpd-3.0.2-22.el7.x86_64                                                     1/1
      Verifying  : vsftpd-3.0.2-22.el7.x86_64                                                     1/1

    Installed:
      vsftpd.x86_64 0:3.0.2-22.el7

    Complete!

Adding a -y flag to the yum command will install/remove/reinstall packages without any futher confirmation.

### 2\. Remove a Package with YUM

To remove any package, run the following command. You can mention multiple package names separated by a space.

    # yum remove vsftpd

    Loaded plugins: fastestmirror
    Resolving Dependencies
    --> Running transaction check
    ---> Package vsftpd.x86_64 0:3.0.2-22.el7 will be erased
    --> Finished Dependency Resolution

    Dependencies Resolved

    ==================================================================================================
     Package              Arch                 Version                      Repository           Size
    ==================================================================================================
    Removing:
     vsftpd               x86_64               3.0.2-22.el7                 @base               348 k

    Transaction Summary
    ==================================================================================================
    Remove  1 Package

    Installed size: 348 k
    Is this ok [y/N]: y
    Downloading packages:
    Running transaction check
    Running transaction test
    Transaction test succeeded
    Running transaction
      Erasing    : vsftpd-3.0.2-22.el7.x86_64                                                     1/1
      Verifying  : vsftpd-3.0.2-22.el7.x86_64                                                     1/1

    Removed:
      vsftpd.x86_64 0:3.0.2-22.el7

    Complete!

### 3\. Update a Package with YUM

To update any package to the latest version, run the following command. You can mention multiple package names separated by a space.

    #  yum update sudo

    Loaded plugins: fastestmirror
    Loading mirror speeds from cached hostfile
     * base: centos.excellmedia.net
     * extras: centos.excellmedia.net
     * updates: centos.excellmedia.net
    Resolving Dependencies
    --> Running transaction check
    ---> Package sudo.x86_64 0:1.8.19p2-10.el7 will be updated
    ---> Package sudo.x86_64 0:1.8.19p2-11.el7_4 will be an update
    --> Finished Dependency Resolution

    Dependencies Resolved

    ==================================================================================================
     Package           Arch                Version                         Repository            Size
    ==================================================================================================
    Updating:
     sudo              x86_64              1.8.19p2-11.el7_4               updates              1.1 M

    Transaction Summary
    ==================================================================================================
    Upgrade  1 Package

    Total download size: 1.1 M
    Is this ok [y/d/N]: y
    Downloading packages:
    Delta RPMs disabled because /usr/bin/applydeltarpm not installed.
    sudo-1.8.19p2-11.el7_4.x86_64.rpm                                          | 1.1 MB  00:00:01
    Running transaction check
    Running transaction test
    Transaction test succeeded
    Running transaction
      Updating   : sudo-1.8.19p2-11.el7_4.x86_64                                                  1/2
      Cleanup    : sudo-1.8.19p2-10.el7.x86_64                                                    2/2
      Verifying  : sudo-1.8.19p2-11.el7_4.x86_64                                                  1/2
      Verifying  : sudo-1.8.19p2-10.el7.x86_64                                                    2/2

    Updated:
      sudo.x86_64 0:1.8.19p2-11.el7_4

    Complete!

### 4\. Downgrade a Package with YUM

To downgrade a package using yum command, run the following command. This command will revert the package to the previous version.

It will work only if the repository has a previous version of the mentioned package.

Ex: Let us downgrade the sudo package which was just updated in our previous example.

    # yum downgrade sudo

    Loaded plugins: fastestmirror
    Loading mirror speeds from cached hostfile
     * base: centos.excellmedia.net
     * extras: centos.excellmedia.net
     * updates: centos.excellmedia.net
    Resolving Dependencies
    --> Running transaction check
    ---> Package sudo.x86_64 0:1.8.19p2-10.el7 will be a downgrade
    ---> Package sudo.x86_64 0:1.8.19p2-11.el7_4 will be erased
    --> Finished Dependency Resolution

    Dependencies Resolved

    ==================================================================================================
     Package            Arch                 Version                         Repository          Size
    ==================================================================================================
    Downgrading:
     sudo               x86_64               1.8.19p2-10.el7                 base               1.1 M

    Transaction Summary
    ==================================================================================================
    Downgrade  1 Package

    Total download size: 1.1 M
    Is this ok [y/d/N]: y
    Downloading packages:
    sudo-1.8.19p2-10.el7.x86_64.rpm                                            | 1.1 MB  00:00:02
    Running transaction check
    Running transaction test
    Transaction test succeeded
    Running transaction
      Installing : sudo-1.8.19p2-10.el7.x86_64                                                    1/2
      Cleanup    : sudo-1.8.19p2-11.el7_4.x86_64                                                  2/2
      Verifying  : sudo-1.8.19p2-10.el7.x86_64                                                    1/2
      Verifying  : sudo-1.8.19p2-11.el7_4.x86_64                                                  2/2

    Removed:
      sudo.x86_64 0:1.8.19p2-11.el7_4

    Installed:
      sudo.x86_64 0:1.8.19p2-10.el7

    Complete!

### 5\. Reinstall a Package with YUM

You can reinstall an RPM using the following command to resolve installation issues.

    # yum reinstall sudo

    Loaded plugins: fastestmirror
    Loading mirror speeds from cached hostfile
     * base: centos.excellmedia.net
     * extras: centos.excellmedia.net
     * updates: centos.excellmedia.net
    Resolving Dependencies
    --> Running transaction check
    ---> Package sudo.x86_64 0:1.8.19p2-10.el7 will be reinstalled
    --> Finished Dependency Resolution

    Dependencies Resolved

    ==================================================================================================
     Package            Arch                 Version                         Repository          Size
    ==================================================================================================
    Reinstalling:
     sudo               x86_64               1.8.19p2-10.el7                 base               1.1 M

    Transaction Summary
    ==================================================================================================
    Reinstall  1 Package

    Total download size: 1.1 M
    Installed size: 3.9 M
    Is this ok [y/d/N]: y
    Downloading packages:
    sudo-1.8.19p2-10.el7.x86_64.rpm                                            | 1.1 MB  00:00:09
    Running transaction check
    Running transaction test
    Transaction test succeeded
    Running transaction
      Installing : sudo-1.8.19p2-10.el7.x86_64                                                    1/1
      Verifying  : sudo-1.8.19p2-10.el7.x86_64                                                    1/1

    Installed:
      sudo.x86_64 0:1.8.19p2-10.el7

    Complete!

### 6\. List a package with YUM

Do you know the package name? Then use the below command to know whether the package is already installed or available for your system.

The output will have the repository name from which the package was installed. In case it is not already installed, the output will have the name of the repository from which we can install the package.

**Installed Package:**

ADVERTISEMENT

    # yum list tar

    Loaded plugins: fastestmirror
    Loading mirror speeds from cached hostfile
     * base: centos.excellmedia.net
     * extras: centos.excellmedia.net
     * updates: centos.excellmedia.net
    Installed Packages
    tar.x86_64                                 2:1.26-32.el7                                 @anaconda

**Available Package:**

    # yum list httpd

    Loading mirror speeds from cached hostfile
     * base: centos.excellmedia.net
     * extras: centos.excellmedia.net
     * updates: centos.excellmedia.net
    Available Packages
    httpd.x86_64                             2.4.6-67.el7.centos.6                             updates

### 7\. List all installed packages with YUM

Sometimes you may want to get a list of packages installed on your system. Use the below command.

    yum list installed | less

### 8\. List all available packages with YUM

You can use the below yum command to get a list of all available packages for your system.

    yum list available | less

### 9\. Find / Search a Package with YUM

Did you forget the package name? You can use below command to search for a package. The command will simply list packages that contain given phrase.

    # yum search telnet

    Loaded plugins: fastestmirror
    Loading mirror speeds from cached hostfile
     * base: centos.excellmedia.net
     * extras: centos.excellmedia.net
     * updates: centos.excellmedia.net
    ====================================== N/S matched: telnet =======================================
    perl-Net-Telnet.noarch : Net-Telnet Perl module
    telnet.x86_64 : The client program for the Telnet remote login protocol
    telnet-server.x86_64 : The server program for the Telnet remote login protocol
    tn5250.i686 : 5250 Telnet protocol and Terminal
    tn5250.x86_64 : 5250 Telnet protocol and Terminal

### 10\. Find which package provides a file with YUM

This command will help you find a package that provides a file. For example: let us find which package provides the date command.

    # yum provides date

    Loaded plugins: fastestmirror
    Loading mirror speeds from cached hostfile
     * base: centos.excellmedia.net
     * extras: centos.excellmedia.net
     * updates: centos.excellmedia.net
    coreutils-8.22-18.el7.x86_64 : A set of basic GNU tools commonly used in shell scripts
    Repo        : base
    Matched from:
    Filename    : /usr/bin/date

    coreutils-8.22-18.el7.x86_64 : A set of basic GNU tools commonly used in shell scripts
    Repo        : @anaconda
    Matched from:
    Filename    : /usr/bin/date

### 11\. Get an information about a Package with YUM

To know more about a particular package, use the following command.

    # yum info tar

    Loaded plugins: fastestmirror
    Loading mirror speeds from cached hostfile
     * base: centos.excellmedia.net
     * extras: centos.excellmedia.net
     * updates: centos.excellmedia.net
    Installed Packages
    Name        : tar
    Arch        : x86_64
    Epoch       : 2
    Version     : 1.26
    Release     : 32.el7
    Size        : 2.7 M
    Repo        : installed
    From repo   : anaconda
    Summary     : A GNU file archiving program
    URL         : http://www.gnu.org/software/tar/
    License     : GPLv3+
    Description : The GNU tar program saves many files together in one archive and can
                : restore individual files (or all of the files) from that archive. Tar
                : can also be used to add supplemental files to an archive and to update
                : or list files in the archive. Tar includes multivolume support,
                : automatic archive compression/decompression, the ability to perform
                : remote archives, and the ability to perform incremental and full
                : backups.
                :
                : If you want to use tar for remote backups, you also need to install
                : the rmt package on the remote box.

### 12\. Download packages with YUM

In some cases, like repository creation, you will need to download rpm packages without installing using YUM command. Below command will download FTP server package to /tmp directory.

    # yum install vsftpd --downloadonly --downloaddir=/tmp

    Loaded plugins: fastestmirror
    Loading mirror speeds from cached hostfile
     * base: centos.excellmedia.net
     * extras: centos.excellmedia.net
     * updates: centos.excellmedia.net
    Resolving Dependencies
    --> Running transaction check
    ---> Package vsftpd.x86_64 0:3.0.2-22.el7 will be installed
    --> Finished Dependency Resolution

    Dependencies Resolved

    ==================================================================================================
     Package              Arch                 Version                       Repository          Size
    ==================================================================================================
    Installing:
     vsftpd               x86_64               3.0.2-22.el7                  base               169 k

    Transaction Summary
    ==================================================================================================
    Install  1 Package

    Total download size: 169 k
    Installed size: 348 k
    Background downloading packages, then exiting:
    vsftpd-3.0.2-22.el7.x86_64.rpm                                             | 169 kB  00:00:01
    exiting because "Download Only" specified

Verify whether the package has been downloaded or not.

    # ls -al /tmp | grep vsftpd

    -rw-r--r--.  1 root root 173060 Aug 10 16:13 vsftpd-3.0.2-22.el7.x86_64.rpm

### 13\. Check updates with YUM

Want to know what are all packages need an update for keeping your system safe then use the below command.

    # yum check-update

    Loaded plugins: fastestmirror
    Loading mirror speeds from cached hostfile
     * base: centos.excellmedia.net
     * epel: epel.mirror.net.in
     * extras: centos.excellmedia.net
     * updates: centos.excellmedia.net

    NetworkManager.x86_64                          1:1.8.0-11.el7_4                          updates
    NetworkManager-libnm.x86_64                    1:1.8.0-11.el7_4                          updates
    NetworkManager-team.x86_64                     1:1.8.0-11.el7_4                          updates
    NetworkManager-tui.x86_64                      1:1.8.0-11.el7_4                          updates
    .     .     .
    .     .     .
    xmlsec1-openssl.x86_64                         1.2.20-7.el7_4                            updates
    Obsoleting Packages
    grub2.x86_64                                   1:2.02-0.65.el7.centos.2                  updates
        grub2.x86_64                               1:2.02-0.64.el7.centos                    @anaconda
    grub2-tools.x86_64                             1:2.02-0.65.el7.centos.2                  updates
        grub2-tools.x86_64                         1:2.02-0.64.el7.centos                    @anaconda
    grub2-tools-extra.x86_64                       1:2.02-0.65.el7.centos.2                  updates
        grub2-tools.x86_64                         1:2.02-0.64.el7.centos                    @anaconda
    grub2-tools-minimal.x86_64                     1:2.02-0.65.el7.centos.2                  updates
        grub2-tools.x86_64                         1:2.02-0.64.el7.centos                    @anaconda

### 14\. Update system with YUM

To update all installed packages in a single go or upgrade the system to the new release of the operating system, you can use the below command.

    yum update

### 15\. Exclude a Package from update with YUM

Sometimes, you want to prevent a package(s) from being updated. For that, you can use below command. You can mention multiple packages separated by a comma.

    yum update --exclude kernel

### 16\. Get history details with YUM

Until this step, you might have executed the yum command for many times. Below command will let you view historical data of successful yum command executions which have actions like install, erase, and update.

    # yum history

    Loaded plugins: fastestmirror
    ID     | Login user               | Date and time    | Action(s)      | Altered
    -------------------------------------------------------------------------------
         9 | root               | 2017-12-03 09:01 | Install        |    1
         8 | root               | 2017-12-03 08:21 | Reinstall      |    1
         7 | root               | 2017-12-03 08:09 | Downgrade      |    1
         6 | root               | 2017-12-03 08:09 | Update         |    1
         5 | root               | 2017-12-03 08:07 | Update         |    2
         4 | root               | 2017-12-03 08:02 | Erase          |    1
         3 | root               | 2017-12-03 08:00 | Install        |    1
         2 | root               | 2017-11-23 10:40 | Install        |    1
         1 | System            | 2017-11-21 21:11 | Install        |  311
    history list

ID is unique for each yum transaction and which will be useful in next few examples.

### 17\. Check information yum history

To know what happened during the particular yum command execution, you can use yum history info command.

For example: let us see changes happened during yum execution (ID 9).

ADVERTISEMENT

    # yum history info 9

    Loaded plugins: fastestmirror
    Transaction ID : 9
    Begin time     : Sun Dec  3 09:01:14 2017
    Begin rpmdb    : 312:6bf3ea07cb67a6d39ce9c212f5afa384fb4b6daa
    End time       :                          (0 seconds)
    End rpmdb      : 313:b71df284ffdb6a3c0f809b15dfb8db623954acc5
    User           : root 
    Return-Code    : Success
    Command Line   : install epel-release
    Transaction performed with:
        Installed     rpm-4.11.3-25.el7.x86_64                      @anaconda
        Installed     yum-3.4.3-154.el7.centos.noarch               @anaconda
        Installed     yum-plugin-fastestmirror-1.1.31-42.el7.noarch @anaconda
    Packages Altered:
        Install epel-release-7-9.noarch @extras
    history info

### 18\. Revert packages with yum history

This command enables you to revert the changes happened for a particular yum command execution.

For example: In the previous step, you can see that the package called epel-release was installed during ID 9\. Let us revert (remove package) that whole installation with yum.

    # yum history undo 9

    Loaded plugins: fastestmirror
    Undoing transaction 9, from Sun Dec  3 09:01:14 2017
        Install epel-release-7-9.noarch @extras
    Resolving Dependencies
    --> Running transaction check
    ---> Package epel-release.noarch 0:7-9 will be erased
    --> Finished Dependency Resolution

    Dependencies Resolved

    ==================================================================================================
     Package                    Arch                 Version              Repository             Size
    ==================================================================================================
    Removing:
     epel-release               noarch               7-9                  @extras                24 k

    Transaction Summary
    ==================================================================================================
    Remove  1 Package

    Installed size: 24 k
    Is this ok [y/N]: y
    Downloading packages:
    Running transaction check
    Running transaction test
    Transaction test succeeded
    Running transaction
      Erasing    : epel-release-7-9.noarch                                                        1/1
      Verifying  : epel-release-7-9.noarch                                                        1/1

    Removed:
      epel-release.noarch 0:7-9

    Complete!

### 19\. Undo revert with yum history

This command will undo the revert (install the removed package – step 19) happened for a particular yum command execution.

    # yum history redo 9

    Loaded plugins: fastestmirror
    Repeating transaction 9, from Sun Dec  3 09:01:14 2017
        Install epel-release-7-9.noarch @extras
    Loading mirror speeds from cached hostfile
     * base: centos.excellmedia.net
     * extras: centos.excellmedia.net
     * updates: centos.excellmedia.net
    Resolving Dependencies
    --> Running transaction check
    ---> Package epel-release.noarch 0:7-9 will be installed
    --> Finished Dependency Resolution

    Dependencies Resolved

    ==================================================================================================
     Package                     Arch                  Version            Repository             Size
    ==================================================================================================
    Installing:
     epel-release                noarch                7-9                extras                 14 k

    Transaction Summary
    ==================================================================================================
    Install  1 Package

    Total download size: 14 k
    Installed size: 24 k
    Is this ok [y/d/N]: y
    Downloading packages:
    epel-release-7-9.noarch.rpm                                                |  14 kB  00:00:00
    Running transaction check
    Running transaction test
    Transaction test succeeded
    Running transaction
      Installing : epel-release-7-9.noarch                                                        1/1
      Verifying  : epel-release-7-9.noarch                                                        1/1

    Installed:
      epel-release.noarch 0:7-9

    Complete!

### 20\. List YUM repositories with YUM

Want to get a list of repositories configured on your machine. Use the below command. The command will list only the enabled repositories.

    # yum repolist

    Loaded plugins: fastestmirror
    Loading mirror speeds from cached hostfile
     * base: centos.excellmedia.net
     * epel: epel.mirror.net.in
     * extras: centos.excellmedia.net
     * updates: centos.excellmedia.net
    repo id                        repo name                                                    status
    base/7/x86_64                  CentOS-7 - Base                                               9,591
    epel/x86_64                    Extra Packages for Enterprise Linux 7 - x86_64               12,126
    extras/7/x86_64                CentOS-7 - Extras                                               283
    updates/7/x86_64               CentOS-7 - Updates                                            1,134
    repolist: 23,134

### 21\. List all YUM repositories with YUM

Using yum with all option can give you the list of all repositories configured on your system including the disabled repositories.

    # yum repolist all

    repo id                       repo name                                            status
    C7.0.1406-base/x86_64         CentOS-7.0.1406 - Base                               disabled
    C7.0.1406-centosplus/x86_64   CentOS-7.0.1406 - CentOSPlus                         disabled
    .     .     .
    .     .     .
    epel/x86_64                   Extra Packages for Enterprise Linux 7 - x86_64       enabled: 12,126
    epel-debuginfo/x86_64         Extra Packages for Enterprise Linux 7 - x86_64 - Deb disabled
    epel-source/x86_64            Extra Packages for Enterprise Linux 7 - x86_64 - Sou disabled
    epel-testing/x86_64           Extra Packages for Enterprise Linux 7 - Testing - x8 disabled
    epel-testing-debuginfo/x86_64 Extra Packages for Enterprise Linux 7 - Testing - x8 disabled
    epel-testing-source/x86_64    Extra Packages for Enterprise Linux 7 - Testing - x8 disabled
    extras/7/x86_64               CentOS-7 - Extras                                    enabled:    283
    extras-source/7               CentOS-7 - Extras Sources                            disabled
    fasttrack/7/x86_64            CentOS-7 - fasttrack                                 disabled
    updates/7/x86_64              CentOS-7 - Updates                                   enabled:  1,134
    updates-source/7              CentOS-7 - Updates Sources                           disabled
    repolist: 23,134

### 22\. List disabled repositories with YUM

You can use yum with a disabled option to list only the disabled yum repositories on your system.

    # yum repolist disabled

    Loaded plugins: fastestmirror
    repo id                        repo name
    C7.0.1406-base/x86_64          CentOS-7.0.1406 - Base
    C7.0.1406-centosplus/x86_64    CentOS-7.0.1406 - CentOSPlus
    C7.0.1406-extras/x86_64        CentOS-7.0.1406 - Extras
    C7.0.1406-fasttrack/x86_64     CentOS-7.0.1406 - CentOSPlus
    C7.0.1406-updates/x86_64       CentOS-7.0.1406 - Updates
    .     .     .
    .     .     .
    fasttrack/7/x86_64             CentOS-7 - fasttrack
    updates-source/7               CentOS-7 - Updates Sources
    repolist: 0

### 23\. Enable repository with YUM

You can also enable a particular repository for the time being to install rpm package.

For example: To install any package from the epel-testing repository which is in disabled state (see 13th step output), the command might look like below.

    yum install unifont --enablerepo=epel-testing

### 24\. Enable repositories with YUM

Sometimes, multiple repositories have the same package. To avoid duplicates, you can use below command to enable particular repository by disabling all other repositories.

Use yum list or yum search command to know on which repository the package is available.

    yum install httpd --disablerepo=* --enablerepo=base

### 25\. List package groups with YUM

Below command will list you the available groups and environments for your system.

    # yum grouplist

    Loaded plugins: fastestmirror
    There is no installed groups file.
    Maybe run: yum groups mark convert (see man yum)
    Loading mirror speeds from cached hostfile
     * base: centos.excellmedia.net
     * epel: epel.mirror.net.in
    Available Environment Groups:
       Minimal Install
       Compute Node
       Infrastructure Server
       File and Print Server
       Cinnamon Desktop
       MATE Desktop
       Basic Web Server
       Virtualization Host
       Server with GUI
       GNOME Desktop
       KDE Plasma Workspaces
       Development and Creative Workstation
    Available Groups:
       CIFS file server
       Compatibility Libraries
    .     .     .
    .     .     .
       Virtualization
       Web-Based Enterprise Management
       Xfce
       iSCSI Storage Client
    Done

### 26\. Install group of packages with YUM

Installing packages in a group will configure a system to a particular state. For example: if you install “Server with GUI” group then your system will have a grahical interface (desktop).

    yum groupinstall "Server with GUI"

### 27\. Generate Meta cache with YUM

Download and make usable all the metadata, like packages, for the currently enabled yum repositories. This command will help you faster the transcation of package installation.

    # yum makecache

    Loaded plugins: fastestmirror
    base                                                                       | 3.6 kB  00:00:00
    epel/x86_64/metalink                                                       | 5.0 kB  00:00:00
    extras                                                                     | 3.4 kB  00:00:00
    updates                                                                    | 3.4 kB  00:00:00
    (1/8): extras/7/x86_64/prestodelta                                         |  51 kB  00:00:00
    (2/8): extras/7/x86_64/other_db                                            |  87 kB  00:00:00
    (3/8): epel/x86_64/prestodelta                                             |  807 B  00:00:01
    (4/8): updates/7/x86_64/other_db                                           | 362 kB  00:00:02
    (5/8): base/7/x86_64/other_db                                              | 2.5 MB  00:00:04
    (6/8): epel/x86_64/filelists_db                                            | 9.9 MB  00:00:14
    (7/8): epel/x86_64/other_db                                                | 2.9 MB  00:00:16
    (8/8): updates/7/x86_64/prestodelta                                        | 428 kB  00:01:02
    Loading mirror speeds from cached hostfile
     * base: centos.excellmedia.net
     * extras: centos.excellmedia.net
     * updates: centos.excellmedia.net
    Metadata Cache Created

### 28\. Clear caches with YUM

YUM creates caches in /var/cache/yum/ directory, and this needs to be cleared if you get any errors or make some disk space.

    yum clean all

### 29\. YUM shell

YUM has its own interactive shell prompt where you can do all tasks shown in previous steps. Below example shows you how to install a package with YUM shell.

ADVERTISEMENT

    # yum shell

    Loaded plugins: fastestmirror
    > install vsftpd
    Loading mirror speeds from cached hostfile
     * base: centos.excellmedia.net
     * epel: kartolo.sby.datautama.net.id
     * extras: centos.excellmedia.net
     * updates: centos.excellmedia.net
    > run
    --> Running transaction check
    ---> Package vsftpd.x86_64 0:3.0.2-22.el7 will be installed
    --> Finished Dependency Resolution

    ==================================================================================================
     Package              Arch                 Version                       Repository          Size
    ==================================================================================================
    Installing:
     vsftpd               x86_64               3.0.2-22.el7                  base               169 k

    Transaction Summary
    ==================================================================================================
    Install  1 Package

    Total download size: 169 k
    Installed size: 348 k
    Is this ok [y/d/N]: y
    Downloading packages:
    vsftpd-3.0.2-22.el7.x86_64.rpm                                             | 169 kB  00:00:01
    Running transaction check
    Running transaction test
    Transaction test succeeded
    Running transaction
      Installing : vsftpd-3.0.2-22.el7.x86_64                                                     1/1
      Verifying  : vsftpd-3.0.2-22.el7.x86_64                                                     1/1

    Installed:
      vsftpd.x86_64 0:3.0.2-22.el7

    Finished Transaction
    > exit
    Leaving Shell

### 30\. Get help with YUM

You can get more information about YUM using the below commands.

    yum --help

That’s All. Post your valuable commands