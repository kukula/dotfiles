vim.api.nvim_set_option('clipboard', 'unnamed')
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.completeopt = 'menuone,noselect'

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = false

-- Enable mouse mode
vim.o.mouse = false

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = false
vim.o.swapfile = false

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'no'

-- Spelling
vim.opt.spell = false
vim.opt.spelllang = { 'en_us' }
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'txt', 'gitcommit' },
  callback = function()
    vim.api.nvim_win_set_option(0, 'spell', true)
  end
})

-- Set completeopt to have a better completion experience
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('n', '<Esc>', '<cmd>:noh<cr>', { noremap = true })
vim.keymap.set('n', '<leader>f', '<cmd>Explore<cr>', { noremap = true })
vim.keymap.set('n', '<leader>e', '<cmd>e#<cr>', { noremap = true })
vim.keymap.set('n', '<leader>gs', '<cmd>Git<cr>', { noremap = true })
vim.keymap.set('n', '<cr>', 'o<esc>', { noremap = true })

-- For fat fingers
vim.api.nvim_create_user_command('W', 'w', { nargs = '?' })
vim.api.nvim_create_user_command('WQ', 'wq', { nargs = '?' })
vim.api.nvim_create_user_command('Wq', 'wq', { nargs = '?' })
vim.api.nvim_create_user_command('Q', 'q', { nargs = '?' })
vim.api.nvim_create_user_command('Cq', 'cq', { nargs = '?' })

-- Command dispatcher
vim.keymap.set('n', '<leader>st', ':CommandDispatch file<cr>', { noremap = true })
vim.keymap.set('n', '<leader>ss', ':CommandDispatch currentline<cr>', { noremap = true })
vim.keymap.set('n', '<leader>sl', ':CommandDispatch last<cr>', { noremap = true })


vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)
vim.keymap.set('n', '<leader>l', require('telescope.builtin').buffers)
vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics)
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume)
