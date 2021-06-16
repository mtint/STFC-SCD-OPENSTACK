Documentation, articles and content surrounding Kubernetes are definitely not lacking on the internet. Although, even with this ample information, we’ve noticed that some users struggle with using the command-line interface when interacting with hosted Kubernetes running on OpenStack Magnum in a public cloud. In order to extensively benefit from using both Kubernetes and Magnum, we came up with this guide to help you prepare the environment, use the CLI and create your own cluster templates based on the Magnum parameters that are required.

Among many other reasons, creating templates is useful due to the fact that it is not possible to upgrade an existing cluster based on how Magnum’s workflow works. To upgrade, you’ll need to create a new cluster using a public cloud’s templates or with your own template.

This guide is beneficial to our [public cloud](https://vexxhost.com/public-cloud/) users who take advantage of our Kubernetes as a service. This guide is applicable to both our **sjc1** and **ca-ymq-1** regions. *Fun fact: Both regions now support the most recent versions of Kubernetes, *which is **v1.18.x**! You can use the public templates we provide for [Kubernetes 1.18.x](https://vexxhost.com/blog/vexxhost-announces-kubernetes-v1-18-update/) called `v2-k8s-8-v1.18.2`.

Before getting started it is important to note that Kubernetes as a Service can be customized to fit a variety of needs of your application or your IT team as a whole. From the above-mentioned details, it is understood that we use `v2-standard-8` flavors, but users can change this when creating clusters based on templates made available by us along with the ability to create their own cluster templates. Enterprise-scale teams can manage a large number of pods and label bigger clusters, whereas smaller teams are more likely to maintain a fewer number of pods and label smaller corresponding clusters.

Now let’s look into how you can create your own templates.

### Preparing The Environment And Using Magnum CLI

In order to get started with Magnum CLI, it’s essential to prepare your environment to interact with the KaaS endpoints.

1. Firstly you need to create a virtualenv for your isolated python environment. In order to do so install python-virtualenv, which is among the commonly known packages for various distributions. Once your virtualenv is activated,
  * install the openstack command-line client
    * `pip install python-openstackclient`
2. With the client installed, download your credentials on our public cloud and source it.
3. To test the client, list the available cluster templates:
  * `openstack coe cluster template list`

An empty output is normal; it indicates that you don’t have any cluster templates yet. If the tool complains about an unknown “coe” command, make sure that you have python-magnumclient installed.

### Instructions To Create Clusters And Cluster Templates

These steps describe how you can interact with our KaaS by creating clusters and cluster templates.

Because there are `--labels` to be set in all cluster templates, it is important to take our public cluster template as a reference to create private cluster templates. There are `--labels` that are required for the cluster template to be functional.

Moving forward, you can get the relevant information by showing the public cluster template details:

```
openstack coe cluster template show <id of v2-k8s-8-v1.18.2 template>
```

As you will see below, there is a field in `--labels` where you need to define the `boot_volume_type`. In this portion make sure you pick the appropriate volume type for each region from the list of available volume types, which you will obtain by running `Openstack volume type list`.

* To create a cluster template, follow the steps:
  * `openstack coe cluster template create <template-name>   --image "fedora-coreos-31.20200601.3.0-openstack.x86_64" --external-network public --master-flavor v2-standard-1 --flavor v2-highcpu-8 --docker-volume-size 50 --network-driver calico <rbd for sjc1 and ssd for ca-ymq2> --docker-storage-driver overlay2 --master-lb-enabled --volume-driver cinder --labels boot_volume_type=,boot_volume_size=50,kube_tag=v1.18.2,availability_zone=nova --coe kubernetes -f value -c uuid`
  * As a result, you will get the template universally unique id (uuid):
    * i.e. `Request to create cluster template <template name>  accepted \<template uuid\> `
* By listing the available cluster templates you will get both the public template and your recent created template:

Copy to Clipboard

1

    +--------------------------------------+------------------+

2

    | uuid | name |

3

    +--------------------------------------+------------------+

4

    | \<id\> |v2-k8s-8-v1.18-2 |

5

    | \<id\> |\<template name\> |

6

    +--------------------------------------+------------------+

7

    ​

* The next would be for you to create a Kubernetes cluster using any of the templates above by running the following:
  * `openstack coe cluster create k8s-cluster --master-count 1 --node-count 2 --cluster-template <chosen template id> `
  * As a result you will get the cluster uuid:
    * `Response: Request to create cluster accepted \<cluster uuid\>`
* Now you should wait until the cluster finishes its creation and you can check for a status update through this:
  * `watch -n 2 openstack coe cluster show -c status -c master_addresses -c faults \<cluster uuid\>`
* Once the status is,
  * `CREATE_COMPLETE`

you can access master using the provided keypair with username core and cluster master\_address.

For further clarification, **master-count** defines the number of Kubernetes management nodes, while **node-count** defines the number of pods.

Additionally, If the master-count is more then 1, a load-balancer will be configured and you will access Kubernetes API via VIP placed on the load balancer. You can also employ an external load balancer that exists in front of the Kubernetes service, creating an external IP that can be accessed and will distribute traffic amongst the pods.

Now that you have created a cluster to its completion, you are good to get started on interacting with your Kubernetes API!****

### The VEXXHOST Difference

Collaborating OpenStack and Kubernetes is the bringing together of two powerhouses of the opensource platform. With the OpenStack project, Magnum on your side, you will be reaping numerous advantages such as a high level of efficiency and security while running the container orchestration engine of choice! Furthermore, the seamless integration between Kubernetes and OpenStack is not limited to Magnum but also extends to Block Storage, Keystone and Load Balancers, as was mentioned briefly before.

By now you are familiar with the fact that the VEXXHOST Cloud Console houses both Kubernetes and OpenStack services. VEXXHOST ensures that the availability of these services is hosting model agnostic, therefore you can run your application on any infrastructure model, be it public, private or even hybrid! Moreover, the VEXXHOST team is constantly in touch with the OpenStack magnum community via IRC, helping us stay updated throughout all changes. If you would like a similar walkthrough on interacting with your [Kubernetes API](https://vexxhost.com/blog/kubernetes-container-orchestration-engine/), stay tuned for new content. In the meantime, you can [reach out](https://vexxhost.com/solutions/kubernetes-enablement/) to us about your Kubernetes questions or get in touch to know more about how we can help you make the most of KaaS.