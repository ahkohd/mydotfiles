return {
	"stevearc/oil.nvim",
	name = "oil",
	lazy = false,
	keys = {
		{ "<C-f>", "<cmd>lua require('oil').open()<cr>", desc = "Open Oil" },
	},
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
