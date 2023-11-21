-- luacheck: globals vim

return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
		require("mason-null-ls").setup({
			ensure_installed = {},
			automatic_installation = false,
			handlers = {},
		})
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		require("null-ls").setup({
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end
			end,
			should_attach = function()
				return _G.null_ls_enabled
			end,
		})

		vim.cmd([[command! NullLsEnable lua require'null_ls_helper'.enable()]])
		vim.cmd([[command! NullLsDisable lua require'null_ls_helper'.disable()]])
	end,
}
