# User and project administration

[![Authors avatar](resources/6167CEFBAC47F904CC4DD118E6F9CA62.svg)](https://www.ntnu.no/wiki/plugins/servlet/mobile#profile/eigilo)

[Eigil Obrestad](https://www.ntnu.no/wiki/plugins/servlet/mobile#profile/eigilo)

[28.06.2016](https://www.ntnu.no/wiki/plugins/servlet/mobile#profile/eigilo)

* [Project administration](https://www.ntnu.no/wiki/plugins/servlet/mobile#Userandprojectadministration-Projectadministration) 
  * [Naming scheme:](https://www.ntnu.no/wiki/plugins/servlet/mobile#Userandprojectadministration-Namingscheme:)
  * [Description field:](https://www.ntnu.no/wiki/plugins/servlet/mobile#Userandprojectadministration-Descriptionfield:)
  * [Expiry](https://www.ntnu.no/wiki/plugins/servlet/mobile#Userandprojectadministration-Expiry)
  * [Creating a project](https://www.ntnu.no/wiki/plugins/servlet/mobile#Userandprojectadministration-Creatingaproject)
  * [Deleting a project:](https://www.ntnu.no/wiki/plugins/servlet/mobile#Userandprojectadministration-Deletingaproject:)
* [Adding/Removing users/groups to/from projects](https://www.ntnu.no/wiki/plugins/servlet/mobile#Userandprojectadministration-Adding/Removingusers/groupsto/fromprojects) 
  * [Displaying users assigned to a certain project](https://www.ntnu.no/wiki/plugins/servlet/mobile#Userandprojectadministration-Displayingusersassignedtoacertainproject)
  * [Assigning NTNU users to a project](https://www.ntnu.no/wiki/plugins/servlet/mobile#Userandprojectadministration-AssigningNTNUuserstoaproject)
  * [Assigning NTNU groups to a project](https://www.ntnu.no/wiki/plugins/servlet/mobile#Userandprojectadministration-AssigningNTNUgroupstoaproject)
  * [Removing NTNU users from a project](https://www.ntnu.no/wiki/plugins/servlet/mobile#Userandprojectadministration-RemovingNTNUusersfromaproject)
  * [Removing NTNU groups from a project](https://www.ntnu.no/wiki/plugins/servlet/mobile#Userandprojectadministration-RemovingNTNUgroupsfromaproject)
* [User administration](https://www.ntnu.no/wiki/plugins/servlet/mobile#Userandprojectadministration-Useradministration) 
  * [Displaying projects a user is member of](https://www.ntnu.no/wiki/plugins/servlet/mobile#Userandprojectadministration-Displayingprojectsauserismemberof)
  * [Service users, or temporary guest users](https://www.ntnu.no/wiki/plugins/servlet/mobile#Userandprojectadministration-Serviceusers,ortemporaryguestusers) 
    * [Create service user:](https://www.ntnu.no/wiki/plugins/servlet/mobile#Userandprojectadministration-Createserviceuser:)
    * [Delete service user:](https://www.ntnu.no/wiki/plugins/servlet/mobile#Userandprojectadministration-Deleteserviceuser:)
    * [Temporary users](https://www.ntnu.no/wiki/plugins/servlet/mobile#Userandprojectadministration-Temporaryusers)

We are using openstack projects, with some defined quotas, to contain student projects. For courses which uses the openstack platform, we are creating one openstack project per project group. This page of the wiki documents this process.

# Project administration

## Naming scheme:

We are creating projects using a strict naming scheme. All projects should be named using one of the following schemes:

Naming schemeExamplePurpose\<Course-code\>\_\<Term\>\_\<GroupName\>IMT3441\_V17\_Group1Projects related to a specific course. Term should reflect when the project is created, and is built up by "H" for autumn and "V" for spring, and then two digits signalizing the year.\<Department\>\_\<DescriptiveName\>IIK\_AssuranceTestingLab

Project related to a certain project not course-specific.

PRIV\_\<username\>PRIV\_eigilo

Single-user private project, not associated with any real courses or projects. Employees only. Similar student projects are prefixed "STUDENT".

MISCMISCProject with misc instances for "people who just wants a server"STUDENT\_\<username\>STUDENT\_olanordmPrivate projects which a student requests for own learning.STUDPROJ\_\<shortname\>STUDPROJ\_cognitaProject assigned to a group of students for a project that is not directly associated with any courses.

Any projects not following this naming scheme might be deleted without warning. Projects created before December 2016 will be renamed instead of deleted.

## Description field:

The projects have a description-field. This field should provide a description of the project, to help the administrators to understand what it is there for.

## Expiry

The projects can have an "expiry" property. This property controls when the project can be deleted. It should contain a date in the format "dd.mm.yyyy"

## Creating a project

We use a [script in our admintools](https://github.com/ntnusky/admintools/blob/master/projectadmin/createProject.sh) to create projects. Please refer to it for help. It prints a help-page if ran without parameters.

## Deleting a project:

When a project is about to be removed, all users should be removed, and all resources should be deleted before the project is deleted. This is a suggested list of actions:

* Remove all users and groups but your own from the project
* Delete all heat stacks
* Deattach and delete all volumes
* Delete all virtual machines
* Delete all ports
* Delete all firewall-rules
* Delete all firewall-policies
* Delete all firewalls
* Delete all routers
* Delete all subnets
* Delete all networks
* Delete all security groups
* Delete all floating IP's
* Remove your user from the project
* Delete the project

As of Mitaka, openstack is still not cleaning up properly when a project is removed; hence the extensive checklist.

[We have a script to delete projects for us.](https://github.com/ntnusky/admintools/blob/master/projectadmin/deleteProject.sh)

# Adding/Removing users/groups to/from projects

This section describes how to add/remove users and groups from projects.

## Displaying users assigned to a certain project

To show which users are assigned to a certain project, the following command can be used.

    $ openstack role assignment list --project <projectname> --names

## Assigning NTNU users to a project

A user can be assigned to a project using the following commands:

**Give user access to project**

    $ openstack role add --project <projectname> --user <username> --user-domain=NTNU _member_
    $ openstack role add --project <projectname> --user <username> --user-domain=NTNU heat_stack_owner
    $ openstack role add --project <projectname> --user <username> --user-domain=NTNU load-balancer_member
    $ openstack role add --project <projectname> --user <username> --user-domain=NTNU creator

This will give the user access to create networks/routers/vm's, in addition to use the heat orchestration services, octavia loadbalancing and barbican key-storage.

## Assigning NTNU groups to a project

A group from BAS can be assigned to a project using the following command:

**Give group access to project**

    $ openstack role add --project <projectname> --group <groupname> --group-domain=NTNU _member_
    $ openstack role add --project <projectname> --group <groupname> --group-domain=NTNU heat_stack_owner
    $ openstack role add --project <projectname> --group <groupname> --group-domain=NTNU load-balancer_member
    $ openstack role add --project <projectname> --group <groupname> --group-domain=NTNU creator

BAS groupadmin: <https://bas.ntnu.no/groupadmin> 

SkyHiGh will only contain groups that starts with "ie-iik\_skyhigh"

[stack.it](http://stack.it) will only contain groups that starts with "itea\_stackit"

## Removing NTNU users from a project

When a user should be removed from the project, his *member* role, and heat\_stack\_owner role, should be removed:

**Give user access to project**

    $ openstack role remove --project <projectname> --user <username> --user-domain=NTNU _member_
    $ openstack role remove --project <projectname> --user <username> --user-domain=NTNU heat_stack_owner
    $ openstack role remove --project <projectname> --user <username> --user-domain=NTNU load-balancer_member
    $ openstack role remove --project <projectname> --user <username> --user-domain=NTNU creator

## Removing NTNU groups from a project

When a group should be removed from the project, his *member* role, and heat\_stack\_owner role, should be removed:

**Give project access to project**

    $ openstack role remove --project <projectname> --group <groupname> --group-domain=NTNU _member_
    $ openstack role remove --project <projectname> --group <groupname> --group-domain=NTNU heat_stack_owner
    $ openstack role remove --project <projectname> --group <groupname> --group-domain=NTNU load-balancer_member
    $ openstack role remove --project <projectname> --group <groupname> --group-domain=NTNU creator

# User administration

As we are performing authentication using the NTNU LDAP infrastructure, we do not administer regular user accounts. We are simply adding existing NTNU users to openstack projects.

## Displaying projects a user is member of

To display which projects a user is a member of:

**Determine user ID**

    $ openstack role assignment list --user eigilo --user-domain=NTNU --names
    +------------------+-------------+-------+---------------+--------+-----------+
    | Role             | User        | Group | Project       | Domain | Inherited |
    +------------------+-------------+-------+---------------+--------+-----------+
    | admin            | eigilo@NTNU |       | admin@Default |        | False     |
    | _member_         | eigilo@NTNU |       | eigil@Default |        | False     |
    | heat_stack_owner | eigilo@NTNU |       | eigil@Default |        | False     |
    +------------------+-------------+-------+---------------+--------+-----------+

## Service users, or temporary guest users

In some special cases it is needed to create users which is not a part of the NTNU LDAP catalog. There are currently two cases where this is necessary:

* In some courses it is desired to automate tasks which accesses the openstack api's in an unattended manner, and in these cases it is undesirable to hard code a student's username and password in these scripts. In these cases a openstack-specific service user can be created.
* When temporary users, where it is undesirable to create a NTNU user, needs an openstack user we can create a local user which he can use.

Everyone who have a personal NTNU user should however use this user for all manual access to the openstack platform. A service user should only be used when unattended tasks targeting the api's are performed.

### Create service user:

A service user should only belong to a single project, and it can be created like so:

**Create a temporary or a service user**

    $ openstack user create --domain default --password-prompt --email <a-relevant-email@address.no> --description "<A Description of this users purpose>" <project-name>_service
    $ openstack role add --project <project-name> --user <project-name>_service _member_

### Delete service user:

Deleting the service user is the opposite approach

**Delete a temporary or a service user**

    $ openstack role remove --project <project-name> --user <project-name>_service _member_
    $ openstack user delete --domain default <project-name>_service

### Temporary users

For temporary users a similar approach as with service users can be performed, where the description of the user should indicate the reason for this being a local user, and not a NTNU user. The user should also be deleted as soon as it is not necessary anymore