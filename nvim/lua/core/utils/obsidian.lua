-- luacheck: globals vim

local M = {}

M.sync = function()
	vim.cmd("!git add ~/vaults")
	vim.cmd("!git stash")
	vim.cmd("!git pull --rebase origin")
	vim.cmd("!git stash apply")
	vim.cmd('!git commit -m "Synced changes with origin"')
	vim.cmd("!git push origin")
end

M.open = function()
	local home_dir = vim.env.HOME
	local vault_path = home_dir .. "/vaults"
	require("core.utils.project").open_project(vault_path)
end

return M
