#!/bin/sh

## Packages / Tools
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

### UI Packages
brew install --cask nikitabobko/tap/aerospace
brew tap FelixKratz/formulae
brew install borders
brew install --cask dbgate
brew install --cask ghostty
brew install font-mononoki-nerd-font
brew install stats
brew install --cask whichspace

### Tools
brew install bob delta dotdrop fzf hurl jq just lsd nvim ripgrep ms-jpq/sad/sad syncthing tmux ugit

### Languages
brew install go rust

### Dev
brew install bash-language-server codespell deno fd fx gopls luacheck lua-language-server mypy npm prettier pyright ruff richgo shellcheck shfmt stylua yaml-language-server yamllint

npm install -g elm-test elm-format @elm-tooling/elm-language-server

echo ""
echo ""
echo 'Manually install: https://github.com/sbmpost/AutoRaise -- https://docs.docker.com/desktop/setup/install/mac-install -- https://guide.elm-lang.org/install/elm.html'
echo 'DONE!'
