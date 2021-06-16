One of the simplest ways to backup a system is using a *shell script*. For example, a script can be used to configure which directories to backup, and pass those directories as arguments to the tar utility, which creates an archive file. The archive file can then be moved or copied to another location. The archive can also be created on a remote file system such as an *NFS* mount.

The tar utility creates one archive file out of many files or directories. tar can also filter the files through compression utilities, thus reducing the size of the archive file.

Simple Shell Script
-------------------

The following shell script uses tar to create an archive file on a remotely mounted NFS file system. The archive filename is determined using additional command line utilities.

    #!/bin/bash
    ####################################
    #
    # Backup to NFS mount script.
    #
    ####################################

    # What to backup. 
    backup_files="/home /var/spool/mail /etc /root /boot /opt"

    # Where to backup to.
    dest="/mnt/backup"

    # Create archive filename.
    day=$(date +%A)
    hostname=$(hostname -s)
    archive_file="$hostname-$day.tgz"

    # Print start status message.
    echo "Backing up $backup_files to $dest/$archive_file"
    date
    echo

    # Backup the files using tar.
    tar czf $dest/$archive_file $backup_files

    # Print end status message.
    echo
    echo "Backup finished"
    date

    # Long listing of files in $dest to check file sizes.
    ls -lh $dest

* *$backup\_files:* a variable listing which directories you would like to backup. The list should be customized to fit your needs.
* *$day:* a variable holding the day of the week (Monday, Tuesday, Wednesday, etc). This is used to create an archive file for each day of the week, giving a backup history of seven days. There are other ways to accomplish this including using the date utility.
* *$hostname:* variable containing the *short* hostname of the system. Using the hostname in the archive filename gives you the option of placing daily archive files from multiple systems in the same directory.
* *$archive\_file:* the full archive filename.
* *$dest:* destination of the archive file. The directory needs to be created and in this case *mounted* before executing the backup script. See [???](https://ubuntu.com/server/docs/backups-shell-scripts#network-file-system) for details of using *NFS*.
* *status messages:* optional messages printed to the console using the echo utility.
* *tar czf $dest/$archive\_file $backup\_files:* the tar command used to create the archive file.

  * *c:* creates an archive.
  * *z:* filter the archive through the gzip utility compressing the archive.
  * *f:* output to an archive file. Otherwise the tar output will be sent to STDOUT.
* *ls -lh $dest:* optional statement prints a *-l* long listing in *-h* human readable format of the destination directory. This is useful for a quick file size check of the archive file. This check should not replace testing the archive file.

This is a simple example of a backup shell script; however there are many options that can be included in such a script. See [References](https://ubuntu.com/server/docs/backups-shell-scripts#References) for links to resources providing more in-depth shell scripting information.

Executing the Script
--------------------

### Executing from a Terminal

The simplest way of executing the above backup script is to copy and paste the contents into a file. `backup.sh` for example. The file must be made executable:

    chmod u+x backup.sh

Then from a terminal prompt:

    sudo ./backup.sh

This is a great way to test the script to make sure everything works as expected.

### Executing with cron

The cron utility can be used to automate the script execution. The cron daemon allows the execution of scripts, or commands, at a specified time and date.

cron is configured through entries in a `crontab` file. `crontab` files are separated into fields:

    # m h dom mon dow   command

* *m:* minute the command executes on, between 0 and 59.
* *h:* hour the command executes on, between 0 and 23.
* *dom:* day of month the command executes on.
* *mon:* the month the command executes on, between 1 and 12.
* *dow:* the day of the week the command executes on, between 0 and 7\. Sunday may be specified by using 0 or 7, both values are valid.
* *command:* the command to execute.

To add or change entries in a `crontab` file the crontab -e command should be used. Also, the contents of a `crontab` file can be viewed using the crontab -l command.

To execute the backup.sh script listed above using cron. Enter the following from a terminal prompt:

    sudo crontab -e

> **Note**
> 
> Using sudo with the crontab -e command edits the *root* user’s crontab. This is necessary if you are backing up directories only the root user has access to.

Add the following entry to the `crontab` file:

    # m h dom mon dow   command
    0 0 * * * bash /usr/local/bin/backup.sh

The `backup.sh` script will now be executed every day at 12:00 pm.

> **Note**
> 
> The backup.sh script will need to be copied to the `/usr/local/bin/` directory in order for this entry to execute properly. The script can reside anywhere on the file system, simply change the script path appropriately.

For more in-depth crontab options see [References](https://ubuntu.com/server/docs/backups-shell-scripts#References).

Restoring from the Archive
--------------------------

Once an archive has been created it is important to test the archive. The archive can be tested by listing the files it contains, but the best test is to *restore* a file from the archive.

* To see a listing of the archive contents. From a terminal prompt type:

      tar -tzvf /mnt/backup/host-Monday.tgz
* To restore a file from the archive to a different directory enter:

      tar -xzvf /mnt/backup/host-Monday.tgz -C /tmp etc/hosts

  The *-C* option to tar redirects the extracted files to the specified directory. The above example will extract the `/etc/hosts` file to `/tmp/etc/hosts`. tar recreates the directory structure that it contains.

  Also, notice the leading *“/”* is left off the path of the file to restore.
* To restore all files in the archive enter the following:

      cd /
    sudo tar -xzvf /mnt/backup/host-Monday.tgz

> **Note**
> 
> This will overwrite the files currently on the file system.

References
----------

* For more information on shell scripting see the [Advanced Bash-Scripting Guide](http://tldp.org/LDP/abs/html/)
* The book [Teach Yourself Shell Programming in 24 Hours](http://safari.samspublishing.com/0672323583) is available online and a great resource for shell scripting.
* The [CronHowto Wiki Page](https://help.ubuntu.com/community/CronHowto?_ga=2.81295319.1173161871.1623195457-1743790232.1623195457) contains details on advanced cron options.
* See the [GNU tar Manual](http://www.gnu.org/software/tar/manual/index.html) for more tar options.
* The Wikipedia [Backup Rotation Scheme](http://en.wikipedia.org/wiki/Backup_rotation_scheme) article contains information on other backup rotation schemes.
* The shell script uses tar to create the archive, but there many other command line utilities that can be used. For example:

  * [cpio](http://www.gnu.org/software/cpio/): used to copy files to and from archives.
  * [dd](http://www.gnu.org/software/coreutils/): part of the coreutils package. A low level utility that can copy data from one format to another.
  * [rsnapshot](http://www.rsnapshot.org/): a file system snapshot utility used to create copies of an entire file system. Also check the [Tools - rsnapshot](https://ubuntu.com/server/docs/tools-rsnapshot) for some information.
  * [rsync](http://manpages.ubuntu.com/manpages/focal/man1/rsync.1.html): a flexible utility used to create incremental copies of files.

 Last updated 1 year, 2 months ago. [Help improve this document in the forum](https://discourse.ubuntu.com/t/backups-shell-scripts/11518).