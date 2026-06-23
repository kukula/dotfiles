.PHONY: test

# Run headless, then `qa!` so nvim exits on its own — no sleep/kill needed.
# Exit non-zero when any test fails so CI / `&&` chains can detect failure.
test:
	@nvim --headless \
		-c "lua require('tests/init').run_all()" \
		-c "lua vim.cmd(require('tests/init').failed > 0 and 'cq' or 'qa!')"
