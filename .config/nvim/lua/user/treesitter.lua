local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {"python", "rust", "javascript"}, -- one of "all" or a list of languages
	ignore_install = { "phpdoc", "comment", "rst" }, -- List of parsers to ignore installing
	highlight = {
		additional_vim_regex_highlighting = false,
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
	autotag = {
		enable = true,
	},
	refactor = {
		highlight_definitions = {
			enable = false,
			-- Set to false if you have an `updatetime` of ~100.
			clear_on_cursor_move = true,
		},
		smart_rename = {
			enable = false,
			keymaps = {
				smart_rename = "grr",
			},
		},
	},
})
