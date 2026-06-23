local M = {}

-- Tally shared across files so run_all can report a final pass/fail count.
M.passed = 0
M.failed = 0

M.run = function(test_file)
  print('Running file', test_file)
  local tests = require('tests/tests/' .. test_file)

  for k, _ in pairs(tests) do
    -- Isolate each test: one failure should report and continue, not abort
    -- the whole suite (which masked every test after the first failure).
    local ok, err = pcall(tests[k])
    if ok then
      M.passed = M.passed + 1
      print('  PASS', k)
    else
      M.failed = M.failed + 1
      print('  FAIL', k, err)
    end
  end
end

M.run_all = function()
  M.passed, M.failed = 0, 0
  for test, _ in vim.fs.dir('tests/tests') do
    test = string.gsub(test, '.lua', '')
    M.run(test)
  end

  print(string.format('\nDone: %d passed, %d failed', M.passed, M.failed))
end

return M
