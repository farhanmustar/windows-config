Set-PSReadlineOption -EditMode Emacs
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-Alias ls Get-ChildItemColorFormatWide
function ll { Get-ChildItem -Attributes Hidden, !Hidden @Args }
Set-Alias -Force sl Get-ChildItemColorFormatWide
Set-Alias open Start-Process
function vimod { Set-PSReadlineOption -EditMode Vi; Set-PSReadlineKeyHandler -Key Tab -Function Complete }
function novimod { Set-PSReadlineOption -EditMode Emacs; Set-PSReadlineKeyHandler -Key Tab -Function Complete }
function vimg { vim -c GV -c "silent! G" -c "silent! tabonly" }
function grep { 
  process { $_ | grep.exe --color=auto @Args }
}
function ssh { ssh.exe -X -A @Args }
function ssh-basic { ssh.exe -X -A -L 8080:localhost:80 @Args }
del alias:history
function history { Get-Content (Get-PSReadlineOption).HistorySavePath }

# Wezterm shell-integration (allow new pane with current dir)
function prompt {
    $p = $executionContext.SessionState.Path.CurrentLocation
    $osc7 = ""
    if ($p.Provider.Name -eq "FileSystem") {
        $ansi_escape = [char]27
        $provider_path = $p.ProviderPath -Replace "\\", "/"
        $osc7 = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}${ansi_escape}\"
    }
    "${osc7}PS $p$('>' * ($nestedPromptLevel + 1)) ";
}
