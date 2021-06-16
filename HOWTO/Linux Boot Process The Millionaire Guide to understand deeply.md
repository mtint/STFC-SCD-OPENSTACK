As a Administrator we have to know Linux boot process which help us to troubleshoot if Linux server struck up in booting. In new version of Linux like RHEL 7 / Centos 7 / Fedora 24 Linux Boot process made very faster compare to old versions. New version of Linux includes **systemd** which is replacement for Init.

Systemd is introduced as a first modification still it support init scripts as backward compatibility symbolic link from /sbin/init –\> /usr/lib/systemd/systemd.

**What’s New in Systemd**

1. Service level dependency defined to make boot process faster
2. All services / Processes will start as a control groups not by PID’s, Control groups adds an tag to all components of a service which make sure that all its components started properly
3. Systemd as a full control to restart crashed services and its components

Let’s See Linux Boot Process in detailed
----------------------------------------

[![Linux boot process](https://arkit.co.in/wp-content/uploads/2016/07/Linux-boot-process-275x300.png)](https://arkit.co.in/wp-content/uploads/2016/07/Linux-boot-process.png)

Linux boot process

Step 1: Power ON
----------------

When you press on power on button SMPS (switch mode power supply) will get an signal to power on, immediate after it PGS (Power on boot signal) will execute to get power to all components.

Step 2: POST 
-------------

(Power-on-Self-Test) is diagnostic testing sequence all the computer parts will diagnose there own.

Step 3: BIOS
------------

 (Basic Input Output System) BIOS is program which verifies all the attached components and identifies device booting order

[![Boot Device Order](https://arkit.co.in/wp-content/uploads/2016/07/Boot-Device-Order.png)](https://arkit.co.in/wp-content/uploads/2016/07/Boot-Device-Order.png)

Boot Device Order

Based on device order BIOS will first boot device, in this case we are considering as HDD as first boot device.

Step 4: MBR
-----------

(Master Boot Record) contains **Boot Loader, Partition information and Magic Blocks**

[![MBR Size 52bytes](https://arkit.co.in/wp-content/uploads/2016/07/MBR-Size-52bytes-300x75.png)](https://arkit.co.in/wp-content/uploads/2016/07/MBR-Size-52bytes.png)

MBR Size 52bytes

* Boot loader – contains boot loader program which is 446 bytes in size.
* 64 Bytes of partition information will be located under MBR, which will provide / redirects to actual /boot partition path to find GRUB2
* 2bytes are magic bytes to identify errors

Step 5: GRUB
------------

(Grand Unified Boot Loader) configuration file located in /boot/grub2/grub.cfg which actually points to **initramfs **is initial RAM disk, initial root file system will be mounted before real root file system.

Basically initramfs will load block device drivers such as SATA, RAID .. Etc. The initramfs is bound to the kernel and the kernel mounts this initramfs as part of a two-stage boot process.

Step 6: KERNEL
--------------

GRUB2 config file will invoke boot menu when boot is processed, kernel will load. When kernel loading completes it immediately look forward to start processes / Services.

Step 7 : Starting Systemd the first system process
--------------------------------------------------

After that, the systemd process takes over to initialize the system and start all the system services. How systemd will start.

As we know before systemd there is no process / service exists. Systemd will be started by a system call fork( ); fork system call have an option to specify PID, that why systemd always hold PID 1.

As there is no sequence to start processes / Services, based on **default.target** will start. If lot many services enabled in default.target boot process will become slow.

Step 8: User Interface (UI) 
----------------------------

Once that’s done, the “Wants” entry tells systemd to start the **display-manager.service service** (/etc/systemd/system/display-manager.service), which runs the GNOME display manager.

Your User interface start and prompt you for credential to login.

Below are the commands to know time of booting process taken

    [root@server ~]# systemd-analyze time
    Startup finished in 1.895s (kernel) + 2.622s (initrd) + 20.402s (userspace) = 24.919s

    [root@server ~]# systemd-analyze blame
     6.850s firewalld.service
     5.714s mariadb.service
     5.509s tuned.service
     5.350s plymouth-quit-wait.service

Thanks for the Read.

Please do comment your feedback which is more important to us.

[Getting Started with systemctl](https://arkit.co.in/centos/systemctl-command/)
 [Squid proxy Server installation and configuration Step by Step Guide](https://arkit.co.in/linux/squid-proxy-server/)

**Thanks for your wonderful Support and Encouragement **

* [Get Email](https://feedburner.google.com/fb/a/mailverify?uri=arkit) | [Download E-Books](https://arkit-in.tradepub.com/)
* [Facebook Page](https://www.facebook.com/Linuxarkit)
* [Youtube Channel](https://www.youtube.com/Techarkit?sub_confirmation=1)
* [Twitter](https://twitter.com/aravikumar48)
* [Exclusive Telegram Group](https://t.me/Linuxarkit)
* [Discuss On WhatsApp Group](https://github.com/techarkit/TechArkit-YouTube/blob/master/whatsapp_group.md)

More than 40000 Techies in our community do you want part of it Join Now