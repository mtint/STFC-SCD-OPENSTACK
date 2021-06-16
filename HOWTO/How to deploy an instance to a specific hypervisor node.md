For **IBM Bluemix Private Cloud 3.0 - 3.1.1**, you may receive this error message when targeting a specific compute node:

`Policy doesn't allow os_compute_api:servers:create:forced_host to be performed`

In that case you will need to use *group affinity* and *group antiaffinity* with server groups to influence scheduling your instance to be deployed close to or away from other instances. Here are two articles that explain how to do that:

https://raymii.org/s/articles/Openstack\_Affinity\_Groups-make-sure-instances-are-on-the-same-or-a-different-hypervisor-host.html

https://dev.cloudwatt.com/en/blog/affinity-and-anti-affinity-in-openstack.html

You can use group affinity and antiaffinity with any version of IBM Bluemix Private Cloud.

One advantage of this is that server groups require less administration as the cluster is expanded.

**The instructions that follow are for any IBM Bluemix Private cloud older than release 3.0, or for any cloud at version 4.0 or greater:**

You may have the need to specify the host to which an instance is deployed. Although this functionality is not available in Horizon, the API in some cloud versions lets you select a specific compute node for instance deployment.

You need to be a user with the `cloud_admin` role to use this feature.

These instructions assume that you have the OpenStack API configured on your local machine. See [Getting Started with the OpenStack API](https://ibm-blue-box-help.github.io/help-documentation/openstack/api/openstack-api-getting-started/) for assistance.

1. Determine which compute hypervisors are available in your cluster.

       $ nova service-list | grep nova-compute
     |41 | nova-compute  | ds1111 | nova    | enabled | up | 2015-05-15T17:14:56.000000 | -
     |55 | nova-compute  | ds1112 | nova    | enabled | up | 2015-05-15T17:14:56.000000 | -
     |70 | nova-compute  | ds1113 | nova    | enabled | up | 2015-05-15T17:14:56.000000 | -
2. Deploy to the desired compute hypervisor.

  Use the `--availability-zone` flag to specify which hypervisor you would like to generate your instance on. In this example, we would like to deploy our new instance to `ds1111`:

       $ nova boot --flavor 'm1.normal' --image 1e74ae39-8413-426e-9e3a-dcc5dd0704a3 --key-name your_key --security-groups default --availability-zone nova:ds1111 instance_1