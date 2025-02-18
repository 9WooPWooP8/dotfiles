require("user.plugins")

require("user.themes.kanagawa")
vim.cmd("colorscheme kanagawa")

require("user.bufferline")
require("user.options")
require("user.keymaps")

require("user.cmp")
require("user.nvim_navic")
require("user.lsp")
require("user.treesitter")
require("user.blank_indent_highlight")
require("user.autopairs")
require("user.telescope")
require("user.lsp_format")
-- require("user.neoscroll")
require("user.dropbar")
require("user.nvim_scrollbar")
require("user.gitsigns")
require("user.lualine")
require("user.dap.dapui")
require("user.dap.dap")
require("user.neotree")
require("user.oil")
require("user.which_key")
require("user.harpoon")

vim.cmd("set cursorline")
