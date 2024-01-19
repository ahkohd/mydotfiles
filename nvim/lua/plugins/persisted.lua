-- luacheck: globals vim

return {
	"olimorris/persisted.nvim",
	keys = {
		{
			"<space>xo",
			"<cmd>Telescope persisted<cr>",
			desc = "List recent sessions",
		},
		{
			"<space>xx",
			"<cmd>SessionSave<cr>",
			desc = "Save the current session",
		},
	},
	config = function()
		require("persisted").setup({
			autoload = false,
			save_dir = vim.fn.stdpath("data") .. "/persisted/",
		})
	end,
}
