[Source](https://linuxconfig.org/how-to-restart-network-on-ubuntu-18-04-bionic-beaver-linux "Permalink to How to restart network on Ubuntu 18.04 Bionic Beaver Linux - LinuxConfig.org")

## Objective

The following article will describe various ways how to restart network from command line as well as from Graphical User Interface (GUI) on Ubuntu 18.04 Bionic Beaver Linux 

## Operating System and Software Versions

* **Operating System:** - Ubuntu 18.04 Bionic
* **Software:** - GNOME Desktop

## Requirements

Privileged access to is required for GUI network restart 

## Conventions

* **\#** - requires given [linux commands](https://linuxconfig.org/linux-commands) to be executed with root privileges either directly as a root user or by use of `sudo` command
* **$** - requires given [linux commands](https://linuxconfig.org/linux-commands) to be executed as a regular non-privileged user

## Other Versions of this Tutorial

 [Ubuntu 20.04 (Focal Fossa)](https://linuxconfig.org/how-to-restart-network-on-ubuntu-20-04-lts-focal-fossa) 

## Instructions

### Graphical User Interface

Bring up network management window by right-click on the top right corner network icon and locate the network connection you wish to restart then click on `Turn Off`.

![network restart on Ubuntu 18.04 Bionic Beaver Linux](https://linuxconfig.org/images/restart-network-gui-ubuntu-18.04-bionic-beaver.png)

 The Network Icon will disappear. To turn on the network again, left click on the top right corner arrow down, locate your network interface and click `Connect`.

![network start on Ubuntu 18.04 Bionic Beaver Linux](https://linuxconfig.org/images/restart-network-gui-on-ubuntu-18.04-bionic-beaver.png)

### Command Line

To restart network from the command line you have the following options: 

### netplan

    $ sudo netplan apply

### systemctl

The first command line network restart uses the `systemctl` command to perform the restart of network manager. 

    $ sudo  systemctl restart NetworkManager.service

### service

Same as the above can be accomplished with the `service` command: 

    $ sudo service network-manager restart

***Looking for Linux Systems Analyst !**

 The UAF Geophysical Institute, is looking for an experienced Linux Systems Analyst to join their team of research cyber infrastructure analysts and engineers. LOCATION: **Fairbanks, Alaska, USA**
 *
[APPLY NOW](http://bit.ly/2Prk1Ts)

### nmcli

Controlling the Network Manager with the `nmcli` command will restart the Network Manager directly: 

    $ sudo nmcli networking off
    $ sudo nmcli networking on

### System V init

The old fashioned and now obsolete way using System V init scripts directly is still available on Ubuntu 18.04 Bionic Beaver Linux: 

    $ sudo /etc/init.d/networking restart
    OR
    $ sudo /etc/init.d/network-manager restart

### ifup/ifdown

In this last example we will restart the network interface directly using the `ifup` and `ifdown` commands. Note the the `-a` option will tell the `ifup` and `ifdown` commands to restart all available network interfaces marked as "auto": 

    $ sudo ifdown -a
    $ sudo ifup -a