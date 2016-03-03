#!/bin/bash

set -x
set -e

# Get admin tenant id
admin_tenant_name=`cat /root/openrc | grep "TENANT_NAME" | awk -F "=" '{print $2}'`
admin_tenant_id=`openstack project list | grep $admin_tenant_name | awk '{print $2}'`

# Update nova quota
nova quota-update --instances -1 --cores -1 --ram -1 --force $admin_tenant_id

# Update cinder quota
cinder quota-update --volumes -1 --snapshots -1 --gigabytes -1 $admin_tenant_id

# Update neutron quota
neutron quota-update --network -1 --subnet -1 --port -1 --tenant-id $admin_tenant_id
