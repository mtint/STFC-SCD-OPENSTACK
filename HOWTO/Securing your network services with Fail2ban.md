[![](resources/56787B2564E68006440A6DD395A4EC08.png)](https://3.bp.blogspot.com/-T_elFQTjlm4/WpnOs8D0poI/AAAAAAAADms/BzP9uw3__s0gW7jK4RBjJhG7mgtV8br7gCLcBGAs/s1600/fail2ban-logo.png)

###  Introduction

 First off, the title may be a bit misleading: this is just *one step* towards securing the network services provided by your Linux server. Proper server hardening involves *a lot *more than that; however, this is an important step, and since it's easy to implement, there's no excuse to not use it.

 In this article, I'll show you:

* The key concepts of Fail2ban.
* How to install Fail2ban and enable jails to secure some network services.
* Create a custom Fail2ban filter and jail to secure a VNC server

###  Key concepts of Fail2ban

 Fail2ban can be considered a kind of *intrusion detection system* (IDS), which are devices or softwares dedicated to monitor a network for malicious activity, triggering automatic actions in case of a match. These actions can range from a simple alert to blocking the malicious traffic from reaching the network, or even a custom, more complex chain of events configured by the security specialist.

 IDSes differ on how they analyze activity, which detection methods they use, and how they prevent the intrusion. Fail2ban works the following way:

1. Starts a daemon on the server where the network services are to be secured.
2. The daemon scans log files for specific attack patterns.
3. If a match is found, it blocks the originating IP address, usually using firewall rules, for a certain time.

 Fail2ban comes out-of-the-box with several pre-configured *filters*, designed to properly identify attack patterns on log files. One common example would be SSH brute-force password attacks. These filters can be used in *jails*, which are configuration blocks that specify:

1. The *network service* to monitor.
2. Which *filter *to apply to that service.
3. Which *log file* to scan.
4. Which *action *to perform on a match.
5. Other related *options*, such as ban time, number of failures etc.

 For example, this is a typical Fail2ban jail block that secures an SSH server against brute-force password attacks, banning the originating IP address for 600 seconds, after 3 authentication failures:

> [sshd]
>  port = ssh
>  logpath = %(sshd\_log)s
>  filter = %(\_\_name\_\_)s
>  bantime = 600
>  maxretry = 3
>  enabled = true

 Some of the options, such as log paths and filter definitions, will be explored later.

 On a Linux server, Fail2ban will, by default, use the IPTables firewall to block attackers. Once the daemon is started, it will create several *chains* and *input rules* according to the enabled jails. For instance, if we enable the *sshd* jail, we'll see something like this:

> root@server:~\# iptables -L -n -v
>  Chain INPUT (policy ACCEPT 4828 packets, 2188K bytes)
>  pkts bytes target prot opt in out source destination
>  34709 6454K f2b-sshd tcp -- \* \* 0.0.0.0/0 0.0.0.0/0 multiport dports 22
>  ...
>  Chain f2b-sshd (1 references)
>  pkts bytes target prot opt in out source destination
>  28165 5884K RETURN all -- \* \* 0.0.0.0/0 0.0.0.0/0

 But, of course, it can take several other actions; you can even create your own! One of the main strengths of Fail2ban, in my opinion, is the possibility to fully customize it.

###  Installing, configuring and enabling Fail2ban

 Most Linux distributions include Fail2ban in their standard repositories, so it's just a matter of using its package installer *(note: on RHEL/CentOS, you need to add the EPEL repository)*:

> root@debian:~\# apt-get install fail2ban -y
>  root@rhel:~\# yum install epel-release -y; yum install fail2ban-firewalld -y

 Once the package is installed, you'll see a directory structure similar to this under */etc/fail2ban*, the default configuration location:

> root@server:~\# ls -F /etc/fail2ban/
>  action.d/ fail2ban.conf fail2ban.d/ filter.d/ jail.conf jail.d/ paths-common.conf paths-debian.conf

* action.d: directory with files defining the several *actions* that Fail2ban can take. You can create a custom action there; take a look at some of the simpler actions for reference.
* fail2ban.conf: main configuration file, defining some general parameters of Fail2ban. Usually it's *not recommended* to edit this file, putting your customizations in a *fail2ban.local* file or under *fail2ban.d*.
* fail2ban.d: directory where you can put configuration files to customize Fail2ban's main parameters.
* filter.d: contains files which define the several *filters* that can be used. Usually the files specify *regular expressions* that will match certain patterns in log files. You can create a custom filter there; take a look at some of the simpler filters for reference.
* jail.conf: main file with the default *jail* definitions. You shouldn't modify this file: place your customizations in a *jail.local* file, or under *jail.d*.
* jail.d: contains custom jail definitions.
* paths-common.conf and paths-debian.conf: specify the default file paths for the operating system, such as log file locations.

 If you read this carefully, you probably realized that, if the provided default actions, filters and paths are enough, you just need to customize the jails to have a fully-functioning Fail2ban IDS running.

 Take a look at the *jail.conf* file: you must have noticed that all the jails are in a *disabled state* by default; it makes perfect sense, since having them all enabled by default would waste a lot of resources. Our task will be, then, to *customize the settings* and *enable the jails* we want, but remember: in a *separate jail.local file* or in a new file under *jail.d*. I'll take the latter approach, creating a new file under *jail.d* with the *settings that differ from the base configuration*:

> root@server:~\# vi /etc/fail2ban/jail.d/server.conf
> 
>  [DEFAULT]
>  bantime = 300
>  findtime = 120
>  maxretry = 3
>  destemail = dorian@dorianbolivar.com
>  sender = root@server
>  mta = sendmail
> 
>  [sshd]
>  enabled = true

 The several options are usually explained in the *jail.conf* base configuration file, and also in the manpages, but I'll briefly explain what I customized here:

* [DEFAULT]: section that contains parameters applied to all the jails.
* bantime, findtime, maxretry: block the attacking IP address for *300 seconds*, if it matches a filter *3 times* in *120 seconds*.
* destemail, sender, mta: send an e-mail to *dorian@dorianbolivar.com*, from *root@server*, using *Sendmail *as the MTA.
* [sshd]: section that contains custom parameters for the *SSHD *jail.
* enabled = true: since I don't want to customize anything else than what's already defined in *jail.conf*, I'll just *enable* this jail.

 Easy, right? Now we just need to enable the Fail2ban service and start it:

> root@server:~\# systemctl enable fail2ban
>  root@server:~\# systemctl start fail2ban

 It should start without errors. Let's check if it's running and if the IPTables chains have been created:

> root@server:~\# ps aux | grep fail2ban
>  root 1389 0.0 1.5 849772 15804 ? Sl Feb23 5:43 /usr/bin/python3 /usr/bin/fail2ban-server -s /var/run/fail2ban/fail2ban.sock -p /var/run/fail2ban/fail2ban.pid -x -b
> 
>  root@server:~\# iptables -L -n -v | grep f2b
>  ...
>  42574 7194K f2b-sshd tcp -- \* \* 0.0.0.0/0 0.0.0.0/0 multiport dports 22
>  ...
>  Chain f2b-sshd (1 references)
> 
>  root@server:~\# fail2ban-client status
>  Status
>  |- Number of jail: 1
>  `- Jail list: sshd

 There you go, your SSH service is now protected against brute-force password attacks with Fail2ban!

###  Creating a custom Fail2ban filter and jail

 While Fail2ban comes out-of-the-box with several pre-defined actions, filters and jails, sometimes you need to protect a network service that isn't covered, and/or you need to define a custom action, tweak a filter's regular expression to better match specific scenarios etc.

 For the sake of learning a little about this kind of customization, I'll teach you how to create a basic filter and jail to protect a VNC server, TightVNC. *"Why not protect TigerVNC, the one you used on your previous article?"* Well, because TigerVNC has built-in brute-force protection! :)

*Reference for the TightVNC filter and jail: <https://github.com/m0jo/fail2ban-tightvncserver>*

* Create a custom filter that will match strings in the log file which indicate an authentication failure (not really a complex regex in this case, right?):

> root@server:~\# vi /etc/fail2ban/filter.d/tightvnc-auth.conf
> 
>  [Definition]
>  failregex = authentication failed from \<HOST\>
>  ignoreregex =

* Create a custom jail configuration file for it. I'll just put the most relevant options (enable the jail, specify the filter, and tell the log file to scan):

> root@server:~\# vi /etc/fail2ban/jail.d/tightvnc-auth.conf
> 
>  [tighvnc-auth]
>  enabled = true
>  filter = tighvnc-auth
>  logpath = /home/user/.vnc/server:1.log

* Restart the *fail2ban* service and confirm the new jail is up and running, as taught in the previous section.

 Not really complicated, right? This was just a basic example, to give you a kickoff for more advanced customizations.

###  Conclusions

 As explained in the beginning, this is just *one step* towards fully securing your server and network services. But since it's an easy and straightforward IDS that is free and available on most modern Linux distributions, I strongly recommend it's usage. If you ever deployed a Linux server on the cloud, you should have noticed how almost *immediately* it becomes a target for brute-force attacks, specially the SSH service, which is almost ubiquitous on Linux servers.

 While apparently a simple tool, Fail2ban's true strenght is on its customization possibilities. You can basically protect *any* network service that creates plain-text log files, and take almost *any* action on a match, including feeding more complex network security elements.

 Many companies usually neglect server security, focusing only on border security or dedicated network security elements. This is not ideal, as a vulnerable server can be open to exploits that bypass these elements. Everything must be taken into account to proper secure your IT environment.