#!/bin/sh

set -e

echo "Setting up mirrors and dnf update..."
cd /etc/yum.repos.d/

sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
dnf -y update

# echo "Installing k3S..."
# curl -sfL https://get.k3s.io | sh -
# echo "k3S installed."

echo "Setting up kubectl completion..."
# dnf install bash-completion
echo 'source <(kubectl completion bash)' >>~/.bashrc

