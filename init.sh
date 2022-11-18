#!/bin/sh

## Packages / Tools ##
sudo pacman -Syy git kitty neovim zsh fd ripgrep fzf shellcheck lua-language-server bash-language-server yaml-language-server yamllint stylua go gopls docker docker-compose python-pip ncdu bpytop tk
yay -install dbgate-bin nerd-fonts-complete wdisplay vale
pip3 install pynvim
/usr/lib/go/bin/go install github.com/kyoh86/richgo@latest
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$(go env GOPATH)"/bin v1.50.1
sudo npm install -g dockerfile-language-server-nodejs

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




