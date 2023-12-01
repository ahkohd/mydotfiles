-- luacheck: globals vim

-- Tokyo night / Night
-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		local tokyo = require("tokyonight")
-- 		tokyo.setup({
-- 			transparent = not vim.g.neovide,
-- 			style = "night",
-- 			terminal_colors = true,
-- 			on_highlights = function(hl, _)
-- 				local bg = nil
-- 				local fg = "#565f89"
-- 				local text = "#9aa5ce"
--
-- 				hl.TelescopeNormal = {
-- 					bg = bg,
-- 					fg = text,
-- 				}
-- 				hl.TelescopeBorder = {
-- 					bg = bg,
-- 					fg = fg,
-- 				}
-- 				hl.TelescopePromptNormal = {
-- 					bg = bg,
-- 					fg = text,
-- 				}
-- 				hl.TelescopePromptBorder = {
-- 					bg = bg,
-- 					fg = fg,
-- 				}
-- 				hl.TelescopePromptTitle = {
-- 					bg = bg,
-- 					fg = text,
-- 				}
-- 				hl.TelescopePreviewTitle = {
-- 					bg = bg,
-- 					fg = text,
-- 				}
-- 				hl.TelescopeResultsTitle = {
-- 					bg = bg,
-- 					fg = text,
-- 				}
-- 				hl.HydraBorder = {
-- 					bg = bg,
-- 					fg = fg,
-- 				}
-- 				hl.HydraHint = {
-- 					bg = bg,
-- 					fg = fg,
-- 				}
-- 				hl.NormalFloat = {
-- 					bg = bg,
-- 					fg = text,
-- 				}
-- 				hl.FloatBorder = {
-- 					bg = bg,
-- 					fg = fg,
-- 				}
-- 				hl.FloatTitle = {
-- 					bg = bg,
-- 					fg = text,
-- 				}
-- 				hl.CmpPmenu = {
-- 					bg = bg,
-- 					fg = fg,
-- 				}
-- 				hl.CmpPmenuBorder = {
-- 					bg = bg,
-- 					fg = fg,
-- 				}
-- 			end,
-- 		})
-- 		vim.cmd([[colorscheme tokyonight-night]])
-- 	end,
-- }

-- No clown fiesta
return {
	"aktersnurra/no-clown-fiesta.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("no-clown-fiesta").setup({
			transparent = not vim.g.neovide, -- Enable this to disable the bg color
			styles = {
				-- You can set any of the style values specified for `:h nvim_set_hl`
				comments = {},
				keywords = {},
				functions = {},
				variables = {},
				type = { bold = false },
				lsp = { underline = true },
			},
		})
		vim.cmd("colorscheme no-clown-fiesta")
	end,
}
