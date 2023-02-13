H = {}

H.exec = function(cmd)
  vim.cmd('redir @t')
  vim.cmd(cmd)
  vim.cmd('redir END')
  local output = vim.fn.split(vim.fn.getreg('t'), "\n")
  return output
end

H.exec_normal = function(cmd)
  return H.exec('normal '..cmd)
end

H.exec_normal_leader = function(cmd)
  return H.exec('normal ,'..cmd)
end

H.inspect = function(o)
  print(vim.inspect(o))
end

H.expect_eq = function(left, right)
  if vim.deep_equal(left, right) then return true end
  local context = string.format('Left:  %s\nRight: %s', vim.inspect(left), vim.inspect(right))
  error('\nNot equal:\n'..context)
end

return H
