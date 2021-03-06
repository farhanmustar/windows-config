@echo off
:: Check for user permission using net session cmd
net session >nul 2>&1
if %errorLevel% == 0 (
  echo The system is going down for power off NOW!
  shutdown /d P:0:0 /s /hybrid
) else (
  echo poweroff: Need to be admin
)
