@echo off
start /MIN powershell -windowstyle hidden -command "wsl-ssh-pageant-gui.exe --systray --wsl c:\ssh-agent.sock --winssh ssh-pageant"
