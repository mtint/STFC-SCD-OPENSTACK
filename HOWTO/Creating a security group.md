You must create a security group with the appropriate IP filter rules to enable access to grid nodes in your StorageGRID Webscale system. If the project already has access to an appropriate security group, you can skip this step.

About this task
---------------

 The recommended security group allows all traffic on all ports for all protocols. This is because each grid node is protected by its own internal firewall.

Note: If you prefer, you can also create a security group using the OpenStack CLI.

Steps
-----

1. Sign in to the OpenStack Dashboard.
2. Select Project \> Compute \> Access & Security.
3. Click the Security Groups tab.
4. Click Create Security Group.
5. Enter a descriptive name, and optionally, a description.
6. Click Create Security Group.
7. Click Manage Rules for the new security group.
8. Ensure a rule exists with the following settings:
  * Direction: Egress
  * Ether Type: IPv4
  * IP Protocol: Any
  * Port Range: Any
  * Remote IP Prefix: 0.0.0.0/0
9. Add rules.
  1. Click Add Rule.
  2. From the Rule drop-down, select ALL TCP, and click Add.
  3. From the Rule drop-down, select ALL UDP, and click Add.
  4. From the Rule drop-down, select ALL ICMP, and click Add.

  The following fields are completed automatically when you add each rule:

  * Direction: Ingress
  * Remote: CIDR
  * CIDR: 0.0.0.0/0