Summary
-------

cloud-init is the [Ubuntu package](https://launchpad.net/ubuntu/+source/cloud-init) that handles early initialization of a cloud instance. It is installed in the official Ubuntu live server images since the release of 18.04, [Ubuntu Cloud Images](http://cloud-images.ubuntu.com/releases/) and also in the official Ubuntu images available on EC2\. 

Some of the things it configures are: 

* setting a default locale
* setting hostname
* generate ssh private keys
* adding ssh keys to user's .ssh/authorized\_keys so they can log in
* setting up ephemeral mount points

cloud-init's behavior can be configured via user-data. [User-data](http://developer.amazonwebservices.com/connect/entry.jspa?externalID=1085) can be given by the user at instance launch time. This is done via the --user-data or --user-data-file argument to [ec2-run-instances](http://docs.amazonwebservices.com/AWSEC2/latest/CommandLineReference/ApiReference-cmd-RunInstances.html) 

User Data Input Formats
-----------------------

User data that will be acted upon by cloud-init must be in one of the following types: 

* **Gzip Compressed Content**

  * content found to be gzip compressed will be uncompressed. The uncompressed data will then be used as if it were not compressed. Compression of data is useful because user-data is limited to 16384 bytes [1](https://help.ubuntu.com/community/CloudInit#fnref-6a17aff5cf9eab5a99b5ab3dbd49854b0e9681c1)
* **Mime Multi Part archive**

  * This list of rules is applied to each part of this multi-part file. Using a mime-multi part file, the user can specify more than one type of data. For example, both a user data script and a cloud-config type could be specified.
* **User-Data Script**

  * begins with: "\#!" or "Content-Type: text/x-shellscript"
script will be executed at "rc.local-like" level during first boot. rc.local-like means "very late in the boot sequence"
* **Include File**

  * begins with "\#include" or "Content-Type: text/x-include-url"
This content is a "include" file. The file contains a list of urls, one per line. Each of the URLs will be read, and their content will be passed through this same set of rules. Ie, the content read from the URL can be gzipped, mime-multi-part, or plain text
* **Cloud Config Data**

  * begins with "\#cloud-config" or "Content-Type: text/cloud-config"
This content is "cloud-config" data. See the examples for a commented example of supported config formats.
* **Upstart Job**

  * begins with "\#upstart-job" or "Content-Type: text/upstart-job"
Content is placed into a file in /etc/init, and will be consumed by upstart as any other upstart job.
* **Cloud Boothook**

  * begins with "\#cloud-boothook" or "Content-Type: text/cloud-boothook"

    This content is "boothook" data. It is stored in a file under /var/lib/cloud and then executed immediately.
This is the earliest "hook" available. Note, that there is no mechanism provided for running only once. The boothook must take care of this itself. It is provided with the instance id in the environment variable "INSTANCE\_ID". This could be made use of to provide a 'once-per-instance'
*Only available in 10.10 or later (cloud-init 0.5.12 and later)*
* **Part Handler**

  * begins with "\#part-handler" or "Content-Type: text/part-handler"

    This is a 'part-handler'. It will be written to a file in /var/lib/cloud/data based on its filename. This must be python code that contains a list\_types method and a handle\_type method. Once the section is read the 'list\_types' method will be called. It must return a list of mime-types that this part-handler handlers.
The 'handle\_type' method must be like: 

        def handle_part(data,ctype,filename,payload):
      # data = the cloudinit object
      # ctype = "__begin__", "__end__", or the mime-type of the part that is being handled.
      # filename = the filename of the part (or a generated filename if none is present in mime data)
      # payload = the parts' content

Cloud-init will then call the 'handle\_type' method once at begin, once per part received, and once at end. The 'begin' and 'end' calls are to allow the part handler to do initialization or teardown.
There is an example at [doc/examples/part-handler.txt](http://bazaar.launchpad.net/~cloud-init-dev/cloud-init/trunk/annotate/head:/doc/examples/part-handler.txt). Also this [blog post](http://foss-boss.blogspot.com/2011/01/advanced-cloud-init-custom-handlers.html) offers another example

User-Data Scripts
-----------------

As popularized by [alestic.com](http://alestic.com/), user-data scripts are a convenient way to do something on first boot of a launched instance. This input format is accepted to cloud-init and handled as you would expect. The script will be invoked at an "rc.local" like point in the boot sequence. 

For example: 

    $ cat myscript.sh
    #!/bin/sh
    echo "Hello World.  The time is now $(date -R)!" | tee /root/output.txt

    $ euca-run-instances --key mykey --user-data-file myscript.sh ami-a07d95c9 

After running the above, you can expect that /root/output.txt will contain the desired text. 

Cloud Config Syntax
-------------------

Cloud Config is the simplest way to accomplish some things via user-data. Using cloud-config syntax, the user can specify certain things in a human friendly format. These things include: 

* apt upgrade should be run on first boot
* a different apt mirror should be used
* additional apt sources should be added
* certain ssh keys should be imported

The file must be valid yaml syntax. 

Here are some simple examples of what can be done with cloud-config syntax: 

* **run 'apt-get upgrade' on first boot** 

      #cloud-config
    apt_upgrade: true
* **enable byobu by default for all system users** 

      #cloud-config
    byobu_by_default: system
* **import ssh keys for launchpad user 'smoser' and add his ppa** 

      #cloud-config
    ssh_import_id: [smoser]
    apt_sources:
     - source: "ppa:smoser/ppa"
* **run a few commands on first boot**
 The output of these commands will appear in console output 

      #cloud-config
    runcmd:
     - [ wget, "http://slashdot.org", -O, /tmp/index.html ]
     - [ sh, -xc, "echo $(date) ': hello world!'" ]

Multipart Input
---------------

A single format of user data might not be enough to accomplish what you want. For example, you may want to insert an upstart job and also run a user-data script. 

There is a tool in cloud-utils's bin/ directory called '[write-mime-multipart](http://bazaar.launchpad.net/~cloud-utils-dev/cloud-utils/trunk/view/head:/bin/write-mime-multipart)' which can aid creating mime multipart content. 

Consider the following example:

    $ cat my-boothook.txt
    #!/bin/sh
    echo "Hello World!"
    echo "This will run as soon as possible in the boot sequence"

    $ cat my-user-script.txt
    #!/usr/bin/perl
    print "This is a user script (rc.local)\n"

    $ cat my-include.txt
    # these urls will be read pulled in if they were part of user-data
    # comments are allowed.  The format is one url per line
    http://www.ubuntu.com/robots.txt
    http://www.w3schools.com/html/lastpage.htm

    $ cat my-upstart-job.txt
    description "a test upstart job"
    start on stopped rc RUNLEVEL=[2345]
    console output
    task
    script
    echo "====BEGIN======="
    echo "HELLO From an Upstart Job"
    echo "=====END========"
    end script

    $ cat my-cloudconfig.txt
    #cloud-config
    ssh_import_id: [smoser]
    apt_sources:
     - source: "ppa:smoser/ppa"

Now, given the files above in the current directory, you can do: 

    $ ls
    my-boothook.txt     my-include.txt      my-user-script.txt
    my-cloudconfig.txt  my-upstart-job.txt

    $ write-mime-multipart --output=combined-userdata.txt \
       my-boothook.txt:text/cloud-boothook \
       my-include.txt:text/x-include-url \
       my-upstart-job.txt:text/upstart-job \
       my-user-script.txt:text/x-shellscript \
       my-cloudconfig.txt

    $ ls -l combined-userdata.txt 
    -rw-r--r-- 1 smoser smoser 1782 2010-07-01 16:08 combined-userdata.txt

    $ gzip combined-userdata.txt
    $ ls -l combined-userdata.txt.gz 
    -rw-r--r-- 1 smoser smoser 659 2010-07-01 16:08 combined-userdata.txt.gz

    $ euca-run-instances ami-a07d95c9 --user-data-file=combined-userdata.txt.gz

Now, when your instance is booted, you will have 

* smoser's keys imported into the ubuntu users ~/.ssh/authorized\_keys . Notice that I did not specify '--key' on the command line as it wasn't needed. Instead, my launchpad keys were imported.
* a root owned file in /var/lib/cloud/data/user-data.txt that contains the gzip compressed user data.
* a root owned file in /var/lib/cloud/data/user-data.txt.i that contains the post-processed user data (uncompressed, with includes resolved).
* a file '/var/lib/cloud/data/user-data.txt.i'

Also, notice 

* because 'my-cloudconfig.txt' begins with '\#cloud-config' we did not need to specify the mime-type.
* [600799](https://launchpad.net/bugs/600799) makes boothook get read as a user script

More information
----------------

The examples subdirectory of cloud-init can be seen in bzr branch [lp:cloud-init](https://code.launchpad.net/~cloud-init-dev/cloud-init/trunk) [doc/examples/](http://bazaar.launchpad.net/~cloud-init-dev/cloud-init/trunk/files/head:/doc/examples/) 

Video:- [Introduction to cloud-init](http://www.youtube.com/watch?v=-zL3BdbKyGY) 

Footnotes
---------

1. The following was output of 'ec2-run-instances --user-data-file=ud.txt' where ud.txt was sufficiently large on 2010-06-28: 'Client.[InvalidParameterValue](https://help.ubuntu.com/community/InvalidParameterValue): User data is limited to 16384 bytes' ([1](https://help.ubuntu.com/community/CloudInit#fndef-6a17aff5cf9eab5a99b5ab3dbd49854b0e9681c1-0))