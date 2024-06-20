local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

lazy.setup({

	"nvim-lua/popup.nvim",  -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	"navarasu/onedark.nvim",
	"windwp/nvim-autopairs",

	"hrsh7th/nvim-cmp",        -- The completion plugin
	"hrsh7th/cmp-buffer",      -- buffer completions
	"hrsh7th/cmp-path",        -- path completions
	"hrsh7th/cmp-cmdline",     -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",

	-- snippets
	"L3MON4D3/LuaSnip",            --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use
	{ "dsznajder/vscode-es7-javascript-react-snippets", run = "yarn install --frozen-lockfile && yarn compile" },

	-- LSP
	"williamboman/mason.nvim", -- simple to use language server installer
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",  -- enable LSP
	"nvim-treesitter/nvim-treesitter-refactor",

	-- file explorer
	{
		'stevearc/oil.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		init = function()

		end
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	}
	,
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},

	{
		"nvimtools/none-ls.nvim",
	},

	"lukas-reineke/lsp-format.nvim",
	"Vimjas/vim-python-pep8-indent",

	--telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",

	--comment out
	"tpope/vim-commentary",
	"lukas-reineke/indent-blankline.nvim",
	"windwp/nvim-ts-autotag",

	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"folke/which-key.nvim",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		lazy = false,
	},

	--scrollbar
	"petertriho/nvim-scrollbar",

	--heirline statusbar
	"rebelot/heirline.nvim",

	--heirline statusbar
	"lewis6991/gitsigns.nvim",

	--debugging
	"mfussenegger/nvim-dap",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio"
		}
	},

	"nvim-lualine/lualine.nvim",

	"folke/neodev.nvim",
	"MunifTanjim/nui.nvim",
	"b0o/schemastore.nvim",
	-- {
	--   'Bekaboo/dropbar.nvim',
	--   -- optional, but required for fuzzy finder support
	--   dependencies = {
	--     'nvim-telescope/telescope-fzf-native.nvim'
	--   }
	-- },
	{
		"LunarVim/breadcrumbs.nvim",
		dependencies = {
			{ "SmiteshP/nvim-navic" },
		},
	},
	-- {
	-- 	"SmiteshP/nvim-navic",
	-- },
	{
		"karb94/neoscroll.nvim",
	},
})
