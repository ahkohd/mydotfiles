_G.null_ls_enabled = true

local M = {}

M.enable = function()
	if not _G.null_ls_enabled then
		_G.null_ls_enabled = true
		print("NullLS is enabled")
	else
		print("NullLS is already enabled")
	end
end

M.disable = function()
	if _G.null_ls_enabled then
		_G.null_ls_enabled = false
		print("NullLS is disabled")
	else
		print("NullLS is already disabled")
	end
end

return M
