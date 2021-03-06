Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-Alias ls Get-ChildItemColorFormatWide
Set-Alias -Force sl Get-ChildItemColorFormatWide
function vimg { vim -c GV -c tabonly }
