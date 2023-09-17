vim.opt.list = true
-- vim.opt.listchars:append "eol:↵"

return { 
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = {
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true
  }
}
