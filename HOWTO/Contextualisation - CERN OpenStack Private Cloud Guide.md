The process of contextualisation configures a virtual machine after it has been installed. Typical examples would be to create additional users, install software packages or call a configuration management system. These steps can be used to take a reference image and customise it further. Contextualisation is only run once when the VM is created, further configuration steps should be performed by a configuration management system such as Puppet.

The benefit of using contextualisation compared to managing your own images is that CERN IT will ensure an up-to-date image is maintained, with appropriate bug fixes and security patches and that the IT support lines for cloud infrastructure and operating system support will investigate issues encountered with the operating system. Private images can be uploaded but there is no central IT support for VMs based on private images.

The standard Linux images as provided by the CERN private cloud include a contextualisation feature using the open source cloud-init package. The method to use this is documented below.

**Note:** The 'User Data' method of passing information to an instance should not be used for sensitive information. For this, the 'Config Drive' option described below or other means, such as secret stores offered by a configuration management system, should be used. See this [OpenStack Security Note](https://wiki.openstack.org/wiki/OSSN/OSSN-0074) for more details. 

Creating Virtual Machines with User Data
----------------------------------------

There exist different ways to launch instances with user data.

* From the OpenStack dashboard, in the "Configuration" tab you can either load a user data file or fill in the "Customisation Script" text box
* Using the `openstack` command line tool, the user data can be provided from a file

    $ openstack server create --image "image_name" --flavor m2.small --user-data "file_with_userdata" --key-name "key_name" myinstance

Verifying User Data
-------------------

The user data for a VM can be retrieved from inside the VM using the following command. The "magic" IP address is fixed and should not be changed for different machines.

    $ curl http://169.254.169.254/latest/user-data

Examples of user data
---------------------

The upsteam `cloud-init` documentation has some nice [examples](https://cloudinit.readthedocs.io/en/latest/topics/examples.html).

### Create all users

    $ cat > cern-config-users.txt << EOF
    #!/bin/sh
    yum install -y cern-config-users
    /usr/sbin/cern-config-users --setup-all
    EOF

### Running a command

The following syntax can also be used

    $ cat > cern-config-users.txt << EOF
    #cloud-config
    runcmd:
     - [ /usr/bin/yum, "install", -y, "cern-config-users" ]
     - [ /usr/sbin/cern-config-users, --setup-all ]
    EOF

### Install the Folding @ Home client

This example shows how the CERN Cloud team deploy the Folding @ Home client on out-of-warranty resources:

    $ cat > folding-at-home.sh << EOF
    #!/bin/sh

    # Install fahclient RPM as found on https://foldingathome.org/start-folding/
    yum install https://download.foldingathome.org/releases/public/release/fahclient/centos-6.7-64bit/v7.6/fahclient-7.6.9-1.x86_64.rpm -y

    # Join the CERN team
    echo "EXTRA_OPTS=\"--user=CERN_Cloud --team=38188 --gpu=false --smp=true\"" >> /etc/default/fahclient

    # Restart the service
    /usr/sbin/service FAHClient restart 
    EOF

### Don't grow the underlying partition

    $ cat > no-grow.txt << EOF
    #cloud-config
    growpart:
      mode: off

### Large file conversion

User data can be provided as a gzip file if needed where the user data is larger than 16384 bytes,

    $ cat > userdata4zip.txt <<EOF
    #!/bin/sh
    wget -O /tmp/geolist.txt http://frontier.cern.ch/geolist.txt
    EOF
    gzip -c userdata4zip.txt > userdata4zip.gz

Using a GZIP file
-----------------

User data can be provided as a gzip file if needed where the user data is larger than 16384 bytes,

    $ cat > userdata4zip.txt <<EOF
    #!/bin/sh
    wget -O /tmp/geolist.txt http://frontier.cern.ch/geolist.txt
    EOF
    gzip -c userdata4zip.txt > userdata4zip.gz

Then use `openstack server create` command to launch a new instance, you will see that the file specified the user-data has been downloaded under /tmp directory.

Include Directive
-----------------

Provide userdata in a "include" way, starts with "\#include" or "Content-Type: text/x-include-url", contains a list of urls, one url per line, the userdata passed by the urls can be plain txt, gzip file or mime-multi-part script. Here is an example:

    #include
    # entries are one url per line. comment lines beginning with '#' are allowed
    # urls are passed to urllib.urlopen, so the format must be supported there
    http://frontier.cern.ch/userdata.txt

The content of userdata.txt is:

    #! /bin/bash
    wget -O /tmp/robots.txt http://www.ubuntu.com/robots.txt

which will get robots.txt and put it under /tmp directory. Then use `openstack server create` command to launch a new instance, you will see that the file specified the user-data has been downloaded under /tmp directory.

Multiple part
-------------

cloud-init supply a method called "multiple part" to supply user data in multiple ways, which means you can use userdata script and cloud-config (or other methods recognized by cloud-init) at the same time. cloud-init provides a script write-mime-multipart to generate a final userdata file, here is the sample:

    $ cat userdata4script
    #! /bin/bash
    mkdir -p /tmp/rdu
    echo "Hello World!" > helloworld.txt

    $ cat userdata4config
    #cloud-config
    runcmd:
     - [ wget, "http://slashdot.org", -O, /tmp/index.html ]

    $ cat userdata4include
    #include
    # entries are one url per line. comment lines beginning with '#' are allowed
    # urls are passed to urllib.urlopen, so the format must be supported there
    http://frontier.cern.ch/userdata.txt

Then use write-mime-multipart (from the cloud-utils RPM) to generate userdata4multi.txt:

    $ write-mime-multipart -o userdata4multi.txt userdata4script userdata4config userdata4include

The resulting file is:

    Content-Type: multipart/mixed; boundary="===============1328186416458086896=="
    MIME-Version: 1.0

    --===============1328186416458086896==
    Content-Type: text/x-include-url; charset="us-ascii"
    MIME-Version: 1.0
    Content-Transfer-Encoding: 7bit
    Content-Disposition: attachment; filename="userdata4include"

    #include
    # entries are one url per line. comment lines beginning with '#' are allowed
    # urls are passed to urllib.urlopen, so the format must be supported there
    http://frontier.cern.ch/userdata.txt

    --===============1328186416458086896==
    Content-Type: text/x-shellscript; charset="us-ascii"
    MIME-Version: 1.0
    Content-Transfer-Encoding: 7bit
    Content-Disposition: attachment; filename="userdata4script"

    #! /bin/bash
    mkdir -p /tmp/rdu
    echo "Hello World!" > helloworld.txt

    --===============1328186416458086896==
    Content-Type: text/cloud-config; charset="us-ascii"
    MIME-Version: 1.0
    Content-Transfer-Encoding: 7bit
    Content-Disposition: attachment; filename="userdata4config"

    #cloud-config
    runcmd:
     - [ wget, "http://slashdot.org", -O, /tmp/index.html ]

    --===============1328186416458086896==--

### Cloud boothook

Starts with "\#cloud-boothook" or "Content-Type: text/cloud-boothook", but didn't provide running-only-once mechanism, see the following sample:

    #cloud-boothook
    #! /bin/bash
    mkdir -p /tmp/rdu
    echo "Hello, World!" > /tmp/helloworld.txt

It's quite similar as userdata script.

### CMF

The OpenStack Windows images support cloud-init also. In these there is a plugin to integrate it into CMF and it will join the NSC specified. It starts with "\#cmf" and contains

For example, to join a CMF NSC,

    #cmf
    [NSC]
    Membership=XXXX,YYYY

It will join the NSCs specified. The value XXXX is integer id of the NSC to join (you are only allowed to specify IDs the main user of the machine have access to)

### References

For more information about cloud-init,

* Upstream code for the cloud-init package is [here](https://launchpad.net/cloud-init) Documentation online [here](https://cloudinit.readthedocs.org/)
* Ubuntu documentation is [here](https://help.ubuntu.com/community/CloudInit)
* Windows cloud init support [here](http://www.cloudbase.it/cloud-init-for-windows-instances/)
* Amazon documentation on contextualisation is [here](http://docs.amazonwebservices.com/AWSEC2/latest/DeveloperGuide/index.htm).

Config Drive
------------

cloud-init provides the most common contextualisation framework. There are others such as amiconfig which operate on similar techniques.

One different approach is a [config drive](http://docs.openstack.org/user-guide/content/config-drive.html). This takes a different approach of defining a read-only image which is made available to the VM.

The directory structure is similar to that returned from the magic IP supplied by Amazon. The following example illustrates the technique. Firstly, create a virtual machine using a standard image and with the parameter --config-drive=true and some additional data such as file.

    nova boot --image 2171bb6e-6404-44e9-8cbd-8c6f6bacce1c --flavor m2.medium --key_name my-key --config-drive=true my-vm-name --file motd=/etc/motd

Once the VM is created, this configuration drive can be mounted:

    $ mkdir /mnt/config
    $ mount /dev/disk/by-label/config-2 /mnt/config
    mount: block device /dev/sr0 is write-protected, mounting read-only

The drive can then be inspected using `du`.