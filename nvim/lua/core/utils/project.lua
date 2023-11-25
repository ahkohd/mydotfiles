-- luacheck: globals vim

local M = {}

M.root_dir = function()
	return require("lspconfig.util").find_git_ancestor(vim.fn.getcwd())
end

M.open_project = function(project_path)
	local actions = require("telescope.actions")
	require("telescope.builtin").find_files({
		cwd = project_path,
		attach_mappings = function(prompt_bufnr, _)
			actions.select_default:replace(function()
				actions.file_edit(prompt_bufnr)
				vim.cmd([[cd %:p:h]])
			end)
			return true
		end,
	})
end

return M
