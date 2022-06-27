local status, lualine = pcall(require, "lualine")
if (not status) then return end


lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto', 
    section_separators = { left = '', right = '' },
    component_separators = '|',
    disabled_filetypes = {}
  },
  sections = {
    lualine_a =  {{'mode', separator = { left = '', right = ''}, right_padding = 2 }},
    lualine_b = {'filename', 'branch'},
    lualine_c = {{
      'fileformat',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0,
    }},
    lualine_x = {
      { 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      'encoding',
    },
    lualine_y = {'filetype'},
    lualine_z = {{'location', separator = { left = '', right = '' }, left_padding = 2 }}
  },
  inactive_sections = {
    lualine_a = {'filename'},
    lualine_b = {},
    lualine_c = {}, 
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'location'}
},
  tabline = {},
  extensions = {'fugitive'}
}

