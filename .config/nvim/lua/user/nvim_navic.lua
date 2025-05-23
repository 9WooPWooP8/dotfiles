local nvim_navic_status_ok, nvim_navic = pcall(require, "nvim-navic")
if not nvim_navic_status_ok then
	return
end

nvim_navic.setup({
	lsp = {
		auto_attach = true,
		preference = {"pyright", "pylsp"}
	}
})

-- vim.o.winbar = "%t %{%v:lua.require'nvim-navic'.get_location()%}"
