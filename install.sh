#!/bin/zsh

# install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew some apps
brew bundle install

# Add links
mkdir -p ~/.zsh
mkdir -p ~/.config/kitty

ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/git/config ~/.gitconfig
ln -sf ~/dotfiles/tool-versions ~/.tool-versions

#ASDF
cut -d' ' -f1 .tool-versions|xargs -I{} asdf plugin add {}
asdf install
