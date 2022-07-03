#!/bin/sh

RESET="\e[0m"
LIGHT_RED="\e[91m"
LIGHT_GREEN="\e[92m"

set -eux

logging(){
	local type=$1; shift
	printf "${RESET}[%b] $0 : %b\n" "$type" "$*"
}

log_info(){
	logging "${LIGHT_GREEN}info${RESET}" "$@"
}

log_error(){
	logging "${LIGHT_RED}error${RESET}" "$@" >&2
	exit 1
}

if [ -z "$NODE_IP" ]; then
   log_error "No variable NODE_IP specified. Please specify it."
fi

# log_info "Setting up mirrors and dnf update..."
# sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
dnf -y --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos

# dnf -y update
# dnf -y install wget kernel-headers kernel-devel-$(uname -r) kernel-header-$(uname -r)
dnf -y install wget kernel-headers kernel-devel-$(uname -r) kernel-header-$(uname -r)
# dnf -y install wget kernel-devel.x86_64
# dnf -y group install "Development Tools"

log_info "Installing server k3S with ${NODE_IP} as node ip..."
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--cluster-init --node-ip=${NODE_IP} --write-kubeconfig-mode 644" sh -
log_info "k3S server node installed."

log_info "Setting up kubectl completion..."
/usr/local/bin/kubectl completion bash >> /etc/bash_completion.d/kubectl

# log_info "is VBox guest additions installed ?"
# lsmod | grep vboxguest
log_info "Installing VBox guest additions."
sudo wget http://download.virtualbox.org/virtualbox/6.1.34/VBoxGuestAdditions_6.1.34.iso
sudo mkdir /media/VBoxGuestAdditions
sudo mount -o loop,ro VBoxGuestAdditions_6.1.34.iso /media/VBoxGuestAdditions
sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run --nox11
sudo rm VBoxGuestAdditions_6.1.34.iso
sudo umount /media/VBoxGuestAdditions
sudo rmdir /media/VBoxGuestAdditions
log_info "VBox guest additions installed."



# sudo wget http://download.virtualbox.org/virtualbox/4.3.8/VBoxGuestAdditions_4.3.8.iso
# sudo mkdir /media/VBoxGuestAdditions
# sudo mount -o loop,ro VBoxGuestAdditions_4.3.8.iso /media/VBoxGuestAdditions
# sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
# sudo rm VBoxGuestAdditions_4.3.8.iso
# sudo umount /media/VBoxGuestAdditions
# sudo rmdir /media/VBoxGuestAdditions