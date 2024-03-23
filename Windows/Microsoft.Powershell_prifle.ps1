Import-Module posh-git

oh-my-posh init pwsh --config C:\Users\gawer\OneDrive\PS\slimmartin.omp.json | Invoke-Expression

Import-Module -Name Terminal-Icons
Import-Module 'C:\Users\gawer\scoop\apps\gsudo\current\gsudoModule.psd1'
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

# super fast scoop utils
Invoke-Expression (&sfsu hook --disable list)

# For zoxide v0.8.0+
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})

# For graphicsmagick
Remove-Alias gm -Force

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

#
# To initialize zoxide, add this to your configuration (find it by running
# `echo $profile` in PowerShell):
#
Invoke-Expression (& { $hook = if ($PSVersionTable.PSVersion.Major -ge 6) { 'pwd' } else { 'prompt' } (zoxide init powershell --hook $hook | Out-String) })

# Starship prompt
Invoke-Expression (& 'C:\Users\gawer\scoop\shims\starship.exe' init powershell --print-full-init | Out-String)

Set-Alias -Name lg -Value lazygit

# yt-dlp mp3 download alias
Function yt-mp3_f {yt-dlp -f 'ba' -x --audio-format mp3 $args}
Set-Alias -Name yt-mp3 -Value yt-mp3_f

Function sen_f {fd . 'P:\Martin\Studium\OneDrive - FH OOe\Studium\SEN1\UEZ\' -t d -d 1 | fzf | cd}
Set-Alias -Name sen -Value sen_f

Function programming_f {$prog_dir = fd . 'P:\Martin\Programming\' -t d -d 1 | fzf;
                          fd . -t d -d 1 $prog_dir | fzf | cd;}
Set-Alias -Name p -Value programming_f

# gitignore
Function gig {
  param(
    [Parameter(Mandatory=$true)]
    [string[]]$list
  )
  $params = ($list | ForEach-Object { [uri]::EscapeDataString($_) }) -join ","
  Invoke-WebRequest -Uri "https://www.toptal.com/developers/gitignore/api/$params" | select -ExpandProperty content | Out-File -FilePath $(Join-Path -path $pwd -ChildPath ".gitignore") -Encoding ascii
}

# dotter completions
Invoke-Expression (& dotter gen-completions --shell powershell | Out-String)