Create additional user(s) on OpenStack VM/Instance[](https://file+.vscode-resource.vscode-webview.net/Users/bbm17567/Documents/GIT%20HOME/cloud-docs/source/howto/AddUsersOpenStackVMInstance.rst#create-additional-user-s-on-openstack-vm-instance "Permalink to this headline")
=================================================================================================================================================================================================================================================================================

Introduction[](https://file+.vscode-resource.vscode-webview.net/Users/bbm17567/Documents/GIT%20HOME/cloud-docs/source/howto/AddUsersOpenStackVMInstance.rst#introduction "Permalink to this headline")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

This guide explains how to create users in Linux using the command line and the *useradd* command and grant administrator privileges using *sudo*.

The sudo command provides a mechanism for granting administrator privileges — ordinarily only available to the root user — to normal users.

This guide will show you how to create a new user with sudo access on Linux, without having to modify your server’s /etc/sudoers file.

Prerequisites[](https://file+.vscode-resource.vscode-webview.net/Users/bbm17567/Documents/GIT%20HOME/cloud-docs/source/howto/AddUsersOpenStackVMInstance.rst#prerequisites "Permalink to this headline")
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

* Valid Login and SSH or Console Access to VM
* Have sudo privileges
* VPN (if outside the network)

Adding Users[](https://file+.vscode-resource.vscode-webview.net/Users/bbm17567/Documents/GIT%20HOME/cloud-docs/source/howto/AddUsersOpenStackVMInstance.rst#adding-users "Permalink to this headline")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

1. Logging into you server

  > SSH in to your server as using your FEDADMIN user:
> 
>       %ssh FEDID@172.16.113.47
>       ____ _____ _____ ____    ____ _                 _
>     / ___|_   _|  ___/ ___|  / ___| | ___  _   _  __| |
>     \\\___ \\ | | | |_ | |     | |   | |/ _ \\| | | |/ _` |
>       ___) || | |  _|| |___  | |___| | (_) | |_| | (_| |
>     |____/ |_| |_|   \\\____|  \\\____|_|\\\___/ \\\__,_|\\\__,_|
> 
>               Location: r89.harwell.europe hpd r89rack241
>                 Branch: xfu59478/mr_build_centos_aq_image (sandbox)
>             Archetype: cloud
>           Personality: nubesvms
>       Operating System: centos7x-x86_64
>         Snapshot Date: 2019-05-20
2. Login as Root

  > Use the sudo command to login in as root:
> 
>       [FEDID@server1 ~]$ sudo su -
> 
>     [root@server1 ~]\#
3. Adding a New User to the System using the script (addusers.sh) below. Edit the script and save it.

  > declare -A KEYS
> 
>     KEYS[FEDID]="ssh-rsa xxxx"
> 
>     groupadd sshusers
> 
>     for FEDID in "${!KEYS[@]}"
>       do
>         SSH\_PUBLIC\_KEY=${KEYS[$FEDID]}
>         echo "Creating USER $FEDID"
>         echo "Adding KEY $SSH\_PUBLIC\_KEY"
>         echo " "
>         echo -n "Add $FEDID to sudo group (y/n)? "
>         read answer
>         if [ "$answer" != "${answer\#[Yy]}" ] ;then
>           useradd $FEDID -g wheel;
>           echo "$FEDID ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers;
>         else
>         useradd $FEDID;
>         fi
>         usermod -a -G sshusers $FEDID
>         mkdir /home/$FEDID/.ssh
>         echo "$SSH\_PUBLIC\_KEY" >> /home/$FEDID/.ssh/authorized_keys
>         chown -R $FEDID /home/$FEDID/.ssh
>         echo "User USER $FEDID Created"
>         echo " "
>     done
>         chmod 0440 /etc/sudoers

This script should only be run once.

User (FEDID) and SSH KEYS are stored in an Array with the format KEY[FEDID]=”SSH KEY”

    KEYS[cog12345]="ssh-rsa xxxxx"

After editing the script with users and keys run by typing

    source addusers.sh

### Testing[](https://file+.vscode-resource.vscode-webview.net/Users/bbm17567/Documents/GIT%20HOME/cloud-docs/source/howto/AddUsersOpenStackVMInstance.rst#testing "Permalink to this headline")

Test by ssh to the server

    ssh mtint@172.16.113.47

    Last login: Thu Feb 25 23:10:27 2021 from vpn-3-065.rl.ac.uk
      ____ _____ _____ ____    ____ _                 _
    / ___|_   _|  ___/ ___|  / ___| | ___  _   _  __| |
    \\\___ \\ | | | |_ | |     | |   | |/ _ \\| | | |/ _` |
      ___) || | |  _|| |___  | |___| | (_) | |_| | (_| |
    |____/ |_| |_|   \\\____|  \\\____|_|\\\___/ \\\__,_|\\\__,_|

              Location: r89.harwell.europe hpd r89rack241
                Branch: xfu59478/mr_build_centos_aq_image (sandbox)
            Archetype: cloud
          Personality: nubesvms
      Operating System: centos7x-x86_64
        Snapshot Date: 2019-05-20

      Notice: Core software packages have been updated, a system reboot is required for them to take effect.

    %id mtint
    uid=1002(mtint) gid=10(wheel) groups=10(wheel),1001(sshusers)

Check sudo privilege

    sudo su -
    Last login: Thu Feb 25 22:09:53 UTC 2021 on pts/1
      Notice: Core software packages have been updated, a system reboot is required for them to take effect.

    [root@server1 ~]\#

### Conclusion[](https://file+.vscode-resource.vscode-webview.net/Users/bbm17567/Documents/GIT%20HOME/cloud-docs/source/howto/AddUsersOpenStackVMInstance.rst#conclusion "Permalink to this headline")

You have now successfully created user(s) on COG OpenStack VM/Instance.

If your having problems [Contact Support](https://file+.vscode-resource.vscode-webview.net/Users/bbm17567/Documents/GIT%20HOME/cloud-docs/source/_build/html/contact.html%2523contact-email "https://file%2B.vscode-resource.vscode-webview.net/Users/bbm17567/Documents/GIT%20HOME/cloud-docs/source/_build/html/contact.html%23contact-email")