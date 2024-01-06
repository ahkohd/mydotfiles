-- luacheck: globals vim

return {
	{
		"maxmx03/fluoromachine.nvim",
		config = function()
			local fm = require("fluoromachine")

			fm.setup({
				glow = false,
				theme = "delta",
				-- transparent = true,
			})

			vim.cmd.colorscheme("fluoromachine")
		end,
	},
}
