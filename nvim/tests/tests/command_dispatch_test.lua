local H = require('tests/helper')
local T = {}

T['command dispatch last'] = function()
  local output = H.exec_normal_leader('sl')
  H.expect_eq(output[1], 'No dispatched commands yet')
end

T['command dispatch file'] = function()
  local output = H.exec_normal_leader('st')
  H.expect_eq(output[1], 'No command to dispatch for this filetype')
end

T['command dispatch line'] = function()
  local output = H.exec_normal_leader('ss')
  H.expect_eq(output[1], 'No command to dispatch for this filetype')
end

return T
