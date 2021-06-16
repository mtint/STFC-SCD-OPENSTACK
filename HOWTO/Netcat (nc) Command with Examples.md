Netcat (nc) Command with Examples
=================================

[Linuxize](safari-reader://linuxize.com/)Feb 24, 2020

Netcat (or `nc`) is a command-line utility that reads and writes data across network connections, using the TCP or UDP protocols. It is one of the most powerful tools in the network and system administrators arsenal, and it as considered as a Swiss army knife of networking tools.

Netcat is cross-platform, and it is available for Linux, macOS, Windows, and BSD. You can use Netcat to debug and monitor network connections, scan for open ports, transfer data, as a proxy, and more.

The Netcat package is pre-installed on macOS and popular Linux distributions like Ubuntu, Debian or CentOS.

Netcat Syntax 
--------------

The most basic syntax of the Netcat utility takes the following form:

On Ubuntu, you can use either `netcat` or `nc`. They are both [symlinks](https://linuxize.com/post/how-to-create-symbolic-links-in-linux-using-the-ln-command/) to the openBSD version of Netcat.

By default, Netcat will attempt to start a TCP connection to the specified host and port. If you would like to establish a UDP connection, use the `-u` option:

Port Scanning 
--------------

Scanning ports is one of the most common uses for Netcat. You can scan a single port or a port range.

[![](resources/67EB6CCD86F6E51196AC1BFC29C7ECBB.png)](https://mariadroste.org/communications/mental-health-awareness-month-2021/)

For example, to scan for open ports in the range 20-80 you would use the following command:

```
nc -z -v 10.10.8.8 20-80
```

The `-z` option will tell `nc` to only scan for open ports, without sending any data to them and the `-v` option to provide more verbose information.

The output will look something like this:

```
nc: connect to 10.10.8.8 port 20 (tcp) failed: Connection refused
nc: connect to 10.10.8.8 port 21 (tcp) failed: Connection refused
Connection to 10.10.8.8 22 port [tcp/ssh] succeeded!
nc: connect to 10.10.8.8 port 23 (tcp) failed: Connection refused
...
nc: connect to 10.10.8.8 port 79 (tcp) failed: Connection refused
Connection to 10.10.8.8 80 port [tcp/http] succeeded!

```

If you want to print only the lines with the open ports, you can filter the results with the [`grep`](https://linuxize.com/post/how-to-use-grep-command-to-search-files-in-linux/) command.

```
nc -z -v 10.10.8.8 20-80 2>&1 | grep succeeded
```

```
Connection to 10.10.8.8 22 port [tcp/ssh] succeeded!
Connection to 10.10.8.8 80 port [tcp/http] succeeded!

```

You can also use Netcat to find the server software and its version. For example, if you send an “EXIT” command to the server on the default [SSH port 22](https://linuxize.com/post/how-to-change-ssh-port-in-linux/) :

```
echo "EXIT" | nc 10.10.8.8 22
```

The output will look something like this:

```
SSH-2.0-OpenSSH_7.6p1 Ubuntu-4
Protocol mismatch.

```

To scan for UDP ports simply add the `-u` option to the command as shown below:

```
nc -z -v -u 10.10.8.8 20-80
```

Typically, [Nmap](https://linuxize.com/post/nmap-command/) is a better tool than Netcat for complex port scanning.

Sending Files through Netcat 
-----------------------------

Netcat can be used to transfer data from one host to another by creating a basic client/server model.

This works by setting the Netcat to listen on a specific port (using the `-l`option) on the receiving host and then establishing a regular TCP connection from the other host and sending the file over it.

On the receiving run the following command which will open the port 5555 for incoming connection and redirect the output to the file:

```
nc -l 5555 > file_name
```

From the sending host connect to the receiving host and send the file:

```
nc receiving.host.com 5555 < file_name
```

To transfer a directory you can use `tar` to archive the directory on the source host and to extract the archive on the destination host.

On the receiving host, set the Netcat tool to listen for an incoming connection on port 5555\. The incoming data is piped to the [`tar`](https://linuxize.com/post/how-to-create-and-extract-archives-using-the-tar-command-in-linux/) command, which will extract the archive:

```
nc -l 5555 | tar xzvf -
```

On the sending host pack the directory and send the data by connecting to the listening `nc` process on the receiving host:

```
tar czvf - /path/to/dir | nc receiving.host.com 5555
```

You can watch the transfer progress on both ends. Once completed, type `CTRL+C` to close the connection.

Creating a Simple Chat Server 
------------------------------

The procedure for creating an online chat between two or more hosts is the same as when transferring files.

On the first host start a Netcat process to listen on port 5555:

```
nc -l 5555
```

From the second host run the following command to connect to the listening port:

```
nc first.host.com 5555
```

Now, if you type a message and press `ENTER` it will be shown on both hosts.

To close the connection, type `CTRL+C`.

Performing an HTTP request 
---------------------------

Although there are much better tools for HTTP requests such as [`curl`](https://linuxize.com/post/curl-command-examples/) , you can also use Netcat to send various requests to remote servers.

For example, to retrieve the Netcat man page from the OpenBSD web site, you would type:

```
printf "GET /nc.1 HTTP/1.1\r\nHost: man.openbsd.org\r\n\r\n" | nc man.openbsd.org 80
```

The full response, including the HTTP headers and HTML code, will be printed in the terminal.

Conclusion 
-----------

In this tutorial, you have learned how to use the Netcat utility to establish and test TCP and UDP connections.

For more information, visit the [Netcat man page](https://man.openbsd.org/nc.1) and read about all other powerful options of the Netcat command.

If you have any questions or remarks, please leave a comment below.