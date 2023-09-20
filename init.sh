#!/bin/sh

GO_BIN=/usr/lib/go/bin/go

## Packages / Tools ##
sudo pacman -Syyu # Update
sudo pacman -S ncdu bpytop lsd bat git-delta sad tk mako swaylock waybar wofi firefox pulseaudio pulseaudio-alsa alsa-utils pamixer wtype wl-clipboard xorg-xwayland network-manager-applet brightnessctl playerctl pavucontrol arc-gtk-theme ntp thunar thunar-volman gvfs swaybg man && \
    sudo systemctl enable ntpd && sudo systemctl start ntpd	# System
sudo pacman -S kitty neovim zsh fd ripgrep fzf shellcheck lua-language-server bash-language-server yaml-language-server yamllint stylua go gopls # Terminal / Neovim
sudo pacman -S git base-devel gcc docker docker-compose python-pip pyright npm jq fx eslint prettier # Dev tools

git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ../ && rm -rf yay
yay -S pipewire xdg-desktop-portal xdg-desktop-portal-wlr pipewire-media-session nwg-displays nwg-launchers ttf-sourcecodepro-nerd ttf-sudo swaync wlogout wmname grim slurp swappy usbutils  # System
yay -S checkmake beautysh dbgate-bin dotenv-linter gitlint hadolint python-pynvim python-setuptools syncthing vale # Dev tools

sudo npm install -g dockerfile-language-server-nodejs cspell markdownlint-cli2 # Dev tools

systemctl --user enable --now pipewire pipewire.socket pipewire-media-session.service xdg-desktop-portal-rewrite-launchers.service

# Debugging screen share issues
# https://github.com/emersion/xdg-desktop-portal-wlr/wiki/%22It-doesn't-work%22-Troubleshooting-Checklist

# Go tools
${GO_BIN} install github.com/kyoh86/richgo@latest
${GO_BIN} install github.com/cweill/gotests/gotests@latest
${GO_BIN} install github.com/nametake/golangci-lint-langserver@latest
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$(go env GOPATH)"/bin v1.50.1

${GO_BIN} install --ldflags "-s -w" --trimpath github.com/mjwhitta/artty/cmd/arTTY@latest

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Bhupesh-V/ugit/master/install)" # Ugit

## Docker Setup ##
sudo systemctl enable docker && sudo systemctl daemon-reload
sudo usermod -aG docker "$USER"
# newgrp docker # Or reboot if still getting non-sudo docker permission errors

## Dotfiles ##
echo "Generate ssh key and add to github. [Enter to continue...]"
firefox https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent &
read -r _

cd ~ && git clone git@github.com:zach-wahrer/dotfiles.git

## pip3 install --user -r ~/dotfiles/dotdrop/requirements.txt
sudo pacman -S python-jinja python-magic python-requests python-tomli-w python-docopt python-ruamel-yaml
echo "Create new profile for machine if needed. [Enter to continue...]"
read -r _
~/dotfiles/dotdrop/dotdrop.sh install

chsh -s "$(which zsh)" # Change default shell to zsh.

echo "Add 'MOZ_ENABLE_WAYLAND=1' to '/etc/environment'"

echo "DONE!"
