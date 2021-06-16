How to create and restore an Instance Snapshot
==============================================

### In this quick tutorial, you will learn how to create a [snapshot](https://fuga.cloud/tag/snapshot/) of your [instance](https://fuga.cloud/tag/instance/) and how to restore it.

#### Prerequisites

For this tutorial you’ll need the following:

1. [A Fuga cloud Account](https://my.fuga.cloud/register/)
2. A running Instance

### How to create a Snapshot of an instance with a volume

After you have [created an Instance](https://docs.fuga.cloud/create-a-cloud-instance-3/4), you can make a Snapshot of this Instance.

1. We recommend to make a volume *Available*.
  1. Go to **Compute** and click on **Stop Instance**
  2. Wait until the status of the instance says **SHUTOFF**
  3. Go to **Storage** -\> **Volume Store**.
  4. Click on detach volume in the **Attached to** column
  5. Now, your volume is detached
2. Click on the three dots dropdown button and choose **Create Snapshot**
3. Give it a name and submit the form
4. You will now see your new snapshot in the table

### Restore an Instance Snapshot with volume storage

After you have created an Instance Snapshot you can restore the Snapshot to an Instance.

1. Click **Compute**
2. Click **Create Instance**
3. Choose under **Select Boot Source**:** Volume snapshots**
4. Select the volume snapshot you'd like to use for this instance
5. Complete the form
6. Click** Launch Instance**

Your restored Instance is now running and is accessible with the selected Key and Security Group.

### Restore an Instance Snapshot with ephemeral storage

After you have created an Instance Snapshot you can restore the Snapshot to an Instance.

1. Click **Compute**
2. Click **Create Instance**
3. Choose under **Select Boot Source**:** Custom Images & snapshots**
4. Select the image you'd like to use for this instance
5. Complete the form
6. Click** Launch Instance**

Your restored Instance is now running and is accessible with the selected Key and Security Group.