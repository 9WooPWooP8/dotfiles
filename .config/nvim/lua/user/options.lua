vim.opt.backup = false
vim.opt.cmdheight = 1
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.showmode = false
vim.opt.fileencoding = "utf-8"
vim.opt.ignorecase = true
vim.opt.showtabline = 1
vim.opt.pumblend = 5
vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.updatetime = 300
vim.opt.timeoutlen = 5000
vim.opt.ttimeoutlen = 5
vim.opt.signcolumn = "yes:2"

vim.opt.keymap = "russian-jcukenwin"
vim.opt.iminsert = 0
vim.opt.imsearch = 0

vim.g.netrw_banner = 0

vim.opt.lazyredraw = true

vim.api.nvim_create_autocmd("FileType", {
	pattern = "cs",
	command = "setlocal shiftwidth=4 tabstop=4"
})

vim.cmd "au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'"
vim.cmd "au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'"
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]


vim.cmd "set cursorline"
