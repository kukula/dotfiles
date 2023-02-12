#!/bin/zsh

# install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew some apps
brew bundle install

# Add links
mkdir -p ~/.zsh
ln -sf ~/dotfiles/zshrc ~/.zshrc

mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua

ln -sf ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/git/config ~/.gitconfig

#ASDF
asdf plugin add ruby
asdf plugin add nodejs
asdf plugin add python

asdf install ruby latest
asdf install nodejs latest
asdf install python latest
