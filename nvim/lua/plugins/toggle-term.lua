-- luacheck: globals vim

return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	version = "*",
	keys = {
		{ mode = "n", "<space><tab>", "<cmd>lua require('toggleterm').toggle()<cr>", desc = "Open Terminal" },
	},
	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({
			direction = "float",
			size = 80,
			start_in_insert = true,
			float_opts = {
				border = "curved",
			},
		})

		-- use <esc> enter normal mode in terminal
		vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", { noremap = true, silent = true })
	end,
}
