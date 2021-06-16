check to see if iptables is installed

> rpm -q iptables

Installation of Iptables

> yum install iptables

Check iptables status

> service iptables status

Start iptables

> service iptables start

To set iptables start at boot

> chkconfig iptables on

List the current loaded rules

> iptables -L

Display Status of the firewall

> iptables -L -n -v

Flush all current rules from iptables

> iptables -F

Allow SSH connections on tcp port 22 (SSH)

> iptables -A INPUT -p tcp –dport 22 -j ACCEPT

Set default policies for INPUT, FORWARD and OUTPUT chains

> iptables -P INPUT DROP
>  iptables -P FORWARD DROP
>  iptables -P OUTPUT ACCEPT

Set access for localhost

> iptables -A INPUT -i lo -j ACCEPT
>  iptables -A INPUT -i eth0 -j ACCEPT

Accept packets belonging to established and related connections

> iptables -A INPUT -m state –state ESTABLISHED,RELATED -j ACCEPT

Accept packets from trusted IP addresses

> iptables -A INPUT -s 192.168.0.4 -j ACCEPT

Accept packets from trusted network

> iptables -A INPUT -s 192.168.0.0/24 -j ACCEPT
>  iptables -A INPUT -s 192.168.0.0/255.255.255.0 -j ACCEPT

Accept tcp packets on destination port 6881

> iptables -A INPUT -p tcp –dport 6881 -j ACCEPT

Accept tcp packets on destination ports 6881-6890

> iptables -A INPUT -p tcp –dport 6881:6890 -j ACCEPT

Accept tcp packets on destination port 22 (SSH) from private LAN

> iptables -A INPUT -p tcp -s 192.168.0.0/24 –dport 22 -j ACCEPT

Blocking null packets

> iptables -A INPUT -p tcp –tcp-flags ALL NONE -j DROP

Reject SYN -FLOOD attack

> iptables -A INPUT -p tcp ! –syn -m state –state NEW -j DROP

Reject a recon Packet

> iptables -A INPUT -p tcp –tcp-flags ALL ALL -j DROP

Allow web server traffic

> iptables -A INPUT -p tcp -m tcp –dport 80 -j ACCEPT
> 
> iptables -A INPUT -p tcp -m tcp –dport 443 -j ACCEPT

Allow users to use SMTP servers

> iptables -A INPUT -p tcp -m tcp –dport 25 -j ACCEPT

Allow any established outgoing connections to receive replies from the server

> iptables -I INPUT -m state –state ESTABLISHED,RELATED -j ACCEPT

Block an IP address

> iptables -A INPUT -s 192.168.1.1 -j DROP

Block a Port for a specific IP Address

> iptables -A INPUT -p tcp -s 192.168.1.1 –dport 80 -j DROP

Open a port for a Specific IP Address

> iptables -A INPUT -p tcp -s 192.168.1.1 –dport 21 -j ACCEPT

Open DNS

> iptables -A INPUT -m state –state NEW -p tcp –dport 53 -j ACCEPT

Open MYSQL Port

> iptables -A INPUT -p tcp –dport 3306 -j ACCEPT

Open a Range of Ports (eg : 7000-7100)

> iptables -A INPUT -m state –state NEW -m tcp -p tcp –dport 7000:7100 -j ACCEPT

Save the rules and restart the iptables

> service iptables save
> 
> service iptables restart

List rules

> iptables -L -v