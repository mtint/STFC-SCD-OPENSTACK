[![](https://4.bp.blogspot.com/-ppdQa80x4xc/VfJwYxfH2XI/AAAAAAAAAlc/WWLXx7CxmI0/s400/YUM%252BServer%252BRHEL7%252BTutorial.png)](https://4.bp.blogspot.com/-ppdQa80x4xc/VfJwYxfH2XI/AAAAAAAAAlc/WWLXx7CxmI0/s1600/YUM%252BServer%252BRHEL7%252BTutorial.png)

YUM is the Linux package management tool that help to install or update the packages, it does automatic installation of dependent packages which is required by main installation package. To setup the YUM repository we need one server system where all the packages are hosted and the client system where you want to install or update the packages.

### **COPYING THE PACKAGES:**

 In order to enable YUM repository through FTP or HTTP / Apache we have to copy the RPM packages to both the places. 

### SERVER Side: 

Install FTP server packages. 

~]\# yum install vsftpd\*

Start the FTP service
~]\# service vsftpd restart
Shutting down vsftpd: [FAILED]
Starting vsftpd for vsftpd: [ OK ]
~]\# chkconfig vsftpd on
~]\# service iptables stop

Now Install HTTP server packages

~]\#yum install http\*
~]\# service httpd restart
Stopping httpd: [ OK ]
Starting httpd: [ OK ]

Edit Apache configuration file to enable the indexes.

~]\#vi /etc/httpd/conf/httpd.conf

From

~]\#Options Indexes FollowSymLinks

To

~]\#Options All Indexes FollowSymLinks

Remove the welcome page.

~]\#rm -rf /etc/httpd/conf.d/welcome.conf

Restart the httpd service after changing the settings

~]\#service httpd restart

Verify the above using the web browser by visiting ***ftp://ip-address*** or ***http://ip-address***.

Copy the packages to FTP Path

Assuming /media/RHEL is the Mount of the CD/DVD of installation media.

~]\# cp -Rv /media/RHEL/Server/\* /var/ftp/pub/ 

copy the packages to HTTP path as well

~]\#cp -Rv /media/RHEL/Server/\* /var/www/html/

### Creating Repository: 

 After hosting the packages, we need to create the repository of the packages that you have copied from the disc. *CreateRepo* is the tool that help you to create the XML based rpm meta structure repository, It is like an index file that point to the rpm files. This XML files used for resolving the dependency packages which is required by main package.Install CreateRepo package.

install the below RPM's before running createrepo command

~]\#rpm -Uvh deltarpm-\*\*.el6.x86\_64.rpm python deltarpm-\*\*.el6.x86\_64.rpm createrepo-\*\*.rpm 

 For FTP

~]\#createrepo -v /var/ftp/pub/

 For HTTP

~]\# createrepo -v /var/www/html/

after completing the repository creation Go to client side configure the client to get repo from server

### Client Side Configuring Repository:

Once created the repository, just go on to the client machine and add the repository file under the /etc/yum.repos.d directory. Change ipadress to your server ip address..

~]\# vi /etc/yum.repos.d/remoteftp.repo

\#FTP 

[remote] name=RHEL FTP
baseurl=ftp://192.168.0.151
enabled=1
gpgcheck=0

~]\# vi /etc/yum.repos.d/remotehttp.repo

\#HTTP 

[remote]name=RHEL Apache
baseurl=http://192.168.0.151
enabled=1
gpgcheck=0

### Install Packages using YUM:

 ~]\#yum install PackageName

### Conclusion:

From the above you could see the MySQL Server packages installed with all dependent packages, It performs the same task that RPM can. It provides a easy installation of packages in single command line. If you face any problem on FTP or Apache, do disabling the iptables

Please provide your valuable comments...
----------------------------------------