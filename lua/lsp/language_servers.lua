local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
  local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  capabilities.offsetEncoding = { "utf-16" }
  local opts = { capabilities = capabilities }

  if server.name == "sumneko_lua" then
    opts = vim.tbl_deep_extend("force", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
          diagnostics = { globals = { "vim" } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }, opts)
  end
  server:setup(opts)
end)

local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
})
