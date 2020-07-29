# Windows configuration guide
Makesure all run in admin powershell

## Powershell Core Configuration
Change Powershell tab completion behaviour
Create new file at ```~/Documents/PowerShell/profile.ps1```
```
Set-PSReadlineKeyHandler -Key Tab -Function Complete
```
set scrip execution policy to remotesigned
```
Set-ExecutionPolicy remotesigned
```

## Chocolatey Package Manager
Install chocolatey (follow website)

install all other software using chocolatey
```
choco install googlechrome psutils microsoft-windows-terminal vim git putty.install vcxsrv filezilla virtualbox dbeaver paint.net inkscape libreoffice advanced-ip-scanner grep less which wget 7zip wireshark free-download-manager vlc notepadplusplus postman watchexec powershell-core hwmonitor --install-arguments='"ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1"' --params "/NoGuiHereIntegration /NoShellHereIntegration /ExtensionPack" --ignore-checksums -y
```

### Alternatively can use gimp instead of paint.net
```
choco install gimp -y
```

### Note on watchexec.
For now there is no watch replacement in windows.
watchexec is almost similar but only execute command if got fie change.
Exemple: execute ```node index.js``` if got file change in current directory.
```
watchexec -- node .\index.js
```
TIPS: for nodejs use ```console.clear()``` inside index.js to clear console log before print new stuff.

### Note on sudo.
```sudo``` keyword is available after installing psutils, which is included in above install command.
Users can now install using chocolatey without admin enabled powershell as shown below.
```
sudo choco install <software_name>
```

## Configure Putty
putty use register to store settings. Double click on ```./putty/putty.reg``` then accept importing the register.

configure shortcut for pagent to pass private key,   
just add path of the key in quote after the pagent url.

configure Xlaunch. then save the config to document folder. (xserver.xlaunch)

## Configure VIM.
pull from dotfiles url(https://gitlab.com/devomatlab/configurations/dotfiles.git)
install vundle (sometimes it not copy to correct file instead it create ~ folder why!!!)
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Configure Chrome
install extension
  - vimmium c
      - configure search to accept js regex
  - dark reader
      - configure dark reader shortcut to ctrl+shift+d
  - js error notify
  - free download manager for chrome

## Configure Windows Terminal
copy paste settings from ```./windows-terminal/settings.json``` to terminal settings.

## Openssl Tools
```
choco install openssl openssl-wizard -y
```

## Nodejs Development
```
choco install nodejs -y
```

## Python 2.x Development
```
choco install python2 -y
```

remove python exe file in following directory (note: use admin console. it is link file)
windows did that to auto start windows store when use python keyword.why!!!
```
C:\Users\farha\AppData\Local\Microsoft\WindowsApps
```

then install pip by running(note: restart terminal to use python)
```
python -m pip
```

## Arduino Development
```
choco install arduino arduino-cli -y
```


## PCB Circuit Design
Download easyeda manually, for now no package on chocolatey.
```
choco install kicad -y
```
Build in board should be enough, But if required can try to search at [snapeda.com](https://www.snapeda.com/kicad/).
Maybe add other library:-
[SparkFun](https://github.com/sparkfun/SparkFun-KiCad-Libraries.git)
[Digi-Key](https://github.com/Digi-Key/digikey-kicad-library.git)


## PC Gaming
```
choco install origin steam epicgameslauncher -y
```

# Not recommended
optionally can configure git to use sshkey from putty. (but https should be good enough. git got save credential)
  - note that thare is bug to add new server to known host in terminal. need to manually ssh using putty and accept in gui.
Set env variable GIT_SSH to pagent.
```
GIT_SSH=C:\ProgramData\chocolatey\bin\PAGEANT.EXE
```
