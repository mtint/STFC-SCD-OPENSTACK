Managing Windows images
-----------------------

These instructions follow [the official OpenStack recipe](https://docs.openstack.org/image-guide/windows-image.html) with some variations and small additions: if in doubt, follow the official recipe.

### Procedure outline

We will first create a VM on localhost, and then we will import its disk into Glance.

Windows images can be imported into OpenStack provided both disk and network are of type `virtio`: make sure you download [latest VirtIO drivers](https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-virtio/virtio-win.iso) as explained in the [Fedora VirtIO-win site](https://docs.fedoraproject.org/quick-docs/en-US/creating-windows-virtual-machines-using-virtio-drivers.html)

### Create Windows VM

Create an empty disk (vanilla installation requires 10-12 GB):

    qemu-img create -f qcow2 ws2008.qcow2 15G

Create the local VM with a command similar to:

    export winImage=/path/to/Windows2008.iso
    export path_to_virtio_iso=/where/you/saved/virtio-win.iso
    virt-install --connect qemu:///system --name ws2008 --ram 2048 --vcpus 2 --network network=default,model=virtio --disk path=ws2008.qcow2,format=qcow2,device=disk,bus=virtio --cdrom $winImage --disk path=${path_to_virtio_iso},device=cdrom --vnc --os-type windows --os-variant win2k8

Connect to the VM using `virt-manager` to complete the installation. Make sure you load the additional drivers for VirtIO (they are in the virtual CD/DVD): you will need NetKVM and virtioscsi.

If you are unable to complete the virt-install command, apply the following trick:

* create a VM with IDE disk and default network
* connect Windows 2008 ISO image and complete installation
* after installation is completed, reboot the VM, then shut it down
* from `virt-manager`, add a small 1GB disk device of type `VirtIO` and a new ethernet adapter also of type `VirtIO`
* boot the VM
* within the VM, go to system panel, then navigate to hardware devices. There will be (at least) 2 devices with missing drivers: I had the network adapter, the disk and a mysterious `PCI device` which turned out to need the `VirtIO balloon driver`: note that for the storage part you need to update drivers for `Storage Controller` Select each one and choose to update its driver, selecting it from within the `VirtIO-win` CD
* install `guest-agent` by navigating to your `virtio-win` CD, under `guest-agent`
* power the VM off
* from `virt-manager` remove any additional disk or ethernet adapter you previously created, and modify the system disk type to `virtio`
* boot your VM

### Configure Windows VM

Within `Server Manager` go to `Install features` and select `Powershell`. Run `Powershell` and execute:

    Set-ExecutionPolicy Unrestricted

Configure firewall input rules to allow `ICMP ping` and `Remote Desktop`: as for the latter, remember to prepare a SecurityGroup to allow connections to port 3389 from your trusted IPs.

Install any basic, useful program you know you will need (e.g. Firefox).

Download [cloudinit](https://cloudbase.it/downloads/CloudbaseInitSetup_Stable_x64.msi) open `Explorer` and navigate to the download folder, right-click on the cloudbase file then `Properties` and make sure you remove any “block” preventing the executable to run. Execute the `CloudbaseInitSetup_Stable_x64.msi`, select *User = Administrator* and *COM1* port for logging: when the installation is complete select `Run Sys Prep`and `Shutdown`.

The VM will power-off and its disk will then be ready to be imported into Glance.

Note

If you ever need to restart the VM in order to create a new Glance image, you will need to run:

`c:\windows\system32\sysprep\sysprep.exe /generalize /oobe /shutdown /unattend:C:\progra~1\cloudb~1\cloudb~1\conf\Unattend.xml`

Note

The `sysprep.exe` utility can only be run a limited number of times (3) before you get an *irreversible error*. When this happens, the easiest solution is to start the whole procedure from scratch, by creating a new Windows VM.

### Upload to Glance

Import the image by using the GUI or, if you prefer, the CLI:

    openstack image create --disk-format qcow2 --file ws2008.qcow2 WindowsServer2008

### Spawn the image and change Administrator password

Create a new machine as usual, and **make sure you also set a ``Key Pair``.** For Windows machines the key pair is used to encrypt the `Administrator` password which is automatically generated and injected in the machine at first boot.

The initial boot will likely take several minutes. Access the VM console from the GUI and wait.

To retrieve the `Administrator` password:

* CLI method: execute the command (you will be prompted for the SSH key passphrase):

      nova get-password <server_UUID> /path/to/private/key/file
* GUI method: open another browser tab, navigate to the VM list, pick the`Retrieve password` action for your VM, which should open a window in which you can select or copy/paste your private key to be used for decryption. If you don’t get the chance to input your private key, open the Console GUI, as the server most likely needs you to answer some question or push button to proceed.

**NOTE:**

* If you want create a key pair on Windows machine it is recommended create the keys in PEM format. For example with the ssh-keygen tool you can use this command:

      ssh-keygen -m PEM

  Alternatively if you already have a key pair and in the CLI method you receive `unable to load Private Key` error, you can convert your private key in the PEM format:

      ssh-keygen -p -m PEM -f ~/.ssh/id_rsa
* There is a problem in the dashboard currently: the Retrieve passwordmenu opens a window where to paste the private key and a field where to get the password, but this mechanism fails with Could not decrypt the password. However, the encrypted password is shown, and it can be de-crypted in the following way:

  * Copy-paste the encrypted password
  * Decode the encrypted password and save to a file:

        echo "<encrypted_password>" | base64 -d > encrypt_pass.txt
  * Decrypt the password:

        openssl rsautl -decrypt -in encrypt_pass.txt -out plain.txt -inkey <your_private_ssh_key>
  * Find the decripted password in file `plain.txt`

Managing KVM images
-------------------

The quick procedure to generate a custom image is outlined in the [official OpenStack documentation](https://docs.openstack.org/image-guide/create-images-manually.html)

We provide one example below, namely the creation of a Kali Linux image.

The procedure can be run as an unprivileged user: to better rephrase, you should NOT be `root`.

Note

Please note that this is a simplified procedure, suitable for Kali Linux. Refer to the above URL for come complete instructions: you may want to read the Ubuntu instructions, for instance.

Specifically, this procedure skips the installation of `cloud-init` since the image is configured for (SSH disabled and) local access by user `root` (with the default password).

* download your image (for this example, you can find it [here](https://www.kali.org/downloads/)):

      wget -O /tmp/kali-linux-2017.2-amd64.iso http://cdimage.kali.org/kali-2017.2/kali-linux-2017.2-amd64.iso
* execute:

      qemu-img create -f qcow2 /home/kali.qcow2 12G
* make sure any other hypervisor (like VirtualBox) is not currently running
* execute a command like the following one:

      virt-install --virt-type kvm --name kali --vcpus 1 --ram 1024 --disk path=/home/kali.qcow2,bus=virtio,format=qcow2,device=disk --cdrom=/tmp/kali-linux-2017.2-amd64.iso --network network=default,model=virtio --graphics vnc,listen=0.0.0.0 --noautoconsole --os-type=linux

  Inspect settings for your newly created machine: specifically, make sure the disk-bus is VirtIO so that the disk device will be referenced as `/dev/vda`, to make OpenStack happy.
* connect to your instance using `virt-manager` and complete the installation
* as soon as the installation is complete, do not forget to check the repositories. For this example:

    cat /etc/apt/sources.list

    deb http://http.kali.org/kali kali-rolling main non-free contrib
    deb-src http://http.kali.org/kali kali-rolling main non-free contrib

* make further configuration as you please (e.g., timezone, additional packages), and possibly update all installed packages
* reboot your server, and make sure it comes up OK
* shutdown your server
* perform some cleanup:

      virt-sysprep -d kali

Note

In this specific example, if you previously set APT sources as suggested, and ran `apt-get update && apt-get upgrade`,

you would have overwritten `/etc/lsb-release` and the above command will fail.

Make sure you set `DISTRIB_RELEASE` in `/etc/lsb-release` equal to some numeric string like:

    DISTRIB_RELEASE=2017.2

Or you can fine tune what will be cleaned-up (run `virt-sysprep --list-operations` for full list):

    virt-sysprep --enable abrt-data,bash-history,logfiles,machine-id,net-hwaddr,package-manager-cache,passwd-backups,tmp-files,udev-persistent-net -d kali

* upload the qcow2 file as an OpenStack image
* if everything works properly in OpenStack, cleanup your libvirt domain:

      virsh undefine kali

Managing VirtualBox images
--------------------------

VirtualBox exports VM images in OVA packages: an OVA is tar archive containing an OVF directory structure (cfr: [https://en.wikipedia.org/wiki/Open\_Virtualization\_Format](https://en.wikipedia.org/wiki/Open_Virtualization_Format)).

Unfortunately the package file cannot be directly imported as an OpenStackimage.

This is the procedure to create an OpenStack image from an OVA package.

Prerequisites: Linux shell with tar and qemu-utils (provides qemu-img) packages.

* extract the OVA package:

      tar xvf $FILE.ova

where $FILE.ova is the file name containing the exported VirtualBox Machine(s) image. This command will unpack the OVA in the current directory generating a file called $FILE-disk1.vmdk. The vmdk is valid to generate an OpenStack image.

For optimization reasons, it’s possible to obtain a qcow2 format with the following procedure:

* convert the $FILE-disk1.vmdk file to QCOW2 format:

      qemu-img convert -f vmdk $FILE-disk1.vmdk -O qcow2 $FILE.qcow2

This command will generate the file $FILE.qcow2 that is also suitable to be used as an OpenStack image

Managing VMWARE images
----------------------

VMware ESXi images are typically stored in vmdk format. Here we will show how qemu-img is capable of uploading a given image to Ceph.

* from the OpenStack CLI or GUI, create a dummy volume: size does not matter, as we will later drop it, we just need its UUID
* note the UUID of your volume, and delete it:

      rbd -p <cinder-ceph-poolname> rm volume-<volume-UUID>
* convert the .vmdk file and upload to the OpenStack cinder pool, with the proper UUID:

      qemu-img convert -p <vmdk_disk_file> -O rbd rbd:<cinder-ceph-poolname>/volume-<volume-UUID>

  If you need to use a different Ceph user, or if the name of your cluster is non-standard, you can add ‘id=\<id\>’ or ‘conf=\<ceph\_config\>’ arguments to the destination, like:

      qemu-img convert -p <vmdk_disk_file> -O rbd rbd:<cinder-ceph-poolname>/volume-<volume-UUID>:id=anotheruser:conf=/etc/ceph/myceph.conf