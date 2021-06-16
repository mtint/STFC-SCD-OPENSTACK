Changing the password on the RHEL 7 kvm qcow2 download (links updated 3/15/2016)
================================================================================

June 8 2020 at 12:43 PM

*(Links updated / last reviewed March 15, 2016)*

Environment
-----------

* Freshly downloaded **RHEL7 qcow2 KVM image** to be a guest virtual system under KVM virtualization.
* **Red Hat Enterprise Linux 6** as the host system running KVM virtualization.
* This is in review for Fedora Linux as a host system running KVM virtualization (this review is not completed)

Introduction
------------

You will find you need to change the password if you download a RHEL 7 kvm qcow2 image. This discussion goes into two different methods to do this. Make a note in the discussion area if you happen to have any suggestions etc...

Red Hat Enterprise Linux 7.x is [now Generally Available (GA) *(getting started guide)*](https://access.redhat.com/site/products/red-hat-enterprise-linux/get-started) and available including in a qcow2 KVM image at the [Red Hat Enterprise Linux product page *(NOTE: a subscription is required, and this link is subject to change*)](https://access.redhat.com/downloads/content/69/ver=/rhel---7/7.1/x86_64/product-downloads). The image is approximately 5 GB). You have to "root the system" after attaching it to a KVM session.

### Download 7.2 KVM image at:

* Use [this link](https://access.redhat.com/downloads/content/69/ver=/rhel---7/7.2/x86_64/product-software) to download 7.2 RHEL qcow2 image (link last checked 3/15/2016)

### Method 1, Red Hat Documentation, Recovering Root Password (with grub 2)

See [Red Hat Enterprise Linux 7 System Administrator's Guide: Changing and Resetting the Root Password](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/System_Administrators_Guide/sec-Terminal_Menu_Editing_During_Boot.html#sec-Changing_and_Resetting_the_Root_Password).

### Method 2 - Using "guestfish" to change the Password for the root account

You can use guestfish to edit a running system under KVM virtualization:
- You can use "guestfish" to edit the /etc/shadow file and change the root password.
- *[Guestfish is an interactive shell that you can use from the command line or from shell scripts to access guest virtual machine file systems](https://access.redhat.com/site/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Virtualization_Deployment_and_Administration_Guide/sect-Guest_virtual_machine_disk_access_with_offline_tools-The_guestfish_shell.html). (See example below)*:

* If needed, first install the guestfish rpm.
* **Red Hat Enterprise Linux 7.x** *(This command will **not** work on Fedora, If you are using Fedora Linux, see next block)*

```
yum -y install guestfish

```

**Thanks Ben Woodard from Red Hat FEDORA LINUX 20**

```
# yum -y install libguestfs-tools

```

* Import the qcow2 image into KVM. The image will be named something along the lines of: "rhel-guest-image-7.1-20150224.0.x86\_64.qcow2", ***(as of July 2nd, 2015, the version will of course change over time)***
  * Change the password on the newly imported KVM to get on the pre-built system.

**Example steps to change the root password using guestfish:**
- This set of instructions is for use on the host system that has the kvm RHEL 7 guest. [The following is from Red Hat solution ID 641193](https://access.redhat.com/site/solutions/641193)
- The syntax is: guestfish --rw -a \<image-name\>
- *(Note, your system may be /dev/vda1, mine was /dev/sda1\. Use the 'list-filesystems' command)*

```

root@box1 # guestfish --rw -a ./rhel-guest-image-7.1-20150224.0.x86_64.qcow2
><fs> run
><fs> list-filesystems
><fs> mount /dev/sda1 /
><fs> vi /etc/shadow

NOTE: after you perform the following steps you use "quit" to exit. 
DO NOT EXIT NOW, proceed with the following steps

```

* Replace the encrypted password *(add it while you are still in vi)*.
This will set the password for the image permanently.
* An encrypted password can be created using the openssl command *(see an example below)*.

**NOTE: Open a separate terminal window to create an encrypted password with the openssl command** *(see example just below)*

Separate window, different terminal window
------------------------------------------

```
[root@someothersystem ~]# openssl passwd -1 changeme
$1$QiSwNHrs$uID6S6qOifSNZKzfXsmQG1

```

* There is a vi session open from the guestfish session mentioned above.
* Copy the output of the openssl command above and appropriately place it into the /etc/shadow file you have opened with vi.

When done type "quit"