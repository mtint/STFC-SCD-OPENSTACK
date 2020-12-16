#!/usr/bin/env bash

hv_host=$1

rm -fR /tmp/user.txt
touch /tmp/user.txt

for i in $(openstack server list -f value -c ID --all --host $hv_host);
    do
	  projectid=`openstack server show  -f value -c project_id $i`
	  users=`openstack user list  -f value -c Name --project $projectid  --domain stfc`
	  echo $users >> /tmp/user.txt
	done

cat /tmp/user.txt | sort | uniq | grep -v admin | grep -E '^[a-z][a-z][a-z][0-9]{5}' > /tmp/user-sorted.txt

