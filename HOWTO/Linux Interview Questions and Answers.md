**1.Create user with specified Home directory ..?**

 Ans: useradd -d "Directory Path" username
 Ex: useradd -d /var/aravi aravi

**2\. Create new user, user should change password by first login..?**

 Ans: useradd \<user name\>
 Ex: useradd aravi1; chage -d 0 aravi1; passwd aravi1

**3\. How to ditermine cronjob ran status..?**

 Ans: 

 \<After the Cron Script\> Add the $? \> \<Log File\>

 Find the code below and its status

 0 -- No problems.
 1 -- An attempt has been made to start cron but there is already a /var/run/cron.pid file. If there really is no other cron daemon running (this does not include invokations of mcron) then you should remove this file before attempting to run cron.
 2 -- In parsing a guile configuration file, a job command has been seen but the second argument is neither a procedure, list or string. This argument is the job's action, and needs to be specified in one of these forms.
 3 -- In parsing a guile configuration file, a job command has been seen but the first argument is neither a procedure, list or string. This argument is the job's next-time specification, and needs to be specified in one of these forms.
 4 -- An attempt to run cron has been made by a user who does not have permission to access the crontabs in /var/cron/tabs. These files should be readable only by root, and the cron daemon must be run as root.
 5 -- An attempt to run mcron has been made, but there are no jobs to schedule!
 6 -- The system administrator has blocked this user from using crontab with the files /var/cron/allow and /var/cron/deny.
 7 -- Crontab has been run with more than one of the arguments -l, -r, -e. These are mutually exclusive options.
 8 -- Crontab has been run with the -u option by a user other than root. Only root is allowed to use this option.
 9 -- An invalid vixie-style time specification has been supplied.
 10 -- An invalid vixie-style job specification has been supplied.
 11 -- A bad line has been seen in /etc/crontab.
 12 -- The last component of the name of the program was not one of mcron, cron, crond or crontab.
 13 -- Either the ~/.cron directory does not exist, or there is a problem reading the files there.
 15 -- Crontab has been run without any arguments at all. There is no default behaviour in this case.
 16 -- Cron has been run by a user other than root.

**4\. What is zombie process in Linux ..?** 

Ans: Zombie process is a **process** that has completed execution (via the exit system call) but still has an entry in the **process** table: it is a **process** in the "Terminated state". 

**5\. How to find and kill zombie process in Linux ..?**

 Ans: To find zombie process in Linux use below command

 $ ps axo stat,ppid,pid,comm | grep -w Z
 $ kill -9 \<PID\>

**6\. How to find Linux system calls ..?**

 Ans: using $ strace command we can find system calls

**7\. What is the Difference between Hardlink and Softlink in Linux..?**

 Ans: 
**Hard Link:** 
 A hardlink isn't a pointer to a file, it's a directory entry (a file) pointing to the same inode. Even if you change the name of the other file, a hardlink still points to the file. If you replace the other file with a new version (by copying it), a hardlink will not point to the new file. You can only have hardlinks within the same filesystem. With hardlinks you don't have concept of the original files and links, all are equal (think of it as a reference to an object). It's a very low level concept.

**Soft Link:**
 A softlink is actually pointing to another path (a file name); it resolves the name of the file each time you access it through the symlink. If you move the file, the symlink will not follow. If you replace the file with another one, keeping the name, the symlink will point to the new file. Symlinks can span filesystems. With symlinks you have very clear distinction between the actual file and symlink, which stores no info beside the path about the file it points to.

**8\. How can I find all the Soft Links in my system ?**

 Ans. Use this command for the same “find /etc -type l -exec ls -li {} \\;”

**9\. How can I find all the files having Hard Links in my system ?**

 Ans. Use this command for the same “find / -links +2 -type f -exec ls -li {} \\;”

**10\. How to find whether a file is a softlink ?**

 Ans. Simply using this command “ls -l” will tell you whether a file is pointing to some other file or not.

**11\. How to check whether a file have any softlink pointing to it ?**

 Ans. Till now, I am not aware of any way to do that. If I will find any, I will surely update my post.

**12\. How can I find out the source file of a hard link ?**

 Ans. No, you can’t find out the source file of a hard link. Once hard link is created, there is no way to tell which was the first file created.

**13\. Can I make a Soft link to a Hard link and Vice Versa ?**

 Ans. Yes, both soft links and hard links acts as normal files of the file system, so you can do both.

**14\. What is the use of initrd directory..?**

 Ans. The Linux initial **RAM disk** (initrd) is a temporary **root file system** that is mounted during system boot to support the two-state boot process. The initrd contains various executables and drivers that permit the real **root file system** to be mounted

