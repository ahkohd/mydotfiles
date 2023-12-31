-- luachek: globals vim

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
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			cmdline = {
				view = "cmdline",
				-- opts = {
				-- 	position = { row = "35%", col = "50%" },
				-- },
				format = {
					cmdline = { pattern = "^:", icon = ":", lang = "vim" },
				},
			},
			popupmenu = {
				opts = {
					position = { row = "50%", col = "50%" },
				},
			},
		})
		local icons = require("core.ui.icons")
		require("notify").setup({
			background_colour = "#000000",
			render = "default",
			stages = "static",
			timeout = 3000,
			top_down = false,
			icons = {
				ERROR = icons.error,
				WARN = icons.warn,
				INFO = icons.info,
			},
		})
	end,
}
