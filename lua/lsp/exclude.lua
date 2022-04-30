local M = {}

M.on_attach = function(client, bufnr)
	if client.name == "jdtls" then
		client.resolved_capabilities.document_formatting = false
	end
end

return M
