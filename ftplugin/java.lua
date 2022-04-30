local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.idl",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.level=ALL",
		"-noverify",
		"-Xmx1G",
		"-jar",
		"/home/ant0n_/Documentos/jdt-language-server-latest/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
		"-configuration",
		"/home/ant0n_/Documentos/jdt-language-server-latest/config_linux/",
		"-data",
		vim.fn.expand("~/.cache/jdtls-workspace") .. workspace_dir,
	},

	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
	capabilities = capabilities,
}

require("jdtls").start_or_attach(config)
