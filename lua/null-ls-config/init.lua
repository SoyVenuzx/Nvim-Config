local null_ls = require("null-ls")
local prettier = require("prettier")
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({ capabilities = capabilities })

local formatting = null_ls.builtins.formatting

require("null-ls").setup({
  on_init = function(new_client, _)
    new_client.offset_encoding = 'utf-32'
  end,
})

null_ls.setup({
  sources = {
    -- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    formatting.black,
    formatting.clang_format,
    formatting.cmake_format,
    formatting.google_java_format,
    formatting.stylua,
    formatting.isort,
    formatting.codespell.with({ filetypes = { "markdown" } }),
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    end

    if client.resolved_capabilities.document_range_formatting then
      vim.cmd("xnoremap <silent><buffer> <Leader>m :lua vim.lsp.buf.range_formatting({})<CR>")
    end
    --   vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    --   -- vim.cmd("autocmd BufWritePre <buffer>:Prettier<cr>")
    -- end
    vim.cmd([[
      augroup document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
  end,
})

prettier.setup({
  bin = 'prettier', -- or `prettierd`
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },

  -- prettier format options (you can use config files too. ex: `.prettierrc`)
  arrow_parens = "always",
  bracket_spacing = true,
  embedded_language_formatting = "auto",
  end_of_line = "lf",
  html_whitespace_sensitivity = "css",
  jsx_bracket_same_line = false,
  jsx_single_quote = true,
  print_width = 80,
  prose_wrap = "preserve",
  quote_props = "as-needed",
  semi = true,
  single_quote = true,
  tab_width = 2,
  -- trailing_comma = "es5",
  trailing_comma = "all",
  use_tabs = false,
  vue_indent_script_and_style = false,
})
