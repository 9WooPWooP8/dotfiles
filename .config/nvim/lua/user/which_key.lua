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
			operators = false, -- adds help for operators like d, y, ...
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
	operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "single",      -- none, single, double, shadow
		position = "bottom",    -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 },                                            -- min and max height of the columns
		width = { min = 20, max = 50 },                                            -- min and max width of the columns
		spacing = 3,                                                               -- spacing between columns
		align = "left",                                                            -- align columns left, center or right
	},
	ignore_missing = true,                                                       -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true,                                                            -- show help message on the command line when the popup is visible
	show_keys = true,                                                            -- show the currently pressed key and its label as a message in the command line
	triggers = "auto",                                                           -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
	-- disable the WhichKey popup for certain buf types and file types.
	-- Disabled by default for Telescope
	disable = {
		buftypes = {},
		filetypes = { "TelescopePrompt" },
	},
})

which_key.register({
	name = "Hotkeys",
	e = {
		":Neotree toggle <CR>",
		"File tree toggle",
	},
	F = {
		":lua vim.lsp.buf.format() <CR>",
		"Format file",
	},
	f = {
		name = "Find",
		f = {
			"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
			"Find file",
		},
		w = {
			"<cmd>lua require'telescope.builtin'.live_grep()<cr>",
			"Grep file",
		},
		b = {
			"<cmd>lua require'telescope.builtin'.buffers()<cr>",
			"Find buffer",
		},
	},
	c = {
		name = "Code actions",
		a = {
			"<cmd>lua vim.lsp.buf.code_action()<CR>",
			"Show code actions",
		},
	},
	l = {
		"<cmd>lua vim.diagnostic.setloclist()<CR>",
		"Show diagnostic list",
	},
	d = {
		name = "DAP",
		r = {
			"<cmd>DapContinue<CR>",
			"DapContinue",
		},
		j = {
			"<cmd>DapStepInto<CR>",
			"StepInto",
		},
		l = {
			"<cmd>DapStepOver<CR>",
			"StepOver",
		},
		k = {
			"<cmd>DapStepOut<CR>",
			"StepOut",
		},
		b = {
			"<cmd>DapToggleBreakpoint<CR>",
			"Toggle breakpoint",
		},
		s = {
			"<cmd>DapTerminate<CR>",
			"Terminate",
		},
	},
	t = {
		name = "Tabs",
		n = {
			"<cmd>tabnew<CR>",
			"New tab",
		},
		q = {
			"<cmd>tabclose<CR>",
			"Close tab",
		},
	},
}, { prefix = "<leader>" })

which_key.register({
	name = "LSP Actions",
	D = {
		"<cmd>lua vim.lsp.buf.declaration()<CR>",
		"Go to declaration",
	},
	d = {
		"<cmd>lua vim.lsp.buf.definition()<CR>",
		"Go to definition",
	},
	i = {
		"<cmd>lua vim.lsp.buf.implementation()<CR>",
		"Show implementations",
	},
	rr = {
		"<cmd>lua vim.lsp.buf.rename()<CR>",
		"Rename",
	},
	r = {
		"<cmd>lua vim.lsp.buf.references()<CR>",
		"Show references",
	},
	l = {
		"<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>",
		"Show diagnostic at line",
	},
}, { prefix = "g" })

which_key.register({
	["<C-k>"] = {
		"<cmd>lua vim.lsp.buf.signature_help()<CR>",
		"Signature help",
	},
	["K"] = {
		"<cmd>lua vim.lsp.buf.hover()<CR>",
		"Signature help",
	},
}, {})
