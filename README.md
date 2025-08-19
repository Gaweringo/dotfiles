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


### Things to install for nvim (to install LSPs)
- [go](https://go.dev/)
- [rust/rustup/cargo](https://rustup.rs/)
- [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
    - For `emmet_language_server`

## Other niceties to install
- [github-cli (gh)](https://github.com/cli/cli)
- [bat](https://github.com/sharkdp/bat)

# Todo
For more todos see the readme in config/neovim

## Archlinux / sway
- [X] Global Clipboard and history
    - [ ] Better picker for it (wofi?)
- [X] Swayidle
- [X] Swaylock for hibernation and sleep
- [X] Battery low warning
- [ ] Power profile switcher and display in swaybar (`powerprofilectl`)
- [ ] i3status or i3blocks for the statusbar (tray-icons?)
- [ ] dark theme for gtk apps (or in general)
- [X] [Ianny](https://github.com/zefr0x/ianny) for break reminders
- [ ] Maybe try gammastep instead of wlsunset
- [ ] wayclip for `waycopy` and `waypaste` commands
- [X] nwg-displays for display management
    - [ ] generall nwg-shell things
- [ ] oculate image viewer
- [ ] maybe a different [launcher](https://github.com/cyclopsian/wdisplays)
    Also see sway wiki for things: [sway wiki](https://github.com/swaywm/sway/wiki/Useful-add-ons-for-sway)
- [ ] zathura setup
- [ ] [Screen record](https://github.com/natpen/awesome-wayland?tab=readme-ov-file#screencasting) and and [screen shot](https://github.com/natpen/awesome-wayland?tab=readme-ov-file#screenshots)
    - [ ] satty setup for screenshot annotations
    - https://github.com/jtheoof/swappy
- [X] automatic background switcher [wpaperd](https://github.com/danyspin97/wpaperd)? (custom script and systemd-timer)
- [ ] Set `MOZ_ENABLE_WAYLAND=1` environment variable somehow, somewhere (look into `environment.d`)
- [ ] Floating for file pickers: https://github.com/basecamp/omarchy/blob/07d88a4b9aa1ecf38b869b2ab01dc416fc841a72/default/hypr/windows.conf#L15-L16
- [ ] Fingerprint and maybe Face https://github.com/basecamp/omarchy/blob/07d88a4b9aa1ecf38b869b2ab01dc416fc841a72/bin/omarchy-setup-fingerprint
- [ ] Add ability to disable auto idle (like: https://github.com/basecamp/omarchy/blob/07d88a4b9aa1ecf38b869b2ab01dc416fc841a72/bin/omarchy-toggle-idle)
    - Make config file for swayidle or run sript, so it can be killed and restarted with the same setup
- [ ] Add ability to disable `wlsunset`
- [ ] look into uwsm
