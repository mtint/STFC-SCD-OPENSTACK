**Last updated 8th April 2020**

Objective
---------

Your Public Cloud instance may become inaccessible due to a lost SSH key or configuration errors.

In such circumstances, you can use the rescue mode to reconfigure your instance or to recover your data. 

**This guide will explain how to put your OVHcloud Public Cloud instance in rescue mode and access your data.**

Requirements
------------

* a [Public Cloud instance](https://www.ovhcloud.com/en-gb/public-cloud/) in your OVHcloud account
* access to the [OVHcloud Control Panel](https://www.ovh.com/auth/?action=gotomanager&from=https://www.ovh.co.uk/&ovhSubsidiary=GB)
* administrative access (root) to your instance via SSH

Instructions
------------

### Step 1: Activating rescue mode

First, log in to the [OVHcloud Control Panel](https://www.ovh.com/auth/?action=gotomanager&from=https://www.ovh.co.uk/&ovhSubsidiary=GB), go to the `Public Cloud` section and select the Public Cloud service concerned. Then, click on the `Instances` tab in the left-hand navigation.

![control panel](resources/909F65B5357415C5BC72010FB2FF4A42.png)

Next, click on `...` to the right of the instance and select `Reboot in rescue mode`

![control panel](resources/CCB28A3EAB788CE4C9D05ECC92DC3E98.png)

You will now see the ‘Reboot in rescue mode’ dialog box. Click the dropdown list to select the distribution you would like to use in rescue mode and then click the `Restart` button.

![control panel](resources/22F657D1FA4D4C350C3E8A74D59AA404.png)

Once your instance has been rebooted in rescue mode, a message will appear at the top of the screen, containing your temporary password.

![control panel](resources/8E92E1E598592696B3B9ED6CAA7E4D7B.png)

### Step 2: Accessing your data

When rescue mode has been activated, your instance’s data will be attached as an additional disk. You will now need to mount it, by taking the following steps.

First, establish an SSH connection to your instance. Once you are connected, verify the available disks with this command:

    root@instance:/home/admin# lsblk

    NAME MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
    vda 253:0 0 1G 0 disk
    └─vda1 253:1 0 1023M 0 part /
    vdb 253:16 0 10G 0 disk
    └─vdb1 253:17 0 10G 0 part

Next, mount the partition:

    root@instance:/home/admin# mount /dev/vdb1 /mnt

Your data will now be accessible from the /mnt folder.

### Deactivating rescue mode

Once you have completed your tasks, you can deactivate rescue mode by rebooting your instance from the Control Panel interface. To execute this, click on on `...` and select `Exit rescue mode`.

![control panel](resources/6626EE779D424DE615635A78739BD371.png)

### Activating rescue mode using the OpenStack API

You can also activate rescue mode via the OpenStack API using the following command:

    # root@server:~# nova rescue INSTANCE_ID

To exit rescue mode, use the following command:

    # root@server:~# nova unrescue INSTANCE_ID

Go further
----------

Join our community of users on <https://community.ovh.com/en/>.

### Did you find this guide useful?

### These guides might also interest you…