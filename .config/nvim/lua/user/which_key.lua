local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

which_key.setup({
	plugins = {
		marks = false,   -- shows a list of your marks on ' and `
		registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true,
			suggestions = 20,
		}, -- use which-key for spelling hints
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			motions = false,   -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = false,   -- default bindings on <c-w>
			nav = false,       -- misc bindings to work with windows
			z = false,         -- bindings for folds, spelling and others prefixed with z
			g = false,         -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	win = {
		border = "single",      -- none, single, double, shadow
		position = "bottom",    -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		wo = {
			winblend = 0,
		}
	},
	layout = {
		height = { min = 4, max = 25 },                                            -- min and max height of the columns
		width = { min = 20, max = 50 },                                            -- min and max width of the columns
		spacing = 3,                                                               -- spacing between columns
		align = "left",                                                            -- align columns left, center or right
	},
	-- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true,                                                            -- show help message on the command line when the popup is visible
	show_keys = true,                                                            -- show the currently pressed key and its label as a message in the command line
	triggers = {
    { "<auto>", mode = "nxsot" },
  },
	-- triggers = {"<leader>"} -- or specify a list manually
	-- disable the WhichKey popup for certain buf types and file types.
	-- Disabled by default for Telescope
	disable = {
		buftypes = {},
		filetypes = { "TelescopePrompt" },
	},
})

which_key.add({
    { "<leader>", group = "Hotkeys" },
    { "<leader>F", ":lua vim.lsp.buf.format() <CR>", desc = "Format file" },
    { "<leader>c", group = "Code actions" },
    { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Show code actions" },
    { "<leader>d", group = "DAP" },
    { "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle breakpoint" },
    { "<leader>dj", "<cmd>DapStepInto<CR>", desc = "StepInto" },
    { "<leader>dk", "<cmd>DapStepOut<CR>", desc = "StepOut" },
    { "<leader>dl", "<cmd>DapStepOver<CR>", desc = "StepOver" },
    { "<leader>dr", "<cmd>DapContinue<CR>", desc = "DapContinue" },
    { "<leader>ds", "<cmd>DapTerminate<CR>", desc = "Terminate" },
    { "<leader>e", ":Neotree toggle <CR>", desc = "File tree toggle" },
    { "<leader>f", group = "Find" },
    { "<leader>fb", "<cmd>lua require'telescope.builtin'.buffers()<cr>", desc = "Find buffer" },
    { "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", desc = "Find file" },
    { "<leader>fw", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", desc = "Grep file" },
    { "<leader>l", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "Show diagnostic list" },
    { "<leader>o", ":Oil --float <CR>", desc = "Oil nvim toggle" },
    { "<leader>t", group = "Tabs" },
    { "<leader>tn", "<cmd>tabnew<CR>", desc = "New tab" },
    { "<leader>tq", "<cmd>tabclose<CR>", desc = "Close tab" },
  }
)

which_key.add({
    { "g", group = "LSP Actions" },
    { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration" },
    { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
    { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Show implementations" },
    { "gl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>", desc = "Show diagnostic at line" },
    { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Show references" },
    { "grr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
  }
)

which_key.add({
    { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature help" },
    { "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Signature help" },
  })
