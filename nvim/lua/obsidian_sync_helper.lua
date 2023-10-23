local M = {}

M.sync = function()
  vim.cmd("!git add ~/vaults")
  vim.cmd("!git stash")
  vim.cmd("!git pull --rebase origin")
  vim.cmd("!git stash apply")
  vim.cmd('!git commit -m "Synced changes with origin"')
  vim.cmd("!git push origin")
end

return M
