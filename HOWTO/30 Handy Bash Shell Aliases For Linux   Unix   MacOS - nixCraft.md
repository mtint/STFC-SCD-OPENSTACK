An **bash shell alias** is nothing but the shortcut to commands. The alias command allows the user to launch any command or group of commands (including options and filenames) by entering a single word. Use alias command to display a list of all defined aliases. You can add user-defined aliases to [~/.bashrc](https://bash.cyberciti.biz/guide/~/.bashrc) file. You can cut down typing time with these aliases, work smartly, and increase productivity at the command prompt.

 This post shows how to create and use aliases including 30 practical examples of bash shell aliases.
[![](data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ1MCIgd2lkdGg9IjU5OSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=)![30 Useful Bash Shell Aliase For Linux/Unix Users](resources/4C240D39B5CAAAE1A2FBE49C422A12E7.jpg)](https://www.cyberciti.biz/tips/wp-content/uploads/2012/06/Getting-Started-With-Bash-Shell-Aliases-For-Linux-Unix.jpg)

More about bash shell aliases
-----------------------------

The general syntax for the alias command for the bash shell is as follows:

### How to list bash aliases

Type the following [alias command](https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html):
`alias`
 Sample outputs:

    alias ..='cd ..'
    alias amazonbackup='s3backup'
    alias apt-get='sudo apt-get'
    ...

By default alias command shows a list of aliases that are defined for the current user.

### How to define or create a bash shell alias

To [create the alias](https://bash.cyberciti.biz/guide/Create_and_use_aliases) use the following syntax:

    alias name=value
    alias name='command'
    alias name='command arg1 arg2'
    alias name='/path/to/script'
    alias name='/path/to/script.pl arg1'

In this example, create the alias **c** for the commonly used clear command, which clears the screen, by typing the following command and then pressing the ENTER key:

    alias c='clear'

Then, to clear the screen, instead of typing clear, you would only have to type the letter ‘c’ and press the [ENTER] key:

    c

### How to disable a bash alias temporarily

An [alias can be disabled temporarily](https://www.cyberciti.biz/faq/bash-shell-temporarily-disable-an-alias/) using the following syntax:

    ## path/to/full/command
    /usr/bin/clear
    ## call alias with a backslash ##
    \c
    ## use /bin/ls command and avoid ls alias ##
    command ls

### How to delete/remove a bash alias

You need to use the command [called unalias to remove aliases](https://bash.cyberciti.biz/guide/Create_and_use_aliases#How_do_I_remove_the_alias.3F). Its syntax is as follows:

    unalias aliasname
    unalias foo

In this example, remove the alias c which was created in an earlier example:

    unalias c

You also need to delete the alias from the [~/.bashrc file](https://bash.cyberciti.biz/guide/~/.bashrc) using a text editor (see next section).

### [How to make bash shell aliases permanent](https://www.cyberciti.biz/faq/create-permanent-bash-alias-linux-unix/)

The alias c remains in effect only during the current login session. Once you logs out or reboot the system the alias c will be gone. To avoid this problem, add alias to your [~/.bashrc file](https://bash.cyberciti.biz/guide/~/.bashrc), enter:

    vi ~/.bashrc

The alias c for the current user can be made permanent by entering the following line:

    alias c='clear'

Save and close the file. System-wide aliases (i.e. aliases for all users) can be put in the /etc/bashrc file. Please note that the alias command is built into a various shells including ksh, tcsh/csh, ash, bash and others.

### A note about privileged access

You can add code as follows in ~/.bashrc:

    # if user is not root, pass all commands via sudo #
    if [ $UID -ne 0 ]; then
        alias reboot='sudo reboot'
        alias update='sudo apt-get upgrade'
    fi

### A note about os specific aliases

You can add code as follows in ~/.bashrc [using the case statement](https://bash.cyberciti.biz/guide/The_case_statement):

    ### Get os name via uname ###
    _myos="$(uname)"

    ### add alias as per os using $_myos ###
    case $_myos in
       Linux) alias foo='/path/to/linux/bin/foo';;
       FreeBSD|OpenBSD) alias foo='/path/to/bsd/bin/foo' ;;
       SunOS) alias foo='/path/to/sunos/bin/foo' ;;
       *) ;;
    esac

30 bash shell aliases examples
------------------------------

You can define various types aliases as follows to save time and increase productivity.

### \#1: Control ls command output

The [ls command lists directory contents](https://www.cyberciti.biz/faq/ls-command-to-examining-the-filesystem/) and you can colorize the output:

    ## Colorize the ls output ##
    alias ls='ls --color=auto'

    ## Use a long listing format ##
    alias ll='ls -la'

    ## Show hidden files ##
    alias l.='ls -d .* --color=auto'

### \#2: Control cd command behavior

    ## get rid of command not found ##
    alias cd..='cd ..'

    ## a quick way to get out of current directory ##
    alias ..='cd ..'
    alias ...='cd ../../../'
    alias ....='cd ../../../../'
    alias .....='cd ../../../../'
    alias .4='cd ../../../../'
    alias .5='cd ../../../../..'

### \#3: Control grep command output

[grep command is a command-line utility for searching](https://www.cyberciti.biz/faq/howto-use-grep-command-in-linux-unix/) plain-text files for lines matching a regular expression:

    ## Colorize the grep command output for ease of use (good for log files)##
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'

### \#4: Start calculator with math support

    alias bc='bc -l'

### \#4: Generate sha1 digest

    alias sha1='openssl sha1'

### \#5: Create parent directories on demand

[mkdir command](https://www.cyberciti.biz/faq/linux-make-directory-command/) is used to create a directory:

    alias mkdir='mkdir -pv'

### \#6: Colorize diff output

You can [compare files line by line using diff](https://www.cyberciti.biz/faq/how-do-i-compare-two-files-under-linux-or-unix/) and use a tool called colordiff to colorize diff output:

    # install  colordiff package :)
    alias diff='colordiff'

### \#7: Make mount command output pretty and human readable format

    alias mount='mount |column -t'

### \#8: Command short cuts to save time

    # handy short cuts #
    alias h='history'
    alias j='jobs -l'

### \#9: Create a new set of commands

    alias path='echo -e ${PATH//:/\\n}'
    alias now='date +"%T"'
    alias nowtime=now
    alias nowdate='date +"%d-%m-%Y"'

### \#10: Set vim as default

    alias vi=vim
    alias svi='sudo vi'
    alias vis='vim "+set si"'
    alias edit='vim'

### \#11: Control output of networking tool called ping

    # Stop after sending count ECHO_REQUEST packets #
    alias ping='ping -c 5'
    # Do not wait interval 1 second, go fast #
    alias fastping='ping -c 100 -s.2'

### \#12: Show open ports

Use [netstat command](https://www.cyberciti.biz/faq/how-do-i-find-out-what-ports-are-listeningopen-on-my-linuxfreebsd-server/) to quickly list all TCP/UDP port on the server:

    alias ports='netstat -tulanp'

### \#13: Wakeup sleeping servers

[Wake-on-LAN (WOL) is an Ethernet networking](https://www.cyberciti.biz/tips/linux-send-wake-on-lan-wol-magic-packets.html) standard that allows a server to be turned on by a network message. You can [quickly wakeup nas devices](https://bash.cyberciti.biz/misc-shell/simple-shell-script-to-wake-up-nas-devices-computers/) and server using the following aliases:

    ## replace mac with your actual server mac address #
    alias wakeupnas01='/usr/bin/wakeonlan 00:11:32:11:15:FC'
    alias wakeupnas02='/usr/bin/wakeonlan 00:11:32:11:15:FD'
    alias wakeupnas03='/usr/bin/wakeonlan 00:11:32:11:15:FE'

### \#14: Control firewall (iptables) output

[Netfilter is a host-based firewall](https://www.cyberciti.biz/faq/rhel-fedorta-linux-iptables-firewall-configuration-tutorial/) for Linux operating systems. It is included as part of the Linux distribution and it is activated by default. This [post list most common iptables solutions](https://www.cyberciti.biz/tips/linux-iptables-examples.html) required by a new Linux user to secure his or her Linux operating system from intruders.

    ## shortcut  for iptables and pass it via sudo#
    alias ipt='sudo /sbin/iptables'

    # display all rules #
    alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
    alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
    alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
    alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
    alias firewall=iptlist

### \#15: Debug web server / cdn problems with curl

    # get web server headers #
    alias header='curl -I'

    # find out if remote server supports gzip / mod_deflate or not #
    alias headerc='curl -I --compress'

### \#16: Add safety nets 

    # do not delete / or prompt if deleting more than 3 files at a time #
    alias rm='rm -I --preserve-root'

    # confirmation #
    alias mv='mv -i'
    alias cp='cp -i'
    alias ln='ln -i'

    # Parenting changing perms on / #
    alias chown='chown --preserve-root'
    alias chmod='chmod --preserve-root'
    alias chgrp='chgrp --preserve-root'

### \#17: Update Debian Linux server

[apt-get command](https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html) is used for installing packages over the internet (ftp or http). You can also upgrade all packages in a single operations:

    # distro specific  - Debian / Ubuntu and friends #
    # install with apt-get
    alias apt-get="sudo apt-get"
    alias updatey="sudo apt-get --yes"

    # update on one command
    alias update='sudo apt-get update && sudo apt-get upgrade'

### \#18: Update RHEL / CentOS / Fedora Linux server

[yum command](https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/) is a package management tool for RHEL / CentOS / Fedora Linux and friends:

    ## distrp specifc RHEL/CentOS ##
    alias update='yum update'
    alias updatey='yum -y update'

### \#19: Tune sudo and su

    # become root #
    alias root='sudo -i'
    alias su='sudo -i'

### \#20: Pass halt/reboot via sudo

[shutdown command](https://www.cyberciti.biz/faq/howto-shutdown-linux/) bring the Linux / Unix system down:

    # reboot / halt / poweroff
    alias reboot='sudo /sbin/reboot'
    alias poweroff='sudo /sbin/poweroff'
    alias halt='sudo /sbin/halt'
    alias shutdown='sudo /sbin/shutdown'

### \#21: Control web servers

    # also pass it via sudo so whoever is admin can reload it without calling you #
    alias nginxreload='sudo /usr/local/nginx/sbin/nginx -s reload'
    alias nginxtest='sudo /usr/local/nginx/sbin/nginx -t'
    alias lightyload='sudo /etc/init.d/lighttpd reload'
    alias lightytest='sudo /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf -t'
    alias httpdreload='sudo /usr/sbin/apachectl -k graceful'
    alias httpdtest='sudo /usr/sbin/apachectl -t && /usr/sbin/apachectl -t -D DUMP_VHOSTS'

### \#22: Alias into our backup stuff

    # if cron fails or if you want backup on demand just run these commands #
    # again pass it via sudo so whoever is in admin group can start the job #
    # Backup scripts #
    alias backup='sudo /home/scripts/admin/scripts/backup/wrapper.backup.sh --type local --taget /raid1/backups'
    alias nasbackup='sudo /home/scripts/admin/scripts/backup/wrapper.backup.sh --type nas --target nas01'
    alias s3backup='sudo /home/scripts/admin/scripts/backup/wrapper.backup.sh --type nas --target nas01 --auth /home/scripts/admin/.authdata/amazon.keys'
    alias rsnapshothourly='sudo /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys --config /home/scripts/admin/scripts/backup/config/adsl.conf'
    alias rsnapshotdaily='sudo  /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys  --config /home/scripts/admin/scripts/backup/config/adsl.conf'
    alias rsnapshotweekly='sudo /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys  --config /home/scripts/admin/scripts/backup/config/adsl.conf'
    alias rsnapshotmonthly='sudo /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys  --config /home/scripts/admin/scripts/backup/config/adsl.conf'
    alias amazonbackup=s3backup

### \#23: Desktop specific – play avi/mp3 files on demand

    ## play video files in a current directory ##
    # cd ~/Download/movie-name
    # playavi or vlc
    alias playavi='mplayer *.avi'
    alias vlc='vlc *.avi'

    # play all music files from the current directory #
    alias playwave='for i in *.wav; do mplayer "$i"; done'
    alias playogg='for i in *.ogg; do mplayer "$i"; done'
    alias playmp3='for i in *.mp3; do mplayer "$i"; done'

    # play files from nas devices #
    alias nplaywave='for i in /nas/multimedia/wave/*.wav; do mplayer "$i"; done'
    alias nplayogg='for i in /nas/multimedia/ogg/*.ogg; do mplayer "$i"; done'
    alias nplaymp3='for i in /nas/multimedia/mp3/*.mp3; do mplayer "$i"; done'

    # shuffle mp3/ogg etc by default #
    alias music='mplayer --shuffle *'

### \#24: Set default interfaces for sys admin related commands

[vnstat is console-based network](https://www.cyberciti.biz/tips/keeping-a-log-of-daily-network-traffic-for-adsl-or-dedicated-remote-linux-box.html) traffic monitor. [dnstop is console tool](https://www.cyberciti.biz/faq/dnstop-monitor-bind-dns-server-dns-network-traffic-from-a-shell-prompt/) to analyze DNS traffic. [tcptrack and iftop commands displays](https://www.cyberciti.biz/faq/check-network-connection-linux/) information about TCP/UDP connections it sees on a network interface and display bandwidth usage on an interface by host respectively.

    ## All of our servers eth1 is connected to the Internets via vlan / router etc  ##
    alias dnstop='dnstop -l 5  eth1'
    alias vnstat='vnstat -i eth1'
    alias iftop='iftop -i eth1'
    alias tcpdump='tcpdump -i eth1'
    alias ethtool='ethtool eth1'

    # work on wlan0 by default #
    # Only useful for laptop as all servers are without wireless interface
    alias iwconfig='iwconfig wlan0'

### \#25: Get system memory, cpu usage, and gpu memory info quickly

    ## pass options to free ##
    alias meminfo='free -m -l -t'

    ## get top process eating memory
    alias psmem='ps auxf | sort -nr -k 4'
    alias psmem10='ps auxf | sort -nr -k 4 | head -10'

    ## get top process eating cpu ##
    alias pscpu='ps auxf | sort -nr -k 3'
    alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

    ## Get server cpu info ##
    alias cpuinfo='lscpu'

    ## older system use /proc/cpuinfo ##
    ##alias cpuinfo='less /proc/cpuinfo' ##

    ## get GPU ram on desktop / laptop##
    alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

### \#26: Control Home Router

The curl command can be used to [reboot Linksys routers](https://www.cyberciti.biz/faq/reboot-linksys-wag160n-wag54-wag320-wag120n-router-gateway/).

    # Reboot my home Linksys WAG160N / WAG54 / WAG320 / WAG120N Router / Gateway from *nix.
    alias rebootlinksys="curl -u 'admin:my-super-password' 'http://192.168.1.2/setup.cgi?todo=reboot'"

    # Reboot tomato based Asus NT16 wireless bridge
    alias reboottomato="ssh admin@192.168.1.1 /sbin/reboot"

### \#27 Resume wget by default

The [GNU Wget is a free utility for non-interactive download](https://www.cyberciti.biz/tips/wget-resume-broken-download.html) of files from the Web. It supports HTTP, HTTPS, and FTP protocols, and it can resume downloads too:

    ## this one saved by butt so many times ##
    alias wget='wget -c'

### \#28 Use different browser for testing website

    ## this one saved by butt so many times ##
    alias ff4='/opt/firefox4/firefox'
    alias ff13='/opt/firefox13/firefox'
    alias chrome='/opt/google/chrome/chrome'
    alias opera='/opt/opera/opera'

    #default ff
    alias ff=ff13

    #my default browser
    alias browser=chrome

### \#29: A note about ssh alias

Do not create ssh alias, instead use ~/.ssh/config OpenSSH SSH client configuration files. It offers more option. An example:

    Host server10
      Hostname 1.2.3.4
      IdentityFile ~/backups/.ssh/id_dsa
      user foobar
      Port 30000
      ForwardX11Trusted yes
      TCPKeepAlive yes

You can now connect to peer1 using the following syntax:
`$ ssh server10`

### \#30: It’s your turn to share…

    ## set some other defaults ##
    alias df='df -H'
    alias du='du -ch'

    # top is atop, just like vi is vim
    alias top='atop'

    ## nfsrestart  - must be root  ##
    ## refresh nfs mount / cache etc for Apache ##
    alias nfsrestart='sync && sleep 2 && /etc/init.d/httpd stop && umount netapp2:/exports/http && sleep 2 && mount -o rw,sync,rsize=32768,wsize=32768,intr,hard,proto=tcp,fsc natapp2:/exports /http/var/www/html &&  /etc/init.d/httpd start'

    ## Memcached server status  ##
    alias mcdstats='/usr/bin/memcached-tool 10.10.27.11:11211 stats'
    alias mcdshow='/usr/bin/memcached-tool 10.10.27.11:11211 display'

    ## quickly flush out memcached server ##
    alias flushmcd='echo "flush_all" | nc 10.10.27.11 11211'

    ## Remove assets quickly from Akamai / Amazon cdn ##
    alias cdndel='/home/scripts/admin/cdn/purge_cdn_cache --profile akamai'
    alias amzcdndel='/home/scripts/admin/cdn/purge_cdn_cache --profile amazon'

    ## supply list of urls via file or stdin
    alias cdnmdel='/home/scripts/admin/cdn/purge_cdn_cache --profile akamai --stdin'
    alias amzcdnmdel='/home/scripts/admin/cdn/purge_cdn_cache --profile amazon --stdin'

Conclusion
----------

This post summarizes several types of uses for \*nix bash aliases:

1. Setting default options for a command (e.g. set eth0 as default option for ethtool command via alias ethtool='ethtool eth0' ).
2. Correcting typos (cd.. will act as cd .. via alias cd..='cd ..').
3. Reducing the amount of typing.
4. Setting the default path of a command that exists in several versions on a system (e.g. GNU/grep is located at /usr/local/bin/grep and Unix grep is located at /bin/grep. To use GNU grep use alias grep='/usr/local/bin/grep' ).
5. Adding the safety nets to Unix by making commands interactive by setting default options. (e.g. rm, mv, and other commands).
6. Compatibility by creating commands for older operating systems such as MS-DOS or other Unix like operating systems (e.g. alias del=rm ).

I’ve shared my aliases that I used over the years to reduce the need for repetitive command line typing. If you know and use any other bash/ksh/csh aliases that can reduce typing, share below in the [comments](https://www.nixcraft.com/t/30-handy-bash-shell-aliases-for-linux-unix-mac-os-x/1458).

Conclusion
----------

I hope you enjoyed my collection of bash shell aliases. See

* [Customize the bash shell environments](https://bash.cyberciti.biz/guide/Customize_the_bash_shell_environments)
* [Download all aliases featured in this post](https://www.cyberciti.biz/files/scripts/nixcraft_bashrc.txt)
* [GNU bash shell home page](https://www.gnu.org/software/bash/)

 🐧 Get the latest tutorials on Linux, Open Source & DevOps via **[RSS feed](https://www.cyberciti.biz/atom/atom.xml)** or **[Weekly email newsletter.](https://newsletter.cyberciti.biz/subscription?f=1ojtmiv8892KQzyMsTF4YPr1pPSAhX2rq7Qfe5DiHMgXwKo892di4MTWyOdd976343rcNR6LhdG1f7k9H8929kMNMdWu3g)**

 🐧 191 comments so far... [add one](https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html#respond) **↓**

CategoryList of Unix and Linux commandsDisk space analyzers[df](https://www.cyberciti.biz/faq/df-command-examples-in-linux-unix/) • [ncdu](https://www.cyberciti.biz/open-source/install-ncdu-on-linux-unix-ncurses-disk-usage/) • [pydf](https://www.cyberciti.biz/tips/unix-linux-bsd-pydf-command-in-colours.html)File Management[cat](https://www.cyberciti.biz/faq/linux-unix-appleosx-bsd-cat-command-examples/) • [cp](https://www.cyberciti.biz/faq/cp-copy-command-in-unix-examples/) • [mkdir](https://www.cyberciti.biz/faq/linux-make-directory-command/) • [tree](https://www.cyberciti.biz/faq/linux-show-directory-structure-command-line/)Firewall[Alpine Awall](https://www.cyberciti.biz/faq/how-to-set-up-a-firewall-with-awall-on-alpine-linux/) • [CentOS 8](https://www.cyberciti.biz/faq/how-to-set-up-a-firewall-using-firewalld-on-centos-8/) • [OpenSUSE](https://www.cyberciti.biz/faq/set-up-a-firewall-using-firewalld-on-opensuse-linux/) • [RHEL 8 ](https://www.cyberciti.biz/faq/configure-set-up-a-firewall-using-firewalld-on-rhel-8/) • [Ubuntu 16.04](https://www.cyberciti.biz/faq/howto-configure-setup-firewall-with-ufw-on-ubuntu-linux/) • [Ubuntu 18.04](https://www.cyberciti.biz/faq/how-to-setup-a-ufw-firewall-on-ubuntu-18-04-lts-server/) • [Ubuntu 20.04](https://www.cyberciti.biz/faq/how-to-configure-firewall-with-ufw-on-ubuntu-20-04-lts/)Network Utilities[NetHogs](https://www.cyberciti.biz/faq/linux-find-out-what-process-is-using-bandwidth/) • [dig](https://www.cyberciti.biz/faq/linux-unix-dig-command-examples-usage-syntax/) • [host](https://www.cyberciti.biz/faq/linux-unix-host-command-examples-usage-syntax/) • [ip](https://www.cyberciti.biz/faq/linux-ip-command-examples-usage-syntax/) • [nmap](https://www.cyberciti.biz/security/nmap-command-examples-tutorials/)OpenVPN[CentOS 7](https://www.cyberciti.biz/faq/centos-7-0-set-up-openvpn-server-in-5-minutes/) • [CentOS 8](https://www.cyberciti.biz/faq/centos-8-set-up-openvpn-server-in-5-minutes/) • [Debian 10](https://www.cyberciti.biz/faq/debian-10-set-up-openvpn-server-in-5-minutes/) • [Debian 8/9](https://www.cyberciti.biz/faq/install-configure-openvpn-server-on-debian-9-linux/) • [Ubuntu 18.04](https://www.cyberciti.biz/faq/ubuntu-18-04-lts-set-up-openvpn-server-in-5-minutes/) • [Ubuntu 20.04](https://www.cyberciti.biz/faq/ubuntu-20-04-lts-set-up-openvpn-server-in-5-minutes/)Package Manager[apk](https://www.cyberciti.biz/faq/10-alpine-linux-apk-command-examples/) • [apt](https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/)Processes Management[bg](https://www.cyberciti.biz/faq/unix-linux-bg-command-examples-usage-syntax/) • [chroot](https://www.cyberciti.biz/faq/unix-linux-chroot-command-examples-usage-syntax/) • [cron](https://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses/) • [disown](https://www.cyberciti.biz/faq/unix-linux-disown-command-examples-usage-syntax/) • [fg](https://www.cyberciti.biz/faq/unix-linux-fg-command-examples-usage-syntax/) • [jobs](https://www.cyberciti.biz/faq/unix-linux-jobs-command-examples-usage-syntax/) • [killall](https://www.cyberciti.biz/faq/unix-linux-killall-command-examples-usage-syntax/) • [kill](https://www.cyberciti.biz/faq/unix-kill-command-examples/) • [pidof](https://www.cyberciti.biz/faq/linux-pidof-command-examples-find-pid-of-program/) • [pstree](https://www.cyberciti.biz/faq/unix-linux-pstree-command-examples-shows-running-processestree/) • [pwdx](https://www.cyberciti.biz/faq/unix-linux-pwdx-command-examples-usage-syntax/) • [time](https://www.cyberciti.biz/faq/unix-linux-time-command-examples-usage-syntax/)Searching[grep](https://www.cyberciti.biz/faq/howto-use-grep-command-in-linux-unix/) • [whereis](https://www.cyberciti.biz/faq/unix-linux-whereis-command-examples-to-locate-binary/) • [which](https://www.cyberciti.biz/faq/unix-linux-which-command-examples-syntax-to-locate-programs/)User Information[groups](https://www.cyberciti.biz/faq/unix-linux-groups-command-examples-syntax-usage/) • [id](https://www.cyberciti.biz/faq/unix-linux-id-command-examples-usage-syntax/) • [lastcomm](https://www.cyberciti.biz/faq/linux-unix-lastcomm-command-examples-usage-syntax/) • [last](https://www.cyberciti.biz/faq/linux-unix-last-command-examples/) • [lid/libuser-lid](https://www.cyberciti.biz/faq/linux-lid-command-examples-syntax-usage/) • [logname](https://www.cyberciti.biz/faq/unix-linux-logname-command-examples-syntax-usage/) • [members](https://www.cyberciti.biz/faq/linux-members-command-examples-usage-syntax/) • [users](https://www.cyberciti.biz/faq/unix-linux-users-command-examples-syntax-usage/) • [whoami](https://www.cyberciti.biz/faq/unix-linux-whoami-command-examples-syntax-usage/) • [who](https://www.cyberciti.biz/faq/unix-linux-w-command-examples-syntax-usage-2/) • [w](https://www.cyberciti.biz/faq/unix-linux-w-command-examples-syntax-usage-2/)WireGuard VPN[Alpine](https://www.cyberciti.biz/faq/how-to-set-up-wireguard-vpn-server-on-alpine-linux/) • [CentOS 8](https://www.cyberciti.biz/faq/centos-8-set-up-wireguard-vpn-server/) • [Debian 10](https://www.cyberciti.biz/faq/debian-10-set-up-wireguard-vpn-server/) • [Firewall](https://www.cyberciti.biz/faq/how-to-set-up-wireguard-firewall-rules-in-linux/) • [Ubuntu 20.04](https://www.cyberciti.biz/faq/ubuntu-20-04-set-up-wireguard-vpn-server/)