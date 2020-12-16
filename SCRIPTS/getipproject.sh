
#!/usr/bin/env bash

openstack server list --all --long  --limit -1 -f value -c ID -c name -c Networks -c Status > /tmp/all-servers.txt

IPS=$(cat scan-report.csv | grep ",High," | awk -F "," '{print $1}' | sort | uniq)

for server in $IPS; 
  do 
     instance_id=$(grep -w $server /tmp/all-servers.txt  | awk '{print $1}')
     if [ ! -z "$instance_id" ]; then 
      	project_id=$(openstack server show $instance_id -f value -c project_id);
      	project_name=$(openstack project show $project_id -f value -c name);
        echo "instance ip = " $server "project id (NAME) = " $project_id "("$project_name")";
     else 
     	echo "instance ip = " $server "does not belong to a project";
     fi
 done
