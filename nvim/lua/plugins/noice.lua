-- luacheck: globals vim

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				progress = { enabled = false },
			},
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = false, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			cmdline = {
				view = "cmdline",
				format = {
					cmdline = { pattern = "^:", icon = " 󰘳", lang = "vim" },
					search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
					filter = { pattern = "^:%s*!", icon = " ", lang = "bash" },
					lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = " ", lang = "lua" },
					help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
				},
			},
		})
		local icons = require("core.ui.icons")
		require("notify").setup({
			background_colour = "#000000",
			render = "default",
			stages = "static",
			icons = {
				ERROR = icons.error,
				WARN = icons.warn,
				INFO = icons.info,
			},
		})
		vim.keymap.set("n", "<leader>nc", function()
			require("noice").cmd("dismiss")
		end)
		vim.keymap.set("n", "<leader>nh", function()
			require("noice").cmd("telescope")
		end)
	end,
}
