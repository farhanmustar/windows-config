Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-Alias ls Get-ChildItemColorFormatWide
Set-Alias -Force sl Get-ChildItemColorFormatWide
Set-Alias open Start-Process
function vimg { vim -c GV -c tabonly }
function grep { 
  process { $_ | grep.exe --color=auto @Args }
}
function ssh { ssh.exe -X -A @Args }
function ssh-basic { ssh.exe -X -A -L 8080:localhost:80 @Args }
