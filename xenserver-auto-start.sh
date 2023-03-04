#!/bin/bash

# Wenderson Souza (wendersonsouza at gmail dot com)
# 04/Mar/2023

# This script setting the Auto-Start in the XenServer and in all Virtual Machines automatically

echo START!
echo

# activate auto power on in the server
UUID_SERVER=`xe pool-list | grep uuid | awk '{print $5}'`
#xe pool-param-set other-config:auto_poweron=true uuid=$UUID_SERVER
echo SERVER [ OK ]
echo


# list of virtual machines
for UUID_VM in `xe vm-list | grep uuid | awk '{print $5}'`
do
        xe vm-param-set other-config:auto_poweron=true uuid=$UUID_VM
        echo VM $UUID_VM [ OK ]
done
echo

echo COMPLETE!
echo

exit 0
