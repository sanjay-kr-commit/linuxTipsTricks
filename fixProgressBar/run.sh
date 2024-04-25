#!/bin/bash

if [ $UID -ne 0 ] ; then
    echo "Root Permission Required to write to system file"
    exit
fi

entry=$( cat /etc/sysctl.conf | grep "vm.dirty_bytes" )

if [ ${#entry} -ne 0 ] ; then
    echo "Property is already set"
    echo $entry
    exit
fi

echo "Gained Root Permission"
echo ""
echo "Current Caching value"

cat /proc/sys/vm/dirty_bytes

# change this value to change cache size before running
cache_size=31457280

# update temporary value
echo $cache_size > /proc/sys/vm/dirty_bytes

# update permanent value

echo vm.dirty_bytes=$cache_size >> /etc/sysctl.conf
echo ""
echo "New Values"
echo ""
echo "Live Value"
cat /proc/sys/vm/dirty_bytes
echo ""
echo "Permanent Value"
cat /etc/sysctl.conf | grep "vm.dirty_bytes"
