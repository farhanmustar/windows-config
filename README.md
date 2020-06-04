# Windows configuration guide
Makesure all run in admin powershell

Change Powershell tab completion behaviour
Create new file at ```~/Documents/WindowsPowerShell/profile.ps1```
```
Set-PSReadlineKeyHandler -Key Tab -Function Complete
```

set scrip execution policy to remotesigned
```
Set-ExecutionPolicy remotesigned
```
Install chocolatey (follow website)

install all other software using chocolatey
```
choco install microsoft-windows-terminal vim git putty vcxsrv filezilla virtualbox dbeaver gimp libreoffice advanced-ip-scanner grep less which 7zip wireshark free-download-manager vlc googlechrome --ignore-checksums -y
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



configure windows terminal
copy paste settings.json from repo windows-terminal


# Not recommended
optionally can configure git to use sshkey from putty. (but https should be good enough. git got save credential)
  - note that thare is bug to add new server to known host in terminal. need to manually ssh using putty and accept in gui.
Set env variable GIT_SSH to pagent.
```
GIT_SSH=C:\ProgramData\chocolatey\bin\PAGEANT.EXE
```
