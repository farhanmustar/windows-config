Makesure all run in admin powershell
set scrip execution policy to remotesigned
```
Set-ExecutionPolicy remotesigned
```
Install chocolatey (follow website)

install all other software using chocolatey
```
choco install microsoft-windows-terminal vim git putty vcxsrv filezilla virtualbox dbeaver gimp libreoffice advanced-ip-scanner grep less which 7zip wireshark -y
```

configure vim.
pull from dotfiles url(TODO: put url here)
install vundle (sometimes it not copy to correct file instead it create ~ folder why!!!)
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

configure putty
keybord xterm
allow agent forwarding
allow x11 forwarding

configure shortcut for putty puttygen pagent. (install from chocoletey add this at programdata/chocolatey/bin.)

configure Xlaunch. then save the config to document folder. (xserver.xlaunch)
