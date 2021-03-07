Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-Alias ls Get-ChildItemColorFormatWide
Set-Alias -Force sl Get-ChildItemColorFormatWide
function vimg { vim -c GV -c tabonly }
function grep { grep.exe --color=auto $args }
function ssh { ssh.exe -X -A $args }
function ssh-basic { ssh.exe -X -A -L 8000:localhost:80 $args }
