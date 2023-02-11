M = {}

local get_filename = function() return vim.api.nvim_buf_get_name(0) end
local get_line_number = function() return vim.api.nvim_win_get_cursor(0)[1] end
local save_command = function(command) vim.g.custom_dispatcher_last_command = command end
local get_saved_command = function() return vim.g.custom_dispatcher_last_command end

local get_command = function(opt)
  local command = M.commands[vim.bo.filetype]

  if not command then return end

  command = command .. get_filename()

  if opt == 'currentline' then
    command = command .. ':' .. get_line_number()
  end

  return command
end

local command_dispatch = function(input)
  local opt = input.args

  if opt == 'last' then
    local command = get_saved_command()
    if not command then
      print('No dispatched commands yet')
      return
    end
  end

  local command = get_command(opt)
  if not command then
    print('No command to dispatch for this filetype')
    return
  end

  save_command(command)
  vim.cmd(command)
end

M.setup = function(commands)
  M['commands'] = commands
  vim.api.nvim_create_user_command('CommandDispatch', command_dispatch, { nargs = 1 })
end

return M
