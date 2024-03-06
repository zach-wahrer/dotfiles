#!/bin/sh

GO_BIN=/usr/lib/go/bin/go

## Packages / Tools
sudo pacman -Syyu # Update
### System Packages
sudo pacman -S cpio ncdu bpytop lsd bat git-delta hyprland hyprrpaper sad tk mako eaudio pulseaudio-alsa polkit-kde-agent \
	alsa-utils pamixer qt5-wayland qt6-wayland wtype wl-clipboard xorg-xwayland network-manager-applet brightnessctl \
	playerctl pavucontrol arc-gtk-theme ntp thunar thunar-volman gvfs reflector swaybg swayidle swayimg man ufw
### Terminal / Neovim Packages
sudo pacman -S alacritty neovim zsh fd ripgrep fzf lua-language-server bash-language-server yaml-language-server yamllint stylua go gopls tmux
### Dev tools Packages
sudo pacman -S git base-devel gcc deno docker docker-compose fx python-pip python-pipx pyright npm jq shfmt

## Yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ../ && rm -rf yay
### AUR System Packages
yay -S pipewire xdg-desktop-portal xdg-desktop-portal-wlr pipewire-media-session nwg-displays nwg-launchers \
	ttf-sharetech-mono-nerd ttf-sourcecodepro-nerd ttf-sudo swaync wlogout wmname grim slurp swappy usbutils wlr-randr
### AUR Dev Packages
yay -S dbgate-bin marksman-bin python-pynvim python-setuptools shellcheck-bin syncthing
### AUR Hyprland Plugins
yay -S hy3

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
