An introduction to Cockpit, an easy-to-use web-based admin tool
---------------------------------------------------------------

[

![Kirshi Yin](https://miro.medium.com/fit/c/96/96/1*dlcfpX9-oenL8QUs9QuOdQ.jpeg)

](https://medium.com/@kirshi.yin?source=post_page-----aef717d6bb1a--------------------------------)

[Kirshi Yin](https://medium.com/@kirshi.yin?source=post_page-----aef717d6bb1a--------------------------------)

[May 20](https://betterprogramming.pub/how-to-manage-linux-servers-in-a-web-browser-aef717d6bb1a?source=post_page-----aef717d6bb1a--------------------------------) · 4 min read

![Computer screen with metrics](https://miro.medium.com/max/9620/0*j9KH6uDQWcqYaomg)

Photo by [Luke Chesser](https://unsplash.com/@lukechesser?utm_source=medium&utm_medium=referral) on [Unsplash](https://unsplash.com/?utm_source=medium&utm_medium=referral).

Monitoring your system is a crucial step to ensure that everything is working fine. If you are in front of the computer, you typically run commands like `top`, `htop`, and `df` in your terminal. Wouldn’t it be nice to handle the server remotely via a web browser?

Numerous tools enable web-based administration. However, a lot of them require the installation of external libraries and manual configurations. If you want to get started very quickly and perform simple admin tasks, I recommend [Cockpit](https://cockpit-project.org/).

In this article, I’m going to introduce you to Cockpit’s main features.

Let’s get started!

Overview of Cockpit
===================

Cockpit is a free open source project that is actively being developed. It’s a lightweight program that runs on-demand, meaning that it doesn’t load your system unnecessarily when you’re not using it.

It displays metrics like CPU usage, disk space, and service status. You can even handle containers, add multiple servers to a single dashboard, manage user accounts, configure network settings, and more.

Installation
------------

I’ve used Ubuntu for this tutorial. For other distributions, check the installation [guide](https://cockpit-project.org/running.html).

Run this command in your terminal:

    $ sudo apt-get install cockpit

That’s it! You’re ready to go. Open this address in your browser to access the UI: [https://{yourserverip}:9090](https://ip-address-of-machine:9090/).

It uses your system credentials for login:

![Login screen](https://miro.medium.com/max/537/1*j_d6fRqXFfpVMaNoLA371A.png)

Login screen

Dashboard
---------

After login, you can find your server on the Dashboard. Then, you can easily navigate through the tabs to check CPU, Memory, Network, and Disk I/O metrics:

![Server Dashboard](https://miro.medium.com/max/600/1*qlzHxQC3JOSg0OiiF4ZhdA.gif)

Server Dashboard

A handy feature is that you can add multiple servers and monitor them from a single dashboard. Just click on the plus sign:

![Adding a new server](https://miro.medium.com/max/708/1*5VMelelKoGEksuXOQQOqoQ.png)

Adding a new server

*Note: Cockpit needs to be installed on the other server.*

Logs
----

Here, you can view your system logs. Different filters help you find what you’re looking for:

![Viewing log files](https://miro.medium.com/freeze/max/60/1*fhEUaE4182iagkdkE8kQxQ.gif?q=20)

![Viewing log files](https://miro.medium.com/max/1200/1*fhEUaE4182iagkdkE8kQxQ.gif)

Viewing log files

Storage
-------

This is an example of storage system information:

![Storage info](https://miro.medium.com/max/60/1*7P4M6gzpUPJjRuLv4P1oBg.png?q=20)

![Storage info](https://miro.medium.com/max/1774/1*7P4M6gzpUPJjRuLv4P1oBg.png)

Storage info

Network
-------

This page manages networking features, such as network bonds and bridges. You can also find the networking logs.

![Network tab](https://miro.medium.com/max/60/1*DnePm-TnjgcX9RqBV7x1kw.png?q=20)

![Network tab](https://miro.medium.com/max/1820/1*DnePm-TnjgcX9RqBV7x1kw.png)

Network tab

Accounts
--------

You can create new users, modify existing permissions, manage passwords, and set up SSH keys from the Accounts tab.

![Modifying an existing account](https://miro.medium.com/max/60/1*XNh2XawnZ-J2DrZ8eX6U8g.png?q=20)

![Modifying an existing account](https://miro.medium.com/max/1772/1*XNh2XawnZ-J2DrZ8eX6U8g.png)

Modifying an existing account

Services
--------

One of the most convenient features is the Services page. You can easily restart services and also view their log files:

![Services](https://miro.medium.com/max/60/1*RHBNn5ux-8QwYbXN9x1AHw.png?q=20)

![Services](https://miro.medium.com/max/1814/1*RHBNn5ux-8QwYbXN9x1AHw.png)

Services

![Service logs](https://miro.medium.com/max/60/1*HEtPZUb2xd1LauDAGEqKXQ.png?q=20)

![Service logs](https://miro.medium.com/max/1732/1*HEtPZUb2xd1LauDAGEqKXQ.png)

Service logs

**Applications**
----------------

This page allows you to install additional third-party applications. For example, [Podman Container](https://github.com/cockpit-project/cockpit-podman) for downloading and managing containers. Check out the current [application list](https://cockpit-project.org/applications.html).

Since this is an open source project, it’s a great opportunity to contribute by developing a new application.

Software Updates
----------------

You can easily manage your software updates from this page. This can come in handy when you have multiple computers that you want to update.

Terminal
--------

Even if you log in from a non-Linux device, you can still use Linux commands thanks to the built-in terminal.

Security
--------

Are you concerned about security? The developers have designed Cockpit with security in mind. Check out this informative [article](https://cockpit-project.org/blog/is-cockpit-secure.html) straight from the tool’s blog to learn more about the topic.

Conclusion
==========

In this short article, we introduced Cockpit’s features. You’ve seen that it’s a lightweight, straightforward tool to manage single or multiple servers. It’s an easy and convenient way to deal with simple tasks.

I hope that you’ve learned something new today.

If you are interested in Linux topics, you might also like the following article:

[

5 Powerful Unix Commands for Easier Troubleshooting
---------------------------------------------------

### A collection of proven Unix commands to help you identify application issues

betterprogramming.pub

](https://betterprogramming.pub/5-powerful-unix-commands-for-easier-troubleshooting-dd619d5e173a)

Thank you for reading and see you next time!