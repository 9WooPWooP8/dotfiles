local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

mason.setup()

require("user.lsp.mason_lsp_config")
require("user.lsp.diagnostics_config").setup()
-- require("user.lsp.none_ls")

vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])
