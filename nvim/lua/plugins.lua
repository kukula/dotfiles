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
        ruby = 'T RAILS_ENV=test bin/rspec ',
        typescript = 'T yarn test ',
        elixir = 'T mix test ',
      }
    },
  },

  'neovim/nvim-lspconfig',

  {
    "mason-org/mason.nvim",
    opts = {}
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
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
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "ruby", "elixir", "heex", "javascript", "typescript", "tsx", "json", "yaml", "html", "css", "markdown", "markdown_inline", "python", "rust", "go" },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            node_decremental = '<c-backspace>',
          },
        },
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

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup({
        check_ts = true,
      })
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = {
        char = '┊',
      },
      scope = {
        enabled = false,
      },
    },
  },

  'jghauser/mkdir.nvim',
  'AndrewRadev/splitjoin.vim',
  'tpope/vim-sleuth',
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-rails',
  'vim-ruby/vim-ruby',
  'CamdenClark/flyboy',
  'vim-crystal/vim-crystal',
  'jbyuki/quickmath.nvim',
}
