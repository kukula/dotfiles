#!/usr/bin/env bash

# Add links
ln -sf ~/dotfiles/bash/profile.sh ~/.bash_profile
ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/dotfiles/tmux.conf.sh ~/.tmux.conf
ln -sf ~/dotfiles/git/config ~/.gitconfig
ln -sf ~/dotfiles/gemrc ~/.gemrc

# Configurate bundler to install gems in parallel
# Can be changed in ~/.bundle/config
number_of_cores=`sysctl -n hw.ncpu`
bundle config --global jobs `expr $number_of_cores - 1`
