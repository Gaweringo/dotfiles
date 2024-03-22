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
```
5. Deploy the config by running `dotter`
    - *Check with* `--dry-run` *before*
