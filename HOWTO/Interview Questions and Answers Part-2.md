**1\. You are tasked to build a new Linux workstation. User wants to install a word processor and spreadsheets that offers a similar version for Microsoft Windows system. Which office suite should you install?**
Ans:- You should use Apache OpenOffice. Its free and open source project. And works fine on both Window and Linux systems.

2\. A technician uses the ps command to see what processes are running. When the current running processes are shown, he notices a process that he terminated 10 minutes ago by using the kill command is still running. What command should he use next to terminate this process?
Ans:- He should use -9 argument with kill command that will send a kill signal to the process. This will terminate the specific process immediately.

3\. A technician quickly notices a kernel error message on the screen during the boot process. Unfortunately, the error message disappear so quickly for the technician to read it all. What log directory can the technician use to examine boot-time messages?
Ans:- Linux system keeps almost all log files under the /var/log directory. Most of the boot messages are kept in buffer, which can be accessed by using the dmesg command. He can examine the /var/log/dmesg.log file. For boot time message he can also check the /var/log/boot.log file.

4\. A technician wants to view a list of all running processes on the server. How can he do this?
Ans:- He should use the ps command with -ef argument. ps -ef command will show a list of all running process.

5\. Where inittab file is located?
Ans:- Default location of inittab file is /etc directory. This file describes which process would be start at boot time.

6\. A technician want to boot the system in CLI mode on start up. Which runlevel should he assign and in which file ?
Ans:- He could assign runlevel 3 as the default runlevel in /etc/inittab file.

7\. What program a technician can use to analyze program's core dump files and to debug the application while it is actually running?
Ans:- He can use gdb program to analyze program's core dump files and also debug the application while it is actually running.

8\. As a technician you want to shutdown the Linux system. What command should you use?
Ans:- You could use shutdown command.

9\. As a technician you need to perform a scheduled shutdown that will occur in 10 minutes. What should you use to shut down the server in 10 minutes.?
Ans:- You can use -h argument with shutdown command which allows you to specify the time in second. To shutdown the system in 10 minute you should run shutdown -h 600 command.

10\. What command will halt the system?
Ans:- halt will halt the system.

11\. As a technician you need to restart the Apache Web Server. What command should you use.?
Ans:- You could use following command to restart the Apache web server.
\#service httpd restart

12\. Which command will restart the FTP Server?
Ans:- \#service vsftpd restart
Above command will restart the FTP server.

13\. What line printer control command is used to control the operation of the line printer system?
Ans:- lpc command is used with various argument to control the operations of line printer system.

14\. A technician wants to terminate an active spooling daemon on the local host immediately and then disables printing for the specified printers. What command should he use?
Ans:- He should use lpc command with abort options. lpc abort lpc abort terminates an active spooling daemon on the local host immediately and then disables printing for the specified printers,

15\. What print command stops a spooling daemon after the current job completes and disables printing?
Ans:- The lpc stop command stops a spooling daemon after the current job completes and disables printing

16\. What command allows you to directly see what jobs are currently in a printer queue?
Ans:- The lpc command allows you to directly see what jobs are currently in a printer queue

17\. A technician wants to halt the Linux server. What command should he use ?
Ans:- He can use init 0 command to halt the Linux server.

18\. What line printer command lets you remove print jobs from the printer queue?
Ans:- The lprm command will let you remove print jobs from the printer queue.

19\. What is the default text editor of Linux which include almost every version of Linux?
Ans:- Default editor of Linux is vi editor that can used to edit any ASCII text.

20\. What command is used for combining a large number of files into one single file for archival to tape?
Ans:- vi is a text editor that can be used to edit any ASCII text. It is especially useful for editing programs.

21\. Where do all your configurations for your services, programs, and daemons reside by default?
By default, all configurations for your services, programs, and daemons reside in the /etc directory.

22\. What type of backup tape will only back up files that have changed since the previous backup and clear the archive bit?
Ans:- An Incremental backup will backup only files that have changed since the previous backup and clear the archive bit.

23\. Which argument is used with tar command to create a new archive file?
-c argument is used to create new archive file.

24\. Which argument is used with tar command to extract the files from archive ?
Ans:- -x argument is used with tar command to extract the files form archive.

