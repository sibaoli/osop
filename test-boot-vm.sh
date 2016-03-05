#!/bin/bash

set -x
set -e

# Get resource ids
image_id=`glance image-list | grep 'cirro' | awk '{print $2}'`
flavor_id=`nova flavor-list | grep "standard-1" | awk '{print $2}'`
net_id=`neutron net-create osop-test-net | grep "\ id\ " | awk '{print $4}'`
subnet_id=`neutron subnet-create $net_id "192.168.0.0/24" | grep "\ id\ " | awk '{print $4}'`

# Boot instance
#nova boot --image 4ad99265-1b00-4446-a602-863bb07caef6 --flavor d240156f-4414-4dc0-8a11-dc0c5e690e5c --nic net-id=298a065e-5a33-4aa6-aaa5-904d2413f1aa --availability_zone module_A --poll tobe-test-1
nova boot --image $image_id --flavor $flavor_id --nic net-id=$net_id --poll osop-test-vm

# Cleanup resources
nova_id=`nova list | grep "osop-test-vm" | awk '{print $2}'`
nova delete $nova_id

sleep 30
neutron subnet-delete $subnet_id

sleep 10
neutron net-delete $net_id
