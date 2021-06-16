Let’s look at how you can update or change your SSH key Passphrase on a Linux system. SSH keys are often used to authenticate users to some kind of information systems. The SSH keys themselves are private keys; the private key is further encrypted using a symmetric encryption key derived from a passphrase. It is easy to change your SSH Key passphrase on a Linux/Unix system.

What is SSH Key Passphrase?
---------------------------

A passphrase is similar to a password and is used to secure your SSH private key from unauthorized access and usage. It is always recommended to set a strong Passphrase for your SSH keys, with at least 15, preferably 20 characters and be difficult to guess.

How to Change or update SSH key Passphrase on Linux / Unix
----------------------------------------------------------

At times you may need to update your SSH key passphrase or set one if you didn’t set at the time of generating your SSH keys.

As an example, let’s generate SSH key without a passphrase:

    # ssh-keygen 
    Generating public/private rsa key pair.
    Enter file in which to save the key (/root/.ssh/id_rsa): 
    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved in /root/.ssh/id_rsa.
    Your public key has been saved in /root/.ssh/id_rsa.pub.
    The key fingerprint is:
    SHA256:1gSD3mPgxaD0C88YLU+TdYs2T3nBO5ttK5Jj0bvz0gs root@ubuntu-01
    The key's randomart image is:
    +---[RSA 2048]----+
    |    . .++ ...    |
    |   . +ooo= o..   |
    |    =o*++ = ..   |
    |     Xo++* .o    |
    |    . =.S.o. =   |
    |       .  . + o  |
    |           oE+ . |
    |          = =.o  |
    |         . o.*o. |
    +----[SHA256]-----+

Now use the command below to set a passphrase:

    # ssh-keygen -p -f ~/.ssh/id_rsa
    Enter new passphrase (empty for no passphrase): <Enter passphrase>
    Enter same passphrase again:<Retype passphrase>
    Your identification has been saved with the new passphrase.

If using a custom path for the private key, replace `~/.ssh/id_rsa` with the path to your private key.

The same command applies when resetting the passphrase, you will be asked for the old one, and the new one to set.

    # ssh-keygen -p -f ~/.ssh/id_rsa
    Enter old passphrase: <Enter old passphrase>
    Enter new passphrase (empty for no passphrase): <Enter new passphrase> 
    Enter same passphrase again: <Retype new passphrase>
    Your identification has been saved with the new passphrase.

### Testing new passphrase

To test that your new passphrase is working, copy ssh public key to a remote server and try to ssh with it.

    $ ssh-copy-id root@10.10.5.4
    Enter passphrase for key '/home/jmutai/.ssh/id_rsa': 
    Now try logging into the machine, with "ssh 'root@10.10.5.4'", and check in:
    .ssh/authorized_keys
    to make sure we haven't added extra keys that you weren't expecting.

Save private key passphrase
---------------------------

With ssh, you can configure authentication agent to save **passphrase** so that you won’t have to re-enter your passphrase every time you use your SSH keys.

    # Start agent on demand
    eval $(ssh-agent) 

    # Add default key
    ssh-add 

    # List keys
    ssh-add -l 

    # Add specific key
    ssh-add ~/.ssh/id_rsa 

    # Add with timeout
    ssh-add -t 3600 ~/.ssh/id_rsa

    # Drop keys
    ssh-add -D 

For a complete guide on how to use SSH, check[ SSH cheatsheet for Linux SysAdmins](https://computingforgeeks.com/ssh-cheatsheet-for-sysadmins/)

More Articles related to SSH

[How To Disable SSH reverse DNS Lookups in Linux/Unix system](https://computingforgeeks.com/how-to-disable-ssh-reverse-dns-lookups-in-linux-unix-system/)

[How To Set Up Two factor (2FA) Authentication for SSH on CentOS / RHEL](https://computingforgeeks.com/how-to-set-up-two-factor-2fa-authentication-for-ssh-on-centos-rhel-8-7/)

[Easy way to Create SSH tunnels on Linux CLI](https://computingforgeeks.com/easy-way-to-create-ssh-tunnels-on-linux-cli/)

[Installing sshfs and using sshfs on Ubuntu / Fedora / Arch / CentOS](https://computingforgeeks.com/installing-using-sshfs-ubuntu-fedora-arch-centos/)

[ssh cheatsheet for Linux SysAdmins](https://computingforgeeks.com/ssh-cheatsheet-for-sysadmins/)

[Adding ssh key pair to Openstack using cli](https://computingforgeeks.com/adding-keypairs-to-openstack-using-cli/)

[i3 ssh configuration to unlock without passphrase](https://computingforgeeks.com/configure-i3-ssh-passphrase/)