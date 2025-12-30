# history setup
try {
# Does not work when using as neovim shell
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
} catch {}
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

$env:EDITOR = "nvim"

##### ALIASes ##################################################################
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
Function xl($arg) {
  eza -lah $arg
}
Function xt($arg) {
  eza -lah --tree $arg
}
Function xtl($arg) {
  eza -lah --tree --level $arg
}
Set-Alias -Name lx -Value xl
Set-Alias -Name tx -Value xt
{{/if}}

{{#if (is_executable 'svn')}}
# neovim alias
Set-Alias -Name snv -Value svn
{{/if}}

##### Better cds ###############################################################
Function .. { cd .. }

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
Function cdi ($search_term) {
  $target_dir = fzf --walker dir,hidden --query="$search_term" --select-1
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

# Copy current directory
Function pwdc { (pwd).path | clip }

##### Usefull commands #########################################################

# yt-dlp mp3 download alias
Function yt-mp3 {yt-dlp -f 'ba' -x --audio-format mp3 $args}

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

# Get new changes made to path env-variable
function RefreshPath {
  # Source - https://stackoverflow.com/a/31845512
  # Posted by mpen, modified by community. See post 'Timeline' for change history
  # Retrieved 2025-12-30, License - CC BY-SA 3.0
  $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

# Update a environment variable from the system.
# Meaning that environment variables changed while this shell was active can be read in and made available.
function RefreshVar($varname) {
  if ($varname -ieq "path") {
    Write-Host "Refreshing `$env:PATH"
    RefreshPath
    return
  }

  $variable = [System.Environment]::GetEnvironmentVariable("$varname","User")
  if ($variable -eq $null) {
    $variable = [System.Environment]::GetEnvironmentVariable("$varname","Machine")
  }
  if ($variable -eq $null) {
    Write-Host "No EnvironmentVariable with name '${varname}' found"
  } else {
    $oldvalue = Get-Item -Path Env:"$varname" -ErrorAction Ignore
    if ($oldvalue -ne $null) {
      Write-Host "Overriding `$env:`"${varname}`" which was '$($oldvalue.Value)'"
    }
    New-Item -Path Env: -Name $varname -Value $variable -Force
  }
}

##### COMPLETIONS ##############################################################
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

{{#if (is_executable "jj")}}
# jj
. "$PSScriptRoot\Completions\jj.ps1"
{{/if}}

{{#if (is_executable "watchexec")}}
# . "$PSScriptRoot\Completions\watchexec.ps1"
{{/if}}

# fzf completions
if (Get-Module -ListAvailable -Name PSFzf) {
  Import-Module PSFzf

  # Override PSReadLine's history search
  Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' `
                  -PSReadlineChordReverseHistory 'Ctrl+r'
}
else {
    Write-Host "PSFzf not installed. Please run: Install-Module -Name PSFzf"
}

##### Starship prompt ##########################################################
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


{{#if (is_executable "Rcmd")}}
if (Test-Path alias:r) {
  Remove-Alias -Name r
}
{{/if}}


##### Zoxide integration #######################################################
# Needs to be at the bottom
# To initialize zoxide, add this to your configuration (find it by running # `echo $profile` in PowerShell):
Invoke-Expression (& { $hook = if ($PSVersionTable.PSVersion.Major -ge 6) { 'pwd' } else { 'prompt' } (zoxide init powershell --hook $hook | Out-String) })
