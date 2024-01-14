-- luacheck: globals vim

return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	version = "*",
	keys = {
		{ "<space><tab>", desc = "Open Terminal" },
		{ "<space><PageUp>", desc = "Open btop" },
		{ "<space><PageDown>", desc = "Open Git UI" },
	},
	config = function()
		local toggleterm = require("toggleterm")
		local Terminal = require("toggleterm.terminal").Terminal

		toggleterm.setup({
			open_mapping = [[<space><tab>]],
			direction = "float",
			size = 80,
			start_in_insert = false,
			insert_mappings = false,
			float_opts = {
				border = "curved",
			},
		})

		local btop = Terminal:new({ cmd = "btop", hidden = true })
		local gitui = Terminal:new({ cmd = "gitui", hidden = true })

		function _btop_toggle()
			btop:toggle()
		end

		function _gitui_toggle()
			gitui:toggle()
		end

		vim.api.nvim_set_keymap(
			"n",
			"<space><PageUp>",
			"<cmd>lua _btop_toggle()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<space><PageDown>",
			"<cmd>lua _gitui_toggle()<CR>",
			{ noremap = true, silent = true }
		)

		-- use <esc> enter normal mode in terminal
		vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", { noremap = true, silent = true })
	end,
}
