#!/usr/bin/env zsh
set -euo pipefail

# Resolve the repo from this script's own location so the installer works from
# any clone path (`:A` makes it absolute and resolves symlinks; `:h` = dirname).
DOTFILES="${0:A:h}"

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
mkdir -p ~/.zsh ~/.config/kitty ~/.config/zed ~/.config/git

link() { ln -sfn "$DOTFILES/$1" "$2"; }
link nvim                 ~/.config/nvim
link zshrc                ~/.zshrc
link kitty.conf           ~/.config/kitty/kitty.conf
link git/config           ~/.gitconfig
link git/gitignore_global ~/.config/git/ignore   # git's native global excludes (XDG)
link zed/settings.json    ~/.config/zed/settings.json

# 3. Install Homebrew packages
brew bundle install --file="$DOTFILES/Brewfile"

# 4. Apply Rectangle preferences from the exported config. RectangleConfig.json
# stores prefs in a typed wrapper format ({"float":3}) plus a separate shortcuts
# map; unwrap to a plain tree, merge the shortcuts, convert to a plist, and
# import it into Rectangle's UserDefaults. Restart Rectangle to apply.
if [[ -f "$DOTFILES/RectangleConfig.json" ]]; then
  tmp_plist="$(mktemp -t rectangle)" || exit 1
  jq '(.defaults | to_entries | map(select(.value | length > 0)) | from_entries
        | map_values(.[keys[0]])) + .shortcuts' "$DOTFILES/RectangleConfig.json" \
    | plutil -convert xml1 -o "$tmp_plist" -
  defaults import com.knollsoft.Rectangle "$tmp_plist"
  rm -f "$tmp_plist"
fi

# 5. Install language runtimes via asdf and pin "latest" globally
plugins=(elixir erlang nodejs python ruby rust yarn)
for plugin in "${plugins[@]}"; do
  asdf plugin add "$plugin" || true
  asdf install "$plugin" latest
  asdf set --home "$plugin" "$(asdf latest "$plugin")"
done

echo
echo "Welcome to your new computer!"
