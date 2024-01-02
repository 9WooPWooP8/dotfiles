local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

mason.setup()
mason_lspconfig.setup()

vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])

require("user.lsp.mason_lsp_config")

require("user.lsp.handlers").setup()
