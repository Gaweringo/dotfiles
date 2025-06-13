# history setup
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
# set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

# FIXME: Long load times
# Icons for folders and files (in ls)
# Import-Module -Name Terminal-Icons

# sudo
Import-Module 'gsudoModule'

# super fast scoop utils
. "$PSScriptRoot\Completions\sfsu.ps1"

{{#if (is_executable 'choco')}}
# Chocolatey profile
# $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
# if (Test-Path($ChocolateyProfile)) {
#   Import-Module "$ChocolateyProfile"
# }
{{/if}}

# FIXME: Long load time
# Import-Module posh-git

# ALIAS
# neovim alias
Set-Alias -Name n -Value nvim
# neogit alias
Function neg {
  nvim . -c Neogit
}
# diffview alias
Function dv {
  nvim . -c DiffviewOpen
}
# lazygit alias
Set-Alias -Name lg -Value lazygit
# graphicmagick alias as the gm conflicts with Get-Member
Set-Alias -Name gmagick -Value gm.exe
{{#if (is_executable 'eza')}}
# eza alias
Set-Alias -Name x -Value eza
Function lx {
  eza -lah
}
{{/if}}

# Better cds
# cd to first subfolder with this name
Function cdf ($search_term) {
  $target_dir = fd $search_term -1 -t directory -H -I
  if (-not [String]::IsNullOrEmpty($target_dir)) {
    cd $target_dir
  } else {
    echo "Could not find directory with name: $search_term"
  }
}
# cd to first subfolder with this name interactively
Function cdi {
  $target_dir = fzf --walker dir
  if (-not [String]::IsNullOrEmpty($target_dir)) {
    cd $target_dir
  }
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
Set-Alias -Name y -Value yazi
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

# run "winget install vswhere" once as a prerequisite
# https://gist.github.com/nefarius/b60a498b0229b5cf0e338b7a39460b80
function Setup-VS {
  param(
    [Parameter(Mandatory = $false)][string]$Platform
  )
  if (!($Platform)) {
    $Platform = 'x86_amd64'
  }
  $installationPath = vswhere.exe -prerelease -latest -property installationPath
  if ($installationPath -and (test-path "$installationPath\VC\Auxiliary\Build\vcvarsall.bat")) {
    & "${env:COMSPEC}" /s /c "`"$installationPath\VC\Auxiliary\Build\vcvarsall.bat`" $Platform && set > %temp%\vcvars.txt" 
    Get-Content "$env:temp\vcvars.txt" | foreach-object {
      $name, $value = $_ -split '=', 2
      set-content env:\"$name" $value
    }
  }
}


## COMPLETIONS ##
# dotter completions
# . "$PSScriptRoot\Completions\dotter.ps1"

{{#if (command_success "pwsh -c Import-Module DockerCompletion")}}
# Docker completion
# Import-Module DockerCompletion
{{/if}}

{{#if (is_executable "caddy")}}
# caddy completion
# . "$PSScriptRoot\Completions\caddy.ps1"
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
# . "$PSScriptRoot\Completions\watchexec.ps1"
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
