local M = {}

M.run = function(test_file)
  print("Running file", test_file)
  local tests = require("tests/"..test_file)

  for k, _ in pairs(tests) do
    print("Running", k)
    print("\n")
    tests[k]()
    print("Passed", k)
  end

end

M.run_all = function()
  local test_files = {
    "simple",
    "command_dispatch",
    "term_wrapper",
    "cmp_snippet"
  }

  for _, test_file in pairs(test_files) do
    M.run(test_file.."_test")
  end

  print("All done!")
end

return M
