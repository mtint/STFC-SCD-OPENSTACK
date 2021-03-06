[Source](https://itsfoss.com/restart-network-ubuntu/ "Permalink to How to Restart Network in Ubuntu [Command Line & GUI]")

You’re [using an Ubuntu-based system and you just can’t seem to connect to your network](https://itsfoss.com/fix-no-wireless-network-ubuntu/)? You’d be surprised how many problems can a simple restart fix.

In this article, I’ll go over multiple ways you can restart network in Ubuntu and other Linux distributions, so you can use whatever suits your needs. The methods are basically divided into two parts:

* [Restart Ubuntu network in command line](https://itsfoss.com/restart-network-ubuntu/#command-line)
* [Restart Ubuntu network via GUI](https://itsfoss.com/restart-network-ubuntu/#via-gui)

![Ubuntu Restart Network](https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/ubuntu-restart-network.png?resize=800%252C450&ssl=1)

## Restart network in Ubuntu using command line

If you are using Ubuntu server edition, you are already in the terminal. If you are using the desktop edition, you can access the terminal using Ctrl+Alt+T [keyboard shortcut in Ubuntu](https://itsfoss.com/ubuntu-shortcuts/).

Now you have several commands at your disposal to restart network in Ubuntu. Some (or perhaps most) commands mentioned here should be applicable for restarting network in Debian and other Linux distributions as well.

### 1\. network manager service

This is the easiest way to restart your network using the command line. It’s equivalent to the graphical way of doing it (restarts the Network-Manager service).

    sudo service network-manager restart

The network icon should disappear for a moment and then reappear.

### 2\. systemd

The **service** command is just a wrapper for this method (and also for init.d scripts and Upstart commands). The **systemctl** command is much more versatile than **service**. This is what I usually prefer. 

    sudo systemctl restart NetworkManager.service

The network icon (again) should disappear for a moment. To check out other **systemctl** options, you can refer to its man page.

### 3\. nmcli

This is yet another tool for handling networks on a Linux machine. It is a pretty powerful tool that I find very practical. Many sysadmins prefer it since it is easy to use.

There are two steps to this method: turning the network off, and then turning it back on.

    sudo nmcli networking off

The network will shut down and the icon will disappear. To turn it back on:

    sudo nmcli networking on

You can check out the man page of nmcli for more options.

### 4\. ifup & ifdown

This commands handle a network interface directly, changing it’s state to one in which it either can or can not transmit and receive data. It’s one of the [must know networking commands in Linux](https://itsfoss.com/basic-linux-networking-commands/).

To shut down all network interfaces, use ifdown and then use ifup to turn all network interfaces back on.

A good practice would be to combine both of these commands:

    sudo ifdown -a && sudo ifup -a

**Note:** *This method will not make the network icon in your systray disappear, and yet you won’t be able to have a connection of any sort.*

**Bonus tool: nmtui (click to expand)**

This is another method often used by system administrators. It is a text menu for managing networks right in your terminal.

    nmtui

This should open up the following menu:

![nmtui Menu](https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmtui_menu.png?fit=800%252C602&ssl=1&is-pending-load=1)

**Note** that in **nmtui**, you can select another option by using the **up** and **down arrow keys**. 

Select **Activate a connection**:

![nmtui Menu Select "Activate a connection"](https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmtui_menu_select_option.png?fit=800%252C579&ssl=1&is-pending-load=1)

Press **Enter**. This should now open the **connections** menu.

![nmtui Connections Menu](https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmui_connection_menu_on.png?fit=800%252C585&ssl=1&is-pending-load=1)

Here, go ahead and select the network with a **star (\*)** next to it. In my case, it’s MGEO72.

![Select your connection in the nmtui connections menu.](https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmui_select_connection_on.png?fit=800%252C576&ssl=1&is-pending-load=1)

Press **Enter**. This should **deactivate** your connection.

![nmtui Connections Menu with no active connection](https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmui_connection_menu_off.png?fit=800%252C572&ssl=1&is-pending-load=1)

Select the connection you want to activate:

![Select the connection you want in the nmtui connections menu.](https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmui_select_connection_off.png?fit=800%252C566&ssl=1&is-pending-load=1)

Press **Enter**. This should reactivate the selected connection.

![nmtui Connections Menu](https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmui_connection_menu_on-1.png?fit=800%252C585&ssl=1&is-pending-load=1)

Press **Tab** twice to select **Back**:

![Select "Back" in the nmtui connections menu.](https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmui_connection_menu_back.png?fit=800%252C585&ssl=1&is-pending-load=1)

Press **Enter**. This should bring you back to the **nmtui** main menu.

![nmtui Main Menu](https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmtui_menu_select_option-1.png?fit=800%252C579&ssl=1&is-pending-load=1)

Select **Quit**:

![nmtui Quit Main Menu](https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/nmui_menu_quit.png?fit=800%252C580&ssl=1&is-pending-load=1)

This should exit the application and bring you back to your terminal.

That’s it! You have successfully restarted your network

## Restart network in Ubuntu graphically

This is, of course, the easiest way of restarting the network for Ubuntu desktop users. If this one doesn’t work, you can of course check the command line options mentioned in the previous section.

NM-applet is the system tray applet indicator for [NetworkManager](https://wiki.gnome.org/Projects/NetworkManager). That’s what we’re going to use to restart our network.

First of all, check out your top panel. You should find a network icon in your system tray (in my case, it is a Wi-Fi icon, since that’s what I use).

Go ahead and click on that icon (or the sound or battery icon). This will open up the menu. Select “Turn Off” here.

![Restart network in Ubuntu](https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/restart-network-ubuntu-1.jpg?resize=800%252C400&is-pending-load=1#038;ssl=1)Turn off your network

The network icon should now disappear from the top panel. This means the network has been successfully turned off.

Click again on your systray to reopen the menu. Select “Turn On”.

![Restarting network in Ubuntu](https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/restart-network-ubuntu-2.jpg?resize=800%252C400&is-pending-load=1#038;ssl=1)Turn the network back on

Congratulations! You have now restarted your network.

### Bonus Tip: Refresh available network list

Suppose you are connected to a network already but you want to connect to another network. How do you refresh the WiFi to see what other networks are available? Let me show you that.

Ubuntu doesn’t have a ‘refresh wifi networks’ option directly. It’s sort of hidden.

You’ll have to open the setting menu again and this time, click on “Select Network”.

![Refresh wifi network list in Ubuntu](https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/select-wifi-network-ubuntu.jpg?resize=800%252C400&is-pending-load=1#038;ssl=1)Select Network to change your WiFi connection

Now, you won’t see the list of available wireless networks immediately. When you open the networks list, it takes around 5 seconds to refresh and show up other available wireless networks.

![Select another wifi network in Ubuntu](https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/select-wifi-network-ubuntu-1.jpg?resize=800%252C400&is-pending-load=1#038;ssl=1)Wait for around 5- seconds to see other available networks

And here, you can select the network of your choice and click connect. That’s it.

**Wrapping Up**

Restarting your network or connection is something that every Linux user has to go through at some point in their experience. 

We hope that we helped you with plenty of methods for handling such issues! 

What do you use to restart/handle your network? Is there something we missed? Leave us a comment below.

208Shares

* [Facebook 174](https://itsfoss.com/restart-network-ubuntu/#)
* [Twitter 28](https://itsfoss.com/restart-network-ubuntu/#)
* [LinkedIn 0](https://itsfoss.com/restart-network-ubuntu/#)
* [Reddit 0](https://itsfoss.com/restart-network-ubuntu/#)
* [Pocket 0](https://itsfoss.com/restart-network-ubuntu/#)