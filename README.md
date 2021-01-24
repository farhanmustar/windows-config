# Windows configuration guide
Make sure all run in admin powershell

## Powershell Core Configuration
Change Powershell tab completion behaviour and set ```ls``` alias to ```get-childitemcolorformatwide```

copy ```./Documents/PowerShell/profile.ps1``` to ```~/Documents/PowerShell/profile.ps1```

set scrip execution policy to remotesigned
```
Set-ExecutionPolicy remotesigned
```

## Chocolatey Package Manager
Install chocolatey from [chocolatey.org](https://chocolatey.org/install).
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

install all other software using chocolatey
```powershell
choco install `
googlechrome postman `
free-download-manager `
psutils get-childitemcolor `
powershell-core `
microsoft-windows-terminal `
vim universal-ctags git `
grep less which wget rsync watchexec `
virtualbox `
putty.install vcxsrv `
filezilla dbeaver 7zip `
advanced-ip-scanner wireshark `
libreoffice notepadplusplus `
paint.net inkscape `
vlc `
cpu-z hwmonitor `
--install-arguments='"ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1"' `
--params "/NoGuiHereIntegration /NoShellHereIntegration /ExtensionPack" `
--ignore-checksums -y
```

### Alternatively can use gimp instead of paint.net
```powershell
choco install gimp -y
```

### Note on watchexec
For now there is no watch replacement in windows.
watchexec is almost similar to watch, but only execute command if got file change.
Exemple: execute ```node index.js``` if file change in current directory.
```
watchexec -- node .\index.js
```
TIPS: for nodejs use ```console.clear()``` inside index.js to clear console log before print new stuff.

### Note on sudo
```sudo``` keyword is available after installing psutils, which is included in the above install command.
Users can now install using chocolatey without admin enabled powershell as shown below.
```powershell
sudo choco install <software_name>
```

## Configure Putty
putty use register to store settings. Double click on ```./putty/putty.reg``` then accept importing the register.

configure shortcut for pagent to pass private key,   
just add path of the key in quote after the pagent url.

configure Xlaunch. then save the config to document folder. (xserver.xlaunch)

## Configure Vim
Clone dotfiles repo at https://github.com/farhanmustar/dotfiles.git.
Run vim and run ```:PluginInstall``` to install all plugins.
```
git clone https://github.com/farhanmustar/dotfiles.git
```

## Configure Keyboard Mapping
To remap ```caps_lock``` key to ```esc``` key and ```scroll_lock``` key to ```caps_lock``` key. 
  - Double click ```keyboard_remap/remap_caps_lock_to_escape_scroll_lock_to_caps_lock.reg``` and accept importing the register

To restore back the keyboard layout maping to default value
  - Double click ```keyboard_remap/default_keyboard_remap.reg``` and accept importing the register

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
```powershell
choco install openssl openssl-wizard -y
```

## Android  Development
```powershell
choco install androidstudio -y
```

## Nodejs Development
```powershell
choco install nodejs -y
```
basic tools used to build pkg manually.
```powershell
sudo npm install -g windows-build-tools
```

## Python 2.x Development
```powershell
choco install python2 -y
```

remove python exe file in following directory (note: use admin console. it is link file)
windows did that to auto start windows store when use python keyword.why!!!
```
C:\Users\farha\AppData\Local\Microsoft\WindowsApps
```

## Arduino Development
```powershell
choco install arduino arduino-cli -y
```

## PlatformIO Development
Need to use pip to install only. Refer to python section to install pip.
```
pip install platformio
```

## PCB Circuit Design
Download easyeda manually, for now no package on chocolatey.
```powershell
choco install kicad -y
```
Build in board should be enough, But if required can try to search at [snapeda.com](https://www.snapeda.com/kicad/).
Maybe add other library:-
[SparkFun](https://github.com/sparkfun/SparkFun-KiCad-Libraries.git)
[Digi-Key](https://github.com/Digi-Key/digikey-kicad-library.git)

## PC Gaming
```powershell
choco install origin steam epicgameslauncher ds4windows -y
```

## Media Software

### Webcam and Screen Recording
```powershell
choco install obs-studio -y
```

### Audio Editing
```powershell
choco install audacity -y
```

### Video Editing
```powershell
choco install kdenlive -y
```

## Hard Disk Health Monitor and Benchmark Tools
```powershell
choco install crystaldiskmark crystaldiskinfo -y
```

# Optional Setup
## Use paegent for ssh auth
optionally can configure git to use sshkey from putty. (but https should be good enough. git use windows credential manager)
  - note that thare is bug to add new server to known host in terminal. need to manually ssh using putty and accept in gui.
Set env variable GIT_SSH to pagent.
```
GIT_SSH=C:\ProgramData\chocolatey\bin\PAGEANT.EXE
```

# TODO

## Explore Powershell Galery
Powershell got its own build in module manager. Need to explore, as for now the package available is very limited.
```
https://www.powershellgallery.com/packages
```

## Explore Windows Package Manager
Windows package manager.
```
https://docs.microsoft.com/en-gb/windows/package-manager/
```

## Explore scoop
need to compare first. or use both.
Install
```
iwr -useb get.scoop.sh | iex
scoop bucket add extras
```
