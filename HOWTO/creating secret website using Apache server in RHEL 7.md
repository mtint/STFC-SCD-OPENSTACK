creating secret website means Installing and configuring Apache server and host an web site but web site would not accessible from all the hosts and its not visible even to the other hosts.

Why we have to host such a type of web site..?
----------------------------------------------

We know maintaining confidential information as confidentially is very impotent, such a type of information can’t be shared / see by others who are not authorized to see. In this cases we can host a web site which will not be accessible from any other hosts, we can allow only certain IP addresses to access the web site.

creating secret website using Apache server in RHEL 7 procedure
===============================================================

To [install and configure normal web site using Apache in RHEL 7 see this article](http://arkit.co.in/linux/web-server-installation/)

Requirements to create secret web site
--------------------------------------

* List of IP addresses to allow access
* Httpd / Apache service should be in running state
* Red Hat Enterprise Linux Version 7

Web server installation process, install required packages, enable and start the service

    [root@TechTutorial ~]# yum install httpd*
    [root@TechTutorial ~]# systemctl enable httpd.service
    [root@TechTutorial ~]# systemctl start httpd.service
    [root@TechTutorial ~]# systemctl status httpd.service 
    httpd.service - The Apache HTTP Server
       Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled)
       Active: active (running) since Tue 2016-03-08 15:39:00 IST; 6s ago
     Main PID: 6694 (httpd)

Create a New directory under /var/www/html/ path. In this example i am going to create directory name called ‘secret’ which may be any name as you like

    [root@TechTutorial ~]# mkdir /var/www/html/secret

Create a sample HTML file for testing purpose under /vat/www/html/secret directory with name Index.html, because index.html name is already by default mentioned in httpd configuration file

    [root@TechTutorial html]# vim /var/www/html/secret/index.html 
    <h1>Secret Web Server</h1>
    </h2> Just Testing</h2>

Save the file and Exit :wq!

Permit firewall ports to communicate with clients

    [root@TechTutorial html]# firewall-cmd --permanent --add-service=http
    success
    [root@TechTutorial html]# firewall-cmd --permanent --add-service=https
    success
    [root@TechTutorial html]# firewall-cmd --reload
    success

Configuring the secret web site, Create file with .conf extension under /etc/httpd/conf.d/secret.conf in this example i am using secret.conf file. Now edit the file and write below configuration in it.

    [root@TechTutorial ~]# vim /etc/httpd/conf.d/secret.conf 
    <VirtualHost *:80>
        ServerAdmin     root@localhost
        ServerName    TechTutorial.arkit.co.in
        DocumentRoot    /var/www/html
    </VirtualHost>
    <Directory </var/www/html/secret">
        Order allow,deny
        Allow from desktop.arkit.co.in
        Deny from all
    </Directory>

As per the above configuration file we are denying all other machines to access web site except desktop.arkit.co.in in place of domain name we can also give IP address

**Note:** Use allow access in the top and then deny because if you mention deny first then you have to write deny rule for all other IP addresses. Simple deny all except particular hosts / IP’s.

Restart Apache service to reflect the changes

    [root@TechTutorial ~]# systemctl restart httpd.service

Test Web site from client
-------------------------

In this case Website will only be accessible from desktop.arkit.co.in machine it will not accessible from any other machine.

conclusion
----------

Creating secret website is used to access from particular IP / Hosts to keep confidential information safe.

That’s about the article. Please do comment your feedback.

**Thanks for your wonderful Support and Encouragement **

* [Get Email](https://feedburner.google.com/fb/a/mailverify?uri=arkit) | [Download E-Books](https://arkit-in.tradepub.com/)
* [Facebook Page](https://www.facebook.com/Linuxarkit)
* [Youtube Channel](https://www.youtube.com/Techarkit?sub_confirmation=1)
* [Twitter](https://twitter.com/aravikumar48)
* [Exclusive Telegram Group](https://t.me/Linuxarkit)
* [Discuss On WhatsApp Group](https://github.com/techarkit/TechArkit-YouTube/blob/master/whatsapp_group.md)

More than 40000 Techies in our community do you want part of it Join Now