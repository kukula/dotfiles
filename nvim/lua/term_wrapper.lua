local M = {}

local scroll_to_bottom = function() vim.cmd("normal G") end
local switch_win = function() vim.cmd("wincmd w") end

local get_term_win = function()
  return vim.tbl_filter(function(window) return window.terminal == 1 end, vim.fn.getwininfo())[1]
end

local get_term_buf = function()
  return vim.tbl_filter(function(buf) return buf.variables.terminal_job_id ~= nil end, vim.fn.getbufinfo())[1]
end

local ensure_split = function()
  if vim.tbl_count(vim.fn.getwininfo()) == 1 then
    vim.cmd('vsplit')
  end
end

local ensure_term_buf_exists = function()
  if not get_term_buf() then
    vim.cmd('term')
    scroll_to_bottom()
    switch_win()
  end
end

local ensure_term_win_shown = function()
  if not get_term_win() then
    vim.cmd('b' .. get_term_buf().bufnr)
    scroll_to_bottom()
    switch_win()
  end
end

local get_term_chan = function() return get_term_buf().variables.terminal_job_id end
local send_cmd = function(cmd) vim.fn.chansend(get_term_chan(), cmd .. "\n") end

function M.term_cmd(input)
  local cmd = input.args
  ensure_split()
  ensure_term_buf_exists()
  ensure_term_win_shown()
  send_cmd(cmd)
end

M.setup = function()
  vim.api.nvim_create_user_command('T', M.term_cmd, { nargs = "*" })
end

return M
