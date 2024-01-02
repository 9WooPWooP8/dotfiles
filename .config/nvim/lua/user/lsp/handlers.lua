local M = {}

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		-- virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)
end

-- local function lsp_highlight_document(client)
-- 	-- Set autocommands conditional on server_capabilities
-- 	local status_ok, illuminate = pcall(require, "illuminate")
-- 	if not status_ok then
-- 		return
-- 	end
-- 	illuminate.on_attach(client)
-- end

-- M.on_attach = function(client, bufnr)
-- 	lsp_highlight_document(client)
-- end

return M
