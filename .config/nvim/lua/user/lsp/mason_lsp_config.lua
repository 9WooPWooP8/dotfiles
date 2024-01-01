local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	["omnisharp"] = function()
		require("lspconfig")["omnisharp"].setup({
			on_attach = function(client, bufnr)
				if client.name == "omnisharp" then
					client.server_capabilities.semanticTokensProvider = nil
				end
			end,
		})
	end,
	["pylsp"] = function()
		require("lspconfig")["pylsp"].setup({
			settings = {
				pylsp = {
					plugins = {
						pycodestyle = {
							ignore = { "E501", "E231", "W503" },
							maxLineLength = 100,
						},
					},
				},
			},
		})
	end,
	["rust_analyzer"] = function()
		require("lspconfig")["rust_analyzer"].setup({
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
					},
				},
			},
		})
	end,
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({})
	end,
	-- ["omnisharp"] = function()
	-- 	require("omnisharp").setup({})
	-- end,
	-- Next, you can provide a dedicated handler for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	-- ["rust_analyzer"] = function()
	-- 	require("rust-tools").setup({})
	-- end,
})
