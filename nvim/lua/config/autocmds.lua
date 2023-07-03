-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- For fat fingers
vim.api.nvim_create_user_command("W", "w", { nargs = "?" })
vim.api.nvim_create_user_command("WQ", "wq", { nargs = "?" })
vim.api.nvim_create_user_command("Wq", "wq", { nargs = "?" })
vim.api.nvim_create_user_command("Q", "q", { nargs = "?" })
vim.api.nvim_create_user_command("Cq", "cq", { nargs = "?" })