25\. What is default name of super or administrator account name in Linux?
Ans:- Super or administrator account in Linux is known as root user.

26\. A technician is going to install Linux on a workstation. The technician wants to customize the installation. What type of installation will the technician use to customize the installation?
Ans:- Only a custom installation can be used to customize what is installed during an installation. A custom installation will allow you to choose what packages you want to install and what packages you don’t want to install.

27\. Where is the password file for Linux located?
Ans:- The password file for Linux is located by default in the /etc/passwd location.

28\. Which program is mostly used for remote login securely in Linux?
Ans:- SSH is used for secure login. SSH is the replacement of old unsecure services like telnet.

29\. What file contains a list of user names that is not allowed to log in to the FTP server?
Ans:- The ftpusers file contains a list of usernames that a Linux administrator has previously set to not allow specific users to login to the FTP server. ftpusers file is located in /etc/vsftpd directory.

30\. Which command can be used to schedule recurring tasks?
Ans:- Cron command can be used to set scheduled recurring tasks.

31\. In which directory Linux store crontab files for particular users?
Ans:- The /var/spool/cron is the directory where user’s crontabs are saved with a directory for each user in which all user’s cron jobs are stored.

32\. What command should you use to activate a swap partition?
Ans:- swapon command is used to activate the swap partition.

33\. A technician is verifying the network configuration of a Linux server. Which command he should used to accomplish this?
Ans:- ifconfig is the proper command to examine network configuration.

34\. A technician wants to assign IP addresses to all the systems that will connect to the server automatically. What type of server he should set up?
Ans:- He should set up DHCP Server which assigns IP address to client automatically on start up.

35\. A technician wants to add a new user to the current domain. What command will the technician use to accomplish this?
Ans:- He should use useradd command followed by the username will create a new user or update default new user information. You need to specify the password separately with the passwd command.

36\. What option a technician can use with usermod command to unlock to user's password?
Ans:- The -U option is used with usermod command to unlock the user's password.

37\. What option of the mkfs command should you use to check the device for bad blocks before building the file system?
Ans:- The –c option when used with the mkfs command will check the device for bad blocks before building the file system.

38\. What at command argument will send mail to the user when the job has completed, even if there was no output?
Ans:- -m argument with at command will send mail to the users when the job has completed even if there was no output.

39\. A user wants to verify the current active shell. Which command will he use?
Ans:- He should use the env command to verify the current active shell

40\. What command can a technician use to search for a specific file?
Ans:- He can use either find or locate command to search for a specific file.

41\. How can you send the output of a file to another file?
Ans:- The \> option is used to send the output of a file to another file.

42\. What is the -t option with fsck command used for?
Ans:- The –t option used with fsck is used to specify the type of filesystem to be checked.

43\. Which utility should you use to display the CPU processes?
Ans:- top utility lets you see all on one screen how much memory and CPU usage that you are currently using, and also the resource usage by each program and process.

44\. What command can you use to obtain information about your serial port resource usage, such as IRQ and IO addresses?
setserial is a utility that you can use to obtain information about serial port resource usage, such as IRQ and IO addresses.

45\. A technician wants to delete the a user account. Which command should he use?
Ans:- The userdel command is used to delete a user from the system.

46\. Which command is used to change from one directory to another?
Ans:- cd command is used to navigate the Linux hierarchical file system structure, use the cd command to change from one directory to another.

47\. A user wants to copy a file from the /tmp directory to the his home directory. Which command would he use?
Ans:- He can use cp command to copy the files from one directory other directory.

48\. What is the file extension of Red Hat Package manager?
Ans:- RPM extension is associated with the Red Hat Package manager

49\. What command can you use to mount a CD-ROM drive?
Ans:- mount command will mount the CD-ROM.

50\. A technician wants to monitor connections to a Linux server. Which command should the technician use?
He should use netstat command. Netstat is a perfect way to see and monitor the both inbound and outbound connections. This command also be used to view packet statistics so you can see how many packets have been sent and received.

51\. Which command a user can use to exit a login shell?
Ans:- The logout or exit command will exit him from a login shell.

52\. A technician is having problems connecting to a mail server. What command can he use to test if the mail server is on the network?
Ans:- He can use ping command to test connectivity between local system and remote server.

### Ping your More Questions in below comments....