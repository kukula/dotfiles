#!/bin/zsh

# Add links
mkdir -p ~/.zsh
mkdir -p ~/.config/kitty

if [ ! -L ~/.config/nvim ]; then
 ln -sf ~/dotfiles/nvim ~/.config/nvim
fi
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/git/config ~/.gitconfig

source ~/.zshrc

# Homebrew as a prerequisite
sudo chown -R $(whoami) $(brew --prefix)/*
eval "${HOMEBREW_PREFIX}/bin/brew shellenv" > ~/.zprofile

# brew some apps
brew bundle install

#ASDF
plugins=(
  elixir
  erlang
  nodejs
  postgres
  python
  ruby
  rust
  yarn
)

# asdf plugin add neovim
# asdf install neovim nightly
echo neovim nightly > ~/.tool-versions

for plugin in "${plugins[@]}"
do
  asdf plugin add $plugin
  asdf install $plugin latest
  asdf list $plugin | xargs echo $plugin $1 >> ~/.tool-versions
done

cat ~/.tool-versions

echo
echo Welcome to your new computer!
