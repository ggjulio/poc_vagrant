# poc_vagrant

##### Running vagrant at 42.
Vagrant and bsdtar are now installed by default on the linux dump.
So only need to change vbox path for VMs to avoid flood home space usage.

Choose either `tmp` or `goinfre` folder:
```shell
vboxmanage setproperty machinefolder ~/goinfre
```
However logout mean lost of VMs...
If persistance matter, try into your server goinfre folder `~/sgoinfre/`
```shell
vboxmanage setproperty machinefolder ~/sgoinfre
```
But server goinfre probably means VMs slow AF...

#### install vagrant autocomplete (and other autocomplete stuff...)
```shell
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
```

Then add it to FPATH in your .zshrc by adding the following line before the line `source $ZSH/oh-my-zsh.sh`:
```shell
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
```

#### install kubectl in our home for part 3
```shell

mkdir -p ~/bin
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

mv kubectl ~/bin/
```

- https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/ 

#### Sources :

##### Vagrant
- [vagrant doc](https://www.vagrantup.com/docs)
- [vagrantfile tips](https://www.vagrantup.com/docs/vagrantfile/tips)
- [vagrant boxes](https://app.vagrantup.com/boxes/search)
- [multi machines](https://www.vagrantup.com/docs/multi-machine)
- [config.vm.network](https://friendsofvagrant.github.io/v1/docs/config/vm/network.html)
- [](https://www.nickhammond.com/configuring-vagrant-virtual-machines-with-env/)
##### vagrant pass token from one vm to another
- [base](https://stackoverflow.com/questions/64486008/how-to-get-env-var-from-one-vm-and-pass-it-to-another-vm-in-vagrantfile)
- [returning a value from a provision script to vagrant](https://stackoverflow.com/questions/21117246/returning-a-value-from-a-provision-script-to-vagrant)
- [returning a value from a provision script to vagrant 2](https://github.com/hashicorp/vagrant/issues/10674)
##### k3s
- [k3s doc](https://rancher.com/docs/k3s/latest/en/)
- [ks server configuration reference](https://rancher.com/docs/k3s/latest/en/installation/install-options/server-config/)
- [k3s multinode install](https://projectcalico.docs.tigera.io/getting-started/kubernetes/k3s/multi-node-install)
- [k8s multinode centos](https://www.golinuxcloud.com/kubernetes-add-node-to-existing-cluster/#Lab_Environment)

##### k3d
- [Create a Multi-Node Cluster with k3d](https://docs.rancherdesktop.io/how-to-guides/create-multi-node-cluster/)

##### kubectl
- [kubectl completion](https://linuxhint.com/enable-kubectl-bash-completion/)