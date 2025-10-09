#!/bin/bash
# Based on omarchy

# Exit if something fails
set -e

# Color for pacman
grep -q '^Color' /etc/pacman.conf || sudo sed -i '/^\[options\]/a Color' /etc/pacman.conf

# base
sudo pacman -S --noconfirm --needed \
    base-devel \
    rustup \
    git \
    unzip

# paru install if not already installed
if ! command -v paru; then
    rustup default stable
    git clone https://aur.archlinux.org/paru.git
    pushd paru
    makepkg -si
    popd
    rm -rf paru
fi

# Fonts
sudo pacman -S --noconfirm --needed ttf-font-awesome noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra
sudo pacman -S --noconfirm --needed \
    ttf-iosevkaterm-nerd \
    ttf-jetbrains-mono \
    ttf-jetbrains-mono-nerd \
    otf-monaspace \
    otf-monaspace-nerd

# Development / terminal things
sudo pacman -S --noconfirm --needed \
    github-cli\
    wezterm ghostty alacritty \
    neovim \
    neovide \
    tree-sitter-cli \
    zellij \
    zoxide \
    yazi \
    uv \
    tealdeer \
    typst \
    clang \
    starship \
    eza \
    fd \
    fish \
    fzf \
    bat \
    ripgrep \
    ripgrep-all \
    rustup \
    difftastic \
    lazygit \
    just \
    jq \
    cmake \
    man-db man-pages \
    imagemagick \
    zeal \
    gdb \
    valgrind \
    strace \
    openocd \
    arm-none-eabi-gdb arm-none-eabi-gcc \
    xmake

# Desktop utilities
sudo pacman -S --noconfirm --needed \
    brightnessctl \
    playerctl \
    wiremix \
    wireplumber \
    satty \
    wlsunset \
    wl-clip-persist cliphist \
    hyprpickr \
    slurp

paru -S --noconfirm --needed wl-screenrec

# general desktop apps
sudo pacman -S --noconfirm --needed \
    firefox \
    thunderbird \
    chromium \
    mpv \
    imv \
    7zip \
    obsidian \
    syncthing \
    zathura zathura-pdf-mupdf \
    speedcrunch \
    libreoffice \
    nautilus \
    obs-studio

# TODO: Look into localsend (firewall things)
# And autostart localsend

paru -S --noconfirm --needed \
    nomacs \
    localsend-bin \
    pinta \
    spotify

# Sway stuff
sudo pacman -S --noconfirm --needed \
    mako \
    sway \
    swaybg \
    swayidle \
    swaylock \
    swayosd \
    rofi rofi-calc \
    autotiling-rs \
    ianny \
    xdg-desktop-portal xdg-desktop-portal-wlr \
    nwg-displays \
    i3status-rust \
    dmenu

# wifi / network
sudo pacman -S --noconfirm --needed iwd impala
sudo systemctl enable --now iwd.service

# Bluetooth
sudo pacman -S --noconfirm bluetui blueberry bluez
sudo systemctl enable --now bluetooth.service

# Printer
sudo pacman -S --noconfirm cups cups-pdf cups-filters system-config-printer
sudo systemctl enable --now cups.service

# Fingerprint
sudo pacman -S --noconfirm --needed fprintd usbutils

# TODO: Figure out how to have for example devdocs.io as a web app (look into web2app or something from omarchy)


# Mime type setup
xdg-mime default imv.desktop image/png
xdg-mime default imv.desktop image/jpeg
xdg-mime default imv.desktop image/gif
xdg-mime default imv.desktop image/webp
xdg-mime default imv.desktop image/bmp
xdg-mime default imv.desktop image/tiff

xdg-mime default org.pwmt.zathura.desktop application/pdf

# Text editor
xdg-mime default nvim.desktop text/plain

# Browser
xdg-settings set default-web-browser firefox.desktop
xdg-mime default firefox.desktop x-scheme-handler/http
xdg-mime default firefox.desktop x-scheme-handler/https

xdg-mime default mpv.desktop video/mp4
xdg-mime default mpv.desktop video/x-msvideo
xdg-mime default mpv.desktop video/x-matroska
xdg-mime default mpv.desktop video/x-flv
xdg-mime default mpv.desktop video/x-ms-wmv
xdg-mime default mpv.desktop video/mpeg
xdg-mime default mpv.desktop video/ogg
xdg-mime default mpv.desktop video/webm
xdg-mime default mpv.desktop video/quicktime
xdg-mime default mpv.desktop video/3gpp
xdg-mime default mpv.desktop video/3gpp2
xdg-mime default mpv.desktop video/x-ms-asf
xdg-mime default mpv.desktop video/x-ogm+ogg
xdg-mime default mpv.desktop video/x-theora+ogg
xdg-mime default mpv.desktop application/ogg

# TODO: Low battery notification https://github.com/basecamp/omarchy/blob/master/migrations/1752168292.sh

# load dotfiles
if [ ! -d ~/.dotfiles ]; then
git clone https://github.com/gaweringo/dotfiles ~/.dotfiles
fi
pushd ~/.dotfiles
# TODO: Check if local.toml already exits and ask before overriding

echo "# which packages should be used on this machine
packages = [\"git\", \"wezterm\", \"sway\", \"fish\", \"starship\", \"lazygit\", \"ghostty\"]

# variables to be substituted in the other toml files
[variables]
email = \"40121865+Gaweringo@users.noreply.github.com\"
git_username = \"Gaweringo\"
" > ./.dotter/local.toml
./dotter -f
popd

# Systemd config
systemctl --user daemon-reload
# || true, to make it not fail, since systemd says something about sleep.target being a non-template unit
# For locking on suspend
systemctl --user enable --now user-suspend@.service || true
# For battery low notification
systemctl --user enable --now battery-monitor.timer || true
# For daily background change
systemctl --user enable --now bg-changer.timer

