# poc_vagrant

#### Running vagrant at 42.
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

### install vagrant autocomplete (and other autocomplete stuff...)
```shell
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
```

Then add it to FPATH in your .zshrc by adding the following line before source `$ZSH/oh-my-zsh.sh`:
```shell
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
```

#### sources :
- [vagrant doc](https://www.vagrantup.com/docs)
- [vagrantfile tips](https://www.vagrantup.com/docs/vagrantfile/tips)
- [vagrant boxes](https://app.vagrantup.com/boxes/search)
- [multi machines](https://www.vagrantup.com/docs/multi-machine)
