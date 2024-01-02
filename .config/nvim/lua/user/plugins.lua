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

	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	"navarasu/onedark.nvim",
	"morhetz/gruvbox",
	"Mofiqul/dracula.nvim",
	"folke/tokyonight.nvim",

	"windwp/nvim-autopairs",

	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use
	{ "dsznajder/vscode-es7-javascript-react-snippets", run = "yarn install --frozen-lockfile && yarn compile" },

	-- LSP
	"williamboman/mason.nvim", -- simple to use language server installer
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig", -- enable LSP
	-- "williamboman/nvim-lsp-installer") -- simple to use language server installer
	"nvim-treesitter/nvim-treesitter-refactor",

	-- file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},

	{
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	},

	{
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		requires = "kyazdani42/nvim-web-devicons",
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

	--scrollbar
	"petertriho/nvim-scrollbar",

	--heirline statusbar
	"rebelot/heirline.nvim",

	--heirline statusbar
	"lewis6991/gitsigns.nvim",

	--debugging
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",

	"nvim-lualine/lualine.nvim",

	"folke/neodev.nvim",
	"MunifTanjim/nui.nvim",
})

-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

-- Use a protected call so we don't error out on first use
