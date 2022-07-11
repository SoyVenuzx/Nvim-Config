local nvim_lsp = require("lspconfig")

local on_attach = function(client, bufnr)
  -- other stuff --
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc');
  require("tailwindcss-colors").buf_attach(bufnr)
end

require('lspconfig')["tailwindcss"].setup({
  -- other settings --
  on_attach = on_attach,
})
