# Windows configuration guide
Make sure all run in admin powershell

## Chocolatey Package Manager
Install chocolatey from [chocolatey.org](https://chocolatey.org/install).
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## Recommended Package to Install
install all other software using chocolatey
```powershell
choco install `
postman `
free-download-manager `
psutils `
wezterm `
rclone `
vcxsrv `
filezilla dbeaver 7zip `
advanced-ip-scanner wireshark `
libreoffice notepadplusplus `
paint.net inkscape `
vlc `
git `
flameshot `
powertoys `
cpu-z hwmonitor wiztree `
-y
```

### Note on sudo
```sudo``` keyword is available after installing psutils, which is included in the above install command.
Users can now install using chocolatey without admin enabled powershell as shown below.
```powershell
sudo choco install <software_name>
```

## Install scoop
Some application not available in chocolatey, we can use scoop instead.  
Install command
```powershell
iwr -useb get.scoop.sh | iex
scoop bucket add extras
```

# WSL configuration
## Install default (ubuntu) distribution
```powershell
wsl --install
```
## Configure wsl to not add path to host windows bin.
* start wsl
* copy file from ```wsl/wsl.conf``` to ```/etc/wsl.conf```
* shutdown wsl to allow it to reload config.
```powershell
wsl --shutdown
```
## Passthrough host cmd in wsl
```bash
sudo ln -sT /mnt/c/Windows/explorer.exe /usr/bin/explorer
sudo ln -sT /mnt/c/Windows/System32/wsl.exe /usr/bin/wsl
sudo ln -sT /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe /usr/bin/powershell
sudo ln -sT /mnt/c/Windows/System32/clip.exe /usr/bin/clip
```
## Execute powershell from wsl bash
Add following to bash_alias.
```bash
alias pwsh='powershell -Command'
```
This allow for executing powershell cmd such as chocolatey install
```bash
pwsh sudo choco install ...
pwsh Get-VM
pwsh "iwr -useb get.scoop.sh | iex"  # pipe need to be in quote 
```
## Install build-essential
```bash
sudo apt install build-essential
```
## Fix ls color for windows files.
Copy `.dircolors` file to wsl home.

# Configure Hyper-V
Hyper-V is not turn on by default. Enable it:
* Search and start "Turn Window features on or off"
* Tick Hyper-V option.

### Optional Workflow Note
Configure new virtual switch (default switch need to use dhcp for internet and external network)
* Open Hyper-V Manager after reboot.
* Add new virtual switch (Internal) and named is as "192.168.5.1"
* Search and start "View network connections".
* Configure new vEthernet(192.168.5.1) with static ip of 192.168.5.1.

When adding new virtual machine 
* Suffix it name with default ip such as 192.168.5.2
* Add new network adapter and connect to "192.168.5.1" switch.
* Start virtual machine and configure the adapter to be the assigned ip.

## Configure Keyboard Shortcut.
* Note: if app delay start when pressing shortcut, open menu and search for background apps. Then disable all except used one.

## Configure dotfiles inside wsl
Clone dotfiles repo at https://github.com/farhanmustar/dotfiles.git.
```bash
git clone https://github.com/farhanmustar/dotfiles.git
```

## Configure Keyboard Mapping
To remap <kbd>caps_lock</kbd> key to <kbd>esc</kbd> key and <kbd>scroll_lock</kbd> key to <kbd>caps_lock</kbd> key. 
  - Double click ```keyboard_remap/remap_caps_lock_to_escape_scroll_lock_to_caps_lock.reg``` and accept importing the register

To restore back the keyboard layout maping to default value
  - Double click ```keyboard_remap/default_keyboard_remap.reg``` and accept importing the register

## Configure Browser
install extension
  - vimmium c
      - configure search to accept js regex
  - dark reader
      - configure dark reader shortcut to ctrl+shift+d
  - js error notify
  - free download manager for chrome

# Install Tiling Window Management (Komorebi)
```bash
scoop install komorebi
scoop install autohotkey
```
* Set environment variable `KOMOREBI_CONFIG_HOME` to `~/.config/komorebi` (in full windows path)
* Copy autohotkey script from `.config/komorebi` into `KOMOREBI_CONFIG_HOME` path.
* Create link to following bash script and set `Ctrl + Alt + s` to execute it.
```bash
komorebic.exe start
```

# Alternatively Software

#### Gimp instead of Paint.net
```powershell
choco install gimp -y
```
or gimp with photoshop-like plugin.
```powershell
choco install photogimp -y
```

#### Chrome instead of Edge
```powershell
choco install googlechrome -y
```

#### Virtualbox instead of Hyper-V
```powershell
choco install virtualbox -y --params "/ExtensionPack"
```

# Extra Note
<!-- TODO: need to migrate this to wsl --> 

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

## 3D CAD Editing
```powershell
choco install freecad -y
```

## PC Gaming
```powershell
choco install origin steam epicgameslauncher ds4windows -y
```

## Latex Editor
Currently not working, need to install manually.
Miktex have mpm as its package manager can explore that.
```powershell
choco install miktex --params '"/Set:essential"' -y
```

## Media Software

### Webcam and Screen Recording
```powershell
choco install obs-studio -y
```
```powershell
choco install screentogif -y
```

### Audio Editing
```powershell
choco install audacity -y
```

### Video Editing
```powershell
choco install kdenlive -y
```

### On-screen keyboard display
```powershell
choco install keycastow -y
```

## Hard Disk Health Monitor and Benchmark Tools
```powershell
choco install crystaldiskmark crystaldiskinfo -y
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

# Abandon Note
Note that are not relevant anymore.

## Powershell Core Configuration
Change Powershell tab completion behaviour and set ```ls``` alias to ```get-childitemcolorformatwide```

copy ```./PowerShell/profile.ps1``` to ```~/Documents/PowerShell/profile.ps1```

set script execution policy to remotesigned
```powershell
Set-ExecutionPolicy remotesigned
```

## Install Scripts
copy content of ```./scripts``` to ```/ProgramData/Chocolatey/bin```

## Recommended Package to Install
install all other software using chocolatey
```powershell
choco install `
psutils get-childitemcolor `
powershell-core `
microsoft-windows-terminal `
neovim universal-ctags git rclone `
ripgrep grep less which wget rsync watchexec fd tac findutils `
putty.install vcxsrv `
--install-arguments='"ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1"' `
--params "/NoGuiHereIntegration /NoShellHereIntegration" `
--ignore-checksums -y
```

### Note on watchexec
For now there is no watch replacement in windows.
watchexec is almost similar to watch, but only execute command if got file change.
Exemple: execute ```node index.js``` if file change in current directory.
```
watchexec -- node .\index.js
```
TIPS: for nodejs use ```console.clear()``` inside index.js to clear console log before print new stuff.

## Configure NeoVim
To ensure consistent configuration path with linux,
* set XDG_CONFIG_HOME to ```C:\Users\<username>\.config``` in user env variable.

To use Nightly NeoVim.
```powershell
choco update neovim --pre
```

### Share clipboard with remote server through ssh with putty
* On server, install xclip. For example, in ubuntu:
```bash
apt install xclip
```
* Run the ```vcxsrv``` on host machine.
* Set ```DISPLAY``` environment variable to ```localhost:10.0```
```bash
export DISPLAY=localhost:10.0
```
* Test xserver forwarding working by using ```xclock```
```bash
xclock
```

## Configure Keyboard Shortcut.
Configure putty shortcut to be <!-- ctrl + alt + r --> <kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>r</kbd>

Configure windows terminal shortcut to be <!-- ctrl + alt + t --> <kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>t</kbd>

* open run <!-- window + r --> <kbd>window</kbd> + <kbd>r</kbd>
* run this ```shell:AppsFolder```
* create shortcut for windows terminal at ```C:\ProgramData\Microsoft\Windows\Start Menu\Programs```
* right click properties and add keyboard shortcut.

## Configure Putty
putty use register to store settings. Double click on ```./putty/putty.reg``` then accept importing the register.

configure shortcut for pagent to pass private key,   
just add path of the key in quote after the pagent url.

configure Xlaunch. then save the config to document folder. (xserver.xlaunch)

## Configure Vim
Clone dotfiles repo at https://github.com/farhanmustar/dotfiles.git.
Run vim and run ```:PlugInstall``` to install all plugins.
```
git clone https://github.com/farhanmustar/dotfiles.git
```

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
Add set ANDROID_HOME path to the sdk path.
Add set JAVA_HOME path to ```C:\Program Files\Android\Android Studio\jre```
Add ```C:\Program Files\Android\Android Studio\jre\bin``` to Path env variable.
Add sdk/tools, sdk/tools/bin and sdk/platform-tools to Path env variable.

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

Remove python alias.
windows did that to auto start windows store when use python keyword.why!!!
* Go to start menu and search ```manage app execution aliases```
* Disable alias for python and python 3.

## PHP Development
```powershell
choco install composer -y
```

## Arduino Development
```powershell
choco install arduino arduino-cli -y
```

## Use pageant for powershell openssh ssh-agent.
Install wsl-ssh-pageant to allow use of pageant as ssh auth. (required scoop package manager)
```
scoop install wsl-ssh-pageant
```
copy ssh-pageant.bat script and added to path.
copy script from ```./scripts/ssh-pageant.bat``` to ```/ProgramData/Chocolatey/bin```
set env variable SSH_AUTH_SOCK to ssh-pageant.
```
SSH_AUTH_SOCK=\\.\pipe\ssh-pageant
```
How to use.
* start Pageant.
* run ```ssh-pageant``` command from terminal.
* use ```ssh``` command as usual.


## Use pageant for git ssh auth
configure git to use ssh key from putty. (git use windows credential manager for http/s)
>note that thare is bug to add new server to known host in terminal. need to manually ssh using putty and accept in gui.

Set env variable GIT_SSH to plink.exe path. hint: use ```which plink``` to display its path.
```
GIT_SSH=C:\ProgramData\chocolatey\bin\PLINK.EXE
```

## Use pass pagent as ssh-agent to wsl from windows host.
Follow similar step to use pagent in powershell ssh-agent.
Then in wsl add environment variable in .bashrc
```bash
export SSH_AUTH_SOCK=/mnt/c/ssh-agent.sock
```


# Experimental (winget)
* Microsoft added winget which is a build in package manager preloaded with windows.
* Noticed this is more like semi auto as the permission popup still require user input.
```powershell
winget install wez.wezterm `
famatech.advancedipscanner `
microsoft.powertoys `
logitech.options `
7zip.7zip `
flameshot.flameshot `
notepad++ `
chocolatey `
libreoffice `
videolan.vlc `
inkscape.inkscape `
mozilla.firefox `
nickemanarin.screentogif `
dotpdnllc.paintdotnet `
AntibodySoftware.WizTree `
--disable-interactivity 
```


# Hyper-V for Windows Home
https://github.com/proviq/AccountManagement/releases
https://www.makeuseof.com/install-hyper-v-windows-11-home/
```bat
pushd "%~dp0"
dir /b %SystemRoot%\servicing\Packages\*Hyper-V*.mum >hyper-v.txt
for /f %%i in ('findstr /i . hyper-v.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del hyper-v.txt
Dism /online /enable-feature /featurename:Microsoft-Hyper-V -All /LimitAccess /ALL
pause
```
