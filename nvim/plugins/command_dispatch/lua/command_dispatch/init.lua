M = {}

local get_filename = function() return vim.api.nvim_buf_get_name(0) end
local get_line_number = function() return vim.api.nvim_win_get_cursor(0)[1] end

local get_command = function(opt)
  local command = M.commands[vim.bo.filetype]

  if not command then return end

  command = command .. get_filename()

  if opt == 'currentline' then
    command = command .. ':' .. get_line_number()
  end

  return command
end

M.command_dispatch = function(input)
  local opt = input.args

  if (M.write_before_run and vim.bo.modified and not vim.bo.readonly) then vim.cmd('up') end

  if opt == 'last' then
    local command = M['last_command']
    if command then
      vim.cmd(command)
      return
    else
      print('No dispatched commands yet')
      return
    end
  else
    local command = get_command(opt)
    if not command then
      print('No command to dispatch for this filetype')
      return
    end

    M['last_command'] = command
    vim.cmd(command)
  end
end

M.setup = function(opts)
  M['commands'] = opts.commands or {}
  M['user_command'] = opts.user_command or 'CommandDispatch'
  M['write_before_run'] = opts.write_before_run or true

  vim.api.nvim_create_user_command(M.user_command, M.command_dispatch, { nargs = 1, desc = "Command dispatcher" })
end

return M
