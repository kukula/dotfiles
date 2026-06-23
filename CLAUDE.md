# CLAUDE.md

Personal macOS (Apple Silicon) dotfiles. Terminal-centric, Neovim-based.
Priority: **speed and minimalism** — no heavy UI plugins, keyboard-only, built-in
test runners. Keep additions minimal and fast; match the existing style.

## Setup

`./install.sh` (idempotent, location-independent — derives its path from `$0`):
Homebrew, symlinks, `brew bundle`, Rectangle prefs, asdf runtimes pinned `latest`.

Symlinks: `nvim/`, `zshrc`, `kitty.conf`, `git/config`, and
`git/gitignore_global`→`~/.config/git/ignore` (git's native global excludes),
`zed/settings.json`. `RectangleConfig.json` isn't a live file — install.sh writes
its keys into Rectangle's UserDefaults via `defaults` (restart Rectangle to apply).

## Neovim

`init.lua` (leader=`,`) bootstraps lazy.nvim, then loads `lua/{plugins,general,lsp}.lua`
(specs / settings+keymaps / Mason LSP). Test the config: `make test` in `nvim/`.

Two in-tree plugins (`nvim/plugins/`):
- `term_wrapper` — `:T <cmd>` runs `<cmd>` in an embedded terminal.
- `command_dispatch` — `:CommandDispatch {file,currentline,last}` looks up a command
  by `filetype` and runs it via `:T`. Configured in `plugins.lua`:
  ruby→`RAILS_ENV=test bin/rspec`, js/ts→`yarn test`, elixir→`mix test`,
  lua/make→`make test`. Keymaps: `,st` file · `,ss` line · `,sl` last.

## Runtimes

asdf: elixir, erlang, nodejs, python, ruby, rust, yarn. Go uses `GOPATH`.

## Conventions

No secrets in-repo (global gitignore: `git/gitignore_global`).
