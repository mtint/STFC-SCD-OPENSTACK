How to create an instance in OpenStack
======================================

Hi@akhtar,

When we try to launch an instance in AWS, we need **AMI, security groups** etc. In OpenStack also we need **image, security group** etc. So, First create an image and security group and after that follow the below given steps.

* Move to Project -\> Instances and hit on Launch Instance button and a new window will appear.

![image](resources/96C6035FA71850CCAEDA28A3D3F3F760.png)

* On the first screen add a name for your instance, leave the Availability Zone to nova, use one instance count and hit on Next button to continue

![image](resources/457450F46C02B3D1BC19625297C81F19.png)

* Next, select Image as a Boot Source, add the Cirros test image created earlier by hitting the + button and hit Next to proceed further.

![image](resources/C01812893FE8C7BA9C9B2C036F53F8CA.png)

* Allocate the virtual machine resources by adding a flavor best suited for your needs and click on Next to move on.

![image](resources/27DE0A59B64798C11D64053554E0EDE2.png)

* Finally, add one of the OpenStack available networks to your instance using the + button and hit on Launch Instance to start the virtual machine.

![image](resources/FDB4CCC2241FDB6C9568F5A41DD2B5B2.png)