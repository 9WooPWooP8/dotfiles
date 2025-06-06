require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'kanagawa',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
		-- use_mode_colors = false
  },
  sections = {
    lualine_a = {'branch'},
    -- lualine_b = {'diff', 'diagnostics'},
    lualine_b = {'diagnostics'},
    lualine_c = {},
    -- lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_x = {'encoding', 'fileformat'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

vim.api.nvim_create_autocmd('CursorMoved', {callback=require('lualine').refresh})
vim.api.nvim_create_autocmd('ModeChanged', {callback=require('lualine').refresh})
