#!/usr/bin/env bash

# install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew some apps
brew bundle install

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Add base16
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell


# Add links
ln -sf ~/dotfiles/bash/profile.sh ~/.bash_profile
ln -sf ~/dotfiles/vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/git/config ~/.gitconfig
ln -sf ~/dotfiles/gemrc ~/.gemrc

rbenv init

# Configurate bundler to install gems in parallel
# Can be changed in ~/.bundle/config
number_of_cores=`sysctl -n hw.ncpu`
bundle config --global jobs `expr $number_of_cores - 1`

sudo easy_install pip
