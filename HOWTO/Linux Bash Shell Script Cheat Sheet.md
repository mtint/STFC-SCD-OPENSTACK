Explain shell commands
----------------------

<https://explainshell.com/>

Basics
------

    #!/bin/bash
    #
    # By Klemens Ullmann-Marx 2011-03-17

    # Exit script immediately if a command exits with a nonzero exit value
    set -e
    # Ignore nonzero exit value for a command by adding " || true"
    #command || true

    # Activate debugging - echo on, display commands, outputs to stderr! 
    #set -x
    # Deactivate debugging
    #set +x

Redirection
-----------

<http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-3.html>

Redirect std and err output to /dev/null:

    date > /dev/null 2>&1

Redirect to stderr:

    date >&2

Use tee to redirect to a file and stdout:

stderr + /dev/tty0:

    date | tee /dev/tty0 >&2

stderr + syslog

    echo "foo" | tee /dev/stderr | logger

### Log bash script output

Put this on top of your bash script: 

    # overwrite log
    exec 1>/path/to/logfile 2>&1

    #append to log
    exec 1>>/path/to/logfile 2>&1

    # show output and append to log
    exec &> >(tee -a /path/to/logfile)

### Echo to stderr

    # Echo to stderr function echoerr() { printf "%s\n" "$*" >&2; }  echoerr "Error, no more beer in the fridge!"

Batch Rename Files
------------------

-n = dry run

rename -n 's/\_bottom/\_x/' \*.png

rename -n 's/\\.htm$/\\.html/' \*.htm

Add a prefix

rename -n 's/^/PRE\_/' \*

Add a suffix

sudo rename -n 's/$/.conf/' /etc/apache2/sites-available/\*

    for file in *; do
      echo $file
      mv "$file" "$file.pdf"
    done

Compare files in two directories
--------------------------------

Not the content!

diff -qr dir1/ dir2/

Search for a string in files recusevly
--------------------------------------

grep -r "word" .

Batch search and replace in files
---------------------------------

sed -i 's/my\_search/my\_replace/g' \*.html

Sed replace with regular expression
-----------------------------------

sed -E 's/ root@[a-zA-Z0-9]+$/ root@foo/' /etc/ssh/ssh\_host\_rsa\_key.pub

Sed delete line by regular expression
-------------------------------------

sed -i '/root@host.example.com$/d' /root/.ssh/authorized\_keys

Recursive

find . -name "\*.php" | xargs -n 1 sed -i -e "s|Theme' . sfConfig::get('app\_theme\_package', 'NG') . \\"Plugin|Plugin|g"

Find Symlinks
-------------

find ./ -type l -exec ls -l {} \\; 

find . -type l

Find multiple file types
------------------------

Note the spaces after and before the braces

find . \\( -name "\*.php" -or -name "\*.html" -or -name "\*.css" -or -name "\*.js" \\) -exec ls -la {} \\;

Find files older than x days
----------------------------

find /my/dir -type f -mtime +7 | xargs ls -l

Extract columns/fields
----------------------

* du ./\* -shx | cut -c 1-3
  * Characters 1-3
* du ./\* -shx | awk '{print $2}'
  * Second column separated by whitespace
* echo "hey whats up with you" | | awk '{for (i=3; i\<NF; i++) printf $i " "; print $NF}'
  * Get all remaining columns starting from column 3

Return Code / Exit Status
-------------------------

Print the return code of the last command. 0=success, \>0=failure

echo $?

Test exit status

    mount /dev/xyz

    if [ $? -eq 0 ] ; then
    # Direct alternative: if mount /dev/xyz; then
      echo "Good..."
    else
      echo "Bad..."
      exit 1 # return failure exit status
    fi

Run multiple commands even with errors, but "log" occurence of error:

    RC=0

    mycommand1
    LASTRC=$?;if [ $LASTRC != 0 ]; then echo "ERROR! Return code $LASTRC"; RC=$LASTRC; fi

    mycommand2
    LASTRC=$?;if [ $LASTRC != 0 ]; then echo "ERROR! Return code $LASTRC"; RC=$LASTRC; fi

    exit $RC

For longer/more complex shell scripts the following is recommended:

    #!/bin/bash
    #

    # Exit script immediately if a command exits with a nonzero exit value
    set -e
    # Echo on, display commands, very useful for debugging
    set -x

    # Ignore nonzero exit value for a command by adding " || true"
    rm mydir/.* -r || true

#### Return Code Condition

    OUTPUT="$(run-one nice -n 19 ionice -c3 unison -silent myNotebook)"
    echo exit: $?
    echo out: ${OUTPUT}

    # Unison exit codes
    #    0: successful synchronization; everything is up-to-date now.
    #    1: some files were skipped, but all file transfers were successful.
    #    2: non-fatal failures occurred during file transfer.
    #    3: a fatal error occurred, or the execution was interrupted.

    if [ $? -eq 3 ] ; then
      echo "Unison: a fatal error occurred, or the execution was interrupted"
      exit 3
    fi

Variables
---------

    "${foo}bar"

Multiline options with comments
-------------------------------

    MYSQLOPTS="\
      --host=$HOST\
      --user=$USER\
      --no-tablespaces         `# mysqldump needs „PROCESS“ privilege otherwise`\
      --ignore-table=myview    `# ignore error 'View 'myview' references invalid table'`\
    "

Explanation:

