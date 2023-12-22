-- luacheck: globals vim

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = function()
		local function pick_web_formatter()
			local root_dir = require("core.utils.project").root_dir()
			if root_dir then
				local biome_config_path = root_dir .. "/biome.json"
				if root_dir and vim.fn.filereadable(biome_config_path) == 1 then
					return { "biome" }
				end
			end
			return { "prettierd" }
		end

		return {
			formatters_by_ft = {
				html = pick_web_formatter(),
				scss = pick_web_formatter(),
				css = pick_web_formatter(),
				javascript = pick_web_formatter(),
				typescript = pick_web_formatter(),
				markdown = pick_web_formatter(),
				yaml = { "yamlfmt" },
				toml = { "taplo" },
				lua = { "stylua" },
				["*"] = {},
				["_"] = { "trim_whitespace" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		}
	end,
}
