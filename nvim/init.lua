local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Re-bootstrap if the install is missing OR incomplete. Checking for lazy's
-- actual entry file (not just the directory) lets a partial/corrupted clone
-- self-heal instead of failing forever with "module 'lazy' not found".
if not vim.uv.fs_stat(lazypath .. '/lua/lazy/init.lua') then
  -- Clear any leftover partial clone, otherwise `git clone` refuses a
  -- non-empty destination and the bootstrap can never recover.
  vim.fn.delete(lazypath, 'rf')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ','
vim.g.maplocalleader = ','

require('lazy').setup(require('plugins'), {
  rocks = {
    enabled = false, -- Disable luarocks since we don't need it
  },
})
require('general')
require('lsp')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
