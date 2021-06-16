Objective
---------

You can add custom images via the OpenStack Horizon interface. For example, you can use it to import images from your old virtual machines to the Public Cloud, provided that they are in a compatible format.

**This guide explains the steps for creating, launching and deleting images in the Horizon interface, which is used to manage OVHcloud services.**

Requirements
------------

* access to the Horizon interface
* access to the Images menu in the OpenStack Horizon interface

![public-cloud](resources/F2BF83A65A59D2B493CFE159D1ABAEEE.png)

Instructions
------------

### Manage the images

* By default, if no images have been created, the list of default public images appears:

![public-cloud](resources/1DE07EB87F0F15C4E18229429DD35C57.png)

* You can then launch an image from a URL, or create a custom image by clicking the Create Image button, which opens the following menu:

![public-cloud](resources/C4D46A8E6BB4C79E3234F2357786FF4D.png)

* Image name (\*)
* Image description
* Image file (Send from your local desktop)
* Image format (\*):

|—|—| |AKI|Amazon Kernel Image| |AMI|Amazon Machine Image| |ARI|Amazon Ramdisk Image| |ISO|ISO 9660| |QCOW2|QEMU Emulator| |RAW|Raw Disk Image| |VDI|VirtualBox format| |VHD|Microsoft format| |VMDK|VMware format|

* Architecture: x86\_64
* Minimum disk space (in GB): if not specified, the default value will be 0.
* Minimum RAM (in MB): if not specified, the default value will be 0.

You can also define whether the image will be public, and whether its deletion will be protected. Once you have confirmed, the image is placed in a queue for creation:

![public-cloud](resources/E00003B10F1641AD6BADCB50C1647810.png)

You can click on the image name for details:

![public-cloud](resources/DF2E32171546776DB4C1A90A2646DD8E.png)

In the **Actions** column, you can:

* launch the image selected in order to create an instance - when you do this, the menu appears

![public-cloud](resources/D02C018418B1AEA6216DEA6F20C5C63A.png)

* edit the image details (only for images you have created)
* delete the image (only for the images you have created), and you are asked to confirm

![public-cloud](resources/1E3A2694587F70D0A5E0C3EE9B953839.png)

Go further
----------

Join our community of users on <https://community.ovh.com/en/>.

### Did you find this guide useful?

### These guides might also interest you…