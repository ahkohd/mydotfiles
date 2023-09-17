-- luacheck: globals vim

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<C-\\>", "<cmd>lua require('toggleterm').open()<cr>" },
  },
  config = function()
    local toggleterm = require("toggleterm")
    toggleterm.setup({
      open_mapping = [[<c-\>]],
      direction = "float",
      size = 80,
      start_in_insert = true,
      float_opts = {
        border = "curved",
      },
    })
    vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
  end,
}
