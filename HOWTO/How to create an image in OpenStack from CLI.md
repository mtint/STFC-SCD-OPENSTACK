You have to first download one preinstalled image in your system. You can go through the below-given link.

[https://download.fedoraproject.org/pub/fedora/linux/releases/32/Cloud/x86\_64/images/Fedora-Cloud-Base-32-1.6.x86\_64.qcow2](https://download.fedoraproject.org/pub/fedora/linux/releases/32/Cloud/x86_64/images/Fedora-Cloud-Base-32-1.6.x86_64.qcow2)

Now you have to log in to your OpenStack cloud and run the below command. It will automatically create an image in OpenStack.

    $ source keystonerc_demo
    [root@openstack ~(keystone_demo)]#  glance image-create --file Fedora-Cloud-Base-32-1.6.x86_64.qcow2 --disk-format qcow2 --container-format bare --name fed64
    +------------------+--------------------------------------+
    | Property         | Value                                |
    +------------------+--------------------------------------+
    | checksum         | 9ba41708fdc7d21a829e3836242f56d6     |
    | container_format | bare                                 |
    | created_at       | 2020-07-06T07:29:57Z                 |
    | disk_format      | qcow2                                |
    | id               | 5c40dedf-57eb-4e68-9ee7-1bb7ffcb105a |
    | min_disk         | 0                                    |
    | min_ram          | 0                                    |
    | name             | fed64                                |
    | owner            | c75cffdeb390468fa099948aa43a99b2     |
    | protected        | False                                |
    | size             | 302841856                            |
    | status           | active                               |
    | tags             | []                                   |
    | updated_at       | 2020-07-06T07:30:00Z                 |
    | virtual_size     | None                                 |
    | visibility       | shared                               |
    +------------------+--------------------------------------+

I hope this will help you.