#/bin/bash
health=$(ceph -s | grep health |awk '{print $2}')
if [ $health == 'HEALTH_OK' ]
then
echo 'ceph is ok!'
else
echo 'ceph is bad!'
fi
