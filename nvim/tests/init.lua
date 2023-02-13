local M = {}

M.run = function(test_file)
  print('Running file', test_file)
  local tests = require('tests/tests/' .. test_file)

  for k, _ in pairs(tests) do
    print('Running', k)
    print('\n')
    tests[k]()
    print('Passed', k)
  end
end

M.run_all = function()
  for test, _ in vim.fs.dir('tests/tests') do
    test = string.gsub(test, '.lua', '')
    M.run(test)
  end

  print('All done!')
end

return M
