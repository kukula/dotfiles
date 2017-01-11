#!/usr/bin/env bash

# install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew some apps
brew bundle install

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

# RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby
gem install bundler

# Configurate bundler to install gems in parallel
# Can be changed in ~/.bundle/config
number_of_cores=`sysctl -n hw.ncpu`
bundle config --global jobs `expr $number_of_cores - 1`
