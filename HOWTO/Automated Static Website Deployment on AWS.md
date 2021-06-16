Automated Static Website Deployment on AWS
==========================================

Table of Contents
-----------------

* * [How to (automatically) serve JAM](https://www.techblog.moebius.space/posts/automated-static-website-deployment-aws/#how-to-automatically-serve-jam)
    * * [TL;DR: If you want to learn Terraform and AWS, keep reading, otherwise use](https://www.techblog.moebius.space/posts/automated-static-website-deployment-aws/#tl-dr-if-you-want-to-learn-terraform-and-aws-keep-reading-otherwise-use-netifly-https-www-netlify-com)[netifly](https://www.netlify.com/)
  * [Part 1: Sign up for AWS](https://www.techblog.moebius.space/posts/automated-static-website-deployment-aws/#part-1-sign-up-for-aws)
  * [Part 2: Register a Domain](https://www.techblog.moebius.space/posts/automated-static-website-deployment-aws/#part-2-register-a-domain)
  * [Part 3: Obtain a Certificate](https://www.techblog.moebius.space/posts/automated-static-website-deployment-aws/#part-3-obtain-a-certificate)
  * [Part 4: Deploy!](https://www.techblog.moebius.space/posts/automated-static-website-deployment-aws/#part-4-deploy)

How to (automatically) serve JAM
--------------------------------

#### TL;DR: If you want to learn Terraform and AWS, keep reading, otherwise use [netifly](https://www.netlify.com/)

I know i’m a bit late to the party, but I’ve just discovered the new wave of static websites, and I think they’re JAMtastic. The JAM in the title is of course Javascript, API’s and Markup. And what better (not to mention cheaper) way to host your new website than with AWS! Static Websites are so easy to deploy on AWS, that they even have a [guided tutorial](https://console.aws.amazon.com/quickstart-website/new) which builds one for you in 2 minutes.

However, my requirements were a bit more detailed than the automated setup provided by AWS. My objective was to build a website which is:

* HTTPS enabled
* Served from my custom domain
* Cheap to setup and maintain
* Responsive with below average load times within my region
* Scaled automatically
* Dynamic - for some actions (like sending emails from contact forms etc.)

With some secondary requirements:

* Easy for non-developers (i.e my dad) to modify
* Automatically setup and deployed

I had already built the website using Jekyll, and you can read about the process [here](). Now I thought it might be cool if I had the superpowers to publish and unpublish this website with the switch of a button. Terraform is this switch, and I’ve been meaning to learn it for quite a while. If you’re sticking with AWS, you can also use AWS CloudFormation to achieve the same result - but I like to keep my options open.

There are a number of useful sources which detail exactly how to setup a static website with HTTPS and CDN via the AWS console. I found these especially useful:

* <https://www.davidbaumgold.com/tutorials/host-static-site-aws-s3-cloudfront/>
* <https://medium.com/@willmorgan/moving-a-static-website-to-aws-s3-cloudfront-with-https-1fdd95563106>

So, I used these to build some Terraform modules to automatically achieve the same result (with a couple of unavoidable manual steps). You can view the full code [here]().

Before you can use this code to deploy your site to AWS using Terraform, you need to perform these (sadly) manual steps:

Part 1: Sign up for AWS
-----------------------

AWS is in a league of its own compared to other competitors. Although other cloud service providers have recently reported a doubling in their market share, Amazon is still nearly 3 times ahead of its competitors in terms of market share with a whopping [36% (as of Q2 2017)](https://awsinsider.net/articles/2017/08/01/aws-market-share-3x-azure.aspx?m=1).

In practical terms, AWS is also quite user friendly, and anyone can get something setup quickly using the console. The console (UI) is straightforward (although they have made some questionable choices), and the programmable access options are every developers dream. Anyone can

For new starters, AWS offers a tier of services which are completely free for the first 12 months. You can sign up [here](https://portal.aws.amazon.com/billing/signup#/start)

Please note that AWS Free Tier have the [following limits](https://aws.amazon.com/free/faqs/) for the services we will use, so don’t go nuts:

* 5 GB of Amazon S3 standard storage, 20,000 Get Requests, and 2,000 Put Requests\*
* 50 GB Data Transfer Out, 2,000,000 HTTP and HTTPS Requests for Amazon CloudFront\*
* 15 GB of bandwidth out aggregated across all AWS services\*

Part 2: Register a Domain
-------------------------

You can register a domain with AWS if you want to manage all the components of your website through one company. However, I have often found that you can find the same domain cheaper through other providers. See below for an example, but [YMMV](https://www.urbandictionary.com/define.php?term=ymmv)

Part 3: Obtain a Certificate
----------------------------

Again, you have a number of options for obtaining certificates:

1. You can go via a third party provider such as namecheap, godaddy, ssl.com etc., or even the same one as your domain and bundle them up. However, these certificates cost money, and why pay for something when you can get it for free!
2. You can use [Let’s Encrypt](https://nparry.com/2015/11/14/letsencrypt-cloudfront-s3.html) to obtain a free certificate. However, you will have to manage the renewal yourself, either via a script or manually.
3. The best option in my opinion is to obtain a certificate via the Amazon Certificate Manager. Certificates are free, and AWS automatically renew them for you when they expire, meaning management is dead simple.

This tutorial assumes that you have gone with Option 3\. If you go with the first two options, you will have to manually upload your certificate to CloudFront (not covered in this tutorial), and re-configure the terraform scripts accordingly.

When you are configuring your certificate, I would suggest that you select at least the following domains: the so called “naked” domain (the base or APEX of your domain), and all wildcarded subdomains of your domain).

![AWS Domain Certificate](https://www.techblog.moebius.space/img/aws-domain-cert2.png#floatleft)

This ensures, that:

1. You can secure any unlimited number of subdomains with this single certificate (in case you want to create different websites on the same domain)
2. Users can navigate to either the naked domain (example.com), or the www subdomain (www.example.com), and both will be secured.

Part 4: Deploy!
---------------

In order to deploy, you will need to have the dependent software installed, or you can setup a docker file to build a deployment environment (I plan to do this soon..).

Also, you need to configure your AWS programmatic access credentials, and terraform variables (in the file variables.tf) to provide details of your setup.

Once all the components are ready, run this to deploy:

```
terraform apply
```