* A backslash "\\" at the end of the line allows to break a line into multiple lines. Make sure there is no whitspace (spaces,...) after the backslash!
* Everything inside "`" backticks is executed. We use this trick for comments with "\#"

Assign heredoc EOF to Variable
------------------------------

    VARIABLE=`cat <<EOF
    foo
    bar
    $BAZ
    EOF
    `

If clauses
----------

If string contains...

    if [[ "$string" == *"foo"* ]]
        echo "Yes we foo!"
    fi

Combine clauses

    if [ "$string" == "foo"] || [ "$string" == "foo" ] 
        echo "Yes we foo or bar!"
    fi

Repeat until it works
---------------------

until ssh <user@server.test>; do echo "Nope"; sleep 2; done

Test multiple script arguments
------------------------------

    # Validate script arguments
    # "-z" = "string is empty"
    if [ -z "$2" ] || [ -z "$1" ]; then

        echo Usage: `basename $0` param1 param2
        echo Example:  `basename $0` "my-project" "secret123"

        # exit with error code
        exit 64
    fi

Test if multiple variables are set
----------------------------------

    # Validate local configuration variables
    # "-z" = "string is empty"
    if [ -z $UNIXUSER ] || [ -z $EMAIL ] || [ -z $MYSQLUSER ] || [ -z $MYSQLPASS ] ; then
        echo Not all required variables are set!

        # exit with error code
        exit 64
    fi

Confirmation
------------

    # Confirmation
    read -r -p "Would you really like to ... [Y/n] ? " response
    response=${response,,} # tolower

    if [[ $response =~ ^(yes|y| ) ]] ;  then
        echo ok, proceeding...
    else
        echo ok, aborting...
        exit 64
    fi

Search and replace in a file
----------------------------

    cp mydir/file mydir/file.99
    cat mydir/file.99 | sed "s/search/replace/g" > mydir/file
    rm mydir/file.99

Sed search and replace from stdin
---------------------------------

<https://unix.stackexchange.com/a/450857>

* echo -n 'foo' | sed -e '/.\*search/{r /dev/stdin' -e 'd;}' /my/file

or direct replace in file:

* echo -n 'foo' | sed -i -e '/.\*search/{r /dev/stdin' -e 'd;}' /my/file

Create user by script
---------------------

    #!/bin/bash
    #
    # Create a user by script
    # Arguments: username password
    #
    # By Klemens Ullmann-Marx 2011-02-01

    USERNAME=$1
    PASSWORD=$2

    useradd --create-home $USERNAME
    echo "$USERNAME:$PASSWORD" | chpasswd

Find and iterate
----------------

    FILES=`find /tmp/subversion -maxdepth 1 -type f -printf %P"\n" | sed 's/.svn.dumpfile//g'`

    for f in $FILES; do
        echo Loading svn repository /tmp/subversion/$f
        rm -rf $REPOSPATH/$f
        svnadmin create $REPOSPATH/$f
        svnadmin load $REPOSPATH/$f < /tmp/subversion/$f.svn.dumpfile
    done

### Iterate lines in a variable

    LIST=`du /srv/backup/milano2/2* -shx`

    # Iterate lines in variabale $LIST
    while read LINE          
    do
        CHECK=$(echo "$LINE" | cut -c 1-3)
        DIR=$(echo "$LINE" | awk '{print $2}')
        #echo $CHECK
        #echo $DIR

        if [ "$CHECK" == "20K" ] ; then
            echo Directory is only $CHECK. This means a failed backup. Deleting $DIR
            rm -r $DIR
        else
            echo $DIR seems to be a valid backup: $CHECK
        fi

        echo "--=--"

    done <<< "$LIST"

### Iterate Mysql result

    mysql dbname -B -N -s -e "SELECT * FROM tbl" | while read -r line
    do
    echo "$line" | cut -f1   # outputs col #1
    echo "$line" | cut -f2   # outputs col #2
    echo "$line" | cut -f3   # outputs col #3
    done

### Check if a mount point/disk is mounted

    #! /bin/sh
    #

    MOUNTPOINT="/media/backup-disk"

    mount $MOUNTPOINT

    if grep -qs "$MOUNTPOINT" /proc/mounts; then
      echo "Good..."
    else
      echo "Failed to mount $MOUNTPOINT!"
      exit 1
    fi

    doSomestuff.sh

    umount $MOUNTPOINT

### Echo tabs

* echo -e "Hey\\twhats\\tup"

### Check if a website is running correctly

Can be used in cron like this, sends an email in case of error if you configure "MAILTO=me@example.com" option in crontab.
 You need also SHELL=/bin/bash

if [[ `wget -q --no-check-certificate -O - <https://example.com:1234/xyz/> | grep "Ok Text"` == "" ]]; then echo "example.com website is running correcly!"; fi

### Check if a remote service is running correctly

Can be used in cron like this, sends an email in case of error if you configure "MAILTO=me@example.com" option in crontab
 You need also SHELL=/bin/bash

nc -z example.com 1234; if [[ $? != 0 ]]; then echo "Service 1234 is not running on example.com!"; fi
 Explanation: nc = netcat, "$?" checks the return code of the "nc" command. If not "0" (not ok) perform notifying.

Logging to stderr and syslog
----------------------------

logger -s "ERROR: no more haribos!"

Gernerate random string
-----------------------

cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 6 | head -n 1

Send email to root
------------------

echo -e "huhu\\nhaha" | mail -s "Test subj" root

Get local ip
------------

ip route get 1.1.1.1 | head -1 | cut -d ' ' -f8