Openstack is not just only about the internet buzz. It’s going to create new revolution on the IT infrastructure industry. How Openstack can do this since it’s just 5 years old ? Is it similar to VMware virtualization ? Oracle VM ? Redhat Virtualization ? Citrix Xen ? Not exactly. Openstack is an opensource project which accepts all the hyper-visors as virtualiazation host, Dedicated volume management node , Object storage , Software defined networking , Orchestration and many more. For an example, Using Openstack controller node , you can connect to VMware ESXi and create the VM and use it . At the same time , you can also able to communicate to the KVM hypervisor and launch the new OS instance using Openstack dashboard. All the Operating system vendors are willing to support openstack to ensure that their products are like in the market.

If you are new to openstack and would like to learn openstack , you must use devstack method to deploy for first time. This article is strictly for openstack beginners.

[box type=”info” align=”” class=”” width=””]Click on the each title to reach the respective articles. [/box]

### 1\. [First Bite:](https://www.unixarena.com/2015/08/openstack-tutorial-history-of-private-cloud.html)

You need to understand the history of private cloud before exploring more in to Openstack. The first version of openstack released in 21st Oct 2010\. It’s better to know the major Openstack Releases names and codes names. So that you can ask yourself that what each releases done different from other one. [Please go trough article which explorer the history of private cloud, openstack releases name and code names.](https://www.unixarena.com/2015/08/openstack-tutorial-history-of-private-cloud.html)

### [2\. Learn More:](https://www.unixarena.com/2015/08/openstack-architecture-and-components-overview.html)

The first article just listed the various code names of openstack. [By reading this article , you will come to know the purpose of each codes and Conceptual architecture of Openstack.](https://www.unixarena.com/2015/08/openstack-architecture-and-components-overview.html)

### [3\. Demonstration:](https://www.unixarena.com/2015/08/how-to-deploy-openstack-on-ubuntu.html)

As beginner, you should always choose Ubuntu’s devstack or Redhat’s method to deploy first openstack controller node & other services. [In this article, I have demonstrated the Openstack deployment on Ubuntu 14.04 TLS server using the devstack method](https://www.unixarena.com/2015/08/how-to-deploy-openstack-on-ubuntu.html). Good Luck for first Openstack Deployment (Only for Testing purpose)

### [4\. Start & stop Openstack Services:](https://www.unixarena.com/2015/08/how-to-stop-and-start-openstack-on-ubuntu.html)

When you are using the devstack method to manage the openstack services , you need to stop the services prior to the controller node reboot. In my setup , all the services are configured on the same node. [Just go through this article to stop & start the openstack services](https://www.unixarena.com/2015/08/how-to-stop-and-start-openstack-on-ubuntu.html).

### [5\. Dashboard (Horizon):](https://www.unixarena.com/2015/08/understanding-the-openstack-dashboard.html)

We need just little bit knowledge to use the Openstack dashboard. [Hope this article provides the basic dashboard knowledge.](https://www.unixarena.com/2015/08/understanding-the-openstack-dashboard.html)

### [6\. Launch the First Openstack Instance:](https://www.unixarena.com/2015/08/how-to-launch-the-first-openstack-instance.html)

Let’s create the first openstack instance. Prior to creating the instance , you need to create the necessary security group & key pairs.

### [7\. How to access the newly created instance using key pairs ?](https://www.unixarena.com/2015/08/how-to-access-the-cloud-instance-using-key-pair.html)

OS instance can be accessed using key pair. In all the private/public cloud methods , key pairs are most common method to access the OS instances.

### [8\. Launch the instance using Cinder Service:](https://www.unixarena.com/2015/09/openstack-configure-cinder-service-testing-method.html)

By default, instances are launched using swift storage service(Object Storage). If you select “Boot from Image using new volume”, system will look for cinder service and if it is available , if will create a new volume for the OS instance. In this article, I have configured the LVM2 as back-end storage for cinder service.

### [8\. How to create the Custom Image ?](https://www.unixarena.com/2015/08/how-to-create-a-custom-image-for-openstack.html).

By default, Openstack comes with cirros image. If you would to build Linux custom image for ubuntu, [you can create it and upload it to glance image.](https://www.unixarena.com/2015/08/how-to-create-a-custom-image-for-openstack.html)

### [9\. Pre-configured cloud Image:](https://www.unixarena.com/2015/08/download-pre-configured-cloud-images-for-linux-windows.html)

If you feel that creating the custom OS instance image is painful, you can download the pre-configured Cloud images for various operating system from internet. I have consolidated all the various Operating system’s download links in this article.

Hope this consolidated article will give you some idea to start learning Openstack. So far we have just seen the basic openstack services and it’s use. There are services like “HEAT” orchestration service , neutron for Software defined networking ,LBaas and etc… Hope you can find “Openstack Guide for Experts” soon in UnixArena. Stay Tuned.

Thank you for visiting UnixArena.

Advertisements