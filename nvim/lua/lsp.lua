local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  
  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local servers = {
  -- Ruby LSP (Shopify's ruby-lsp is better than solargraph)
  ruby_lsp = {
    init_options = {
      formatter = 'auto',
      linters = { 'rubocop' },
    },
  },
  
  -- Rubocop for additional linting
  rubocop = {},
  
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = {
        globals = { 'vim' }
      },
    },
  },
  
  ts_ls = {},
  eslint = {},
  
  elixirls = {
    cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/elixir-ls") },
  },
  
  pyright = {},
  
  jsonls = {},
  yamlls = {},
  html = {},
  cssls = {},
  tailwindcss = {},
}

require('mason').setup()

local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = false, -- Don't automatically install missing servers
})

for server_name, server_config in pairs(servers) do
  lspconfig[server_name].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = server_config,
    init_options = server_config.init_options,
    cmd = server_config.cmd,
  })
end

vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  float = {
    border = 'rounded',
  },
})