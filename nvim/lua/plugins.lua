return {
  {
    name = 'term_wrapper',
    dir = '~/dotfiles/nvim/plugins/term_wrapper',
    opts = { user_command = 'T' },
  },

  {
    name = 'command_dispatch',
    dir = '~/dotfiles/nvim/plugins/command_dispatch',
    opts = {
      user_command = 'CommandDispatch',
      write_before_run = true,
      commands = {
        javascript = 'T yarn test ',
        lua = 'T make test ',
        make = 'T make test ',
        ruby = 'T bundle exec rspec ',
        typescript = 'T yarn test ',
      }
    },
  },
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'jose-elias-alvarez/null-ls.nvim',
      'hrsh7th/cmp-nvim-lsp'
    },
    config = function()
      local servers = {
        tsserver = {},
        rust_analyzer = {},
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
              globals = { 'vim' }
            }
          },
        },
        ruby_ls = {},
        emmet_ls = {
          filetypes = {
            'css',
            'html',
            'javascriptreact',
            'less',
            'sass',
            'scss',
            'typescriptreact',
          },
        }
      }

      require('mason').setup()

      local mason_lspconfig = require 'mason-lspconfig'
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            settings = servers[server_name],
          }
        end,
      }
    end,
    build = ':MasonUpdate'
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'f3fora/cmp-spell',
      'saadparwaiz1/cmp_luasnip',
      'lukas-reineke/cmp-under-comparator',
      {
        'L3MON4D3/LuaSnip',
        config = function()
          require('luasnip/loaders/from_vscode').lazy_load()
        end,
        dependencies = {
          'rafamadriz/friendly-snippets',
        }
      }
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, vim_item)
            vim_item.menu = ({
              buffer = '[Buffer]',
              luasnip = '[Snippet]',
              nvim_lsp = '[LSP]',
              spell = '[Spelling]',
            })[entry.source.name]

            return vim_item
          end
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          {
            name = 'buffer',
            keyword_length = 1,
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end
            }
          },
          {
            name = 'spell',
            option = {
              keep_all_entries = false,
              enable_in_context = function()
                return require('cmp.config.context').in_treesitter_capture('spell')
              end,
            },
          },
        },
      }
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "ruby", "elixir", "heex" },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true
        }
      })
    end,
  },

  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        style = 'night',
        light_style = 'day',
        terminal_colors = true,
      })

      vim.cmd 'colorscheme tokyonight'
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
      pickers = {
        buffers = {
          ignore_current_buffer = true,
          sort_lastused = true,
        },
      },
    }
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable 'make' == 1,
    config = function()
      pcall(require('telescope').load_extension, 'fzf')
    end
  },

  {
    'echasnovski/mini.surround',
    config = function()
      require('mini.surround').setup()
    end
  },

  {
    'echasnovski/mini.comment',
    config = function()
      require('mini.comment').setup()
    end
  },

  'jghauser/mkdir.nvim',
  'AndrewRadev/splitjoin.vim',
  'tpope/vim-sleuth',
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
}
