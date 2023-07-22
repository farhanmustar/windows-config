#SingleInstance Force

; You can generate a fresh version of this file with "komorebic ahk-library"
#Include %A_ScriptDir%\komorebic.lib.ahk
; https://github.com/LGUG2Z/komorebi/#generating-common-application-specific-configurations
#Include %A_ScriptDir%\komorebi.generated.ahk

; Default to minimizing windows when switching workspaces
WindowHidingBehaviour("minimize")

; Set cross-monitor move behaviour to insert instead of swap
CrossMonitorMoveBehaviour("insert")

; Ensure there is 2 workspace created
EnsureWorkspaces(0, 2)
EnsureWorkspaces(1, 2)

; Configure the invisible border dimensions
InvisibleBorders(7, 0, 14, 7)

; Configure workspaces
WorkspaceName(0, 0, "I")
WorkspaceName(0, 1, "O")

; Uncomment the next two lines if you want a visual border drawn around the focused window
ActiveWindowBorderColour(66, 165, 245, "single") ; this is a nice blue colour
ActiveWindowBorder("enable")

; Remove padding
ContainerPadding(0, 0, 3)
WorkspacePadding(0, 0, 3)

ContainerPadding(1, 0, 3)
WorkspacePadding(1, 0, 3)

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

;Move the focused window in a given direction, Win + Shift + Vim direction keys (HJKL)
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

; cycle workspaces
~^#k::
CycleWorkspace("next")
return

~^#j::
CycleWorkspace("previous")
return

; resize shortcut
#Right::
ResizeAxis("horizontal", "increase")
return

#Left::
ResizeAxis("horizontal", "decrease")
return

#Up::
ResizeAxis("vertical", "increase")
return

#Down::
ResizeAxis("vertical", "decrease")
return

#m::
ToggleMonocle()
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

; disable start while running
^!s::
return

; reload configurations
^!r::
ReloadConfiguration()
return

; Program shortcut
#t::
RunWait, wezterm.exe, , Hide
return

#b::
RunWait, msedge.exe, , Hide
return

#f::
RunWait, explorer.exe, , Hide
return
