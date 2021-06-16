We assume you have docker installed on your machine, check the [Linux CERN page](http://linux.web.cern.ch/linux/centos7/docs/docker.shtml).

Start the openstack clients container:

    sudo docker run -it gitlab-registry.cern.ch/cloud/ciadm

If you want your home and afs directories available in the container, do instead (after getting your afs credentials set):

    kinit <YOURAFSUSER>
    sudo docker run -it --privileged -e KRB5CCNAME=/tmp/krb5cc_$UID -e AFS_USER=<YOURAFSUSER> -v /tmp:/tmp -v /afs:/afs gitlab-registry.cern.ch/cloud/ciadm

Once you got a shell in the container, you can use the clients as before:

    [root@28ad6acb3783 ]# . Personal\ <username>-openrc.sh
    [root@28ad6acb3783 ]# openstack server list