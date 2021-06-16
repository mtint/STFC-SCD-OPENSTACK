[Source](https://linuxhint.com/restarting_network_ubuntu/ "Permalink to How to Restart Network on Ubuntu 20.04 – Linux Hint")

There are various situations where you may have to restart the network on Ubuntu. It may be because the network settings were changed. It may be because the network connection is acting weird. Generally, whenever there’s a problem with the system, a common treatment is performing a reboot. However, if it’s a problem related to the network, then it’s possible to just restart the network.In this guide, check out how to restart the network on Ubuntu 20.04. There are various methods you can follow to restart the network on Ubuntu. It can be performed directly from the GUI or through the terminal. Depending on your preference, follow the one that suits you.

### Restart network from GUI

In this section, I’ll be assuming that you’re using Ubuntu 20.04 with the default GNOME desktop.

### Restart network from the desktop

Click on the top-right network icon on the screen.

![](https://linuxhint.com/wp-content/uploads/2020/09/word-image-796.png)

Select the network connection and press “Turn Off”. It will disable the network connection.

To enable it again, go through the same process. This time, there’ll be a different option “Connect”. Click “Connect” to re-establish the network connection.

![](https://linuxhint.com/wp-content/uploads/2020/09/word-image-797.png)

### Restart network from GNOME Settings

You can also do this directly from the GNOME “Settings”.

![](https://linuxhint.com/wp-content/uploads/2020/09/word-image-798.png)

From the left panel, select “Network”.

![](https://linuxhint.com/wp-content/uploads/2020/09/word-image-799.png)

Disable and enable the connected network(s).

### Restart network from CLI

When working with the CLI, there are multiple ways of taking action. We can take action on the network manager service or use other tools like nmcli, ifup, nmtui, etc.

### Restart network manager service

This is one of the easiest ways of restarting the network service. It’s equivalent to the graphical method demonstrated above.

Fire up a terminal and run the following command.

$ sudo service network-manager restart

![](https://linuxhint.com/wp-content/uploads/2020/09/word-image-800.png)

### Restart network service using systemd

Systemd offers an array of system components to the system. Part of it is handling the services. The previous method is only an alternative one of this method. Systemd is directly told to restart the service rather than going through any hoops.

$ sudo systemctl restart NetworkManager.service

![](https://linuxhint.com/wp-content/uploads/2020/09/word-image-801.png)

### Restart network using nmcli

The nmcli tool is a powerful tool for managing the network connection on Linux machines. It’s a popular one among system admins because of its ease of use.

First, turn off the network connection.

$ sudo nmcli networking off

![](https://linuxhint.com/wp-content/uploads/2020/09/word-image-802.png)

Then, turn it back on.

$ sudo nmcli networking on

![](https://linuxhint.com/wp-content/uploads/2020/09/word-image-803.png)

### Restart network using ifup and ifdown

The ifup and ifdown commands handle a network interface directly. It’s one of the most basic networking commands on Linux. The ifdown command turns off all network interfaces and the ifup command turns them on.

The ifup and ifdown commands come with the ifupdown package. By default, it doesn’t come with Ubuntu. Thankfully, it’s directly available from the official Ubuntu repo. Install them right away.

$ sudo apt update && sudo apt install ifupdown -y

![](https://linuxhint.com/wp-content/uploads/2020/09/word-image-804.png)

Once the installation is complete, perform the network restart.

$ sudo ifdown -a
 $ sudo ifup -a

It’s a good practice to combine both commands in a single line.

$ sudo ifdown -a && sudo ifup -a

### Restart network using nmtui

The nmtui tool is yet another network management tool that’s widely popular among system admins. Unlike the other CLI tools, it offers an interactive way of managing network connections that’s similar to the GUI method.

In the case of Ubuntu 20.04, it comes by default. Launch the tool.

$ sudo nmtui

![](https://linuxhint.com/wp-content/uploads/2020/09/word-image-805.png)

To navigate the tool, use the arrow keys. Select “Activate a connection”.

You’ll land on a screen with a list with all the network connections. Select the appropriate one and select “Deactivate”.

![](https://linuxhint.com/wp-content/uploads/2020/09/word-image-806.png)

Once deactivated, activate the connection.

![](https://linuxhint.com/wp-content/uploads/2020/09/word-image-807.png)

The network has been successfully restarted. Quit the application.

![](https://linuxhint.com/wp-content/uploads/2020/09/word-image-808.png)

### Restart network using IP command

The ip command is a powerful way of managing the network connections on Linux. It can be used for restarting the network connection. This method is applicable to any Linux distro.

To work with the ip command, first, we need to know the target network interface. Use the following command for the network interface.

$ ip link show

![](https://linuxhint.com/wp-content/uploads/2020/09/word-image-809.png)

In my case, the target network interface is *enp0s3*. Let’s restart the network.

$ sudo ip link set enp0s3 down

![](https://linuxhint.com/wp-content/uploads/2020/09/word-image-810.png)

$ sudo ip link set enp0s3 up

![](https://linuxhint.com/wp-content/uploads/2020/09/word-image-811.png)

### Final thoughts

Restarting the network is a common solution to various network-related problems. If it didn’t yet solve the issue, then the next recommended action is restarting the system. If the problem persists, then it’s worth investigating further.

Interested in learning more about network configuration? Check out this guide on [Ubuntu 20.04 network configuration](https://linuxhint.com/ubuntu_20-04_network_configuration/).

Enjoy!