#!/usr/bin/env bash

# install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install oh my Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# brew some apps
brew bundle install

# Add base16
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Add links
ln -sf ~/dotfiles/bash/profile.sh ~/.bash_profile
ln -sf ~/dotfiles/zshrc ~/.zshrc
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/nvim/lua ~/.config/nvim/lua
ln -sf ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/git/config ~/.gitconfig
ln -sf ~/dotfiles/gemrc ~/.gemrc


#ASDF
asdf plugin add ruby
asdf plugin add crystal
asdf plugin add nodejs
asdf plugin add python

asdf install ruby latest
asdf install crystal latest
asdf install nodejs latest
asdf install python latest

# Configurate bundler to install gems in parallel
# Can be changed in ~/.bundle/config
number_of_cores=`sysctl -n hw.ncpu`
bundle config --global jobs `expr $number_of_cores - 1`
