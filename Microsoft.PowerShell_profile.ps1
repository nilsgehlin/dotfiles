oh-my-posh init pwsh --config ~/nige.omp.json | Invoke-Expression

# Better tab completion
Set-PSReadlineKeyHandler -Key Tab -Function Complete

Set-Alias -Name vim -Value nvim
Set-Alias -Name touch -Value New-Item