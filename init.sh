#!/bin/sh

GO_BIN=/usr/lib/go/bin/go

## Packages / Tools ##
sudo pacman -Syyu # Update
sudo pacman -S ncdu bpytop sad tk mako swaylock waybar wofi firefox pulseaudio pulseaudio-alsa alsa-utils pamixer wtype wl-clipboard xorg-xwayland network-manager-applet brightnessctl playerctl arc-gtk-theme # System
sudo pacman -S kitty neovim zsh fd ripgrep fzf shellcheck lua-language-server bash-language-server yaml-language-server yamllint stylua go gopls # Terminal / Neovim
sudo pacman -S git base-devel gcc docker docker-compose python-pip npm jq fx eslint prettier # Dev tools

git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ../ && rm -rf yay
yay -S nwg-displays nerd-fonts-complete sudo-font-git swaync wlogout  # System
yay -S checkmake dbgate-bin dotenv-linter hadolint vale # Dev tools

pip3 install beautysh gitlint pynvim setuptools # Dev tools
sudo npm install -g dockerfile-language-server-nodejs cspell markdownlint-cli2 # Dev tools

# Go tools
${GO_BIN} install github.com/kyoh86/richgo@latest
${GO_BIN} install github.com/cweill/gotests/gotests@latest
${GO_BIN} install github.com/nametake/golangci-lint-langserver@latest
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$(go env GOPATH)"/bin v1.50.1

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

pip3 install --user -r ~/dotfiles/dotdrop/requirements.txt
echo "Create new profile for machine if needed. [Enter to continue...]"
read -r _
~/dotfiles/dotdrop/dotdrop.sh install

## Setup ##
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'  # Bootstrap neovim until it doesn't error
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'  # Bootstrap neovim until it doesn't error
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'  # Bootstrap neovim until it doesn't error
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'  # Bootstrap neovim until it doesn't error

chsh -s "$(which zsh)" # Change default shell to zsh.
