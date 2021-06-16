Create a custom OpenStack image with Packer
===========================================

<https://www.ovhcloud.com/en-gb/public-cloud/>

<https://docs.ovh.com/gb/en/public-cloud/packer-openstack-builder/>

Objective
---------

This guide will show you how to create a Packer configuration file to create your own OpenStack image.

Requirements
------------

You’ll need an [OVHcloud Public Cloud](https://www.ovhcloud.com/en-gb/public-cloud/) OpenStack project and a terminal.

### Install Packer

Packer can be downloaded from the official website (curently [here](https://www.packer.io/downloads.html) ) and you’ll need to `unzip` it.

For Linux 64bits

    wget https://releases.hashicorp.com/packer/1.3.1/packer_1.3.1_linux_amd64.zip
    unzip packer_1.3.1_linux_amd64.zip

### Install jq

`jq` is a command line tool for [parsing JSON document](https://stedolan.github.io/jq/manual/). It’ll be used to automate the configuration file creation.

### Fetch your openrc.sh configuration

From [OVHcloud Control Panel](https://www.ovh.com/auth/?action=gotomanager&from=https://www.ovh.co.uk/&ovhSubsidiary=GB), fetch your `openrc.sh` configuration file. You can fetch it from OpenStack menu entry in the left panel and under the `...`button on the right `Download an OpenStack configuration file`. You might need to create an OpenStack user before.

### Install openstack command line client

The easier way is to use a python virtual environment

    python3 -m venv venv3 \# creates a virtualenv named venv3
    . ./venv3/bin/activate \# enter the virtualenv
    pip install --upgrade pip
    pip install python-openstackclient

or install your distribution package `apt-get install python-openstackclient`

#### Verification

Sourcing the `openrc.sh` configuration file retrieved before, try your local setup with

    . ./openrc.sh
    openstack token issue

Packer configuration
--------------------

First, source your `openrc.sh` file with

Next, let’s find some needed ID. You’ll need the ID of the image, flavor and network. We’ll build our image from `Ubuntu 16.04` on a `vps-ssd-1` hardware, with a interface connected on public network `Ext-Net`

    SOURCE\_ID=`openstack image list -f json | jq -r '.[] | select(.Name == "Ubuntu 16.04") | .ID'`
    FLAVOR\_ID=`openstack flavor list -f json | jq -r '.[] | select(.Name == "vps-ssd-1") | .ID'`
    NETWORK\_ID=`openstack network list -f json | jq -r '.[] | select(.Name == "Ext-Net") | .ID'`

**INFO**: for `FLAVOR_ID`, you can directly use the name, ie `vps-ssd-1`

Finaly, create a `packer.json` file

    cat > packer.json \<\<EOF
    {
     "builders": [
     {
     "type": "openstack",
     "username": "$OS\_USERNAME",
     "password": "$OS\_PASSWORD",
     "identity\_endpoint": "$OS\_AUTH\_URL",
     "region": "$OS\_REGION\_NAME",
     "tenant\_id": "$OS\_TENANT\_ID",
     "image\_name": "My Custom Image",
     "ssh\_username": "ubuntu",
     "source\_image": "$SOURCE\_ID",
     "flavor": "$FLAVOR\_ID",
     "ssh\_ip\_version": "4",
     "networks": [
     "$NETWORK\_ID"
     ]
     }
     ],
     "provisioners": [
     {
     "script": "setup\_vm.sh",
     "type": "shell"
     }
     ]
    }
    EOF

In the last selection of the configuration file, we specify a `setup_vm.sh` shell script to be ran.

    \#!/bin/sh

    set -ex

    if [ `id -u` -ne 0 ]; then
         sudo $0
        exit 0
    fi

    \#\# your custom code below
    apt-get install git
    git clone ...

Building the image
------------------

Using the configuration file create above, check it and build the image with

    packer validate packer.json
    packer build packer.json

If all went ok, you should have a new image available. You can check with

    openstack image list | grep 'My Custom Image'

**Tip**: To enable debug information: `export PACKER_LOG=1`

Go further
----------

Join our community of users on <https://community.ovh.com/en/>.

---

### Did you find this guide useful?

---

### These guides might also interest you…

[Public Cloud
Changing the hostname of a Public Cloud instance](safari-reader://docs.ovh.com/gb/en/public-cloud/changing_the_hostname_of_an_instance/)

[Public Cloud
Configuring additional SSH keys](safari-reader://docs.ovh.com/gb/en/public-cloud/configuring_additional_ssh_keys/)

[Public Cloud
Deploying an infrastructure with variables and formatted outputs using OpenStack Heat (BETA)](safari-reader://docs.ovh.com/gb/en/public-cloud/deploy-infrastructure-with-variables-and-formatted-outputs-openstack-heat/)