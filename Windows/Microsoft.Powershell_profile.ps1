# history setup
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
# set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

# Icons for folders and files (in ls)
Import-Module -Name Terminal-Icons

# sudo
Import-Module 'gsudoModule'

# super fast scoop utils
. "$PSScriptRoot\Completions\sfsu.ps1"

{{#if (is_executable 'choco')}}
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
{{/if}}

Import-Module posh-git

# ALIAS
# neovim alias
Set-Alias -Name n -Value nvim
# neogit alias
Function neg {
  nvim . -c Neogit
}
# lazygit alias
Set-Alias -Name lg -Value lazygit
# graphicmagick alias as the gm conflicts with Get-Member
Set-Alias -Name gmagick -Value gm.exe

# Better cds
# cd to first subfolder with this name
Function cdf ($search_term) {
  cd $(fd $search_term -1 -t directory -H -I)
}
# cd to first subfolder with this name interactively
Function cdi {
  cd $(fzf --walker dir)
}

{{#if (is_executable 'yazi')}}
# yazi needs file to function / show images
$env:YAZI_FILE_ONE = "C:\Users\Martin\scoop\apps\git\current\usr\bin\file.exe"
# yazi cd
function yy {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}
{{/if}}

# yt-dlp mp3 download alias
Function yt-mp3 {yt-dlp -f 'ba' -x --audio-format mp3 $args}

{{#if sen_folder}}
Function sen {fd . '{{sen_folder}}' -t d -d 1 | fzf | cd}
{{/if}}

{{#if programming_folder}}
Function programming {$prog_dir = fd . '{{programming_folder}}' -t d -d 1 | fzf;
                          fd . -t d -d 1 $prog_dir | fzf | cd;}
{{/if}}

Function devpwsh {
  Import-Module "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\Microsoft.VisualStudio.DevShell.dll";
  $env:Path += "C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin;";
}

## COMPLETIONS ##
# dotter completions
. "$PSScriptRoot\Completions\dotter.ps1"

{{#if (command_success "pwsh -c Import-Module DockerCompletion")}}
# Docker completion
Import-Module DockerCompletion
{{/if}}

{{#if (is_executable "caddy")}}
# caddy completion
. "$PSScriptRoot\Completions\caddy.ps1"
{{/if}}

# fzf completions
if (Get-Module -ListAvailable -Name PSFzf) {
  Import-Module PSFzf

# Override PSReadLine's history search
  Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' `
                  -PSReadlineChordReverseHistory 'Ctrl+r'
} 
else {
    Write-Host "PSFzf not installed: Install-Module -Name PSFzf"
}

# Starship prompt
function Invoke-Starship-PreCommand {
  $loc = $executionContext.SessionState.Path.CurrentLocation;
  $prompt = "$([char]27)]9;12$([char]7)"
  if ($loc.Provider.Name -eq "FileSystem")
  {
    $provider_path = $loc.ProviderPath -replace "\\", "/"
    # for wezterm
    $prompt += "$([char]27)]7;file://${env:COMPUTERNAME}/${provider_path}$([char]27)\"
    # for windows terminal
    $prompt += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
  }
  $host.ui.Write($prompt)
}

. "$PSScriptRoot\Completions\starship.ps1"

{{#if (is_executable "watchexec")}}
. "$PSScriptRoot\Completions\watchexec.ps1"
{{/if}}

{{#if (is_executable "Rcmd")}}
rm alias:\r
{{/if}}

$env:EDITOR = "nvim"

# Needs to be at the bottom
# To initialize zoxide, add this to your configuration (find it by running
# `echo $profile` in PowerShell):
#
Invoke-Expression (& { $hook = if ($PSVersionTable.PSVersion.Major -ge 6) { 'pwd' } else { 'prompt' } (zoxide init powershell --hook $hook | Out-String) })
