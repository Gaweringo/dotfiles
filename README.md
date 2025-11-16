# dotfiles
Dotfiles, managed with [dotter](https://github.com/SuperCuber/dotter).
## Setup on new machine
1. Install `dotter`
    - On Windows best installed with [scoop](https://scoop.sh): `scoop install dotter`
2. Install git
    - On Windows best installed with `scoop install git`
3. Clone this repo
    - Whereever you like. e.g.: `~/.dotfiles/`
4. Configure what should be configured on this machine with `.dotter/local.toml`
Example for Windows:
```toml
# include the contents of these files
includes = [".dotter/include/windows.toml"]

# which packages should be used on this machine
packages = ["default"]

# variables to be substituted in the other toml files
[variables]
email = "40121865+Gaweringo@users.noreply.github.com"
git_username = "Gaweringo"
sen_folder = 'P:\..\SEN1\UEZ\'
programming_folder = 'P:\..\Programming'
```
5. Deploy the config by running `dotter`
    - *Check with* `--dry-run` *before*

## Things to install that are in config:
### General
- [starship](https://starship.rs)
- [wezterm](https://wezfurlong.org/wezterm/index.html)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)
- [difftastic](https://github.com/Wilfred/difftastic)

### Windows
- [pwsh](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows)
    - `Install-Module -Name Terminal-Icons -Repository PSGallery` [Terminal-Icons](https://github.com/devblackops/Terminal-Icons) (optional)
    - `Install-Module DockerCompletion` (optional)
- [scoop](https://scoop.sh)
- [sfsu](https://github.com/jewlexx/sfsu) `scoop install sfsu`
- [gsudo](https://github.com/gerardog/gsudo) `scoop install gsudo`
- [posh-git](https://github.com/dahlbyk/posh-git) `scoop install posh-git`
- [psfzf](https://github.com/kelleyma49/PSFzf) `scoop install psfzf`

### Linux
There is a setup.sh script for setting up from a clean arch instll.

- [fish](https://fishshell.com/)
- [exa](https://the.exa.website/)
- [imv](https://sr.ht/~exec64/imv/)
- [nomacs](https://nomacs.org/)
- [mpv](https://mpv.io)
- [paru](https://github.com/Morganamilo/paru) (Arch AUR helper (rust using rustup))

#### Sway on Arch
For the [Sway](https://swaywm.org) config:
 - Install a Nerd-Font (`pacman -S ttf-jetbrains-mono-nerd ttf-iosevkaterm-nerd ttf-iosevka-nerd`)
    - Or/And install the symbols only font `ttf-nerd-fonts-symbols` (use normal/non-patched font and symbols font as fallback)
    - Also install `noto-fonts-emoji` to have emojis (starship uses them for example)
 - Install:
    - [dmenu](https://tools.suckless.org/dmenu/)
    - swayosd (for media keys and osd)
    - mako (for simple notifications)

### Things to install for nvim (to install LSPs)
- [go](https://go.dev/)
- [rust/rustup/cargo](https://rustup.rs/)
- [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
    - For `emmet_language_server`

## Other niceties to install
- [github-cli (gh)](https://github.com/cli/cli)
- [bat](https://github.com/sharkdp/bat)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
    - [ripgrep-all (rga)](https://github.com/phiresky/ripgrep-all)
    - [ripgrep_replace (rgr)](https://github.com/ElectricRCAircraftGuy/ripgrep_replace)
- [tealdeer](https://https://github.com/tealdeer-rs/tealdeer)
- [neovide](https://github.com/neovide/neovide)
- [just](https://github.com/casey/just)
- [typst](https://github.com/typst/typst)
- [xmake](https://xmake.io)

# Todo
For more todos see the readme in config/neovim

## Archlinux / sway
- [X] Global Clipboard and history
    - [X] Better picker for it (wofi?) -> rofi chosen
- [X] Swayidle
- [X] Swaylock for hibernation and sleep
- [X] Battery low warning
- [ ] Power profile switcher and display in swaybar (`powerprofilectl`)
- [ ] Bottles for running windows apps
- [ ] i3status or i3blocks for the statusbar (tray-icons?)
- [ ] dark theme for gtk apps (or in general)
- [X] [Ianny](https://github.com/zefr0x/ianny) for break reminders
- [ ] Virtualization (qemu) [ChrisTitus linutil](https://github.com/ChrisTitusTech/linutil/blob/main/core/tabs/system-setup/arch/virtualization.sh)
- [ ] Maybe try gammastep instead of wlsunset
- [ ] wayclip for `waycopy` and `waypaste` commands
- [X] nwg-displays for display management
    - [ ] generall nwg-shell things
- [ ] oculate image viewer
- [ ] maybe a different [launcher](https://github.com/cyclopsian/wdisplays)
    Also see sway wiki for things: [sway wiki](https://github.com/swaywm/sway/wiki/Useful-add-ons-for-sway)
- [X] zathura setup
- [ ] [Screen record](https://github.com/natpen/awesome-wayland?tab=readme-ov-file#screencasting) and and [screen shot](https://github.com/natpen/awesome-wayland?tab=readme-ov-file#screenshots)
    - [ ] satty setup for screenshot annotations
    - https://github.com/jtheoof/swappy
- [X] automatic background switcher [wpaperd](https://github.com/danyspin97/wpaperd)? (custom script and systemd-timer)
- [ ] Power profile switcher using roif and powerprofilectl
- [ ] Set `MOZ_ENABLE_WAYLAND=1` environment variable somehow, somewhere (look into `environment.d`)
- [ ] Floating for file pickers: https://github.com/basecamp/omarchy/blob/07d88a4b9aa1ecf38b869b2ab01dc416fc841a72/default/hypr/windows.conf#L15-L16
- [ ] Fingerprint and maybe Face https://github.com/basecamp/omarchy/blob/07d88a4b9aa1ecf38b869b2ab01dc416fc841a72/bin/omarchy-setup-fingerprint
- [ ] Add ability to disable auto idle (like: https://github.com/basecamp/omarchy/blob/07d88a4b9aa1ecf38b869b2ab01dc416fc841a72/bin/omarchy-toggle-idle)
    - Make config file for swayidle or run sript, so it can be killed and restarted with the same setup
- [ ] Add ability to disable `wlsunset` (kill and relauch script)
- [ ] look into uwsm
-  [ ] Waydroid for running android apps
