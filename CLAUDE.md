# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository for macOS development environment configuration. It provides a comprehensive terminal-based development setup with Neovim as the primary editor.

## Key Commands

### Installation & Setup
- `./install.sh` - Main installation script that sets up symlinks, installs Homebrew packages, and configures development tools
- `brew bundle install` - Install all Homebrew dependencies from Brewfile
- `update-nvim-nightly` - Update Neovim to the latest nightly build (custom zsh alias)

### Neovim Development
- `make test` - Run Neovim plugin tests (from nvim/ directory)
- `,st` - Run tests for current file (CommandDispatch)
- `,ss` - Run test for current line (CommandDispatch)
- `,sl` - Run last test command (CommandDispatch)
- `T <command>` - Open terminal wrapper for running commands

### Project-Specific Test Commands
The CommandDispatch plugin automatically runs the appropriate test command based on file type:
- Ruby/Rails: `RAILS_ENV=test bin/rspec`
- JavaScript/TypeScript: `yarn test`
- Elixir: `mix test`
- Lua: `make test`

## Architecture & Structure

### Core Components
1. **Shell Configuration** (`zshrc`): Custom Zsh setup with Git integration, ASDF version management, and development-focused aliases
2. **Terminal** (`kitty.conf`): Kitty terminal with Tokyo Night theme and optimized settings
3. **Editor** (`nvim/`): Modular Neovim configuration with LSP, custom plugins, and extensive key mappings
4. **Version Management**: ASDF manages multiple language runtimes (Ruby, Elixir, Node.js, Python, Rust, Go)

### Custom Neovim Plugins
- **term_wrapper** (`nvim/plugins/term_wrapper/`): Terminal integration for running commands within Neovim
- **command_dispatch** (`nvim/plugins/command_dispatch/`): Smart test runner that detects project type and runs appropriate test commands

### Neovim Configuration Structure
- `nvim/init.lua` - Entry point, loads Lazy.nvim and other modules
- `nvim/lua/plugins.lua` - Plugin definitions and configurations
- `nvim/lua/general.lua` - General Neovim settings and key mappings
- `nvim/lua/lsp.lua` - LSP server configurations with Mason

## Key Technologies & Tools

### Language Servers (via Mason)
- Ruby: `ruby_lsp` (Shopify's Ruby LSP) with Rubocop integration
- JavaScript/TypeScript: `tsserver`, `eslint`
- Elixir: `elixirls`
- Other: `lua_ls`, `rust_analyzer`, `gopls`, `pyright`, `jsonls`, `yamlls`, `html`, `cssls`, `tailwindcss`

### Essential Neovim Plugins
- **vim-ai**: AI integration for code assistance
- **telescope.nvim**: Fuzzy finder for files, buffers, and more
- **nvim-treesitter**: Advanced syntax highlighting and code understanding
- **nvim-cmp**: Autocompletion with LSP support
- **vim-fugitive**: Git integration
- **vim-rails**: Rails-specific functionality
- **mini.surround**: Surround text objects
- **nvim-autopairs**: Auto-close brackets and quotes
- **indent-blankline**: Visual indent guides

### Development Tools (via Homebrew)
- Search: `fd`, `ripgrep`, `fzf`
- Git: `git`, `difftastic`
- System: `htop`, `tldr`
- Utilities: `jq`, `thefuck`

## Important Patterns

1. **Minimal & Fast**: Configuration prioritizes speed and minimalism - no heavy plugins like lualine or gitsigns
2. **Terminal-Centric**: Heavy reliance on terminal integration and keyboard-only workflows
3. **Test-Driven**: Built-in test runners for multiple languages with smart detection
4. **Version Management**: All language runtimes managed through ASDF for consistency

## Testing Strategy

- Neovim plugins have their own test suite in `nvim/tests/`
- Run with `make test` from the `nvim/` directory
- Tests use a custom helper framework for plugin testing

## Git Configuration

- Global gitignore patterns in `git/gitignore_global`
- Git aliases and settings in `git/config`
- No credentials or sensitive data stored in repository