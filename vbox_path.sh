#!/bin/sh

if [ "$(id -u)" = "1000" ]; then
    echo "Not at school !"
    exit 0
fi
vboxmanage setproperty machinefolder ~/goinfre
echo "vbox path changed to ~/goinfre."
