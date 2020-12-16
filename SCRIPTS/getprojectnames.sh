for id in  $(openstack server list --all --long | awk '{print $2}'); 
do  
    instance_name=$(openstack server show $id | grep "^| name  " | awk '{print $4}'); 
    project_id=$(openstack server show $id | grep project_id | awk '{print $4}');
    project_name=$(openstack project show $project_id | grep name | awk '{print $4}');
        echo "$instance_name <--- $project_name"; 
done

