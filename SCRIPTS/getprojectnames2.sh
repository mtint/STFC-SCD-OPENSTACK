for server in $(openstack server list --all-projects -c ID -f value)
do
    # the -f shell option sets environment variables
    eval $(openstack server show $server -f shell -c id -c OS-EXT-STS:power_state -c addresses -c project_id) 
    project_name=$(openstack project show -f value -c name $project_id)
    echo $id $os_ext_sts_power_state $addresses $project_name
done

