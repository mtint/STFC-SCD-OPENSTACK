# Upload speeds are very slow

## Overview

This article provides an overview of what can be causing slow uploads to your site, or what can be preventing you from uploading in general.

## Does DreamHost limit upload speeds?

DreamHost does not limit upload speeds. If you notice slow uploads, the most common causes are:

* Network connection is bad
* Local Internet is slow
* You have a firewall program that is blocking you
* Your router is blocking you

There can be other reasons, but these are the most common issues.

## Network connection is bad

If you can upload, but the speed is slow, the reason may be that your connection to the site is timing out. It’s also possible the upload speed is getting bottlenecked by your local Internet provider.

### Running a traceroute

Running a traceroute lets you detect connection problems between your location and the server. If you see that hops are timing out, this is something you need to contact your ISP about as it can be impacting your upload speeds. You can read more about how traceroutes work and how to run them here:

* [Traceroute](https://help.dreamhost.com/hc/en-us/articles/215840708-Traceroute)

### Check your Internet speed

The speed at which your data uploads is limited by the speed at which your computer can upload to the Internet. Check your connection speed here:

* <http://www.speedtest.net/>

If the results provided in the test are unsatisfactory, you need to speak to your ISP about steps you can take to improve the speed.

## I can’t connect using FTP at all

In the event that the FTP connection fails to allow you to upload at all, it is likely that something on your local network or computer is blocking the connection. Try disabling your firewall. Many firewalls block access to port 21 which is used by FTP. If you turn off your firewall and the FTP connection works, then you need to adjust your firewall settings to allow port 21 (or port 22 for SFTP).

Routers can also block port 21\. If turning off your firewall doesn’t resolve the issue, make sure your router is configured to allow access to port 21\. If your firewall and router are set to allow access but you still cannot upload, then please contact DreamHost support for further assistance.

### Uploading errors on a website

If uploads are failing when you are using a WordPress plugin, or any other alternate PHP-based uploading solution for your site, you could be hitting the limits of your PHP settings. If you get 500 errors when trying to upload, or the site spins endlessly and nothing happens, this may be the case. You may wish to add a custom phprc to your site to increase upload limits and execution times.

You can read more about this in the following articles:

* [How to add a phprc file](https://help.dreamhost.com/hc/en-us/articles/214894037-How-do-I-create-a-phprc-file-via-FTP-)
* [Increasing the PHP upload limit](https://help.dreamhost.com/hc/en-us/articles/214200558-How-do-I-increase-the-PHP-upload-limit-)

## See also

* [List of website troubleshooting articles](https://help.dreamhost.com/hc/en-us/categories/202186727)
* [Common reasons for poor website performance](https://help.dreamhost.com/hc/en-us/articles/216349808-Common-reasons-for-poor-website-performance)
* [Viewing your access and error log via SFTP](https://help.dreamhost.com/hc/en-us/articles/216512197-Viewing-your-access-and-error-logs-via-SFTP)
* [Viewing and examining your access log via SSH](https://help.dreamhost.com/hc/en-us/articles/216105097-Viewing-and-examining-your-access-log-via-SSH)