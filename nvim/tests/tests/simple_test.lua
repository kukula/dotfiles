local T = {}

T['simple test'] = function()
  local x = 1 + 1
  if x ~= 2 then
    error('`x` is not equal to 2')
  end
end

return T
