local null_ls = require("null-ls")
local prettier = require("prettier")

local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black,
		-- formatting.clang_format,
		formatting.cmake_format,
		formatting.google_java_format,
		formatting.stylua,
		formatting.isort,
		formatting.codespell.with({ filetypes = { "markdown" } }),
	},
	on_attach = function(client)
		-- if client.resolved_capabilities.document_formatting then
		-- 	vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
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
    -- "javascript",
    -- "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    -- "typescript",
    -- "typescriptreact",
    "yaml",
  },

  -- prettier format options (you can use config files too. ex: `.prettierrc`)
  arrow_parens = "always",
  bracket_spacing = true,
  embedded_language_formatting = "auto",
  end_of_line = "lf",
  html_whitespace_sensitivity = "css",
  jsx_bracket_same_line = false,
  jsx_single_quote = false,
  print_width = 80,
  prose_wrap = "preserve",
  quote_props = "as-needed",
  semi = true,
  single_quote = false,
  tab_width = 2,
  trailing_comma = "es5",
  use_tabs = false,
  vue_indent_script_and_style = false,
})
