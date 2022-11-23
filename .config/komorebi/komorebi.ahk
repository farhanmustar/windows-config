#SingleInstance Force

; You can generate a fresh version of this file with "komorebic ahk-library"
#Include %A_ScriptDir%\komorebic.lib.ahk
; https://github.com/LGUG2Z/komorebi/#generating-common-application-specific-configurations
#Include %A_ScriptDir%\komorebi.generated.ahk

; Default to minimizing windows when switching workspaces
WindowHidingBehaviour("minimize")

; Set cross-monitor move behaviour to insert instead of swap
CrossMonitorMoveBehaviour("insert")

; Enable hot reloading of changes to this file
WatchConfiguration("enable")

; Ensure there is 1 workspace created on monitor 0
EnsureWorkspaces(0, 1)

; Configure the invisible border dimensions
InvisibleBorders(7, 0, 14, 7)

; Configure the 1st workspace
WorkspaceName(0, 0, "I")

; Uncomment the next two lines if you want a visual border drawn around the focused window
ActiveWindowBorderColour(66, 165, 245, "single") ; this is a nice blue colour
ActiveWindowBorder("enable")

; Allow komorebi to start managing windows
CompleteConfiguration()

; Change the focused window, Win + Vim direction keys (HJKL)
#h::
Focus("left")
return

#j::
Focus("down")
return

#k::
Focus("up")
return

#l::
Focus("right")
return

; Move the focused window in a given direction, Win + Shift + Vim direction keys (HJKL)
#+h::
Move("left")
return

#+j::
Move("down")
return

#+k::
Move("up")
return

#+l::
Move("right")
return

; close program
#q::
PostMessage, 0x112, 0xF060,,, A
return

; stop komorebi
^!q::
Stop()
ExitApp
return

; Program shortcut
#t::
RunWait, powershell.exe -c wezterm.exe, , Hide
return

#b::
RunWait, msedge.exe, , Hide
return

#f::
RunWait, explorer.exe, , Hide
return
