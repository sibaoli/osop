#!/bin/bash

set -x
set -e

# Create volume
volume_id=`cinder create 1 --name osop-test-volume | grep "\ id\ " | awk '{print $4}'`

# Clean volume
cinder delete $volume_id
