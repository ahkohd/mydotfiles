-- luacheck: globals vim

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
	event = "BufReadPost",
	config = function()
		local icons = require("core.ui.icons")
		local colors = {
			bg = nil,
			fg = "#D0D0D0",
		}
		local theme = {
			normal = {
				a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg },
				c = { fg = colors.fg, bg = colors.bg },
			},
			insert = { a = { fg = colors.fg, bg = colors.bg, gui = "bold" } },
			visual = { a = { fg = colors.fg, bg = colors.bg, gui = "bold" } },
			command = { a = { fg = colors.fg, bg = colors.bg, gui = "bold" } },
			replace = { a = { fg = colors.fg, bg = colors.bg, gui = "bold" } },
			inactive = {
				a = { fg = colors.fg, bg = colors.bg },
				b = { fg = colors.fg, bg = colors.bg },
				c = { fg = colors.fg, bg = colors.bg },
			},
		}

		local disable = {
			"neogitstatus",
			"netrw",
			"lir",
			"lazy",
			"alpha",
			"Outline",
			"NeogitStatus",
			"NeogitCommitMessage",
		}

		local ignore = { "help", "TelescopePrompt" }

		local function hide_in_width()
			return vim.fn.winwidth(0) > 80
		end

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = {
				error = icons.error .. " ",
				warn = icons.warn .. " ",
			},
			colored = false,
			padding = 0,
			update_in_insert = false,
		}

		local diff = {
			"diff",
			colored = false,
			cond = hide_in_width,
		}

		local branch = {
			"branch",
			icon = icons.git,
		}

		local filetype = {
			"filetype",
			icon_only = true,
			colored = false,
			cond = hide_in_width,
		}

		local function lsp_client_names()
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				return ""
			end
			local client_names = {}
			for _, client in pairs(clients) do
				table.insert(client_names, client.name)
			end
			return table.concat(client_names, ", ")
		end

		local language_server = {
			lsp_client_names,
		}

		local lsp_progress = {
			"lsp_progress",
			display_components = { { "title", "percentage", "message" } },
			timer = {
				progress_enddelay = 500,
				lsp_client_name_enddelay = 500,
			},
		}

		local opts = {
			options = {
				icons_enabled = true,
				theme = theme,
				component_separators = "",
				section_separators = { left = "", right = "" },
				disabled_filetypes = disable,
				ignore_focus = ignore,
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { branch, diff },
				lualine_c = {},
				lualine_x = { lsp_progress, language_server, diagnostics },
				lualine_y = { filetype },
				lualine_z = { "location", "progress" },
			},
			inactive_sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location", "progress" },
			},
			extensions = {},
		}

		require("lualine").setup(opts)

		vim.cmd([[
      hi StatusLine guibg=NONE ctermbg=NONE
      hi StatusLineNC guibg=NONE ctermbg=NONE
    ]])
	end,
}
