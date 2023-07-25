local oil = require("oil")

oil.setup()

vim.api.nvim_set_keymap("n", "<C-b>", "<cmd>lua require('oil').open()<cr>", { noremap = true })
