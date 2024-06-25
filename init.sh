#!/bin/sh

GO_BIN=/usr/lib/go/bin/go

## Packages / Tools
sudo pacman -Syyu # Update

### System Packages
sudo pacman -S alsa-utils arc-gtk-theme bat bpytop brightnessctl cpio eaudio git-delta gvfs lsd hyprland hyprrpaper \
	mako man network-manager-applet ncdu ntp pavucontrol playerctl polkit-kde-agent pulseaudio-alsa \
	pamixer qt5-wayland qt6-wayland reflector sad swaybg swayidle swayimg tk thunar thunar-volman ufw \
	wtype wl-clipboard xorg-xwayland
#### KDE
sudo pacman -S kde-desktop kscreen xorg-xinit

### Terminal / Neovim Packages
sudo pacman -S alacritty bash-language-server fd fzf go gopls lua-language-server neovim ripgrep stylua tmux \
	yaml-language-server yamllint zsh

### Dev tools Packages
sudo pacman -S base-devel deno docker docker-compose fx gcc git hurl jq npm python-pip python-pipx pyright rustup rust-analyzer shfmt

## Yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ../ && rm -rf yay
### AUR System Packages
yay -S grim pipewire pipewire-media-session nwg-displays nwg-launchers slurp swappy swaync \
	ttf-sharetech-mono-nerd ttf-sourcecodepro-nerd ttf-sudo usbutils wlogout wmname wlr-randr \
	xdg-desktop-portal xdg-desktop-portal-wlr
### AUR Dev Packages
yay -S dbgate-bin marksman-bin python-pynvim python-setuptools shellcheck-bin syncthing
### Hyprland Plugins
hyprpm update -v
hyprpm add https://github.com/outfoxxed/hy3
hyprpm enable hy3

## NPM Dev Tools
sudo npm install -g dockerfile-language-server-nodejs

## Go Tools
${GO_BIN} install github.com/kyoh86/richgo@latest
${GO_BIN} install github.com/cweill/gotests/gotests@latest
${GO_BIN} install github.com/nametake/golangci-lint-langserver@latest
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$(go env GOPATH)"/bin v1.50.1

## Other Tools
### ArTTY
${GO_BIN} install --ldflags "-s -w" --trimpath github.com/mjwhitta/artty/cmd/arTTY@latest
### Ugit
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Bhupesh-V/ugit/master/install)" # Ugit

## Dotfiles
echo "Generate ssh key and add to github. [Enter to continue...]"
firefox https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent &
read -r _
cd ~ && git clone git@github.com:zach-wahrer/dotfiles.git
# pip3 install --user -r ~/dotfiles/dotdrop/requirements.txt
sudo pacman -S python-jinja python-magic python-requests python-tomli-w python-docopt python-ruamel-yaml
echo "Create new profile for machine if needed. [Enter to continue...]"
read -r _
~/dotfiles/dotdrop/dotdrop.sh install

## System
### Time
sudo systemctl enable --now ntpd
### Firewall
sudo systemctl enable --now ufw
sudo ufw enable && sudo ufw default deny
### Reflector (Pacman mirror updater)
sudo systemctl enable --now reflector.service
sudo systemctl enable --now reflector.timer
### Docker Setup
sudo systemctl enable docker && sudo systemctl daemon-reload
sudo usermod -aG docker "$USER"
# newgrp docker # Or reboot if still getting non-sudo docker permission errors
### Change default shell to zsh.
chsh -s "$(which zsh)"
### Pipewire / Desktop Portal
systemctl --user enable --now pipewire pipewire.socket pipewire-media-session.service xdg-desktop-portal-rewrite-launchers.service
# Debugging screen share issues
# https://github.com/emersion/xdg-desktop-portal-wlr/wiki/%22It-doesn't-work%22-Troubleshooting-Checklist

echo "Add 'MOZ_ENABLE_WAYLAND=1' to '/etc/environment'"
echo "DONE!"
