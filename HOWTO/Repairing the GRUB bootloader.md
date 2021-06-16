**Last updated 23rd November 2020**

Objective
---------

In some cases you might need to repair the GRUB bootloader. This guide will show you how to easily repair the bootloader and successfully reboot your instance.

Requirements
------------

* The instance must be in rescue mode (see [Putting an instance in rescue mode](https://docs.ovh.com/gb/en/public-cloud/put_an_instance_in_rescue_mode)).

Instructions
------------

Connect to the instance, either via VNC in the [OVHcloud Control Panel](https://www.ovh.com/auth/?action=gotomanager&from=https://www.ovh.co.uk/&ovhSubsidiary=GB) or via SSH.

Type the following commands to mount the remote file system and start GRUB repairs:

    mount /dev/sdb1 /mnt
    mount -o bind /proc /mnt/proc
    mount -o bind /sys /mnt/sys
    mount -o bind /dev /mnt/dev
    chroot /mnt /bin/bash

### Update GRUB (or GRUB2)

For GRUB installs:

    grub-install /dev/sdb
    update-grub

For GRUB2 installs:

    grub2-install /dev/sdb
    grub2-mkconfig -o /boot/grub2/grub.cfg

You can now leave the rescue mode and boot normally (see [Putting an instance in rescue mode](https://docs.ovh.com/gb/en/public-cloud/put_an_instance_in_rescue_mode)).

Go further
----------

Join our community of users on <https://community.ovh.com/en/>.

### Did you find this guide useful?

### These guides might also interest you…