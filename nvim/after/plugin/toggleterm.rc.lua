local status, toggleterm = pcall(require, "toggleterm")
if not status then
  return
end

toggleterm.setup({
  open_mapping = [[<c-\>]],
  direction = "float",
  size = 80,
  start_in_insert = true,
  float_opts = {
    border = "curved",
  },
})

local Terminal = require("toggleterm.terminal").Terminal

local htop = Terminal:new({
  cmd = "htop",
  dir = "git_dir",
  direction = "float",
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _htop_toggle()
  htop:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>lua _htop_toggle()<CR>", { noremap = true, silent = true })
