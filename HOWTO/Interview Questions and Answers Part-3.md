### Which version of RHEL officially supports LUKS encryption?

 From version 6 or higher LUKS encryption is officially supported by RHEL.

### What is the default virtualization technology for RHEL6 ?

 Default virtualization technology is KVM.

### Can you configure KVM Virtual machine on 32 bit system ?

 No, KVM virtualization requires at least 64 bit system.

### What is default mode of SELinux during the installation of RHEL ?

* In RHEL5 you have to choose the mode which you want.
* From RHEL6 default mode is Enforcing during the installation.

 However you can change the mode of SELinux after installation, only difference between RHEL5 and RHEL6 is that in RHEL5 asks you to choose the mode while RHEL6 does not let you to choose the mode during the installation.

### Which remote management service is allowed through the default firewall and by default installed in RHEL?

 By default SSH is always installed in RHEL. SSH uses port 22 which is allowed through the default firewall rules.

### Which standard directory is used by vsFTP server for file sharing ?

 Default Standard directory for ftp is /var/ftp/pub.

### Which standard directory is used by Apache web server for HTML files ?

 standard directory for HTML files is /var/www/html

### What is the default partition layout during the installation ?

 Default partition Layout is the LVM.

### Which necessary partition cannot be a part of logical volume group ?

 boot partition cannot be a part of logical volume group. You must have create it as a regular partition.

### Which partitions are recommended for custom layout of partition ?

* /
* /boot
* /home
* swap

### What step during the installation could you take to prevent a program from creating temporary files that fill up the entire space ?

 You can create a separate /tmp partition prevents a program from creating temporary files that fill up the entire filesystem.

### What is the kickstart ?

 kickstart is a installation method used in RHEL. A kickstart installation is started from a kickstart file, which contains the answers to all the questions in the installation program.

### Name any of two third party distribution based on RHEL6 source code.

 CentOS and Scientific Linux

### Which Log file contains all installation message?

 install.log.syslog file contains all messages that were generated during the installation.