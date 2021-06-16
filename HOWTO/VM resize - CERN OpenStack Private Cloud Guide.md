If the flavor of a virtual machine needs to be changed, such as adding more memory or vCPUs, this can be done using the **resize** operation.

Using resize, you can select a new flavor for your virtual machine. This is an offline operation, meaning that the virtual machine will be shutdown, configured with the new flavor properties and booted again. Depending on the size of the virtual machine size, this operation can take several minutes.

**NOTE:** It's only recommended to **increase** the size of the virtual machine, ie. from a smaller to a larger flavor.

Resizing a VM from the command line
-----------------------------------

Before resizing,

* Check the current size of the VM using:

    $ openstack server show --fit-width <VM name>

This is shown on the line marked 'flavor'.

* Select a new flavor for the available flavors:

    $ openstack flavor list

To resize the virtual machine, run:

    $ openstack server resize --flavor <new_flavor_name> <VM name>

Check the virtual machine status using:

    $ openstack server show --fit-width <VM name>

During the operation, the virtual machine status will display "RESIZE". This can take several minutes. When it finishes, the status will change to "VERIFY\_RESIZE".

Log in to the virtual machine and confirm that the resize operations have worked.

For example:

    lscpu

If the resize operation worked as expected, confirm with the following command:

    $ openstack server resize confirm <VM name>

If you identified any issue in the resized virtual machine, the operation can be rolled back. Use the following command:

    $ openstack server resize revert <VM name>