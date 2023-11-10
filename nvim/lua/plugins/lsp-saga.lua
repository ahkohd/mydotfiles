-- luacheck: globals vim

return {
	"nvimdev/lspsaga.nvim",
	event = "BufRead",
	config = function()
		local saga = require("lspsaga")
		local keymap = vim.keymap.set

		saga.setup({
			ui = {
				code_action = "",
			},
			symbol_in_winbar = {
				separator = " → ",
			},
			lightbulb = {
				enable = false,
			},
		})

		-- references and definitions
		keymap("n", "gh", "<cmd>Lspsaga finder<CR>")

		-- hover
		keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

		-- code action
		keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

		-- refactor -> rename usage
		keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

		-- implementation / definition / declaration
		keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
		keymap("n", "<leader>gd", "<cmd>Lspsaga goto_definition<CR>")

		-- type definition
		keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
		keymap("n", "<leader>gt", "<cmd>Lspsaga goto_type_definition<CR>")

		-- diagnostics
		keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
		keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

		-- Diagnostic jump
		-- You can use <C-o> to jump back to your previous location
		keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
		keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
		keymap("n", "<C-e>", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

		local function lspSymbol(name, icon)
			local hl = "DiagnosticSign" .. name
			vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
		end

		lspSymbol("Error", "")
		lspSymbol("Hint", "")
		lspSymbol("Info", "")
		lspSymbol("Warn", "")
	end,
}