**15\. RHEL version comparison..?**

Ans.

[![](https://2.bp.blogspot.com/-jXv0-OgMEhg/VW2ZMUfm4uI/AAAAAAAAAKA/Y6QTjJrkd34/s640/RHEL%252BComparision.jpg)](https://2.bp.blogspot.com/-jXv0-OgMEhg/VW2ZMUfm4uI/AAAAAAAAAKA/Y6QTjJrkd34/s1600/RHEL%252BComparision.jpg)

**16\. What is MYSQL query cache..?**

 Ans: The query cache stores the text of a SELECT statement together with the corresponding result that was sent to the client. If an identical statement is received later, the server retrieves the results from the query cache rather than parsing and executing the statement again.

**17\. What is Difference between Swap and Pagefile ..?**

 Ans: SWAPFILES operate by swapping entire processes from system memory into the swapfile. This immediately frees up memory for other applications to use.
 PAGING FILES function by moving "pages: of a program from system memory into the paging file. These pages are 4KB in size. The entire program does not get swapped wholesale into the paging file, when next application is requested this paging file not immediately freedup.

**18\. How to check the MYSQL running processes ..?**

 Ans: You can run the MySQL command SHOW PROCESSLIST to see what queries are being processed.

**19\. How to identify which processes are taking more memory..?**

 Ans: Enter Command "**top**"
 Press **SHIFT+F**
 Press **n** (\* N: %MEM = Memory usage (RES))
 Press **ENTER**

 OR

 use below command to see top 5 processes

    $ ps -eo pmem,pcpu,vsize,pid,cmd | sort -k 1 -nr | head -5

**19\. TCP vs UDP ..?**
 Ans :

**TCP - **
 Transmission Control Protocol.
 TCP is a connection-oriented protocol.
 Use by other protocols HTTP, HTTPs, FTP, SMTP, Telnet.
 The speed for TCP is slower than UDP.
 TCP header size is 20 bytes
 TCP does error checking
 Acknowledgement segments

**UDP -** 
 User Datagram Protocol or Universal Datagram Protocol
 UDP is a connectionless protocol.
 Use by other protocols DNS, DHCP, TFTP, SNMP, RIP, VOIP.
 UDP is faster because there is no error-checking for packets.
 UDP Header size is 8 bytes.
 UDP does error checking, but no recovery options.
 No Acknowledgment 

**. what is the difference between bash & ksh..?**

 Ans:** **

 Y Feature can be done using this shell.
 N Feature is not present in the shell.
 F Feature can only be done by using the shells function mechanism.
 L The readline library must be linked into the shell to enable this Feature 

DescriptionshcshkshbashtcshzshrcesJob controlNYYYYYNNAliasesNYYYYYNNShell functionsY(1)NYYNYYYSensible Input/Output redirection YNYYNYYYDirectory stackNYYYYYFFCommand historyNYYYYYLLCommand line editingNNYYYYLLVi Command line editingNNYYY(3)YLLEmacs Command line editingNNYYYYLLRebindable Command line editingNNNYYYLLUser name look upNYYYYYLLLogin/Logout watchingNNNNYYFFFilename completionNY(1)YYYYLLUsername completionNY(2)YYYYLLHostname completionNY(2)YYYYLLHistory completionNNNYYYLLFully programmable CompletionNNNNYYNNMh Mailbox completionNNNN(4)N(6)N(6)NNCo ProcessesNNYNNYNNBuiltin artithmetic evaluationNYYYYYNNCan follow symbolic links invisiblyNNYYYYNNPeriodic command executionNNNNYYNNCustom Prompt (easily)NNYYYYYYSun Keyboard HackNNNNNYNNSpelling CorrectionNNNNYYNNProcess SubstitutionNNNY(2)NYYYFreely AvailableNNN(5)YYYYYChecks MailboxNYYYYYFFTty Sanity CheckingNNNNYYNNCan cope with large argument listsYNYYYYYYHas non-interactive startup fileNYY(7)Y(7)YYNNHas non-login startup fileNYY(7)YYYNNCan avoid user startup filesNYNYNYYYCan specify startup fileNNYYNNNNLow level command redefinitionNNNNNNNYHas anonymous functionsNNNNNNYYList VariablesNYYNYYYYFull signal trap handlingYNYYNYYYFile no clobber abilityNYYYYYNFLocal variablesNNYYNYYYLexically scoped variablesNNNNNNNYExceptionsNNNNNNNY