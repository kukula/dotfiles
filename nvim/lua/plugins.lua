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
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
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
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
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

      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  { 'nvim-telescope/telescope.nvim',
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
    'echasnovski/mini.pairs',
    config = function()
      require('mini.pairs').setup()
    end
  },

  {
    'echasnovski/mini.comment',
    config = function()
      require('mini.comment').setup()
    end
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      -- char = '┊',
      char = ' ',
      show_trailing_blankline_indent = true,
    }
  },

  'jghauser/mkdir.nvim',
  'AndrewRadev/splitjoin.vim',
  'tpope/vim-sleuth',
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
}
