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


# ALIAS
# lazygit alias
Set-Alias -Name lg -Value lazygit
# graphicmagick alias as the gm conflicts with Get-Member
Set-Alias -Name gmagick -Value gm.exe

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

# Starship prompt
. "$PSScriptRoot\Completions\starship.ps1"

{{#if (is_executable "watchexec")}}
. "$PSScriptRoot\Completions\watchexec.ps1"
{{/if}}

{{#if (is_executable "Rcmd")}}
rm alias:\r
{{/if}}

# Needs to be at the bottom
# To initialize zoxide, add this to your configuration (find it by running
# `echo $profile` in PowerShell):
#
Invoke-Expression (& { $hook = if ($PSVersionTable.PSVersion.Major -ge 6) { 'pwd' } else { 'prompt' } (zoxide init powershell --hook $hook | Out-String) })
