vim.api.nvim_set_option('clipboard', 'unnamed')

-- Python provider
vim.g.python3_host_prog = vim.fn.expand('$HOME/.asdf/shims/python3')
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.completeopt = 'menuone,noselect'

-- Set highlight on search
vim.o.hlsearch = true

-- Mouse mode
vim.o.mouse = ""

-- Indentation
vim.o.breakindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Undo history and swap
vim.o.undofile = false
vim.o.swapfile = false

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Disable welcome screen
vim.o.shortmess = 'I'

-- Decrease update time
vim.o.updatetime = 250

-- Status column
vim.o.number = false
vim.o.relativenumber = false
vim.o.signcolumn = 'no'


-- Spelling
vim.opt.spell = false
vim.opt.spelllang = { 'en_us' }
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'txt', 'gitcommit' },
  callback = function()
    vim.api.nvim_win_set_option(0, 'spell', true)
  end
})

-- JSON format
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'json',
  callback = function()
    vim.api.nvim_create_user_command('Format', '%!jq .', { nargs = '?' })
  end
})

-- Set completeopt to have a better completion experience
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('n', '<Esc>', ':noh<cr>', { noremap = true })
vim.keymap.set('n', '<leader>f', ':Explore<cr>', { noremap = true })
vim.keymap.set('n', '<leader>e', ':e#<cr>', { noremap = true })
vim.keymap.set('n', '<leader>gs', ':Git<cr>', { noremap = true })
vim.keymap.set('n', 's', ':w<cr>', { noremap = true })
vim.keymap.set('n', '===', "gg=G''", { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>k', function ()
  vim.diagnostic.open_float()
end, { silent = true })

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

vim.keymap.set('n', '<leader>so', require('telescope.builtin').oldfiles)
vim.keymap.set('n', '<leader>l', require('telescope.builtin').buffers)
vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics)
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume)
