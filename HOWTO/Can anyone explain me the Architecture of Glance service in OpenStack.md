OpenStack Glance has a client-server architecture that provides a REST API to the user through which requests to the server can be performed.

A Glance Domain Controller manages the internal server operations that is divided into layers. Specific tasks are implemented by each layer.

All the file (Image data) operations are performed using glance\_store library, which is responsible for interaction with external storage back ends and (or) local filesystem(s). The glance\_store library provides a uniform interface to access the backend stores.

Glance uses a central database (Glance DB) that is shared amongst all the components in the system and is sql-based by default. Other types of database backends are somewhat supported and used by operators but are not extensively tested upstream.

 ![OpenStack Glance Architecture Diagram. Consists of 5 main blocks: "Client" "Glance" "Keystone" "Glance Store" and "Supported Storages". Glance block exposes a REST API. The REST API makes use of the AuthZ Middleware and a Glance Domain Controller, which contains Auth, Notifier, Policy, Quota, Location and DB. The Glance Domain Controller makes use of the Glance Store (which is external to the Glance block), and (still within the Glance block) it makes use of the Database Abstraction Layer, and (optionally) the Registry Layer. The Registry Layer makes use of the Database Abstraction Layer. The Database abstraction layer exclusively makes use of the Glance Database. The Client block makes use of the Rest API (which exists in the Glance block) and the Keystone block. The Glance Store block contains AuthN which makes use of the Keystone block, and it also contains Glance Store Drivers, which exclusively makes use of each of the storage systems in the Supported Storages block. Within the Supported Storages block, there exist the following storage systems, none of which make use of anything else: Filesystem, Swift, Ceph, "ellipses", Sheepdog. A complete list is given by the currently available drivers in glance\_store/\_drivers.](resources/B6E6210D9BDA7E005A0A560D14813BE2.png)

 Image 1\. OpenStack Glance Architecture