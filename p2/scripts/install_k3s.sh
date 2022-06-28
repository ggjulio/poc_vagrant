#!/bin/sh

set -eux

BOLD="\e[1m"
RESET="\e[0m"
LIGHT_RED="\e[91m"
LIGHT_GREEN="\e[92m"
LIGHT_CYAN="\e[96m"

logging(){
	local type=$1; shift
	printf "${LIGHT_CYAN}${BOLD}Entrypoint${RESET} [%b] : %b\n" "$type" "$*"
}

log_error(){
	logging "${LIGHT_RED}error${RESET}" "$@" >&2
	exit 1
}

if [ -z "$NODE_IP" ]; then
   log_error "No variable $NODE_IP specified."
fi

echo "Setting up mirrors and dnf update..."
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
dnf -y update

echo "Installing server k3S with  ${NODE_IP}..."
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--cluster-init --node-ip=${NODE_IP} --write-kubeconfig-mode 644" sh -
echo "k3S master node installed."

echo "Setting up kubectl completion..."
# dnf install bash-completion
echo 'source <(kubectl completion bash)' >>~/.bashrc
