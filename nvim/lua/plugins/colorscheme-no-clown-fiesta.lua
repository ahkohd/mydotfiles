-- luacheck: globals vim

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
		vim.cmd("highlight LspInlayHint guifg=#373737")
		vim.cmd("highlight NoiceCmdlineIconCmdline guifg=#D0D0D0")
	end,
}
