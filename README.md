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
