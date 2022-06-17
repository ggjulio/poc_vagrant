#!/bin/sh

set -e 

if [ "$(id -u)" = "1000" ]; then
    echo "Not at school !"
    exit 0
fi
vboxmanage setproperty machinefolder ~/goinfre
echo "vbox path changed to ~/goinfre."

echo '* 192.168.10.0/24' >> /etc/vbox/networks.conf
echo "vbox allowed ranges "
