**Last updated 2nd December 2019**

Objective
---------

You can create a backup of your instance at any time via the [OVHcloud Control Panel](https://www.ovh.com/auth/?action=gotomanager&from=https://www.ovh.co.uk/&ovhSubsidiary=GB). You can then use this backup to restore your instance to an old configuration, or recreate it.

**Create a backup of a Public Cloud in just a few clicks.**

Requirements
------------

* an [OVHcloud Public Cloud instance](https://docs.ovh.com/gb/en/public-cloud/create_an_instance_in_your_ovh_customer_account/)
* access to the [OVHcloud Control Panel](https://www.ovh.com/auth/?action=gotomanager&from=https://www.ovh.co.uk/&ovhSubsidiary=GB)

Instructions
------------

### Create a backup of an instance.

Log in to the [OVHcloud Control Panel](https://www.ovh.com/auth/?action=gotomanager&from=https://www.ovh.co.uk/&ovhSubsidiary=GB), and select the Public Cloud tab from the `Instances` section.

Next, click on the `...` button to the right of the instance, then `Create a backup`.

![public-cloud-instance-backup](resources/2338BC0F201478BD4ED33C6BCF7BCA3A.png)

Enter a name for the backup on the next page.

![public-cloud-instance-backup](resources/1E12097704D076752B8336295EEE9681.png)

Once the backup has been created, it will be available in the `Instance Backup` section.

![public-cloud-instance-backup](resources/55B82E043960133B85C99E8BAE5C1640.png)

### Create an automated backup of an instance.

In the `Instances` section, select `Create an automatic backup` in the list of available actions you can perform on the instance.

![public-cloud-instance-backup](resources/F222EA22B4F5A67662CB9C47CF92F471.png)

You will need to enter the following information on the next page:

#### **The workflow.**

Currently, only one workflow exists. It will make a backup for the instance and its primary volume.

![public-cloud-instance-backup](resources/885BD900A8734918974EA6C96FB95F41.png)

#### **The resource.**

Simply select the instance you want to back up.

![public-cloud-instance-backup](resources/FA79BA6F15AF7F0FCE7FD468816CBC0B.png)

#### **The schedule.**

Here, you need to define the frequency with which backups are made. There are two default options:

* daily backup with a log of 7 days maximum
* daily backup with a log of 14 days maximum

![public-cloud-instance-backup](resources/52364A8A16751D37A667096B1FB8A4B1.png)

#### **The name.**

This is where you set a name for the backup task. 

![public-cloud-instance-backup](resources/2CB58D377DC80942E5FEE7B608739FA6.png)

Once you have created it, go to the `Workflow Management` section:

![public-cloud-instance-backup](resources/E1A47F44296B64591F82DFF818F319A2.png)

Your backups will be available in the `Instance Backup` section, and are billed in accordance with the solution you are using.

Go further
----------

Join our community of users on <https://community.ovh.com/en/>.

### Did you find this guide useful?

### These guides might also interest you…