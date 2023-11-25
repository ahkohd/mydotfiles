-- luacheck: globals vim

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>l",
			function()
				require("lint").try_lint()
			end,
			mode = "n",
			desc = "Lint current file",
		},
	},
	config = function()
		local function pick_web_linter()
			local root_dir = require("core.utils.project").root_dir()
			if root_dir then
				local biome_config_path = root_dir .. "/biome.json"
				if root_dir and vim.fn.filereadable(biome_config_path) == 1 then
					return { "biomejs" }
				end
			end
			return { "eslint_d" }
		end

		require("lint").linters_by_ft = {
			html = { "biomejs" },
			css = pick_web_linter(),
			typescript = pick_web_linter(),
			typescriptreact = pick_web_linter(),
			javascript = pick_web_linter(),
			javascriptreact = pick_web_linter(),
			lua = { "luacheck" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
