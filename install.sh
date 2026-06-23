#!/usr/bin/env zsh
set -euo pipefail

DOTFILES="${HOME}/dotfiles"

# 1. Install Homebrew if it isn't already present
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

# Persist the brew environment for future login shells (only once)
if ! grep -qs 'brew shellenv' ~/.zprofile; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
fi

# 2. Symlink config files into place.
# -n makes ln treat an existing symlink-to-directory as a normal file,
# so re-running replaces the link instead of nesting inside it.
mkdir -p ~/.zsh ~/.config/kitty

link() { ln -sfn "$DOTFILES/$1" "$2"; }
link nvim       ~/.config/nvim
link zshrc      ~/.zshrc
link kitty.conf ~/.config/kitty/kitty.conf
link git/config ~/.gitconfig

# 3. Install Homebrew packages
brew bundle install --file="$DOTFILES/Brewfile"

# 4. Install language runtimes via asdf and pin "latest" globally
plugins=(elixir erlang nodejs python ruby rust yarn)
for plugin in "${plugins[@]}"; do
  asdf plugin add "$plugin" || true
  asdf install "$plugin" latest
  asdf set --home "$plugin" "$(asdf latest "$plugin")"
done

echo
echo "Welcome to your new computer!"
