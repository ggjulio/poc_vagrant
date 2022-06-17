#!/bin/sh

set -e

echo "\n================WORKER========================\n"
echo "\nmise à jours des miroir\n"
cd /etc/yum.repos.d/

sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
# dnf -y update

echo "\ninstallation de k3S\n"
curl -sfL https://get.k3s.io | sh -
