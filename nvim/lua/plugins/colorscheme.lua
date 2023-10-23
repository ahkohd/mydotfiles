-- Catppuccin / Mocha
-- return {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     lazy = false,
--     priority = 1000,
--     config = function()
-- 	require("catppuccin").setup({
-- 	  flavour = "mocha", -- latte, frappe, macchiato, mocha
-- 	  background = {
-- 	    light = "latte",
-- 	    dark = "mocha",
-- 	  },
-- 	  transparent_background = true,
-- 	  show_end_of_buffer = false, -- show the '~' characters after the end of buffers
-- 	  term_colors = true,
-- 	  dim_inactive = {
-- 	    enabled = false,
-- 	    shade = "dark",
-- 	    percentage = 0.5,
-- 	  },
-- 	  no_italic = false,
-- 	  no_bold = false,
-- 	  no_underline = false,
-- 	  styles = {
-- 	    comments = { "italic" },
-- 	    conditionals = { "italic" },
-- 	    loops = {},
-- 	    functions = {},
-- 	    keywords = {},
-- 	    strings = {},
-- 	    variables = {},
-- 	    numbers = {},
-- 	    booleans = {},
-- 	    properties = {},
-- 	    types = {},
-- 	    operators = {},
-- 	  },
-- 	  color_overrides = {},
-- 	  custom_highlights = function(_) return {
-- 	    Folded = { bg =  "#1b1b2b" }
-- 	  } end,
-- 	  integrations = {
-- 	    cmp = true,
-- 	    gitsigns = true,
-- 	    nvimtree = true,
-- 	    telescope = false,
-- 	    notify = false,
-- 	    mini = false,
-- 	    barbar = true,
-- 	    hop = true,
-- 	    native_lsp = {
-- 			underlines = {
-- 			errors = { "undercurl" },
-- 			hints = { "undercurl" },
-- 			warnings = { "undercurl" },
-- 			information = { "undercurl" },
-- 		},
-- 	    },
-- 	    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
-- 	  },
-- 	})
--
--       vim.cmd([[colorscheme catppuccin]])
--     end
-- }

-- Tokyo night / Dark
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local tokyo = require("tokyonight")
    tokyo.setup({
      transparent = true,
      style = "night",
      terminal_colors = true,
      on_highlights = function(hl, c)
        local prompt = "#2d3149"
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = prompt,
        }
        hl.TelescopePromptBorder = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePromptTitle = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
      end,
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}
