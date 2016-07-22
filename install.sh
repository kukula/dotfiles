#!/usr/bin/env bash

# install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew some apps
brew bundle Brewfile

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Add links
ln -sf ~/dotfiles/bash/profile.sh ~/.bash_profile
ln -sf ~/dotfiles/vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/git/config ~/.gitconfig
ln -sf ~/dotfiles/gemrc ~/.gemrc

# Configurate bundler to install gems in parallel
# Can be changed in ~/.bundle/config
number_of_cores=`sysctl -n hw.ncpu`
bundle config --global jobs `expr $number_of_cores - 1`
